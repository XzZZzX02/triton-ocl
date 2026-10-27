"""All 18x18 storage dtype casts, plus every legal narrowing RTZ pair.

Float-to-int inputs are restricted to representable results: MLIR leaves
NaN/infinity/out-of-range conversions undefined. Integer-to-integer expectations
use explicit truncation/sign extension. Oracles never call generated helpers.
"""
import argparse
import concurrent.futures
import ctypes
import itertools
import json
import math
import os
import pathlib
import struct
import subprocess
import sys

from dtype_semantics import DTYPES, FP8, decode_fp8, encode_fp8, pack_value, unpack_value

NAMES=tuple(DTYPES)
FLOATS=tuple(d for d in NAMES if d.startswith(('float','bfloat')))


def encode(dtype,value,rtz=False):
    if dtype in FP8: return bytes([encode_fp8(dtype,value,rtz)])
    if dtype not in FLOATS:
        return pack_value(dtype,bool(value) if dtype=='int1' else DTYPES[dtype][1](int(value)).value)
    try: raw=pack_value(dtype,float(value))
    except (OverflowError,struct.error): raw=pack_value(dtype,math.copysign(math.inf,value))
    if rtz and math.isfinite(value):
        rounded=unpack_value(dtype,raw)
        if abs(rounded)>abs(value): raw=(int.from_bytes(raw,'little')-1).to_bytes(len(raw),'little')
    return raw


def decode(dtype,raw):
    return decode_fp8(dtype,raw[0]) if dtype in FP8 else unpack_value(dtype,raw)


def probes(src,dst,b=256):
    if src not in FLOATS:
        bits=8*ctypes.sizeof(DTYPES[src][1]);signed=src.startswith('int')
        values=[0,1,2,3,7,15,31,63]
        if src=='int1': values=[0,1]
        else:
            limit=(1 << (bits-int(signed)))-1
            values += [limit,limit-1,1 << (bits-2), (1 << (bits-2))+1]
            if signed: values += [-1,-2,-3,-(1 << (bits-1)), -(1 << (bits-1))+1]
        return (values*b)[:b]
    if dst not in FLOATS:
        values=[0.,-0.,0.5,1.,1.5,2.,3.,7.,15.,31.,63.,127.]
        if dst.startswith('int') and dst!='int1': values += [-0.5,-1.,-1.5,-3.,-7.,-63.,-127.]
        if dst=='int1': values += [math.nan,math.inf,-math.inf,-1.]
        if src in FP8:
            candidates=[decode_fp8(src,i) for i in range(256)]
            if dst=='int1': values=candidates
            else:
                bits=8*ctypes.sizeof(DTYPES[dst][1]);signed=dst.startswith('int')
                lo=-(1 << (bits-1)) if signed else 0
                hi=(1 << (bits-int(signed)))-1
                values=[v for v in candidates if math.isfinite(v) and lo <= int(v) <= hi]
        return (values*b)[:b]
    if src in FP8: return [decode_fp8(src,i) for i in range(256)]
    values=[0.,-0.,1.,-1.,math.inf,-math.inf,math.nan,
            2.**-149,2.**-133,2.**-24,2.**-14,65504.,65520.,1.e10,-1.e10]
    for exponent in (-20,-10,-1,0,1,7,15,32,100):
        for mantissa in (0,1,2,3,7,10,23):
            values += [math.ldexp(1.+2.**(-mantissa-1),exponent),
                       -math.ldexp(1.+2.**(-mantissa-1),exponent)]
    return (values*b)[:b]


