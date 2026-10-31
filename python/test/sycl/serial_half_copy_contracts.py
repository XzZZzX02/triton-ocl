"""Contracts for serial IEEE binary16 local copy emission guards."""
import argparse
import itertools
import json
import pathlib
import tempfile


def source(dtype='f16', dialect='affine', distributed=False, variant='plain', store_dialect=None):
    local=f'memref<16x32x{dtype}>'
    if variant=='dynamic':local=f'memref<?x32x{dtype}>'
    if variant=='nonidentity':local=f'memref<16x32x{dtype}, strided<[1,16]>>'
    target=f'memref<32x16x{dtype}>'
    allocate='' if variant=='external' else f'%a = memref.alloc() : {local}'
    if variant=='dynamic':allocate=f'%a = memref.alloc(%sixteen) : {local}'
    signature=f'%a:{local}' if variant=='external' else ''
    load=f'%v = {dialect}.load %a[%i,%j] : {local}'
    value='%v'
    if variant=='arithmetic':
        load+=f'\n%twice = arith.addf %v,%v : {dtype}';value='%twice'
    if variant=='multiuse':load+=f'\n%also = arith.addf %v,%v : {dtype}'
    attrs=' {sycl.scalar_half_bits}' if variant=='stale' else ''
    body=f'''{load}
    {store_dialect or dialect}.store {value},%b[%j,%i]{attrs} : {target}'''
    if variant=='conditional':body='scf.if %flag {\n'+body+'\n}'
    mark=' {sycl.distribute = 2 : i64}' if distributed else ''
    if variant=='no_loop':
        body=body.replace('%i','%zero').replace('%j','%zero')
    elif variant=='scf_loop':
        # Affine accesses cannot use SCF induction variables as affine dims.
        # Constant indices isolate the unsupported enclosing-loop boundary.
        body=body.replace('%i','%zero').replace('%j','%zero')
        body='scf.for %i = %zero to %sixteen step %one {\n scf.for %j = %zero to %thirtytwo step %one {\n'+body+'\n}\n}'
    else:
        body='affine.for %i = 0 to 16 {\n affine.for %j = 0 to 32 {\n'+body+'\n}\n}'+mark
    return f'''module {{func.func @copy({signature}{',' if signature else ''}%flag:i1) {{
      %zero = arith.constant 0 : index
      %one = arith.constant 1 : index
      %sixteen = arith.constant 16 : index
      %thirtytwo = arith.constant 32 : index
      {allocate}
      %b = memref.alloc() : {target}
      {body}
      return
    }}}}'''


