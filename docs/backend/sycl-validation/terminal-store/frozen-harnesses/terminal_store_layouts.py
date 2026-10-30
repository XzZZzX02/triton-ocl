"""Real static output layouts, dynamic-stride fallback, and masked scatter negatives."""
import argparse
import ctypes
import hashlib
import itertools
import json
import math
import pathlib
import statistics
import struct

import triton
import triton.language as tl
from register_accumulator import Tensor
from cooperative_staging_semantics import check
from triton.backends.sycl.sycl_utils import run_standalone, profile_standalone


@triton.jit(do_not_specialize=['n','base','dynamic_stride'])
def copy_layout(x,y,n,base,dynamic_stride,R:tl.constexpr,C:tl.constexpr,
                SR:tl.constexpr,SC:tl.constexpr,BS:tl.constexpr,KIND:tl.constexpr):
    p=tl.program_id(0)
    r=tl.arange(0,R)[:,None]
    c=tl.arange(0,C)[None,:]
    lane=p*R*C+r*C+c
    value=tl.load(x+lane,lane<n,-7.)
    if KIND=='dynamic':
        address=base+p*BS+r*dynamic_stride+c
    elif KIND=='collision':
        address=base+p*BS+r+c
    elif KIND=='scatter':
        address=base+p*BS+(r*C+c)%7
    else:
        address=base+p*BS+r*SR+c*SC
    valid=(lane<n)&((r*C+c)%5!=2)
    # Colliding/scatter cases use one valid element per program for defined
    # runtime output while their complete address domain must reject proof.
    if KIND=='collision' or KIND=='scatter':valid=valid&(r==0)&(c==0)
    tl.store(y+address,value,valid)


@triton.jit(do_not_specialize=['n','base'])
def copy_rank3(x,y,n,base):
    p=tl.program_id(0)
    a=tl.arange(0,2)[:,None,None]
    b=tl.arange(0,8)[None,:,None]
    c=tl.arange(0,32)[None,None,:]
    lane=p*512+a*256+b*32+c
    value=tl.load(x+lane,lane<n,-7.)
    tl.store(y+base+p*1100+a*550+b*65-c,value,(lane<n)&(lane%5!=2))


@triton.jit(do_not_specialize=['m','n','k','base'])
def dot_layout(x,y,z,m,n,k,base,TA:tl.constexpr,TB:tl.constexpr,
               SR:tl.constexpr,SC:tl.constexpr,BS:tl.constexpr):
    p=tl.program_id(0)
    r=tl.arange(0,16);c=tl.arange(0,16);h=tl.arange(0,32)
    if TA:a=tl.trans(tl.load(x+p*512+h[:,None]*16+r[None,:],(h[:,None]<k)&(r[None,:]<m),0.))
    else:a=tl.load(x+p*512+r[:,None]*32+h[None,:],(r[:,None]<m)&(h[None,:]<k),0.)
    if TB:b=tl.trans(tl.load(y+p*512+c[:,None]*32+h[None,:],(c[:,None]<n)&(h[None,:]<k),0.))
    else:b=tl.load(y+p*512+h[:,None]*16+c[None,:],(h[:,None]<k)&(c[None,:]<n),0.)
    v=tl.dot(a,b)
    tl.store(z+base+p*BS+r[:,None]*SR+c[None,:]*SC,v,(r[:,None]<m)&(c[None,:]<n))


LAYOUTS={'dense':(16,1),'transpose':(1,19),'padded':(23,1),
         'negative':(-23,1),'stride2':(40,2),'reverse_cols':(23,-1)}