def execute(src):
    import triton
    import triton.language as tl
    from triton.backends.sycl.sycl_utils import run_standalone
    globals().update(tl=tl)

    @triton.jit
    def convert(x,y,SLOT:tl.constexpr,B:tl.constexpr):
        i=tl.arange(0,B)
        v=tl.load(x+SLOT*B+i)
        tl.store(y+i,v.to(y.dtype.element_ty))
        if v.dtype.is_floating() and y.dtype.element_ty.is_floating() and v.dtype.primitive_bitwidth > y.dtype.element_ty.primitive_bitwidth:
            tl.store(y+B+i,v.to(y.dtype.element_ty,fp_downcast_rounding='rtz'))
    globals().update(convert=convert)

    @triton.jit
    def kernel(x,y0,y1,y2,y3,y4,y5,y6,y7,y8,y9,y10,y11,y12,y13,y14,y15,y16,y17,B:tl.constexpr):
        convert(x,y0,0,B)
        convert(x,y1,1,B)
        convert(x,y2,2,B)
        convert(x,y3,3,B)
        convert(x,y4,4,B)
        convert(x,y5,5,B)
        convert(x,y6,6,B)
        convert(x,y7,7,B)
        convert(x,y8,8,B)
        convert(x,y9,9,B)
        convert(x,y10,10,B)
        convert(x,y11,11,B)
        convert(x,y12,12,B)
        convert(x,y13,13,B)
        convert(x,y14,14,B)
        convert(x,y15,15,B)
        convert(x,y16,16,B)
        convert(x,y17,17,B)

    class Tensor:
        def __init__(self,dtype,raw):
            self.dtype=getattr(tl,dtype)
            ctype=DTYPES[dtype][1]
            self.c_array=(ctype*(len(raw)//ctypes.sizeof(ctype))).from_buffer_copy(raw)
        def data_ptr(self):return ctypes.addressof(self.c_array)
        def raw(self):return ctypes.string_at(self.data_ptr(),ctypes.sizeof(self.c_array))

    b=256
    segments=[b''.join(encode(src,v) for v in probes(src,d)) for d in NAMES]
    x=Tensor(src,b''.join(segments))
    outputs=[Tensor(d,b'\0'*(b*2*ctypes.sizeof(DTYPES[d][1]))) for d in NAMES]
    c=kernel.warmup(x,*outputs,B=b,grid=(1,))
    if os.environ.get('SYCL_CONVERSION_DUMP'):
        directory=pathlib.Path(os.environ['SYCL_CONVERSION_DUMP']);directory.mkdir(parents=True,exist_ok=True)
        for stage,value in c.asm.items():
            if isinstance(value,bytes):value=value.decode()
            if isinstance(value,str):(directory/(src+'.'+stage)).write_text(value)
    pairs=[]
    for block in (48,(3,5)):
        run_standalone(1,1,1,c.name,c.asm['sycl'],[x,*outputs,b],signature=c.src.signature,
                       metadata=c.metadata,block_size=block)
        source_size=ctypes.sizeof(DTYPES[src][1])
        for dst,segment,y in zip(NAMES,segments,outputs):
            size=ctypes.sizeof(DTYPES[dst][1])
            narrowing=src in FLOATS and dst in FLOATS and source_size>size
            values=[decode(src,segment[i*source_size:(i+1)*source_size]) for i in range(b)]
            for rtz in (False,True) if narrowing else (False,):
                raw=y.raw()[b*size*int(rtz):b*size*(int(rtz)+1)]
                for i,value in enumerate(values):
                    # This checkout routes integers through f32 for fp8, and
                    # legacy fp8e4b15 uses its documented fp16 intermediate.
                    intermediate=value
                    if src not in FLOATS and dst in FP8:
                        intermediate=unpack_value('float32',pack_value('float32',value))
                    expected=encode(dst,intermediate,rtz)
                    actual=raw[i*size:(i+1)*size]
                    want,got=decode(dst,expected),decode(dst,actual)
                    if isinstance(want,float) and math.isnan(want): assert math.isnan(got),(src,dst,rtz,i,got,want)
                    else: assert actual==expected,(src,dst,rtz,i,value,got,want,actual.hex(),expected.hex())
                if block==48:pairs.append(dict(src=src,dst=dst,rounding='rtz' if rtz else 'default',status='PASS'))
    return pairs


def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--source',choices=NAMES)
    p.add_argument('--sources',nargs='+',choices=NAMES)
    p.add_argument('--output')
    p.add_argument('--python',default=sys.executable)
    p.add_argument('--jobs',type=int,default=4)
    args=p.parse_args()
    if args.source:
        print(json.dumps(dict(source=args.source,status='PASS',pairs=execute(args.source))))
        return
    def run(source):
        try:
            r=subprocess.run([args.python,__file__,'--source',source],capture_output=True,text=True,timeout=600)
            if r.returncode:return dict(source=source,status='FAIL',error=(r.stdout+r.stderr)[-14000:])
            return json.loads(r.stdout.splitlines()[-1])
        except Exception as e:return dict(source=source,status='FAIL',error=repr(e))
    rows=[]
    with concurrent.futures.ThreadPoolExecutor(max_workers=args.jobs) as pool:
        for row in pool.map(run,args.sources or NAMES):
            rows.append(row);print(json.dumps(row),flush=True)
            pathlib.Path(args.output).write_text(json.dumps(rows,indent=2)+'\n')
    raise SystemExit(any(r['status']!='PASS' for r in rows))


if __name__=='__main__':main()