def main():
    from triton._C.libtriton import ir,sycl
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--output',required=True)
    args=p.parse_args();ctx=ir.context();ir.load_dialects(ctx);sycl.load_dialects(ctx)
    rows=[]
    for dtype,dialect,store_dialect,distributed,variant in itertools.product(
        ('f16','f32','bf16'),('affine','memref'),('affine','memref'),(False,True),
        ('plain','conditional','external','arithmetic','multiuse','no_loop','stale',
         'dynamic','nonidentity','scf_loop')):
        with tempfile.NamedTemporaryFile(mode='w',suffix='.mlir') as f:
            f.write(source(dtype,dialect,distributed,variant,store_dialect));f.flush()
            mod=ir.parse_mlir_module(f.name,ctx)
        pm=ir.pass_manager(ctx);sycl.passes.memir.serial_half_copy_guard(pm);pm.run(mod)
        first=str(mod)
        count=2*int(dtype=='f16' and not distributed and variant in ('plain','conditional','stale'))
        assert first.count('sycl.scalar_half_bits')==count,(dtype,dialect,distributed,variant,first)
        pm=ir.pass_manager(ctx);sycl.passes.memir.serial_half_copy_guard(pm);pm.run(mod)
        assert str(mod)==first,(first,str(mod))
        rows.append(dict(dtype=dtype,dialect=dialect,store_dialect=store_dialect,
            distributed=distributed,variant=variant,markers=count,status='PASS'))
    # Replanning after ownership changes removes stale guards; a subsequent
    # serial schedule restores them. No pass relies on the original marker.
    for dtype in ('f16','f32'):
        text=source(dtype).replace('\n}\n}', '\n} {sycl.parallel}\n} {sycl.parallel}')
        with tempfile.NamedTemporaryFile(mode='w',suffix='.mlir') as f:
            f.write(text);f.flush();mod=ir.parse_mlir_module(f.name,ctx)
        for distributed in (False,True,False):
            if distributed:
                pm=ir.pass_manager(ctx);sycl.passes.memir.work_distribution(pm);pm.run(mod)
                assert 'sycl.distribute' in str(mod),str(mod)
            elif 'sycl.distribute' in str(mod):
                # Parse a changed ownership plan while preserving stale guards.
                text=str(mod).replace('sycl.distribute, ', '').replace('sycl.distribute = 2 : i64, ', '')
                with tempfile.NamedTemporaryFile(mode='w',suffix='.mlir') as f:
                    f.write(text);f.flush();mod=ir.parse_mlir_module(f.name,ctx)
            pm=ir.pass_manager(ctx);sycl.passes.memir.serial_half_copy_guard(pm);pm.run(mod)
            count=2*int(dtype=='f16' and not distributed)
            assert str(mod).count('sycl.scalar_half_bits')==count,str(mod)
            rows.append(dict(dtype=dtype,variant='ownership_replanning',distributed=distributed,
                             markers=count,status='PASS'))
    # Serial local-to-external copies have the same storage-emission hazard.
    # Wider output views and ranked/indirect bases are deliberately rejected.
    for dtype,dialect,store_dialect,distributed,variant in itertools.product(
        ('f16','f32'),('affine','memref'),('affine','memref'),(False,True),
        ('scalar_view','wide_view','ranked_base')):
        local=f'memref<16x32x{dtype}>'
        view=f'memref<{2 if variant=="wide_view" else 1}x{dtype}, strided<[1], offset: ?>>'
        base=f'memref<512x{dtype}>' if variant=='ranked_base' else f'memref<*x{dtype}>'
        size=2 if variant=='wide_view' else 1
        mark=' {sycl.distribute, sycl.distribution_depth = 2 : i64}' if distributed else ''
        text=f'''module {{func.func @output(%out:{base}) {{
          %zero = arith.constant 0 : index
          %a = memref.alloc() : {local}
          affine.for %i = 0 to 16 {{
            affine.for %j = 0 to 32 {{
              %at = affine.apply affine_map<(d0,d1)->(d0*32+d1)>(%i,%j)
              %view = memref.reinterpret_cast %out to offset:[%at], sizes:[{size}], strides:[1] : {base} to {view}
              %v = {dialect}.load %a[%i,%j] : {local}
              {store_dialect}.store %v,%view[%zero] : {view}
            }}
          }}{mark}
          return
        }} }}'''
        with tempfile.NamedTemporaryFile(mode='w',suffix='.mlir') as f:
            f.write(text);f.flush();mod=ir.parse_mlir_module(f.name,ctx)
        pm=ir.pass_manager(ctx);sycl.passes.memir.serial_half_copy_guard(pm);pm.run(mod)
        first=str(mod);count=2*int(dtype=='f16' and not distributed and variant=='scalar_view')
        assert first.count('sycl.scalar_half_bits')==count,(dtype,dialect,variant,first)
        pm=ir.pass_manager(ctx);sycl.passes.memir.serial_half_copy_guard(pm);pm.run(mod)
        assert str(mod)==first
        rows.append(dict(dtype=dtype,dialect=dialect,store_dialect=store_dialect,
                         distributed=distributed,variant='output_'+variant,markers=count,status='PASS'))
    pathlib.Path(args.output).write_text(json.dumps(rows,indent=2)+'\n')
    print(json.dumps(dict(status='PASS',count=len(rows))))


if __name__=='__main__':main()
