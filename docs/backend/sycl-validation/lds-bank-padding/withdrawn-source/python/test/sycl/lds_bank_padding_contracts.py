"""Candidate LDS padding legality, cost gates and schedule preservation."""
import argparse
import itertools
import json
import pathlib
import re
import tempfile

from two_column_contracts import source


def initialized(m=16,n=16,k=64,dtype='f16',batches=None):
    text = source(m,n,k,dtype=dtype,batches=batches)
    prefix = f'{batches}x' if batches is not None else ''
    batch = '%batch,' if batches is not None else ''
    fills = ''
    for name,outer,inner in (('a',m,k),('b',k,n)):
        kind = f'memref<{prefix}{outer}x{inner}x{dtype}>'
        fill = f'''
affine.for %i = 0 to {outer} {{
  affine.for %j = 0 to {inner} {{
    affine.store %input, %{name}[{batch}%i,%j] : {kind}
  }} {{sycl.parallel}}
}} {{sycl.parallel}}
'''
        if batches is not None:
            fill = f'affine.for %batch = 0 to {batches} {{\n{fill}\n}} {{sycl.parallel}}\n'
        fills += fill
    text = text.replace('%zero =', f'%input = arith.constant 1.0 : {dtype}\n%zero =',1)
    return re.sub(r'(%c = memref.alloc\(\) : [^\n]+)', lambda match: match[1]+fills, text, count=1)


