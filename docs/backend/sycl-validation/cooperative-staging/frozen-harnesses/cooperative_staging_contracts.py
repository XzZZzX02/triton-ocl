"""IR proof boundaries for independent external-to-local staging."""
import argparse
import json
import pathlib
import tempfile


def source(m=16, n=32, masked=True, partial=False, duplicate=False,
           local_read=False, extra_store=False, escape=False, dynamic=False,
           step=1, nested=False, unknown=False, input_alias=False):
    extra = '%local = memref.load %out[%r,%c] : memref<16x32xf32>' if local_read else ''
    write_index = '%r,%r' if duplicate else '%r,%c'
    write = f'memref.store %v,%out[{write_index}] : memref<16x32xf32>'
    if extra_store: write += '\n' + write
    read = '%view = memref.reinterpret_cast %input to offset: [%idx], sizes: [1], strides: [1] : memref<*xf32> to memref<1xf32, strided<[1], offset: ?>>'
    if input_alias:
        read = '%view = memref.reinterpret_cast %out to offset: [%idx], sizes: [1], strides: [1] : memref<16x32xf32> to memref<1xf32, strided<[1], offset: ?>>'
    if masked:
        load = '''%guard = arith.cmpi slt, %c, %limit : index
          %v = scf.if %guard -> (f32) {
            %x = memref.load %view[%zero] : memref<1xf32, strided<[1], offset: ?>>
            scf.yield %x : f32
          } else {
            scf.yield %other : f32
          }'''
    else:
        load = '%v = memref.load %view[%zero] : memref<1xf32, strided<[1], offset: ?>>'
    if unknown: load += '\nfunc.call @side_effect() : () -> ()'
    loop = f'''affine.for %r = 0 to {m} {{
        affine.for %c = 0 to {'%limit' if dynamic else n-1 if partial else n} step {step} {{
          %idx = arith.addi %r,%c : index
          {read}
          {load}
          {extra}
          {write}
        }}
      }}'''
    if nested: loop = 'scf.if %flag {\n'+loop+'\n}'
    view = '%escaped = memref.cast %out : memref<16x32xf32> to memref<?x?xf32>' if escape else ''
    return f'''func.func private @side_effect()
    func.func @stage(%input: memref<*xf32>, %limit: index, %flag: i1) {{
      %zero = arith.constant 0 : index
      %other = arith.constant -7.0 : f32
      %out = memref.alloc() : memref<16x32xf32>
      {view}
      {loop}
      return
    }}'''


