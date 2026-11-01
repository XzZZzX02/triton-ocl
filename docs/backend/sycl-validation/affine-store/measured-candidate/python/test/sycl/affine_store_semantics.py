"""Raw IEEE copies and layout timings through the unchanged terminal passes."""
import argparse
import hashlib
import itertools
import json
import pathlib
import statistics
import tempfile
from affine_store_cases import source,fixture,Raw,F16,F32,SHAPES
from triton.backends.sycl.sycl_utils import run_standalone,profile_standalone


def main():
    from triton._C.libtriton import ir,sycl
    from triton.backends.sycl.compiler import SYCLBackend
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--case',choices=list(SHAPES),required=True);p.add_argument('--dtype',choices=('f16','f32'),required=True)
    p.add_argument('--grid',type=int,choices=(1,3),default=3)
    p.add_argument('--form',choices=('affine','nested','arith','mixed'),default='affine')
    p.add_argument('--reader',choices=('affine','memref'),default='affine')
    p.add_argument('--rounds',type=int,default=1);p.add_argument('--repeats',type=int,default=0)
    p.add_argument('--compile-only',action='store_true')
    p.add_argument('--expect-legacy',action='store_true',help='Assert old compiler selection for a frozen baseline replay')
    p.add_argument('--output',type=pathlib.Path,required=True);p.add_argument('--dump-dir',type=pathlib.Path)
    args=p.parse_args();ctx=ir.context();ir.load_dialects(ctx);sycl.load_dialects(ctx)
    shape,coef,base,spacing,raw,expected,sentinel=fixture(args.case,args.dtype,args.grid)
    text=source(shape,coef,args.dtype,args.form,args.reader,args.case,True,spacing,base)
    x,y=Raw(raw,args.dtype),Raw([sentinel]*len(expected),args.dtype);rows=[]
    stage='half_store_distribution' if args.dtype=='f16' else 'terminal_store_distribution'
    marker='sycl.half_store_distribution' if args.dtype=='f16' else 'sycl.terminal_store_distribution'
    eligible=args.case not in ('small','dynamic','collision','modulo')
    if args.expect_legacy:
        eligible=eligible and args.form=='arith' and (args.dtype=='f16' or args.reader=='memref')
    for round_ in range(args.rounds):
        plans=list(itertools.product((False,True),repeat=2))
        for stack,enabled in (plans if round_%2==0 else reversed(plans)):
            with tempfile.NamedTemporaryFile(mode='w',suffix='.mlir') as f:
                f.write(text);f.flush();mod=ir.parse_mlir_module(f.name,ctx)
            pm=ir.pass_manager(ctx)
            if stack:sycl.passes.memir.work_distribution(pm);sycl.passes.memir.local_memory_reuse(pm)
            if enabled:getattr(sycl.passes.memir,stage)(pm)
            sycl.passes.memir.serial_half_copy_guard(pm);pm.run(mod)
            memir=str(mod);selected=marker in memir
            assert selected==(enabled and eligible),(args.case,args.dtype,args.form,args.reader,memir)
            code=SYCLBackend.emit_sycl(mod,{},None)
            if args.dump_dir:
                args.dump_dir.mkdir(parents=True,exist_ok=True)
                for ext,data in [('sycl',code),('memir',memir)]:
                    (args.dump_dir/f'stack{stack}-enabled{enabled}.{ext}').write_text(data)
            checks=0;samples=[]
            if not args.compile_only:
                for block in (1,3,48,(3,5),64):
                    y.words[:]=[sentinel]*len(expected)
                    run_standalone(args.grid,1,1,'affine_copy',code,[x,y,1],block_size=block)
                    actual=list(y.words)
                    assert actual==expected,[(i,a,b) for i,(a,b) in enumerate(zip(actual,expected)) if a!=b][:8]
                    checks+=len(expected)
                if args.repeats:
                    samples=profile_standalone(args.grid,1,1,'affine_copy',code,[x,y,1],block_size=64,warmup=10,repeats=args.repeats)
                    assert list(y.words)==expected;checks+=len(expected)
            row=dict(case=args.case,dtype=args.dtype,shape=shape,coefficients=coef,form=args.form,reader=args.reader,
                grid=args.grid,stack=stack,enabled=enabled,selected=selected,round=round_,status='PASS',
                compile_only=args.compile_only,elements_checked=checks,output_elements=len(expected),
                source_sha256=hashlib.sha256(code.encode()).hexdigest(),guarded_copies=memir.count('sycl.scalar_half_bits'),
                single_lane_markers=memir.count('sycl.single_lane_half_bits'),samples_ns=samples,
                special_bits=F16 if args.dtype=='f16' else F32,median_ns=statistics.median(samples) if samples else None)
            rows.append(row);print(json.dumps(row),flush=True);args.output.write_text(json.dumps(rows,indent=2)+'\n')


if __name__=='__main__':main()
