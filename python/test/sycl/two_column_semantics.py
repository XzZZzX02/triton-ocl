"""Paired two-column fallback tests with ordered output references and stack ablations."""
import argparse
import hashlib
import itertools
import json
import math
import pathlib
import random
import re
import statistics
import struct
from types import SimpleNamespace
from cooperative_staging_semantics import prepare,check
from full_stack_ablation import ALL
from triton.backends.sycl.sycl_utils import run_standalone,profile_standalone


def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--shape',nargs=3,type=int,default=[8,16,32])
    p.add_argument('--layout',choices=('NN','NT','TN','TT'),required=True)
    p.add_argument('--dtype',choices=('f16','f32'),default='f16')
    p.add_argument('--configs',nargs='+',choices=('base','full','no_staging','no_init','no_accumulator','no_reuse','no_fusion','no_unroll','no_distribution','tiling_off'),default=['base','full'])
    p.add_argument('--rounds',type=int,default=1);p.add_argument('--repeats',type=int,default=0)
    p.add_argument('--special',action='store_true')
    p.add_argument('--rounding',action='store_true')
    p.add_argument('--bounds',choices=('tail','full','empty','unit'),default='tail')
    p.add_argument('--check-blocks',choices=('all','64'),default='all')
    p.add_argument('--compile-only',action='store_true')
    p.add_argument('--output',type=pathlib.Path,required=True);p.add_argument('--dump-dir',type=pathlib.Path)
    a=p.parse_args();M,N,K=a.shape;fixture=SimpleNamespace(kind='dot',shape=a.shape,layout=a.layout,dtype=a.dtype)
    kernel,warm,kw,bound,out,expected,grid=prepare(fixture)
    if a.special or a.rounding:
        # Exact 0/1 inputs preserve an independent reference while exercising
        # NaN, opposite infinities and signed zeros in separate programs.
        values=[(-0. if i%2 else 0.) for i in range(grid*M*K)]
        values[0]=math.nan;values[M*K+1]=math.inf;values[2*M*K+2]=-math.inf
        other=[1.]*(grid*K*N)
        if a.rounding:
            rng=random.Random(906)
            cast=lambda v:struct.unpack('<e' if a.dtype=='f16' else '<f',struct.pack('<e' if a.dtype=='f16' else '<f',v))[0]
            values=[cast(rng.uniform(-2,2)) for _ in values]
            other=[cast(rng.uniform(-2,2)) for _ in other]
            # Half subnormals and extrema alongside non-exact input rounding.
            if a.dtype=='f16':
                edge=[2**-24,-2**-24,2**-14,-2**-14,65504.,-65504.,0.,-0.]
                values[:len(edge)]=edge
        from register_accumulator import Tensor
        x,y=Tensor(values,a.dtype=='f16'),Tensor(other,a.dtype=='f16')
        warm[:2]=[x,y];bound[:2]=[x,y]
    else:
        values=[(i%11-5)/4 for i in range(grid*M*K)]
        other=[(i%13-6)/4 for i in range(grid*K*N)]
    m,n,k={'tail':(M-1,N-3,K-1),'full':(M,N,K),
           'empty':(0,N,0),'unit':(1,1,1)}[a.bounds]
    warm[3:6]=[m,n,k];bound[3:6]=[m,n,k]
    expected=[-999.]*(grid*M*N+7);ta,tb=[v=='T' for v in a.layout]
    for batch in range(grid):
        for r in range(m):
            for c in range(n):
                acc=0.
                # Include masked zero padding in the exact recurrence.
                for h in range(K):
                    av=values[batch*M*K+(h*M+r if ta else r*K+h)] if h<k else 0.
                    bv=other[batch*K*N+(c*K+h if tb else h*N+c)] if h<k else 0.
                    prod=struct.unpack('<f',struct.pack('<f',av*bv))[0]
                    acc=struct.unpack('<f',struct.pack('<f',acc+prod))[0]
                expected[batch*M*N+r*N+c]=acc
    rows=[];markers={}
    for round_ in range(a.rounds):
        plans=list(itertools.product(a.configs,(False,True)))
        for plan,enabled in (plans if round_%2==0 else reversed(plans)):
            opts=dict(ALL)
            if plan=='base':
                opts.update({k:False for k in opts if k not in ('register_accumulator','matmul_register_tiling','distribute_work','reuse_local_memory','reduction_unroll')})
                opts['reduction_unroll']=1
            elif plan=='tiling_off':opts['matmul_register_tiling']=False
            elif plan.startswith('no_'):
                key={'staging':'cooperative_load_staging','init':'accumulator_init_forwarding',
                     'accumulator':'register_accumulator','reuse':'reuse_local_memory','fusion':'fuse_elementwise',
                     'unroll':'reduction_unroll','distribution':'distribute_work'}[plan[3:]]
                opts[key]=1 if key=='reduction_unroll' else False
            c=kernel.warmup(*warm,grid=(grid,),**kw,**opts,matmul_register_tiling_2col=enabled)
            code=c.asm['sycl'];code=code.decode() if isinstance(code,bytes) else code;memir=str(c.asm['memir'])
            found=re.search(r'sycl.register_tile = (\d+)',memir);tile=int(found[1]) if found else 0
            eligible=opts['matmul_register_tiling'] and opts['distribute_work'] and a.dtype=='f16' and M>=8 and N>=16 and K>=16 and N%4==0
            want=4 if eligible and M*(N//4)>=64 else 2 if eligible and enabled and M*(N//2)>=64 else 0
            assert tile==want,(a.shape,a.dtype,plan,enabled,tile,want,memir)
            promoted=opts['register_accumulator'] or tile>0
            guarded=want==2
            assert memir.count('sycl.two_column_launch_guard')==int(guarded),memir
            assert 'sycl.two_column_candidate' not in memir,memir
            unroll_legal=opts['reduction_unroll']>1 and promoted and K%4==0 and K//4>=2
            expected_unroll=(int(unroll_legal)*(1+int(K>=32)) if guarded else
                             int(unroll_legal and (tile==0 or K>=32)))
            assert memir.count('sycl.ordered_reduction_unroll')==expected_unroll,memir
            other={k:memir.count(k) for k in ('sycl.accumulator_init_forwarded','sycl.cooperative_load_staging','sycl.terminal_store_distribution','sycl.single_lane_half_bits')}
            # Standalone tiling itself creates private accumulators, enabling
            # forwarding even when the independent promotion pass is off.
            want_init=int(opts['accumulator_init_forwarding'] and promoted and
                          opts['distribute_work'] and M*N>=128)
            assert other['sycl.accumulator_init_forwarded']==want_init*(2 if guarded else 1),(plan,enabled,other,memir)
            assert memir.count('sycl.register_tile_composed_accumulator')==int(tile>0 and opts['register_accumulator']),memir
            stable={k:v for k,v in other.items() if k!='sycl.accumulator_init_forwarded'}
            digest=hashlib.sha256(code.encode()).hexdigest()
            if (plan,not enabled) in markers:
                prior=markers[plan,not enabled]
                assert prior['stable']==stable,(plan,enabled,stable,prior)
                if not eligible or M*(N//4)>=64 or M*(N//2)<64:
                    assert prior['sha256']==digest,(plan,enabled,'fallback source changed')
            markers[plan,enabled]=dict(stable=stable,sha256=digest)
            if a.dump_dir:
                a.dump_dir.mkdir(parents=True,exist_ok=True)
                for ext,text in [('sycl',code),('memir',memir)]:
                    (a.dump_dir/f'{plan}-enabled{enabled}.{ext}').write_text(text)
            checks=0;samples=[]
            if not a.compile_only:
                for local in ((1,3,48,(3,5),64,128,256,(4,4,8)) if a.check_blocks=='all' else (64,)):
                    out.c_array[:]=[-999.]*len(expected)
                    run_standalone(grid,1,1,c.name,code,bound,signature=c.src.signature,metadata=c.metadata,block_size=local)
                    check(list(out.c_array),expected);checks+=len(expected)
                if a.repeats:
                    samples=profile_standalone(grid,1,1,c.name,code,bound,signature=c.src.signature,
                        metadata=c.metadata,block_size=64,warmup=10,repeats=a.repeats)
                    check(list(out.c_array),expected);checks+=len(expected)
            row=dict(shape=a.shape,layout=a.layout,dtype=a.dtype,plan=plan,enabled=enabled,round=round_,tile=tile,
                status='PASS',guarded=guarded,special=a.special,rounding=a.rounding,bounds=a.bounds,
                check_blocks=a.check_blocks,options=dict(opts,matmul_register_tiling_2col=enabled),
                compile_only=a.compile_only,elements_checked=checks,
                output_elements=len(expected),source_sha256=digest,
                source_bytes=len(code),markers=other,composed=memir.count('sycl.register_tile_composed_accumulator'),
                unrolled=memir.count('sycl.ordered_reduction_unroll'),samples_ns=samples,
                median_ns=statistics.median(samples) if samples else None)
            rows.append(row);print(json.dumps(row),flush=True);a.output.write_text(json.dumps(rows,indent=2)+'\n')


if __name__=='__main__':main()
