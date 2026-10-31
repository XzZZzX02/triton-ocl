"""Paired cost of serial half-copy guards, timing correct baselines only."""
import argparse
import hashlib
import json
import pathlib
import statistics
import tempfile
from types import SimpleNamespace

from cooperative_staging_semantics import prepare, check
from full_stack_ablation import ALL
from triton.backends.sycl.sycl_utils import run_standalone, profile_standalone


def main():
    from triton._C.libtriton import ir, sycl
    from triton.backends.sycl.compiler import SYCLBackend
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('before',type=pathlib.Path)
    p.add_argument('--output',required=True,type=pathlib.Path)
    args=p.parse_args();rows=[]
    ctx=ir.context();ir.load_dialects(ctx);sycl.load_dialects(ctx)
    previous=json.loads(args.before.read_text())
    specs=[([32,16,64],'TN','f16'),([16,16,32],'NT','f16'),
           ([8,32,16],'TN','f16'),([16,16,128],'NN','f16'),([16,32,32],'NN','f32')]
    for shape,layout,dtype in specs:
        fixture=SimpleNamespace(kind='dot',shape=shape,layout=layout,dtype=dtype)
        kernel,warm,kw,bound,out,expected,grid=prepare(fixture)
        options=dict(ALL,distribute_work=False)
        compiled=kernel.warmup(*warm,grid=(grid,),**kw,**options)
        current=compiled.asm['sycl'];current=current.decode() if isinstance(current,bytes) else current
        text=str(compiled.asm['memir']).replace(' {sycl.scalar_half_bits}', '')
        # Test-only reconstruction of the archived pre-fix emitter path. There
        # is deliberately no runtime/compiler option to disable the repair.
        with tempfile.NamedTemporaryFile(mode='w',suffix='.mlir') as f:
            f.write(text);f.flush();mod=ir.parse_mlir_module(f.name,ctx)
        old=SYCLBackend.emit_sycl(mod,{},None)
        record=next(r for r in previous if r['shape']==shape and r['layout']==layout
                    and r['dtype']==dtype and r['config']=='without_distribution')
        assert hashlib.sha256(old.encode()).hexdigest()==record['source_sha256'],(shape,layout)
        sources={'before':old,'after':current}
        for round_ in range(3):
            for variant in (('before','after') if round_%2==0 else ('after','before')):
                code=sources[variant]
                for block in (3,48,(3,5),64):
                    out.c_array[:]=[-999.]*len(expected)
                    run_standalone(grid,1,1,compiled.name,code,bound,
                        signature=compiled.src.signature,metadata=compiled.metadata,block_size=block)
                    check(list(out.c_array),expected)
                samples=profile_standalone(grid,1,1,compiled.name,code,bound,
                    signature=compiled.src.signature,metadata=compiled.metadata,
                    block_size=64,warmup=10,repeats=31)
                # The profiled launch also returns its final output buffer.
                check(list(out.c_array),expected)
                row=dict(shape=shape,layout=layout,dtype=dtype,variant=variant,round=round_,
                    status='PASS',elements_checked=5*len(expected),samples_ns=samples,
                    median_ns=statistics.median(samples),source_sha256=hashlib.sha256(code.encode()).hexdigest(),
                    identical_sources=old==current)
                rows.append(row);print(json.dumps(row),flush=True)
                args.output.write_text(json.dumps(rows,indent=2)+'\n')


if __name__=='__main__':
    main()