def main():
    from triton._C.libtriton import ir, sycl
    from triton.backends.sycl.compiler import SYCLOptions
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--output', required=True)
    args=p.parse_args()
    ctx=ir.context();ir.load_dialects(ctx);sycl.load_dialects(ctx)
    rows=[]
    def transform(text, order):
        with tempfile.NamedTemporaryFile(mode='w',suffix='.mlir') as f:
            f.write('module {\n'+text+'\n}');f.flush()
            module=ir.parse_mlir_module(f.name,ctx)
        pm=ir.pass_manager(ctx)
        for name in order: getattr(sycl.passes.memir,name)(pm)
        pm.run(module)
        return str(module).replace(f.name,'staging.mlir')
    stage='cooperative_load_staging';distribute='work_distribution'
    cases=[('masked',{},True),('unmasked',dict(masked=False),True),
        ('small',dict(m=4,n=32),False),('partial',dict(partial=True),False),
        ('duplicate',dict(duplicate=True),False),('local_read',dict(local_read=True),False),
        ('extra_store',dict(extra_store=True),False),('escape',dict(escape=True),False),
        ('dynamic',dict(dynamic=True),False),('strided_loop',dict(step=2),False),
        ('conditional_phase',dict(nested=True),False),('call',dict(unknown=True),False),
        ('local_source_alias',dict(input_alias=True),False)]
    for name,kw,eligible in cases:
        text=source(**kw)
        for order in ([stage],[stage,distribute],[distribute,stage,distribute],
                      [stage,distribute,'local_memory_reuse']):
            out=transform(text,order)
            assert out.count('sycl.cooperative_load_staging')==int(eligible),(name,order,out)
            assert out.count('sycl.distribution_depth')==int(eligible and distribute in order),(name,order,out)
            assert out.count('sycl.parallel')==2*int(eligible),(name,order,out)
            assert out==transform(text,order+[stage]),(name,order,out)
            if eligible:
                assert out.count('affine.store')==1 and out.count('memref.store')==0,out
                assert out.count('scf.if')==int(kw.get('masked',True)),out
            rows.append(dict(case=name+'_'+str(order),status='PASS',transformed=eligible))
    for name, text in [
        ('default_nontemporal_false', source().replace('memref.store %v,%out[%r,%c]',
            'memref.store %v,%out[%r,%c] {nontemporal = false}')),
    ]:
        result = transform(text, [stage, distribute])
        assert result.count('sycl.cooperative_load_staging') == 1, (name,result)
        rows.append(dict(case=name, status='PASS', transformed=True))
    for name, text in [
        ('nontemporal_store', source().replace('memref.store %v,%out[%r,%c]',
            'memref.store %v,%out[%r,%c] {nontemporal = true}')),
        ('unknown_store_attr', source().replace('memref.store %v,%out[%r,%c]',
            'memref.store %v,%out[%r,%c] {custom.flag}')),
        ('prior_external_write', source().replace('      affine.for %r',
            '      %prior = memref.reinterpret_cast %input to offset: [0], sizes: [1], strides: [1] : memref<*xf32> to memref<1xf32>\n      memref.store %other,%prior[%zero] : memref<1xf32>\n      affine.for %r', 1)),
        ('volatile_stage', source().replace('      }\n      return',
                          '      } {sycl.scalar_memory_volatile}\n      return')),
        ('thread_capture', source().replace('%idx = arith.addi %r,%c : index',
                           '%idx = arith.addi %r,%thread : index').replace(
                           '      %out = memref.alloc()',
                           '      %thread = gpu.thread_id x\n      %out = memref.alloc()')),
        ('unknown_capture', source().replace('%idx = arith.addi %r,%c : index',
                            '%idx = arith.addi %r,%captured : index').replace(
                            'func.func private @side_effect()',
                            'func.func private @side_effect()\nfunc.func private @capture() -> index').replace(
                            '      %out = memref.alloc()',
                            '      %captured = func.call @capture() : () -> index\n      %out = memref.alloc()'))]:
        result = transform(text, [stage, distribute])
        assert 'sycl.cooperative_load_staging' not in result, (name, result)
        assert 'sycl.distribution_depth' not in result, (name, result)
        rows.append(dict(case=name, status='PASS', transformed=False))
    assert not SYCLOptions().cooperative_load_staging
    assert SYCLOptions(cooperative_load_staging=True).hash()!=SYCLOptions().hash()
    rows.append(dict(case='default_and_cache_key',status='PASS'))
    for shape in ((256,), (2,8,32), (2,2,8,16)):
        rank=len(shape)
        ty='memref<'+ 'x'.join(map(str,shape))+'xf32>'
        ivs=','.join('%i'+str(i) for i in range(rank))
        body='''%view = memref.reinterpret_cast %input to offset: [%i0], sizes: [1], strides: [1] : memref<*xf32> to memref<1xf32, strided<[1], offset: ?>>
        %value = memref.load %view[%zero] : memref<1xf32, strided<[1], offset: ?>>
        '''+f'memref.store %value,%out[{ivs}] : {ty}'
        for dim in reversed(range(rank)):
            body=f'affine.for %i{dim} = 0 to {shape[dim]} {{'+body+'}'
        text=f'func.func @rank_stage(%input:memref<*xf32>) {{%zero=arith.constant 0:index %out=memref.alloc():{ty} '+body+' return}'
        for order in ([stage],[stage,distribute]):
            out=transform(text,order)
            eligible=rank<=3
            assert out.count('sycl.cooperative_load_staging')==int(eligible),out
            assert out.count('sycl.parallel')==rank*int(eligible),out
            assert out.count('sycl.distribution_depth')==int(eligible and distribute in order),out
            rows.append(dict(case='rank'+str(rank)+'_'+str(order),status='PASS',transformed=eligible))
    pathlib.Path(args.output).write_text(json.dumps(rows,indent=2)+'\n')
    print(json.dumps(dict(status='PASS',count=len(rows))))


if __name__=='__main__':main()