def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--suite',choices=('memory','dot','fallback'),required=True)
    p.add_argument('--output',required=True)
    p.add_argument('--cases',nargs='+')
    p.add_argument('--compile-only',action='store_true')
    p.add_argument('--repeats',type=int,default=0)
    p.add_argument('--rounds',type=int,default=1)
    args=p.parse_args();rows=[]
    grid=3
    specs=(list(LAYOUTS)+['rank3'] if args.suite=='memory' else
           [a+'_'+b+'_'+c for a,b,c in itertools.product(('f32','f16'),('NN','NT','TN','TT'),('transpose','negative'))]
           if args.suite=='dot' else ['dynamic','collision','scatter','small'])
    if args.cases:
        assert len(args.cases)==len(set(args.cases)) and set(args.cases)<=set(specs),args.cases
        specs=args.cases
    for case in specs:
        if args.suite=='dot':
            dtype,layout,out_layout=case.split('_');sr,sc=LAYOUTS[out_layout]
            R=C=16;m,n,k=13,11,29;half=dtype=='f16';ta,tb=[s=='T' for s in layout]
            av=[(i%11-5)/4 for i in range(grid*512)];bv=[(i%13-6)/4 for i in range(grid*512)]
            warm0=[Tensor(av,half),Tensor(bv,half)];dtype_tag=dtype
            kernel=dot_layout;coords=[(r,c) for r in range(m) for c in range(n)]
        else:
            sr,sc=LAYOUTS.get(case,(16,1));R,C=(8,16) if case=='small' else (16,16)
            n=grid*(512 if case=='rank3' else R*C)-3
            special=[math.nan,math.inf,-math.inf,-0.,0.,2**-149,-2**-149,2**-126,-2**-126,1.25]
            values=[special[i%len(special)] for i in range(n+7)]
            warm0=[Tensor(values)];dtype_tag='f32';kernel=copy_rank3 if case=='rank3' else copy_layout
        if case=='rank3':ends=[a*550+b*65-c for a,b,c in itertools.product(range(2),range(8),range(32))];bs=1100
        else:ends=[r*sr+c*sc for r,c in itertools.product(range(R),range(C))];bs=max(ends)-min(ends)+19
        base=7-min(ends);size=base+(grid-1)*bs+max(ends)+8
        expected=[-999.]*size
        for batch in range(grid):
            if args.suite=='dot':
                for r,c in coords:
                    v=sum(av[batch*512+(h*16+r if ta else r*32+h)]*bv[batch*512+(c*32+h if tb else h*16+c)] for h in range(k))
                    expected[base+batch*bs+r*sr+c*sc]=v
            elif case=='rank3':
                for a,b,c in itertools.product(range(2),range(8),range(32)):
                    lane=batch*512+a*256+b*32+c
                    if lane<n and lane%5!=2:expected[base+batch*bs+a*550+b*65-c]=values[lane]
            else:
                for r,c in itertools.product(range(R),range(C)):
                    lane=batch*R*C+r*C+c
                    if lane>=n or (r*C+c)%5==2:continue
                    if case in ('collision','scatter') and (r!=0 or c!=0):continue
                    address=(r+c if case=='collision' else (r*C+c)%7 if case=='scatter' else r*sr+c*sc)
                    expected[base+batch*bs+address]=values[lane]
        output=Tensor([-999.]*size)
        if args.suite=='dot':warm=warm0+[output,m,n,k,base];kw=dict(TA=ta,TB=tb,SR=sr,SC=sc,BS=bs);bound=warm+[ta,tb,sr,sc,bs]
        elif case=='rank3':warm=warm0+[output,n,base];kw={};bound=warm
        else:warm=warm0+[output,n,base,sr];kw=dict(R=R,C=C,SR=sr,SC=sc,BS=bs,KIND=case);bound=warm+[R,C,sr,sc,bs,case]
        for round_ in range(args.rounds):
            configs=list(itertools.product((False,True),repeat=2))
            for enabled,optimized in (configs if round_%2==0 else reversed(configs)):
                comp=kernel.warmup(*warm,grid=(grid,),**kw,terminal_store_distribution=enabled,
                    cooperative_load_staging=optimized,register_accumulator=optimized,
                    matmul_register_tiling=optimized,accumulator_init_forwarding=optimized,
                    reduction_unroll=4 if optimized else 1,fuse_elementwise=optimized,
                    reuse_local_memory=True,group_reduction=optimized)
                code=comp.asm['sycl'];code=code.decode() if isinstance(code,bytes) else code
                memir=str(comp.asm['memir']);stores=memir.count('sycl.terminal_store_distribution')
                assert stores==int(enabled and args.suite!='fallback'),(case,enabled,stores,memir)
                checked=0
                if not args.compile_only:
                    for block in (3,48,(3,5)):
                        output.c_array[:]=[-999.]*size
                        run_standalone(grid,1,1,comp.name,code,bound,signature=comp.src.signature,metadata=comp.metadata,block_size=block)
                        check(list(output.c_array),expected);checked+=size
                samples=[]
                if args.repeats and not args.compile_only:
                    samples=profile_standalone(grid,1,1,comp.name,code,bound,signature=comp.src.signature,metadata=comp.metadata,block_size=64,warmup=10,repeats=args.repeats)
                    if isinstance(samples,int):samples=[samples]
                row=dict(case=case,suite=args.suite,dtype=dtype_tag,enabled=enabled,optimized=optimized,
                    round=round_,status='PASS',stores=stores,elements_checked=checked,
                    markers={s:memir.count(s) for s in ('sycl.register_accumulator','sycl.register_tile =','sycl.ordered_reduction_unroll','sycl.accumulator_init_forwarded','sycl.cooperative_load_staging')},
                    source_sha256=hashlib.sha256(code.encode()).hexdigest(),samples_ns=samples,median_ns=statistics.median(samples) if samples else None)
                rows.append(row);print(json.dumps(row),flush=True)
                pathlib.Path(args.output).write_text(json.dumps(rows,indent=2)+chr(10))


if __name__=='__main__':main()
