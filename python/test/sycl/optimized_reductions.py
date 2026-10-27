"""Exercise actual tree paths: long reductions and odd local ranges."""
import argparse
import ctypes
import json
import triton
import triton.language as tl
from triton.backends.sycl.sycl_utils import run_standalone

class Tensor:
    def __init__(self, values, integer=False):
        self.dtype=tl.int32 if integer else tl.float32
        self.c_array=((ctypes.c_int32 if integer else ctypes.c_float)*len(values))(*values)
    def data_ptr(self):return ctypes.addressof(self.c_array)

@triton.jit
def band(a,b):return a&b

@triton.jit
def kernel(x,y,KIND:tl.constexpr):
    v=tl.load(x+tl.arange(0,1024))
    if KIND=='sum':r=tl.sum(v,0)
    elif KIND=='max':r=tl.max(v,0)
    elif KIND=='min':r=tl.min(v,0)
    elif KIND=='and':r=tl.reduce(v,0,band)
    elif KIND=='or':r=tl.reduce_or(v,0)
    else:r=tl.xor_sum(v,0)
    tl.store(y,r)


def main():
    parser=argparse.ArgumentParser()
    parser.add_argument("--case", choices=("sum","max","min","and","or","xor"))
    parser.add_argument("--block",type=int)
    args=parser.parse_args()
    results=[]
    for kind in ('sum','max','min','and','or','xor'):
        if args.case and kind!=args.case:continue
        integer=kind in ('and','or','xor')
        values=[(0x7fffffff^(1<<(i%12))) if integer else float(i%17-8)/4 for i in range(1024)]
        x,y=Tensor(values,integer),Tensor([0],integer)
        c=kernel.warmup(x,y,KIND=kind,grid=(1,))
        if kind=='sum':expected=sum(values)
        elif kind=='max':expected=max(values)
        elif kind=='min':expected=min(values)
        else:
            expected=values[0]
            for value in values[1:]:
                expected=expected&value if kind=='and' else (expected|value if kind=='or' else expected^value)
        for block in ((args.block,) if args.block else (48,64,128)):
            print(json.dumps(dict(kind=kind,block=block,status="RUNNING")),flush=True)
            run_standalone(1,1,1,c.name,c.asm['sycl'],[x,y,kind],signature=c.src.signature,metadata=c.metadata,block_size=block)
            assert y.c_array[0]==expected,(kind,block,y.c_array[0],expected)
            results.append(dict(kind=kind,block=block,status='PASS',max_abs_error=0))
            print(json.dumps(results[-1]),flush=True)
    print(json.dumps(results),flush=True)

if __name__=='__main__':main()
