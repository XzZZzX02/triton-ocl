"""Independent rounded-product references, explicit counterexamples and safe widening."""
import argparse
import ctypes
import hashlib
import itertools
import json
import math
import pathlib
import statistics
import tempfile

import triton.language as tl
from dtype_semantics import DTYPES, pack_value, unpack_value
from triton.backends.sycl.sycl_utils import run_standalone,profile_standalone


class Tensor:
    def __init__(self,dtype,values):
        self.dtype=getattr(tl,dtype);self.name=dtype
        payload=b''.join(pack_value(dtype,v) for v in values)
        typ=DTYPES[dtype][1]
        self.c_array=(typ*(len(payload)//ctypes.sizeof(typ))).from_buffer_copy(payload)
    def data_ptr(self):return ctypes.addressof(self.c_array)
    def values(self):
        data=bytes(self.c_array);size=ctypes.sizeof(DTYPES[self.name][1])
        return [unpack_value(self.name,data[i:i+size]) for i in range(0,len(data),size)]


CASES={'f32':('float32','float32','float32',True),
       'f64':('float64','float64','float64',True),
       'half':('float16','float16','float32',False),
       'bf16':('bfloat16','bfloat16','float32',True),
       'widened_f32':('float32','float32','float64',False)}
MLIR={'float16':'f16','bfloat16':'bf16','float32':'f32','float64':'f64'}


def cast(dtype,value):
    try:return unpack_value(dtype,pack_value(dtype,value))
    except OverflowError:return math.copysign(math.inf,value)


def source(a,b,dest,count):
    widening=''
    x,y='%x','%y'
    if a!=dest:widening+=f'%ax = arith.extf %x : {a} to {dest}\n';x='%ax'
    if b!=dest:widening+=f'%by = arith.extf %y : {b} to {dest}\n';y='%by'
    return f'''module {{func.func @product_add(%a:memref<*x{a}>,%b:memref<*x{b}>,%c:memref<*x{dest}>,%out:memref<*x{dest}>) {{
%zero = arith.constant 0 : index
%pid = gpu.global_id x
affine.for %i = 0 to {count} {{
 %at = affine.apply affine_map<(d0,d1)->(d0*{count}+d1)>(%pid,%i)
 %ap = memref.reinterpret_cast %a to offset:[%at], sizes:[1], strides:[1] : memref<*x{a}> to memref<1x{a}, strided<[1], offset: ?>>
 %bp = memref.reinterpret_cast %b to offset:[%at], sizes:[1], strides:[1] : memref<*x{b}> to memref<1x{b}, strided<[1], offset: ?>>
 %cp = memref.reinterpret_cast %c to offset:[%at], sizes:[1], strides:[1] : memref<*x{dest}> to memref<1x{dest}, strided<[1], offset: ?>>
 %op = memref.reinterpret_cast %out to offset:[%at], sizes:[1], strides:[1] : memref<*x{dest}> to memref<1x{dest}, strided<[1], offset: ?>>
 %x = memref.load %ap[%zero] : memref<1x{a}, strided<[1], offset: ?>>
 %y = memref.load %bp[%zero] : memref<1x{b}, strided<[1], offset: ?>>
 %z = memref.load %cp[%zero] : memref<1x{dest}, strided<[1], offset: ?>>
 {widening}
 %p = arith.mulf {x}, {y} : {dest}
 %v = arith.addf %p, %z : {dest}
 memref.store %v, %op[%zero] : memref<1x{dest}, strided<[1], offset: ?>>
}}
return
}}}}'''


def main():
    from triton._C.libtriton import ir,sycl
    from triton.backends.sycl.compiler import SYCLBackend
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--case',choices=CASES,required=True)
    p.add_argument('--guards',nargs='+',type=int,choices=(0,1),default=[1])
    p.add_argument('--blocks',nargs='+',default=['1','3','48','64','3x5'])
    p.add_argument('--rounds',type=int,default=1)
    p.add_argument('--repeats',type=int,default=0)
    p.add_argument('--profile-block',default='64')
    p.add_argument('--output',type=pathlib.Path,required=True)
    p.add_argument('--dump-dir',type=pathlib.Path,required=True)
    args=p.parse_args()
    at,bt,dt,unsafe=CASES[args.case]
    bits=52 if dt=='float64' else 23
    eps=2**-(27 if dt=='float64' else 23)
    max32=unpack_value('float32',bytes.fromhex('ffff7f7f'))
    triples=[(1+eps,1-eps,-1.),(0.,math.inf,1.),(-0.,1.,-0.),
             (math.inf,1.,-math.inf),(math.nan,1.,0.),(0.,-1.,-0.),
             (1.,1.,-1.),(1.,-1.,1.),(2**-bits,0.75,-2**-bits)]
    if args.case=='f32':triples+=[(2**-149,0.5,2**-149)]
    if args.case=='f64':triples+=[(2**-1074,0.5,2**-1074)]
    if args.case=='bf16':
        max_bf16=unpack_value('bfloat16',bytes.fromhex('7f7f'))
        triples+=[(max_bf16,1.5,-max32)]
    if args.case=='half':triples+=[(65504.,65504.,-cast('float32',65504.*65504.)),
                                  (2**-24,2**-24,-2**-48)]
    if args.case=='widened_f32':
        triples+=[(max32,max32,-max32*max32),(2**-149,2**-149,-2**-298)]
    count,grid=64,3
    chosen=[triples[i%len(triples)] for i in range(count*grid)]
    a=Tensor(at,[x[0] for x in chosen]);b=Tensor(bt,[x[1] for x in chosen])
    c=Tensor(dt,[x[2] for x in chosen]);out=Tensor(dt,[-999.]*(count*grid+7))
    expected=[cast(dt,cast(dt,x*y)+z) for x,y,z in zip(a.values(),b.values(),c.values())]+[-999.]*7
    ctx=ir.context();ir.load_dialects(ctx);sycl.load_dialects(ctx)
    text=source(MLIR[at],MLIR[bt],MLIR[dt],count)
    rows=[];hashes={}
    args.dump_dir.mkdir(parents=True,exist_ok=True)
    for round_ in range(args.rounds):
        for enabled in (args.guards if round_%2==0 else reversed(args.guards)):
            with tempfile.NamedTemporaryFile(mode='w',suffix='.mlir') as f:
                f.write(text);f.flush();mod=ir.parse_mlir_module(f.name,ctx)
            pm=ir.pass_manager(ctx)
            if enabled:sycl.passes.memir.fp_contract_guard(pm)
            pm.run(mod)
            memir=str(mod)
            assert memir.count('sycl.fp_contract_off')==int(bool(enabled) and unsafe)
            code=SYCLBackend.emit_sycl(mod,{},None)
            digest=hashlib.sha256(code.encode()).hexdigest()
            if enabled in hashes:assert hashes[enabled]==digest
            hashes[enabled]=digest
            if not unsafe and 0 in hashes and 1 in hashes:assert hashes[0]==hashes[1]
            for ext,data in (('sycl',code),('memir',memir)):
                (args.dump_dir/f'enabled{enabled}.{ext}').write_text(data)
            for block in args.blocks:
                local=tuple(map(int,block.split('x'))) if 'x' in block else int(block)
                out.c_array[:]=[-999.]*(count*grid+7)
                run_standalone(grid,1,1,'product_add',code,[a,b,c,out],block_size=local)
                bad=[dict(index=i,actual=got,expected=want) for i,(got,want) in enumerate(zip(out.values(),expected))
                     if not (math.isnan(got) if math.isnan(want) else pack_value(dt,got)==pack_value(dt,want))]
                assert not bad or (not enabled and unsafe),(args.case,enabled,block,bad[:8])
                row=dict(status='PASS' if not bad else 'REPRODUCED_BASELINE_MISMATCH',
                    case=args.case,enabled=enabled,round=round_,block=block,grid=grid,count=count,
                    mismatches=bad[:12],mismatch_count=len(bad),elements_checked=len(expected),
                    source_sha256=digest,samples_ns=[],median_ns=None)
                rows.append(row);args.output.write_text(json.dumps(rows,indent=2)+'\n')
                print(json.dumps(row),flush=True)
            if args.repeats:
                local=tuple(map(int,args.profile_block.split('x'))) if 'x' in args.profile_block else int(args.profile_block)
                samples=profile_standalone(grid,1,1,'product_add',code,[a,b,c,out],
                    block_size=local,warmup=10,repeats=args.repeats)
                bad=[i for i,(got,want) in enumerate(zip(out.values(),expected)) if not (
                    math.isnan(got) if math.isnan(want) else pack_value(dt,got)==pack_value(dt,want))]
                assert not bad or (not enabled and unsafe)
                row=dict(status='PASS' if not bad else 'REPRODUCED_BASELINE_MISMATCH',
                    case=args.case,enabled=enabled,round=round_,block=args.profile_block,
                    grid=grid,count=count,mismatch_count=len(bad),elements_checked=len(expected),
                    source_sha256=digest,samples_ns=samples,median_ns=statistics.median(samples))
                rows.append(row);args.output.write_text(json.dumps(rows,indent=2)+'\n')
                print(json.dumps(row),flush=True)


if __name__=='__main__':main()
