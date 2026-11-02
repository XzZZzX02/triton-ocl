"""Collective/register priority regression with independent references and events."""
import argparse
import hashlib
import itertools
import json
import math
import pathlib
import statistics
import struct
import ctypes
import triton
import triton.language as tl
from triton.backends.sycl.sycl_utils import run_standalone,profile_standalone


@triton.jit
def product(a,b):return a*b


@triton.jit
def pair(a,b,c,d):return a+c,tl.maximum(b,d)


@triton.jit
def bit_and(a,b):return a&b


@triton.jit
def bit_or(a,b):return a|b


@triton.jit(do_not_specialize=['n','flag'])
def kernel(x,y,n,flag,B:tl.constexpr,KIND:tl.constexpr):
    p=tl.program_id(0);i=tl.arange(0,B)
    v=tl.load(x+p*B+i,i<n,1 if KIND=='product' or KIND=='product_zero' else 0)
    if KIND=='conditional':
        if flag:r=tl.sum(v,0)
        else:r=17.
        tl.store(y+p,r)
    elif KIND=='product' or KIND=='product_zero':tl.store(y+p,tl.reduce(v,0,product))
    elif KIND=='max':tl.store(y+p,tl.max(v,0))
    elif KIND=='min':tl.store(y+p,tl.min(v,0))
    elif KIND=='tuple':
        a,b=tl.reduce((v,v),0,pair)
        tl.store(y+2*p,a);tl.store(y+2*p+1,b)
    elif KIND=='and':tl.store(y+p,tl.reduce(v,0,bit_and))
    elif KIND=='or':tl.store(y+p,tl.reduce(v,0,bit_or))
    elif KIND=='xor':tl.store(y+p,tl.xor_sum(v,0))
    else:tl.store(y+p,tl.sum(v,0))


class Tensor:
    def __init__(self,values,integer=False):
        self.dtype=tl.int32 if integer else tl.float32
        self.c_array=((ctypes.c_int32 if integer else ctypes.c_float)*len(values))(*values)
    def data_ptr(self):return ctypes.addressof(self.c_array)


def prepare(case,B,grid):
    integer=case in ('and','or','xor');n=B if case not in ('sum','max','min') else B-7
    data=[];expected=[]
    for batch in range(grid):
        values=[(i%17-8)/4 for i in range(B)]
        if integer:values=[ctypes.c_int32(0x71234567^(i*7919)).value for i in range(B)]
        if case in ('product','product_zero'):values=[-1. if i%3==0 else 1. for i in range(B)]
        if case=='product_zero':values[-1]=-0.
        if case=='sum_zero':values=[-0.]*B
        if case=='sum_nan':values[13]=math.nan
        if case=='max':values=[-(i%17+1)/4 for i in range(B)]
        if case=='min':values=[(i%17+1)/4 for i in range(B)]
        active=values[:n];data+=values
        if case=='and':
            result=active[0]
            for v in active[1:]:result&=v
        elif case in ('or','xor'):
            result=0
            for v in active:result=(result|v) if case=='or' else (result^v)
        elif case in ('product','product_zero'):result=math.prod(active)
        elif case=='max':result=max(active)
        elif case=='min':result=min(active)
        else:result=sum(active)
        expected.extend([result,max(active)] if case=='tuple' else [result])
    expected += [-999.]*7
    return Tensor(data,integer),Tensor([-999]*len(expected),integer),n,expected


def check(values,expected,integer):
    assert len(values)==len(expected)
    for i,(a,b) in enumerate(zip(values,expected)):
        assert (math.isnan(a) if isinstance(b,float) and math.isnan(b) else
                a==b if integer else struct.pack('<f',a)==struct.pack('<f',b)),(i,a,b)


