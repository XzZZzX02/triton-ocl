"""Measure added serial-output protection only against bit-correct controls."""
import argparse
import hashlib
import json
import pathlib
import statistics
import tempfile
from serial_half_copy_bits import Bits,source
from triton.backends.sycl.sycl_utils import run_standalone,profile_standalone


def main():
    from triton._C.libtriton import ir,sycl
    from triton.backends.sycl.compiler import SYCLBackend
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--shape',nargs=2,type=int,required=True)
    p.add_argument('--output',required=True,type=pathlib.Path)
    args=p.parse_args();R,C=args.shape
    ctx=ir.context();ir.load_dialects(ctx);sycl.load_dialects(ctx)
    with tempfile.NamedTemporaryFile(mode='w',suffix='.mlir') as f:
        f.write(source(R,C,'affine'));f.flush();mod=ir.parse_mlir_module(f.name,ctx)
    pm=ir.pass_manager(ctx);sycl.passes.memir.serial_half_copy_guard(pm);pm.run(mod)
    text=str(mod);assert text.count('sycl.scalar_half_bits')==4
    after=SYCLBackend.emit_sycl(mod,{},None)
    # Test-only reconstruction: remove only the output phase's guard pair.
    lines=text.splitlines();indices=[i for i,line in enumerate(lines) if 'sycl.scalar_half_bits' in line]
    for i in indices[-2:]:lines[i]=lines[i].replace(' {sycl.scalar_half_bits}','')
    with tempfile.NamedTemporaryFile(mode='w',suffix='.mlir') as f:
        f.write('\n'.join(lines));f.flush();old=ir.parse_mlir_module(f.name,ctx)
    assert str(old).count('sycl.scalar_half_bits')==2
    before=SYCLBackend.emit_sycl(old,{},None)
    special=[0,0x8000,0x3c00,0xbc00,0x7c00,0xfc00,0x7e00,0x7d01,0xfe55,1,0x8001,0x3ff,0x83ff,0x400,0x8400,0x7bff,0xfbff]
    raw=[special[i%len(special)] for i in range(3*R*C)]
    expected=[0x3555]*(3*R*C+7)
    for batch in range(3):
        for r in range(R):
            for c in range(C):expected[batch*R*C+r*C+c]=raw[batch*R*C+c*R+r]
    x,y=Bits(raw),Bits(expected);rows=[]
    for round_ in range(3):
        for variant in (('before','after') if round_%2==0 else ('after','before')):
            code=before if variant=='before' else after
            for block in (1,3,48,(3,5),64):
                y.c_array[:]=[0x3555]*len(expected)
                run_standalone(3,1,1,'half_copy',code,[x,y],block_size=block)
                assert list(y.c_array)==expected,(variant,block)
            samples=profile_standalone(3,1,1,'half_copy',code,[x,y],block_size=64,warmup=10,repeats=31)
            assert list(y.c_array)==expected,(variant,'profile')
            row=dict(shape=[R,C],variant=variant,round=round_,status='PASS',
                elements_checked=6*len(expected),samples_ns=samples,median_ns=statistics.median(samples),
                source_sha256=hashlib.sha256(code.encode()).hexdigest())
            rows.append(row);print(json.dumps(row),flush=True)
            args.output.write_text(json.dumps(rows,indent=2)+'\n')


if __name__=='__main__':main()
