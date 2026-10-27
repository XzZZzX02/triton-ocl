"""Paired legality, interaction and event timing tests for SYCL IR passes.

Profiles run serially on one device. Every configuration checks independent
references before timing; records include compiler cost, code and local storage.
"""
import argparse
import ctypes
import hashlib
import itertools
import json
import math
import pathlib
import re
import statistics
import time

import triton
import triton.language as tl
from triton.backends.sycl.sycl_utils import run_standalone, profile_standalone


class Tensor:
    def __init__(self, values):
        self.dtype = tl.float32
        self.c_array = (ctypes.c_float * len(values))(*values)

    def data_ptr(self):
        return ctypes.addressof(self.c_array)


@triton.jit
def elementwise(x, z, y, N: tl.constexpr, B: tl.constexpr, KIND: tl.constexpr):
    i = tl.program_id(0)*B + tl.arange(0, B)
    a = tl.load(x+i, i < N, 0.)
    if KIND == 'chain':
        a = a * 2. + 1.
        a = a * 0.5 - 3.
        a = a * a + 2.
    elif KIND == 'fanout':
        p = a*2.+1.
        a = p*p + p
    elif KIND == 'masked':
        a = tl.where(i % 3 == 1, a*2.+1., a*0.5-3.)
    elif KIND == 'overlap':
        b = tl.load(z+i, i < N, 0.)
        a = a*2.+b*3.
    elif KIND == 'reuse':
        tl.store(y+i, a*2.+1., i < N)
        a = tl.load(z+i, i < N, 0.)*3.-1.
        i = i+N
    elif KIND == 'sum':
        a = tl.sum(a*2.+1., 0)
        i = tl.program_id(0)
    tl.store(y+i, a, (i < N) if KIND != 'reuse' else (i < 2*N))


@triton.jit
def matrix(x, y, B: tl.constexpr, KIND: tl.constexpr):
    r = tl.arange(0, 16)
    c = tl.arange(0, B)
    if KIND == 'transpose':
        a = tl.load(x+tl.program_id(0)*16*B+c[:,None]*16+r[None,:])
        a = tl.trans(a)
    elif KIND == 'broadcast':
        a = tl.load(x+tl.program_id(0)*16*B+r[:,None]*B+c[None,:])
        b = tl.load(x+tl.program_id(0)*16*B+c)
        a = a+b[None,:]
    else:
        a = tl.load(x+tl.program_id(0)*16*B+r[:,None]*B+c[None,:])
    tl.store(y+tl.program_id(0)*16*B+r[:,None]*B+c[None,:], (a*2.+1.)*0.5-3.)