def main():
    from triton._C.libtriton import ir,sycl,passes
    from triton.backends.sycl.compiler import SYCLOptions,SYCLBackend
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--output', type=pathlib.Path, required=True)
    a = p.parse_args()
    ctx = ir.context()
    ir.load_dialects(ctx)
    sycl.load_dialects(ctx)
    rows = []
    def run(text,order):
        with tempfile.NamedTemporaryFile(mode='w',suffix='.mlir') as f:
            f.write(text);f.flush();mod=ir.parse_mlir_module(f.name,ctx)
        pm=ir.pass_manager(ctx)
        for item in order:
            if isinstance(item,tuple):sycl.passes.memir.matmul_register_tiling(pm,item[1])
            elif item == 'unroll':sycl.passes.memir.ordered_reduction_unroll(pm,4)
            elif item == 'cse':passes.common.add_cse(pm)
            else:getattr(sycl.passes.memir,item)(pm)
        pm.run(mod)
        return str(mod).replace(f.name,'lds-bank-contract.mlir')

    for dtype,k,n,promote,tile,unroll in itertools.product(
            ('f16','f32'),(16,32,64,128),(16,32),(False,True),(False,True),(False,True)):
        text=initialized(k=k,n=n,dtype=dtype)
        order=['work_distribution']
        if promote:order+=['register_accumulator']
        if tile:order+=[('tile',False),'cse']
        if unroll:order+=['unroll','cse']
        off=run(text,order)
        on=run(text,order+['lds_bank_padding'])
        count=on.count('sycl.lds_bank_padding')
        if count:
            assert count==1
            before=int(re.search('sycl.lds_bank_cost_before = ([0-9]+)',on)[1])
            after=int(re.search('sycl.lds_bank_cost_after = ([0-9]+)',on)[1])
            assert after<before
            assert f'16x{k+(2 if dtype=="f16" else 1)}x{dtype}' in on
        else:assert on==off
        assert on==run(text,order+['lds_bank_padding','lds_bank_padding'])
        for marker in ('sycl.register_accumulator','sycl.register_tile =',
                       'sycl.ordered_reduction_unroll','sycl.distribution_depth'):
            assert on.count(marker)==off.count(marker)
        reused=run(text,order+['lds_bank_padding','local_memory_reuse'])
        allocations=re.findall(r'memref.alloc\(\).*?: memref<([^>]+)>',reused)
        expected_bytes=0
        for alloc in allocations:
            dims=alloc.split('x')
            expected_bytes+=int(dims.pop()[1:])//8*__import__('math').prod(map(int,dims))
        assert f'sycl.local_bytes_after = {expected_bytes} : i64' in reused
        rows.append(dict(dtype=dtype,k=k,n=n,promote=promote,tile=tile,
                         unroll=unroll,padded=count,status='PASS'))
    assert any(r['padded'] for r in rows)
    assert any(not r['padded'] for r in rows)
    good=initialized()
    ty='memref<16x64xf16>'
    negatives={
        'no_distribution':(good,[]),
        'uninitialized':(source(16,16,64),['work_distribution']),
        'shape_observed':(good.replace('return','%dim = memref.dim %a, %c0 : '+ty+'\nreturn').replace(
            '%zero =','%c0 = arith.constant 0 : index\n%zero =',1),['work_distribution']),
        'escaping':(good.replace('return','func.call @sink(%a) : ('+ty+') -> ()\nreturn').replace(
            'module {','module {func.func private @sink('+ty+')\n',1),['work_distribution']),
        'view':(good.replace('return','%view = memref.cast %a : '+ty+' to memref<?x?xf16>\nreturn'),['work_distribution']),
        'conditional':(good.replace('affine.for %r =', 'scf.if %true {\naffine.for %r =').replace(
            'return','}\nreturn').replace('%zero =','%true = arith.constant true\n%zero =',1),['work_distribution']),
        'two_column':(initialized(8,16,64),['work_distribution','register_accumulator',('tile',True)]),
        'nonidentity_index':(good.replace('affine.load %a[%r,%k]',
            'affine.load %a[%r, %k + 1]'),['work_distribution']),
        'unknown_storage':(good.replace('return',
            '%vector = memref.alloc() : memref<16xvector<4xf32>>\nreturn'),['work_distribution']),
        'oversized_storage':(good.replace('return',
            '%large = memref.alloc() : memref<65536xf32>\nreturn'),['work_distribution']),
        'dynamic_storage':(good.replace('func.func @matmul()', 'func.func @matmul(%extent: index)').replace(
            'return','%dynamic = memref.alloc(%extent) : memref<?xf32>\nreturn'),['work_distribution']),
        'nonunit_output':(good.replace('affine.for %r = 0 to 16 {',
            'affine.for %r = 0 to 16 step 2 {'),['work_distribution']),
        'access_alignment':(good.replace('affine.load %a[%r,%k] :',
            'affine.load %a[%r,%k] {alignment = 16 : i64} :'),['work_distribution']),
        'access_contract':(good.replace('affine.load %a[%r,%k] :',
            'affine.load %a[%r,%k] {custom.memory_contract} :'),['work_distribution']),
    }
    for name,(text,order) in negatives.items():
        off=run(text,order)
        on=run(text,order+['lds_bank_padding'])
        assert off==on,(name,on)
        rows.append(dict(case=name,padded=0,status='PASS'))
    for batches in (1,2,3):
        text=initialized(8,16,64,batches=batches)
        on=run(text,['work_distribution','register_accumulator',('tile',False),'lds_bank_padding'])
        assert on.count('sycl.lds_bank_padding')==int(batches==1),on
        rows.append(dict(case='rank3',batches=batches,padded=int(batches==1),status='PASS'))
    # Padding must retain the slots already selected by storage reuse. A
    # before-reuse placement can break equal-type coloring of disjoint phases.
    text=initialized(32,64,64)
    ty='memref<32x64xf16>'
    text=text.replace('%c = memref.alloc()',f'%late = memref.alloc() : {ty}\n%c = memref.alloc()',1)
    text=text.replace('return',f'''
affine.for %i = 0 to 32 {{
  affine.for %j = 0 to 64 {{
    affine.store %input, %late[%i,%j] : {ty}
  }} {{sycl.parallel}}
}} {{sycl.parallel}}
return''')
    order=['work_distribution','register_accumulator',('tile',False),'cse','local_memory_reuse']
    off=run(text,order)
    on=run(text,order+['lds_bank_padding'])
    assert off.count('memref.alloc')==on.count('memref.alloc')==3
    assert on.count('sycl.lds_bank_padding')==1
    assert 'sycl.local_bytes_after = 20608 : i64' in on
    assert 'sycl.local_buffers_reused = 1 : i64' in on
    assert on==run(text,order+['lds_bank_padding','lds_bank_padding'])
    rows.append(dict(case='retain_reused_slot',status='PASS'))
    text=initialized(8,16,64).replace('return',
        '%indices = memref.alloc() : memref<16xindex>\nreturn')
    on=run(text,['work_distribution','lds_bank_padding'])
    assert on.count('sycl.lds_bank_padding')==1,on
    rows.append(dict(case='index_storage_accounting',status='PASS'))
    assert not SYCLOptions().lds_bank_padding
    assert SYCLOptions().hash()!=SYCLOptions(lds_bank_padding=True).hash()
    rows.append(dict(case='cache_default',status='PASS'))
    a.output.write_text(json.dumps(rows,indent=2)+'\n')
    print(json.dumps(dict(status='PASS',count=len(rows),active=sum(r.get('padded',0) for r in rows))))


if __name__=='__main__':
    main()
