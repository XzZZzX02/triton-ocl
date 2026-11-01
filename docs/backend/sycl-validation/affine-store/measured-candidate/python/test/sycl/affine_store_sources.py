"""Verify old dispatch/source and preservation of existing dot schedules."""
import argparse
import hashlib
import json
import pathlib
import tempfile
from types import SimpleNamespace
from affine_store_cases import source
from cooperative_staging_semantics import prepare
from full_stack_ablation import expected_markers
from single_lane_half_dot import unguard


def main():
    from triton._C.libtriton import ir,sycl
    from triton.backends.sycl.compiler import SYCLBackend
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--reference',type=pathlib.Path,required=True)
    p.add_argument('--options',type=pathlib.Path,required=True);p.add_argument('--output',type=pathlib.Path,required=True)
    args=p.parse_args();rows=[];ctx=ir.context();ir.load_dialects(ctx);sycl.load_dialects(ctx)
    for dtype in ('f16','f32'):
        for form in ('affine','arith','nested','mixed'):
            for reader in ('affine','memref'):
                name=f'{dtype}-{form}-{reader}'
                old=json.loads((args.reference/f'affine-store-legacy-{name}.json').read_text())
                text=source(dtype=dtype,form=form,reader=reader,grid_stride=534,base=11)
                # Fixture dense spacing = 511+23; exact program used for old replay.
                for prior in old:
                    with tempfile.NamedTemporaryFile(mode='w',suffix='.mlir') as f:
                        f.write(text);f.flush();mod=ir.parse_mlir_module(f.name,ctx)
                    pm=ir.pass_manager(ctx)
                    if prior['stack']:sycl.passes.memir.work_distribution(pm);sycl.passes.memir.local_memory_reuse(pm)
                    if prior['enabled']:
                        getattr(sycl.passes.memir,'half_store_distribution' if dtype=='f16' else 'terminal_store_distribution')(pm)
                    sycl.passes.memir.serial_half_copy_guard(pm);pm.run(mod)
                    code=SYCLBackend.emit_sycl(mod,{},None)
                    digest=hashlib.sha256(code.encode()).hexdigest()
                    reconstructed=hashlib.sha256(unguard(code).encode()).hexdigest()
                    newly_selected=prior['enabled'] and not prior['selected']
                    assert (reconstructed!=prior['source_sha256'])==newly_selected,(name,prior['stack'],prior['enabled'],reconstructed)
                    rows.append(dict(case='legacy_replay',dtype=dtype,form=form,reader=reader,stack=prior['stack'],
                        enabled=prior['enabled'],newly_selected=newly_selected,status='PASS',
                        before_source_sha256=prior['source_sha256'],after_source_sha256=digest,
                        without_input_guard_sha256=reconstructed))
    for old in json.loads(args.options.read_text()):
        fixture=SimpleNamespace(kind='dot',shape=old['shape'],layout=old['layout'],dtype=old['dtype'])
        kernel,warm,kw,_,_,_,grid=prepare(fixture)
        c=kernel.warmup(*warm,grid=(grid,),**kw,**old['options'])
        code=c.asm['sycl'];code=code.decode() if isinstance(code,bytes) else code
        digest=hashlib.sha256(code.encode()).hexdigest();expected_markers(fixture,old['options'],str(c.asm['memir']))
        # The selected baseline file is the exact accepted single-lane compiler.
        golden=json.loads((args.reference/'accepted-dot-sources.json').read_text())
        reference=next(r for r in golden if all(r[k]==old[k] for k in ('shape','dtype','layout','config')))
        assert digest==reference['source_sha256'],(old['shape'],old['layout'],old['config'])
        rows.append(dict(case='dot_preservation',shape=old['shape'],dtype=old['dtype'],layout=old['layout'],
            config=old['config'],status='PASS',source_sha256=digest))
    args.output.write_text(json.dumps(rows,indent=2)+'\n')
    print(json.dumps(dict(status='PASS',count=len(rows))))


if __name__=='__main__':main()
