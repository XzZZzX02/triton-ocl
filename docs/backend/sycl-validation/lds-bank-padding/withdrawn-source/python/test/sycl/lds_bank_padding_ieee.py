"""Ordered-reference checks for actual padded scratch layouts and IEEE inputs."""
import argparse
import hashlib
import itertools
import json
import math
import pathlib
import random
import struct
from types import SimpleNamespace

from cooperative_staging_semantics import prepare, check
from full_stack_ablation import ALL
from register_accumulator import Tensor
from triton.backends.sycl.sycl_utils import run_standalone


def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--shape',nargs=3,type=int,default=[32,64,64])
    p.add_argument('--layout',choices=('NN','NT','TN','TT'),default='NN')
    p.add_argument('--dtype',choices=('f16','f32'),default='f16')
    p.add_argument('--data',choices=('rounding','special'),required=True)
    p.add_argument('--bounds',choices=('full','tail','empty','unit'),default='full')
    p.add_argument('--plans',nargs='+',choices=('raw','full'),default=['full'])
    p.add_argument('--blocks',nargs='+',default=['1','3','48','64','128','256','3x5','4x4x4'])
    p.add_argument('--output',type=pathlib.Path,required=True)
    p.add_argument('--dump-dir',type=pathlib.Path,required=True)
    args=p.parse_args()
    M,N,K=args.shape
    half=args.dtype=='f16'
    kernel,warm,kw,bound,out,_,grid=prepare(SimpleNamespace(
        kind='dot',shape=args.shape,layout=args.layout,dtype=args.dtype))
    f32=lambda value:struct.unpack('<f',struct.pack('<f',value))[0]
    cast=(lambda value:struct.unpack('<e',struct.pack('<e',value))[0]) if half else f32
    if args.data=='rounding':
        rng=random.Random(906)
        av=[cast(rng.uniform(-2,2)) for _ in range(grid*M*K)]
        bv=[cast(rng.uniform(-2,2)) for _ in range(grid*K*N)]
        edges=[0.,-0.,2**-24,-2**-24,2**-14,-2**-14,65504.,-65504.] if half else [
            0.,-0.,2**-149,-2**-149,2**-126,-2**-126,1.0000001192092896,-1.0000001192092896]
        av[:len(edges)]=edges
    else:
        av=[0. if i%2 else -0. for i in range(grid*M*K)]
        av[0]=math.nan;av[M*K+1]=math.inf;av[2*M*K+2]=-math.inf
        bv=[1. for _ in range(grid*K*N)]
    x,y=Tensor(av,half),Tensor(bv,half)
    warm[:2]=[x,y];bound[:2]=[x,y]
    m,n,k={'full':(M,N,K),'tail':(M-1,N-3,K-1),'empty':(0,N,0),'unit':(1,1,1)}[args.bounds]
    warm[3:6]=[m,n,k];bound[3:6]=[m,n,k]
    expected=[-999.]*(grid*M*N+7)
    ta,tb=(c=='T' for c in args.layout)
    for batch in range(grid):
        for r in range(m):
            for c in range(n):
                value=0.
                for h in range(K):
                    a=av[batch*M*K+(h*M+r if ta else r*K+h)] if h<k else 0.
                    b=bv[batch*K*N+(c*K+h if tb else h*N+c)] if h<k else 0.
                    value=f32(value+f32(a*b))
                expected[batch*M*N+r*N+c]=value
    rows=[]
    args.dump_dir.mkdir(parents=True,exist_ok=True)
    for plan,enabled in itertools.product(args.plans,(False,True)):
        options=dict(ALL) if plan=='full' else dict(distribute_work=True,reuse_local_memory=True)
        c=kernel.warmup(*warm,grid=(grid,),**kw,**options,lds_bank_padding=enabled)
        code=c.asm['sycl'];code=code.decode() if isinstance(code,bytes) else code
        memir=str(c.asm['memir'])
        for ext,data in (('sycl',code),('memir',memir)):
            (args.dump_dir/f'{plan}-enabled{enabled}.{ext}').write_text(data)
        checks=0
        for block in args.blocks:
            local=tuple(map(int,block.split('x'))) if 'x' in block else int(block)
            out.c_array[:]=[-999.]*len(expected)
            run_standalone(grid,1,1,c.name,code,bound,
                signature=c.src.signature,metadata=c.metadata,block_size=local)
            check(list(out.c_array),expected);checks+=len(expected)
        row=dict(status='PASS',shape=args.shape,layout=args.layout,dtype=args.dtype,
            data=args.data,bounds=args.bounds,plan=plan,enabled=enabled,
            padded=memir.count('sycl.lds_bank_padding'),blocks=args.blocks,
            elements_checked=checks,source_sha256=hashlib.sha256(code.encode()).hexdigest())
        rows.append(row);args.output.write_text(json.dumps(rows,indent=2)+'\n')
        print(json.dumps(row),flush=True)


if __name__=='__main__':main()
