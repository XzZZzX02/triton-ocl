"""Exact loop recurrence and active fusion checks; one case per invocation."""
import argparse
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
from triton.backends.sycl.sycl_utils import run_standalone,profile_standalone


@triton.jit(do_not_specialize=['n','count','inner','stride'])
def recurrence(x,y,n,count,inner,stride,B:tl.constexpr,KIND:tl.constexpr):
    lane=tl.program_id(0)*B+tl.arange(0,B)
    valid=lane<n
    value=tl.full((B,),-0.,tl.float32)
    for i in range(count):
        if KIND=='nested':
            for j in range(inner):
                term=tl.load(x+lane*stride,valid,0.)
                value=value+term
        elif KIND=='chain':
            term=tl.load(x+lane*stride,valid,0.)
            intermediate=value+term
            value=intermediate*2.
        else:
            value=value+tl.load(x+lane*stride,valid,0.)
    tl.store(y+lane,value,valid)


def f32(value):return struct.unpack('<f',struct.pack('<f',value))[0]


def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--case',choices=('single','chain','nested','ieee'),required=True)
    p.add_argument('--output',required=True)
    p.add_argument('--rounds',type=int,default=1)
    p.add_argument('--repeats',type=int,default=0)
    p.add_argument('--compile-only',action='store_true')
    p.add_argument('--count',type=int,default=3)
    p.add_argument('--dump-dir')
    args=p.parse_args()
    B,n,grid=256,765,3
    values=[(i%17-8)/4 for i in range(n+7)]
    if args.case=='ieee':
        specials=[math.nan,math.inf,-math.inf,0.,-0.,2**-149,-2**-149,2**-126,-2**-126]
        values=[specials[i%len(specials)] for i in range(n+7)]
    x,y=Tensor(values),Tensor([-999.]*(n+7))
    kind='single' if args.case=='ieee' else args.case
    inner=2
    configs=list(itertools.product((False,True),repeat=3))
    rows=[]
    for round_ in range(args.rounds):
        for fuse,stage,reuse in (configs if round_%2==0 else reversed(configs)):
            c=recurrence.warmup(x,y,n,args.count,inner,1,B=B,KIND=kind,grid=(grid,),
                fuse_elementwise=fuse,cooperative_load_staging=stage,reuse_local_memory=reuse)
            code=c.asm['sycl'];code=code.decode() if isinstance(code,bytes) else code
            lair=str(c.asm['lair']);memir=str(c.asm['memir'])
            generics=lair.count('linalg.generic')
            # The real lowered chain uses the producer as both input and DPS init.
            # Its two uses intentionally retain the existing fusion fallback.
            assert generics==(2 if kind=='chain' else 1),(kind,fuse,lair)
            assert 'tensor.empty' not in lair.split('scf.for',1)[1],lair
            assert 'sycl.cooperative_load_staging' not in memir,memir
            if args.dump_dir:
                pth=pathlib.Path(args.dump_dir);pth.mkdir(exist_ok=True,parents=True)
                for ext,data in (('lair',lair),('memir',memir),('sycl',code)):
                    (pth/f'{args.case}-f{fuse}-s{stage}-r{reuse}.{ext}').write_text(data)
            checked=0
            counts=(0,args.count)
            if not args.compile_only:
                for count in counts:
                    expected=[]
                    for v in values[:n]:
                        acc=-0.
                        for _ in range(count):
                            for _ in range(inner if kind=='nested' else 1):acc=f32(acc+v)
                            if kind=='chain':acc=f32(acc*2.)
                        expected.append(acc)
                    expected += [-999.]*7
                    for local in (3,48,(3,5)):
                        y.c_array[:]=[-999.]*len(expected)
                        run_standalone(grid,1,1,c.name,code,[x,y,n,count,inner,1,B,kind],
                            signature=c.src.signature,metadata=c.metadata,block_size=local)
                        check(list(y.c_array),expected);checked+=len(expected)
            samples=[]
            if args.repeats:
                samples=profile_standalone(grid,1,1,c.name,code,[x,y,n,args.count,inner,1,B,kind],
                    signature=c.src.signature,metadata=c.metadata,block_size=64,warmup=10,repeats=args.repeats)
                if isinstance(samples,int):samples=[samples]
            row=dict(case=args.case,status='PASS',fuse=fuse,stage=stage,reuse=reuse,round=round_,
                count=args.count,linalg_generics=generics,elements_checked=checked,
                source_sha256=hashlib.sha256(code.encode()).hexdigest(),
                samples_ns=samples,median_ns=statistics.median(samples) if samples else None)
            rows.append(row);print(json.dumps(row),flush=True)
            pathlib.Path(args.output).write_text(json.dumps(rows,indent=2)+chr(10))


if __name__=='__main__':main()
