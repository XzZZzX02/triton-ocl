"""Diagnostic only: locate binary16 corruption across local copy phases."""
import argparse
import hashlib
import json
import pathlib
import re
import tempfile
from serial_half_copy_bits import Bits,source
from triton.backends.sycl.sycl_utils import run_standalone


def main():
    from triton._C.libtriton import ir,sycl
    from triton.backends.sycl.compiler import SYCLBackend
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--output',required=True);args=p.parse_args()
    ctx=ir.context();ir.load_dialects(ctx);sycl.load_dialects(ctx)
    with tempfile.NamedTemporaryFile(mode='w',suffix='.mlir') as f:
        f.write(source(16,32,'affine'));f.flush();mod=ir.parse_mlir_module(f.name,ctx)
    pm=ir.pass_manager(ctx);sycl.passes.memir.work_distribution(pm);sycl.passes.memir.serial_half_copy_guard(pm);pm.run(mod)
    code=SYCLBackend.emit_sycl(mod,{},None)
    pairs=list(re.finditer(r'(?m)^( *)triton_sycl_float16 (var_\d+) = ([^;]+);[^\n]*\n\1([^;\n]+) = \2;',code))
    assert len(pairs)==3,len(pairs)
    values=[0,0x8000,0x3c00,0xbc00,0x7c00,0xfc00,0x7e00,0x7d01,0xfe55,1,0x8001,0x3ff,0x83ff,0x400,0x8400,0x7bff,0xfbff]
    raw=[values[i%len(values)] for i in range(1536)];expected=[0x3555]*1543
    for p_ in range(3):
        for r in range(16):
            for c in range(32):expected[p_*512+r*32+c]=raw[p_*512+c*16+r]
    rows=[]
    for variant,selected in [('original',()),('middle',(1,)),('input',(0,)),('output',(2,)),('all',(0,1,2))]:
        transformed=code
        for i in reversed(selected):
            m=pairs[i];pad,tmp,src,dst=m.groups()
            replacement=f'{pad}triton_sycl_float16 {tmp};\n{pad}{tmp}.bits = *reinterpret_cast<const volatile uint16_t*>(&({src}).bits);\n{pad}*reinterpret_cast<volatile uint16_t*>(&({dst}).bits) = {tmp}.bits;'
            transformed=transformed[:m.start()]+replacement+transformed[m.end():]
        pathlib.Path(args.output+'.'+variant+'.sycl').write_text(transformed)
        for block in (1,3,48,(3,5)):
            x,y=Bits(raw),Bits([0x3555]*1543);error=None
            try:
                run_standalone(3,1,1,'half_copy',transformed,[x,y],block_size=block)
                diff=[dict(index=i,got=a,want=b) for i,(a,b) in enumerate(zip(y.c_array,expected)) if a!=b]
            except Exception as e:error=repr(e);diff=[]
            row=dict(variant=variant,block=block,status='EXECUTION_ERROR' if error else 'MISMATCH' if diff else 'PASS',
                     mismatches=diff[:16],mismatch_count=len(diff),error=error,
                     source_sha256=hashlib.sha256(transformed.encode()).hexdigest())
            rows.append(row);print(json.dumps(row),flush=True)
            pathlib.Path(args.output).write_text(json.dumps(rows,indent=2)+'\n')


if __name__=='__main__':main()
