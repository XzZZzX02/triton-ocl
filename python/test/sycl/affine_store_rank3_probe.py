"""Diagnostic only: isolate rank3 half baseline staging versus output failure."""
import argparse
import hashlib
import json
import pathlib
import re
import tempfile
from affine_store_cases import fixture,source,Raw
from triton.backends.sycl.sycl_utils import run_standalone


def main():
    from triton._C.libtriton import ir,sycl
    from triton.backends.sycl.compiler import SYCLBackend
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--output',type=pathlib.Path,required=True);a=p.parse_args()
    shape,coef,base,spacing,raw,expected,sentinel=fixture('rank3','f16',3)
    ctx=ir.context();ir.load_dialects(ctx);sycl.load_dialects(ctx)
    with tempfile.NamedTemporaryFile(mode='w',suffix='.mlir') as f:
        f.write(source(shape,coef,'f16','affine','affine','rank3',True,spacing,base));f.flush();mod=ir.parse_mlir_module(f.name,ctx)
    pm=ir.pass_manager(ctx);sycl.passes.memir.work_distribution(pm);sycl.passes.memir.local_memory_reuse(pm);sycl.passes.memir.serial_half_copy_guard(pm);pm.run(mod)
    code=SYCLBackend.emit_sycl(mod,{},None)
    pattern=r'(?m)^([ \t]*)triton_sycl_float16 (var_\d+) = ([^\n;]+);[^\n]*\n\1(var_\d+\[[^\n;]+\]) = \2;'
    matches=list(re.finditer(pattern,code));assert len(matches)==1,len(matches)
    match=matches[0];pad,tmp,src,dst=match.groups()
    bitcopy=f'{pad}triton_sycl_float16 {tmp};\n{pad}{tmp}.bits = *reinterpret_cast<const volatile uint16_t*>(&({src}).bits);\n{pad}*reinterpret_cast<volatile uint16_t*>(&{dst}.bits) = {tmp}.bits;'
    guarded=code[:match.start()]+bitcopy+code[match.end():]
    rows=[]
    for variant,program in [('original',code),('input_bits',guarded)]:
        a.output.with_suffix('.'+variant+'.sycl').write_text(program)
        for block in (1,3,48,(3,5),64):
            x,y=Raw(raw,'f16'),Raw([sentinel]*len(expected),'f16');error=None;diff=[]
            try:
                run_standalone(3,1,1,'affine_copy',program,[x,y,1],block_size=block)
                diff=[dict(index=i,got=x,want=y) for i,(x,y) in enumerate(zip(y.c_array,expected)) if x!=y]
            except Exception as e:error=repr(e)
            row=dict(variant=variant,block=block,status='EXECUTION_ERROR' if error else 'MISMATCH' if diff else 'PASS',
                mismatch_count=len(diff),mismatches=diff[:8],error=error,source_sha256=hashlib.sha256(program.encode()).hexdigest())
            rows.append(row);print(json.dumps(row),flush=True);a.output.write_text(json.dumps(rows,indent=2)+'\n')


if __name__=='__main__':main()
