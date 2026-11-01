"""Connect measured candidates to the final accepted half-only scope."""
import argparse
import hashlib
import json
import pathlib
import tempfile
from affine_store_cases import source,fixture


def main():
    from triton._C.libtriton import ir,sycl
    from triton.backends.sycl.compiler import SYCLBackend
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('records',type=pathlib.Path)
    p.add_argument('--output',type=pathlib.Path,required=True);a=p.parse_args();rows=[]
    ctx=ir.context();ir.load_dialects(ctx);sycl.load_dialects(ctx)
    for path in sorted(a.records.glob('affine-store-dcu-*.json')):
        measured=json.loads(path.read_text());first=measured[0]
        shape,coef,base,spacing,_,_,_=fixture(first['case'],first['dtype'],first['grid'])
        text=source(shape,coef,first['dtype'],first['form'],first['reader'],first['case'],True,spacing,base)
        for prior in [r for r in measured if r['round']==0]:
            with tempfile.NamedTemporaryFile(mode='w',suffix='.mlir') as f:
                f.write(text);f.flush();mod=ir.parse_mlir_module(f.name,ctx)
            pm=ir.pass_manager(ctx)
            if prior['stack']:sycl.passes.memir.work_distribution(pm);sycl.passes.memir.local_memory_reuse(pm)
            if prior['enabled']:
                getattr(sycl.passes.memir,'half_store_distribution' if first['dtype']=='f16' else 'terminal_store_distribution')(pm)
            sycl.passes.memir.serial_half_copy_guard(pm);pm.run(mod)
            selected=('sycl.half_store_distribution' if first['dtype']=='f16' else 'sycl.terminal_store_distribution') in str(mod)
            code=SYCLBackend.emit_sycl(mod,{},None);digest=hashlib.sha256(code.encode()).hexdigest()
            expected=prior if first['dtype']=='f16' else next(r for r in measured if r['round']==0 and r['stack']==prior['stack'] and not r['enabled'])
            assert selected==(prior['selected'] and first['dtype']=='f16')
            assert digest==expected['source_sha256'],(path.name,prior['stack'],prior['enabled'],digest,expected)
            rows.append(dict(file=path.name,case=first['case'],dtype=first['dtype'],form=first['form'],
                reader=first['reader'],grid=first['grid'],stack=prior['stack'],enabled=prior['enabled'],
                selected=selected,status='PASS',source_sha256=digest,measured_reference_sha256=expected['source_sha256']))
            a.output.write_text(json.dumps(rows,indent=2)+'\n')
    print(json.dumps(dict(status='PASS',count=len(rows),selected=sum(r['selected'] for r in rows))))


if __name__=='__main__':main()
