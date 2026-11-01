"""Bit-preserving local transpose elimination under both work ownership plans."""
import argparse
import hashlib
import itertools
import json
import pathlib
import re
import tempfile
from serial_half_copy_bits import Bits,source
from half_store_semantics import SPECIAL
from triton.backends.sycl.sycl_utils import run_standalone


def main():
    from triton._C.libtriton import ir,sycl
    from triton.backends.sycl.compiler import SYCLBackend
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--output',type=pathlib.Path,required=True)
    p.add_argument('--shape',type=int,nargs=2,default=[16,32]);args=p.parse_args();R,C=args.shape
    ctx=ir.context();ir.load_dialects(ctx);sycl.load_dialects(ctx)
    raw=[SPECIAL[i%len(SPECIAL)] for i in range(3*R*C)];expected=[0x3555]*(3*R*C+7)
    for b in range(3):
        for r in range(R):
            for c in range(C):expected[b*R*C+r*C+c]=raw[b*R*C+c*R+r]
    rows=[];x,y=Bits(raw),Bits(expected)
    for middle,enabled in itertools.product((False,True),repeat=2):
        with tempfile.NamedTemporaryFile(mode='w',suffix='.mlir') as f:
            f.write(source(R,C,'affine'));f.flush();mod=ir.parse_mlir_module(f.name,ctx)
        pm=ir.pass_manager(ctx)
        if middle:sycl.passes.memir.work_distribution(pm)
        if enabled:sycl.passes.memir.local_copy_forwarding(pm)
        sycl.passes.memir.local_memory_reuse(pm)
        sycl.passes.memir.serial_half_copy_guard(pm);pm.run(mod)
        count=re.search(r'sycl.local_copies_forwarded = (\d+)',str(mod))
        assert (int(count[1]) if count else 0)==int(enabled)
        code=SYCLBackend.emit_sycl(mod,{},None)
        for block in (1,3,48,(3,5),64):
            y.c_array[:]=[0x3555]*len(expected)
            run_standalone(3,1,1,'half_copy',code,[x,y],block_size=block)
            assert list(y.c_array)==expected,[(i,a,b) for i,(a,b) in enumerate(zip(y.c_array,expected)) if a!=b][:8]
            row=dict(shape=[R,C],middle=middle,enabled=enabled,block=block,status='PASS',
                special_bits=SPECIAL,elements_checked=len(expected),source_sha256=hashlib.sha256(code.encode()).hexdigest())
            rows.append(row);print(json.dumps(row),flush=True);args.output.write_text(json.dumps(rows,indent=2)+'\n')


if __name__=='__main__':main()
