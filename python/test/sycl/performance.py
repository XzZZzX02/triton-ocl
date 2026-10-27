"""Warm device-event benchmark on identical frozen compiler snapshots."""
import argparse
import ctypes
import json
import statistics
import triton
import triton.language as tl
from triton.backends.sycl.sycl_utils import profile_standalone, run_standalone

class Tensor:
    def __init__(self,values):
        self.dtype=tl.float32
        self.c_array=(ctypes.c_float*len(values))(*values)
    def data_ptr(self):return ctypes.addressof(self.c_array)

@triton.jit
def bench_kernel(x,y,N:tl.constexpr,KIND:tl.constexpr,B:tl.constexpr):
    i=tl.program_id(0)*B+tl.arange(0,B)
    value=tl.load(x+i,i<N,0.)
    if KIND=='sum':
        result=tl.sum(value,0)
        tl.store(y+tl.program_id(0),result)
    else:
        tl.store(y+i,value*2.+1.,i<N)


@triton.jit
def matrix_kernel(x,y,N:tl.constexpr):
    a=tl.arange(0,16)
    b=tl.arange(0,64)
    offsets=tl.program_id(0)*1024+a[:,None]*64+b[None,:]
    values=tl.load(x+offsets,offsets<N,0.)
    tl.store(y+offsets,values*2.+1.,offsets<N)


@triton.jit
def copy_reuse_kernel(x, z, y, N: tl.constexpr, REUSE: tl.constexpr):
    i = tl.program_id(0)*1024 + tl.arange(0, 1024)
    a = tl.load(x+i)
    tl.store(y+i, a)
    if REUSE:
        b = tl.load(z+i)
        tl.store(y+N+i, b*3.-1.)


def main():
    parser=argparse.ArgumentParser()
    parser.add_argument('--output',required=True)
    parser.add_argument('--repeats',type=int,default=31)
    args=parser.parse_args()
    results=[]
    for kind in ('vector','matrix','sum','copy','reuse'):
        n,b=262144,1024
        values=[float(i%17-8)/4 for i in range(n)]
        x=Tensor(values)
        z=Tensor(list(reversed(values)))
        y=Tensor([0.]*(2*n if kind=='reuse' else (n if kind!='sum' else n//b)))
        if kind in ('copy','reuse'):
            compiled=copy_reuse_kernel.warmup(x,z,y,N=n,REUSE=kind=='reuse',grid=(n//b,))
            bound=[x,z,y,n,kind=='reuse']
        elif kind=='matrix':
            compiled=matrix_kernel.warmup(x,y,N=n,grid=(n//b,))
            bound=[x,y,n]
        else:
            compiled=bench_kernel.warmup(x,y,N=n,KIND=kind,B=b,grid=(n//b,))
            bound=[x,y,n,kind,b]
        expected=[v*2+1 for v in values] if kind!='sum' else [sum(values[i:i+b]) for i in range(0,n,b)]
        if kind in ('copy','reuse'):
            expected=values + ([v*3.-1. for v in reversed(values)] if kind=='reuse' else [])
        for block in (64,128,256):
            run_standalone(n//b,1,1,compiled.name,compiled.asm['sycl'],bound,signature=compiled.src.signature,metadata=compiled.metadata,block_size=block)
            error=max(abs(a-b) for a,b in zip(y.c_array,expected))
            if error>1.e-5:raise AssertionError(f'{kind}/{block}: error {error}')
            samples=profile_standalone(n//b,1,1,compiled.name,compiled.asm['sycl'],bound,signature=compiled.src.signature,metadata=compiled.metadata,block_size=block,repeats=args.repeats,warmup=10)
            row=dict(kind=kind,n=n,block=block,repeats=args.repeats,warmup=10,max_abs_error=error,kernel_ns=samples,median_ns=statistics.median(samples),min_ns=min(samples))
            results.append(row);print(json.dumps(row),flush=True)
            open(args.output,'w').write(json.dumps(results,indent=2)+'\n')

if __name__=='__main__':main()