def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--case',choices=('sum','product','sum_nan','sum_zero','product_zero','max','min','tuple','conditional','and','or','xor'),required=True)
    p.add_argument('--block',type=int,default=1024);p.add_argument('--grid',type=int,choices=(1,3),default=3)
    p.add_argument('--epoch',choices=('before','after'),required=True)
    p.add_argument('--rounds',type=int,default=1);p.add_argument('--repeats',type=int,default=0)
    p.add_argument('--compile-only',action='store_true')
    p.add_argument('--stack',choices=('base','full','both'),default='both')
    p.add_argument('--output',type=pathlib.Path,required=True);p.add_argument('--dump-dir',type=pathlib.Path)
    a=p.parse_args();x,y,n,expected=prepare(a.case,a.block,a.grid);integer=a.case in ('and','or','xor')
    eligible=a.block>=256 and a.case not in ('max','min','tuple','conditional')
    stacks=[False,True] if a.stack=='both' else [a.stack=='full'];rows=[];source_pairs={}
    for round_ in range(a.rounds):
        plans=list(itertools.product(stacks,(False,True),(False,True)))
        for stack,reg,group in (plans if round_%2==0 else reversed(plans)):
            c=kernel.warmup(x,y,n,1,B=a.block,KIND=a.case,grid=(a.grid,),
                register_accumulator=reg,group_reduction=group,reduction_unroll=4 if stack else 1,
                cooperative_load_staging=stack,terminal_store_distribution=stack,
                accumulator_init_forwarding=stack,fuse_elementwise=stack,reuse_local_memory=True,
                matmul_register_tiling=stack)
            code=c.asm['sycl'];code=code.decode() if isinstance(code,bytes) else code;memir=str(c.asm['memir'])
            collective=code.count('sycl::reduce_over_group')
            # Promotion intentionally requires a nested affine reduction;
            # collectives intentionally require a top-level uniform one.
            # The two current match domains do not conflict.
            want=group and eligible
            assert collective==int(want),(a.case,stack,reg,group,collective,memir)
            digest=hashlib.sha256(code.encode()).hexdigest()
            source_pairs[stack,reg,group]=digest
            if eligible and group and (stack,not reg,group) in source_pairs:
                assert digest==source_pairs[stack,not reg,group],(a.case,stack,reg,group)
            if a.dump_dir:
                a.dump_dir.mkdir(parents=True,exist_ok=True)
                for ext,data in [('sycl',code),('memir',memir)]:
                    (a.dump_dir/f'stack{stack}-reg{reg}-group{group}.{ext}').write_text(data)
            checks=0;samples=[]
            if not a.compile_only:
                for local in (1,3,48,(3,5),64):
                    for flag in ((0,1) if a.case=='conditional' else (1,)):
                        y.c_array[:]=[-999]*len(expected)
                        bound=[x,y,n,flag,a.block,a.case]
                        run_standalone(a.grid,1,1,c.name,code,bound,signature=c.src.signature,metadata=c.metadata,block_size=local)
                        ref=[17.]*a.grid+[-999.]*7 if a.case=='conditional' and not flag else expected
                        check(list(y.c_array),ref,integer);checks+=len(expected)
                if a.repeats:
                    samples=profile_standalone(a.grid,1,1,c.name,code,[x,y,n,1,a.block,a.case],
                        signature=c.src.signature,metadata=c.metadata,block_size=64,warmup=10,repeats=a.repeats)
                    check(list(y.c_array),expected,integer);checks+=len(expected)
            row=dict(case=a.case,block=a.block,grid=a.grid,epoch=a.epoch,stack=stack,reg=reg,group=group,round=round_,
                status='PASS',compile_only=a.compile_only,eligible=eligible,collectives=collective,
                promoted=memir.count('sycl.register_accumulator'),private_loops=memir.count('sycl.thread_private'),
                staging=memir.count('sycl.cooperative_load_staging'),output_elements=len(expected),
                elements_checked=checks,source_sha256=digest,samples_ns=samples,median_ns=statistics.median(samples) if samples else None)
            rows.append(row);print(json.dumps(row),flush=True);a.output.write_text(json.dumps(rows,indent=2)+'\n')


if __name__=='__main__':main()
