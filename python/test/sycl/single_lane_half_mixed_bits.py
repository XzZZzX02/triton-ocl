"""Exercise both conditional emitter dialects with explicit independent copies."""
import argparse
import hashlib
import json
import pathlib
import tempfile
from serial_half_copy_bits import Bits,source
from half_store_semantics import SPECIAL
from triton.backends.sycl.sycl_utils import run_standalone


def main():
    from triton._C.libtriton import ir,sycl
    from triton.backends.sycl.compiler import SYCLBackend
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--output',type=pathlib.Path,required=True)
    p.add_argument('--dump-dir',type=pathlib.Path)
    args=p.parse_args();ctx=ir.context();ir.load_dialects(ctx);sycl.load_dialects(ctx)
    R,C=8,16;raw=[SPECIAL[i%len(SPECIAL)] for i in range(3*R*C)];expected=[0x3555]*(3*R*C+7)
    for b in range(3):
        for r in range(R):
            for c in range(C):expected[b*R*C+r*C+c]=raw[b*R*C+c*R+r]
    rows=[]
    for load_dialect,store_dialect in [('memref','affine'),('affine','memref')]:
        text=source(R,C,load_dialect).replace(f'{load_dialect}.store %v,%b',f'{store_dialect}.store %v,%b')
        if store_dialect=='memref':
            # Explicit valid MemIR schedule: transpose iterations write unique
            # b[r,c] cells and read disjoint source allocation a[c,r].
            # Generic WorkDistribution conservatively rejects memref stores.
            old='} {sycl.parallel}\n      affine.for %r'
            assert old in text
            text=text.replace(old,'} {sycl.parallel, sycl.distribute, sycl.distribution_depth = 2 : i64}\n      affine.for %r')
        with tempfile.NamedTemporaryFile(mode='w',suffix='.mlir') as f:
            f.write(text);f.flush();mod=ir.parse_mlir_module(f.name,ctx)
        pm=ir.pass_manager(ctx)
        if store_dialect=='affine':sycl.passes.memir.work_distribution(pm)
        sycl.passes.memir.serial_half_copy_guard(pm);pm.run(mod)
        assert str(mod).count('sycl.single_lane_half_bits')==2,str(mod)
        code=SYCLBackend.emit_sycl(mod,{},None)
        if args.dump_dir:
            args.dump_dir.mkdir(parents=True,exist_ok=True)
            (args.dump_dir/f'{load_dialect}-{store_dialect}.sycl').write_text(code)
            (args.dump_dir/f'{load_dialect}-{store_dialect}.memir').write_text(str(mod))
        x,y=Bits(raw),Bits(expected)
        for block in (1,3,48,(3,5),64):
            y.c_array[:]=[0x3555]*len(expected)
            run_standalone(3,1,1,'half_copy',code,[x,y],block_size=block)
            assert list(y.c_array)==expected,[(i,a,b) for i,(a,b) in enumerate(zip(y.c_array,expected)) if a!=b][:8]
            row=dict(load_dialect=load_dialect,store_dialect=store_dialect,block=block,status='PASS',
                elements_checked=len(expected),special_bits=SPECIAL,source_sha256=hashlib.sha256(code.encode()).hexdigest())
            rows.append(row);print(json.dumps(row),flush=True);args.output.write_text(json.dumps(rows,indent=2)+'\n')


if __name__=='__main__':main()