def execute(kind, n, b, block, fuse, reuse, group, repeats):
    xv = [float(i%17-8)/4 for i in range(n)]
    zv = [float(i%13-6)/2 for i in range(n)]
    x, z = Tensor(xv), Tensor(zv)
    outsize = 2*n if kind == 'reuse' else ((n+b-1)//b if kind == 'sum' else n)
    y = Tensor([-99.]*outsize)
    if kind in ('matrix','transpose','broadcast'):
        assert n%(16*b) == 0
        grid = (n//(16*b),1,1)
        bound = [x,y,b,kind]
        kernel, kwargs = matrix, dict(B=b,KIND=kind)
        expected=[]
        for p in range(grid[0]):
            for r in range(16):
                for c in range(b):
                    a = xv[p*16*b+(c*16+r if kind == 'transpose' else r*b+c)]
                    if kind == 'broadcast': a += xv[p*16*b+c]
                    expected.append((a*2.+1.)*0.5-3.)
    else:
        grid = ((n+b-1)//b,1,1)
        bound = [x,z,y,n,b,kind]
        kernel, kwargs = elementwise, dict(N=n,B=b,KIND=kind)
        if kind == 'chain': expected=[((v*2.+1.)*0.5-3.)**2+2. for v in xv]
        elif kind == 'fanout': expected=[(v*2.+1.)**2+v*2.+1. for v in xv]
        elif kind == 'masked': expected=[v*2.+1. if i%3 == 1 else v*0.5-3. for i,v in enumerate(xv)]
        elif kind == 'overlap': expected=[a*2.+b*3. for a,b in zip(xv,zv)]
        elif kind == 'reuse': expected=[v*2.+1. for v in xv]+[v*3.-1. for v in zv]
        elif kind == 'sum': expected=[sum(v*2.+1. for v in xv[start:start+b])+max(0,start+b-n) for start in range(0,n,b)]
        else: expected=xv
    started=time.perf_counter()
    c=kernel.warmup(*bound[:2] if kernel is matrix else bound[:3], grid=grid,
                    fuse_elementwise=fuse,reuse_local_memory=reuse,group_reduction=group,**kwargs)
    compile_seconds=time.perf_counter()-started
    source=c.asm['sycl']
    if isinstance(source,bytes): source=source.decode()
    run_standalone(*grid,c.name,source,bound,signature=c.src.signature,metadata=c.metadata,block_size=block)
    actual=list(y.c_array)
    error=max(abs(a-b) for a,b in zip(actual,expected))
    assert len(actual) == len(expected) and error == 0, (kind,fuse,reuse,group,error,actual[:12],expected[:12])
    storage=re.search(r'local storage: (\d+) -> (\d+) bytes',source)
    assert storage, 'missing local storage report'
    samples=profile_standalone(*grid,c.name,source,bound,signature=c.src.signature,metadata=c.metadata,
                               block_size=block,repeats=repeats,warmup=10) if repeats else []
    return dict(kind=kind,n=n,b=b,block=block,fuse=fuse,reuse=reuse,group=group,status='PASS',max_abs_error=error,
                local_bytes_before=int(storage[1]),local_bytes_after=int(storage[2]),source_bytes=len(source),
                source_sha256=hashlib.sha256(source.encode()).hexdigest(),
                group_collectives=source.count('sycl::reduce_over_group'),
                lair_generics=str(c.asm['lair']).count('linalg.generic'),compile_seconds=compile_seconds,
                samples_ns=samples,median_ns=statistics.median(samples) if samples else None)


def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--output',required=True)
    p.add_argument('--repeats',type=int,default=0)
    p.add_argument('--quick',action='store_true')
    p.add_argument('--offset',type=int,default=0)
    p.add_argument('--kinds',nargs='+')
    p.add_argument('--rounds',type=int,default=1)
    args=p.parse_args()
    kinds=args.kinds or ['chain','fanout','masked','overlap','reuse','sum','copy','matrix','transpose','broadcast']
    rows=[]
    specs=[(1024,256,48),(16384,1024,(8,8)),(262144,1024,128)]
    if args.quick: specs=specs[:1]
    for index,(kind,(n,b,block)) in enumerate(itertools.product(kinds,specs)):
        if index < args.offset: continue
        if kind in ('matrix','transpose','broadcast'):
            b=16 if n==1024 else 64
        # Rotate order across workloads to expose order-dependent cache/noise.
        configs=list(itertools.product((False,True),repeat=3))
        if kinds.index(kind)%2: configs.reverse()
        for round_index in range(args.rounds):
            for fuse,reuse,group in (configs if round_index%2 == 0 else reversed(configs)):
                try:
                    row=execute(kind,n,b,block,fuse,reuse,group,args.repeats)
                except Exception as e:
                    row=dict(kind=kind,n=n,b=b,block=block,fuse=fuse,reuse=reuse,group=group,status='FAIL',error=repr(e))
                row['round']=round_index
                rows.append(row); print(json.dumps(row),flush=True)
                pathlib.Path(args.output).write_text(json.dumps(rows,indent=2)+'\n')
    raise SystemExit(any(row['status'] != 'PASS' for row in rows))


if __name__ == '__main__': main()
