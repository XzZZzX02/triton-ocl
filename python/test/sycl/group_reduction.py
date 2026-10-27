"""Collective legality and semantics; every case has an independent process.

Integer references use modular arithmetic. Floating probes are exact binary
fractions or classification/zero-sign checks, with no tolerance hiding NaNs.
"""
import argparse
import concurrent.futures
import ctypes
import itertools
import json
import math
import os
import pathlib
import subprocess
import sys

CASES = ['sum:f32', 'sum:f64', 'sum:i32', 'sum:u32', 'sum:i64',
         'sum:u64', 'product:f32', 'and:u32', 'or:u64', 'xor:i32',
         'short:f32', 'conditional:f32', 'maxnan:f32', 'minzero:f32',
         'sum_nan:f32', 'sum_zero:f32', 'product_zero:f32', 'tuple:f32']


def execute(case, repeats):
    import triton
    import triton.language as tl
    from triton.backends.sycl.sycl_utils import run_standalone, profile_standalone
    globals().update(tl=tl)

    @triton.jit
    def bit_and(a, b): return a & b

    @triton.jit
    def bit_or(a, b): return a | b

    @triton.jit
    def coupled(a, b, c, d):
        return a+c, tl.maximum(b, d)

    @triton.jit(do_not_specialize=['flag'])
    def kernel(x, y, flag, N: tl.constexpr, B: tl.constexpr, KIND: tl.constexpr):
        i = tl.arange(0, B)
        v = tl.load(x+i, i < N, 1 if KIND == 'product' or KIND == 'product_zero' else 0)
        if KIND == 'conditional':
            if flag:
                tl.store(y, tl.sum(v, 0))
            else:
                tl.store(y, 17.)
        elif KIND == 'and': tl.store(y, tl.reduce(v, 0, bit_and))
        elif KIND == 'or': tl.store(y, tl.reduce(v, 0, bit_or))
        elif KIND == 'xor': tl.store(y, tl.xor_sum(v, 0))
        elif KIND == 'product' or KIND == 'product_zero': tl.store(y, tl.reduce(v, 0, _product))
        elif KIND == 'maxnan': tl.store(y, tl.max(v, 0))
        elif KIND == 'minzero': tl.store(y, tl.min(v, 0))
        elif KIND == 'tuple':
            a, b = tl.reduce((v, v), 0, coupled)
            tl.store(y, a)
            tl.store(y+1, b)
        else: tl.store(y, tl.sum(v, 0))

    @triton.jit
    def product(a, b): return a*b
    globals().update(_product=product,bit_and=bit_and,bit_or=bit_or,coupled=coupled)

    kind, dtype = case.split(':')
    types = dict(f32=(tl.float32,ctypes.c_float), f64=(tl.float64,ctypes.c_double),
                 i32=(tl.int32,ctypes.c_int32),u32=(tl.uint32,ctypes.c_uint32),
                 i64=(tl.int64,ctypes.c_int64),u64=(tl.uint64,ctypes.c_uint64))
    ty, ctype = types[dtype]
    class Tensor:
        def __init__(self, values):
            self.dtype = ty
            self.c_array = (ctype*len(values))(*values)
        def data_ptr(self): return ctypes.addressof(self.c_array)

    b = 64 if kind == 'short' else 1024
    n = b-7 if kind == 'sum' else b
    if dtype.startswith(('i','u')):
        bits=ctypes.sizeof(ctype)*8
        values=[ctype((1 << (bits-1)) + i*7919).value for i in range(n)]
    else: values=[float(i%17-8)/4 for i in range(n)]
    if kind.startswith('product'): values=[-1. if i%3 == 0 else 1. for i in range(n)]
    if kind == 'maxnan': values=[math.nan]*n
    if kind == 'minzero': values=[0., -0.]*(n//2)
    if kind == 'sum_nan': values[13]=math.nan
    if kind == 'sum_zero': values=[-0.]*n
    if kind == 'product_zero': values=[1.]*(n-1)+[-0.]
    if kind == 'and': expected=values[0]
    elif kind in ('or','xor'): expected=0
    elif kind.startswith('product'): expected=math.prod(values)
    elif kind == 'maxnan': expected=math.nan
    elif kind == 'minzero': expected=-0.
    else: expected=sum(values)
    if kind == 'and':
        for v in values: expected &= v
    if kind == 'or':
        for v in values: expected |= v
    if kind == 'xor':
        for v in values: expected ^= v
    if dtype.startswith(('i','u')): expected=ctype(expected).value
    expected=[expected, max(values)] if kind == 'tuple' else [expected]
    records=[]
    for fuse,reuse,group in itertools.product((False,True),repeat=3):
        x,y=Tensor(values),Tensor([-99]*len(expected))
        compiled=kernel.warmup(x,y,1,N=n,B=b,KIND=kind,grid=(1,),
            fuse_elementwise=fuse,reuse_local_memory=reuse,group_reduction=group)
        source=compiled.asm['sycl']
        if isinstance(source,bytes): source=source.decode()
        collectives=source.count('sycl::reduce_over_group')
        # Coupled tuple combiners and control flow must preserve serial form.
        rejected=kind in ('short','conditional','maxnan','minzero','tuple')
        if not group or rejected: assert collectives == 0, (case,group,collectives)
        else: assert collectives > 0, ('missed collective',case,group)
        for block in (3,48,(3,5),257):
            for flag in ((0,1) if kind == 'conditional' else (1,)):
                args=[x,y,flag,n,b,kind]
                run_standalone(1,1,1,compiled.name,source,args,signature=compiled.src.signature,
                               metadata=compiled.metadata,block_size=block)
                actual=list(y.c_array)
                reference=[17.] if kind == 'conditional' and not flag else expected
                for a,e in zip(actual,reference):
                    if isinstance(e,float) and math.isnan(e): assert math.isnan(a), (case,a,e)
                    else:
                        assert a == e, (case,block,flag,a,e)
                        if e == 0 and kind in ('minzero','sum_zero','product_zero'):
                            assert math.copysign(1.,a) == math.copysign(1.,e), (case,a,e)
        samples=profile_standalone(1,1,1,compiled.name,source,[x,y,1,n,b,kind],
            signature=compiled.src.signature,metadata=compiled.metadata,block_size=48,
            warmup=10,repeats=repeats) if repeats else []
        records.append(dict(fuse=fuse,reuse=reuse,group=group,collectives=collectives,samples_ns=samples))
    return records


def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--case',choices=CASES)
    p.add_argument('--cases',nargs='+',choices=CASES)
    p.add_argument('--python',default=sys.executable)
    p.add_argument('--jobs',type=int,default=4)
    p.add_argument('--output')
    p.add_argument('--repeats',type=int,default=0)
    args=p.parse_args()
    if args.case:
        print(json.dumps(dict(case=args.case,status='PASS',configs=execute(args.case,args.repeats))))
        return
    def run(case):
        try:
            result=subprocess.run([args.python,__file__,'--case',case,'--repeats',str(args.repeats)],
                capture_output=True,text=True,timeout=1500)
            if result.returncode: return dict(case=case,status='FAIL',error=(result.stdout+result.stderr)[-14000:])
            return json.loads(result.stdout.splitlines()[-1])
        except Exception as e: return dict(case=case,status='FAIL',error=repr(e))
    rows=[]
    with concurrent.futures.ThreadPoolExecutor(max_workers=args.jobs) as pool:
        futures={pool.submit(run,c):c for c in (args.cases or CASES)}
        for future in concurrent.futures.as_completed(futures):
            row=future.result(); rows.append(row); print(json.dumps(row),flush=True)
            pathlib.Path(args.output).write_text(json.dumps(rows,indent=2)+'\n')
    raise SystemExit(any(r['status'] != 'PASS' for r in rows))


if __name__ == '__main__': main()
