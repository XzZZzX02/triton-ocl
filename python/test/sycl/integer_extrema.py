"""Exact integer min/max collectives with existing schedule composition and tails."""
import argparse
import ctypes
import hashlib
import itertools
import json
import pathlib
import statistics
import triton
import triton.language as tl
from triton.backends.sycl.sycl_utils import run_standalone,profile_standalone


TYPES={'i32':(tl.int32,ctypes.c_int32,32,True),'u32':(tl.uint32,ctypes.c_uint32,32,False),
       'i64':(tl.int64,ctypes.c_int64,64,True),'u64':(tl.uint64,ctypes.c_uint64,64,False)}


class Tensor:
    def __init__(self,values,dtype):
        self.dtype,ctype,_,_=TYPES[dtype];self.c_array=(ctype*len(values))(*values)
    def data_ptr(self):return ctypes.addressof(self.c_array)


@triton.jit(do_not_specialize=['n','flag'])
def extrema(x,y,n,flag,B:tl.constexpr,MAX:tl.constexpr,OTHER:tl.constexpr,CONDITIONAL:tl.constexpr):
    p=tl.program_id(0);i=tl.arange(0,B)
    v=tl.load(x+p*B+i,i<n,OTHER)
    if CONDITIONAL:
        if flag:
            r=tl.max(v,0) if MAX else tl.min(v,0)
        else:r=tl.full((),OTHER,x.dtype.element_ty)
    else:r=tl.max(v,0) if MAX else tl.min(v,0)
    tl.store(y+p,r)


def prepare(dtype,kind,B,grid,data):
    _,ctype,bits,signed=TYPES[dtype]
    lo=-(1<<(bits-1)) if signed else 0;hi=(1<<(bits-1))-1 if signed else (1<<bits)-1
    neutral=lo if kind=='max' else hi
    n=0 if data=='empty' else 1 if data=='one' else B-7
    raw=[];expected=[]
    for batch in range(grid):
        if data=='identity':values=[neutral]*B
        elif data=='high':
            values=[(hi-i%97 if kind=='min' else lo+i%89) for i in range(B)]
        else:
            # Signed max all-negative and signed min all-positive expose an
            # incorrect zero identity. Unsigned values straddle the sign bit.
            values=[(-1-(i*17+batch)%1009 if kind=='max' else 1+(i*19+batch)%997) if signed
                    else ctype((1<<(bits-1))+(i*7919+batch)%65521).value for i in range(B)]
            if n>2 and data=='boundary':
                values[0]=lo;values[n-1]=hi
        raw+=values;valid=values[:n]
        expected.append((max(valid) if kind=='max' else min(valid)) if valid else neutral)
    expected += [123]*7
    return Tensor(raw,dtype),Tensor([123]*len(expected),dtype),n,expected,neutral


def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--dtype',choices=TYPES,required=True);p.add_argument('--kind',choices=('min','max'),required=True)
    p.add_argument('--block',type=int,default=1024);p.add_argument('--grid',type=int,choices=(1,3),default=3)
    p.add_argument('--data',choices=('ordinary','boundary','identity','high','empty','one'),default='ordinary')
    p.add_argument('--conditional',action='store_true');p.add_argument('--epoch',choices=('before','after'),required=True)
    p.add_argument('--rounds',type=int,default=1);p.add_argument('--repeats',type=int,default=0)
    p.add_argument('--stack',choices=('base','full','both'),default='both')
    p.add_argument('--compile-only',action='store_true');p.add_argument('--output',type=pathlib.Path,required=True)
    p.add_argument('--dump-dir',type=pathlib.Path);a=p.parse_args()
    x,y,n,expected,neutral=prepare(a.dtype,a.kind,a.block,a.grid,a.data);rows=[];controls={}
    eligible=a.block>=1024 and not a.conditional
    stacks=[False,True] if a.stack=='both' else [a.stack=='full'];plans=list(itertools.product(stacks,(False,True),(False,True)))
    for round_ in range(a.rounds):
        for stack,reg,group in (plans if round_%2==0 else reversed(plans)):
            kw=dict(B=a.block,MAX=a.kind=='max',OTHER=neutral,CONDITIONAL=a.conditional)
            c=extrema.warmup(x,y,n,1,grid=(a.grid,),**kw,register_accumulator=reg,group_reduction=group,
                reduction_unroll=4 if stack else 1,cooperative_load_staging=stack,fuse_elementwise=stack,
                reuse_local_memory=True,terminal_store_distribution=stack,accumulator_init_forwarding=stack,
                matmul_register_tiling=stack)
            code=c.asm['sycl'];code=code.decode() if isinstance(code,bytes) else code;memir=str(c.asm['memir'])
            collective=code.count('sycl::reduce_over_group')
            want=a.epoch=='after' and group and eligible
            assert collective==int(want),(a.dtype,a.kind,stack,reg,group,want,memir)
            digest=hashlib.sha256(code.encode()).hexdigest();controls[stack,reg,group]=digest
            if (stack,not reg,group) in controls:assert controls[stack,not reg,group]==digest
            if a.dump_dir:
                a.dump_dir.mkdir(parents=True,exist_ok=True)
                for ext,text in [('sycl',code),('memir',memir)]:
                    (a.dump_dir/f'stack{stack}-reg{reg}-group{group}.{ext}').write_text(text)
            checked=0;samples=[]
            if not a.compile_only:
                for local in (1,3,48,(3,5),64,257):
                    for flag in ((0,1) if a.conditional else (1,)):
                        y.c_array[:]=[123]*len(expected)
                        bound=[x,y,n,flag,a.block,a.kind=='max',neutral,a.conditional]
                        run_standalone(a.grid,1,1,c.name,code,bound,signature=c.src.signature,metadata=c.metadata,block_size=local)
                        ref=[neutral]*a.grid+[123]*7 if a.conditional and not flag else expected
                        assert list(y.c_array)==ref,(a.dtype,a.kind,stack,reg,group,local,list(y.c_array),ref)
                        checked+=len(expected)
                if a.repeats:
                    samples=profile_standalone(a.grid,1,1,c.name,code,
                        [x,y,n,1,a.block,a.kind=='max',neutral,a.conditional],signature=c.src.signature,
                        metadata=c.metadata,block_size=64,warmup=10,repeats=a.repeats)
                    assert list(y.c_array)==expected;checked+=len(expected)
            row=dict(dtype=a.dtype,kind=a.kind,block=a.block,grid=a.grid,data=a.data,conditional=a.conditional,
                epoch=a.epoch,stack=stack,reg=reg,group=group,round=round_,status='PASS',
                compile_only=a.compile_only,eligible=eligible,collectives=collective,
                source_sha256=digest,staging=memir.count('sycl.cooperative_load_staging'),
                promoted=memir.count('sycl.register_accumulator'),output_elements=len(expected),
                elements_checked=checked,neutral=neutral,reference=expected,samples_ns=samples,
                median_ns=statistics.median(samples) if samples else None)
            rows.append(row);print(json.dumps(row),flush=True);a.output.write_text(json.dumps(rows,indent=2)+'\n')


if __name__=='__main__':main()
