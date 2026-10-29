"""IR-level optimizer contracts; complements device output and event tests."""
import argparse
import json
import pathlib
import tempfile


def main():
    from triton._C.libtriton import ir, sycl
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--output',required=True)
    args=parser.parse_args()
    context=ir.context()
    ir.load_dialects(context)
    sycl.load_dialects(context)
    rows=[]

    def run(name,text,passes,check):
        with tempfile.NamedTemporaryFile(mode='w',suffix='.mlir') as f:
            f.write('module {\n'+text+'\n}');f.flush()
            module=ir.parse_mlir_module(f.name,context)
        pm=ir.pass_manager(context)
        for p in passes:
            getattr(sycl.passes.lair if p=='elementwise_fusion' else sycl.passes.memir,p)(pm)
        pm.run(module)
        result=str(module)
        check(result)
        rows.append(dict(case=name,status='PASS',pipeline=pm.get_pipeline_str()))

    def count(token,n):
        def check(s): assert s.count(token)==n,(token,n,s)
        return check

    def reduction(bound=1024,op='arith.addf',view=False,nested=False):
        load='%input' if not view else '%alias'
        alias='%alias = memref.cast %input : memref<1024xf32> to memref<?xf32>' if view else ''
        loadtype='memref<?xf32>' if view else 'memref<1024xf32>'
        loop=f'''affine.for %i = 0 to {bound} {{
          %a = affine.load {load}[%i] : {loadtype}
          %b = affine.load %acc[] : memref<f32>
          %v = {op} %b, %a : f32
          affine.store %v, %acc[] : memref<f32>
        }} {{sycl.reduction}}'''
        if nested:loop='scf.if %flag {\n'+loop+'\n}'
        return f'''func.func @reduce(%flag: i1) {{
          %input = memref.alloc() : memref<1024xf32>
          %acc = memref.alloc() : memref<f32>
          {alias}
          {loop}
          return
        }}'''

    for name,kw in [('sum',{}),('short',dict(bound=64)),('view',dict(view=True)),
                    ('conditional',dict(nested=True)),('maxnum',dict(op='arith.maxnumf'))]:
        expected=int(name=='sum')
        for order in [('group_reduction',),('group_reduction','local_memory_reuse'),
                      ('local_memory_reuse','group_reduction'),('group_reduction','group_reduction')]:
            run('group_'+name+'_'+'_'.join(order),reduction(**kw),order,count('gpu.all_reduce',expected))

    def buffers(overlap=False,view=False):
        first='''affine.for %i = 0 to 256 {
          affine.store %zero, %a[%i] : memref<256xf32>
        }'''
        second='''affine.for %i = 0 to 256 {
          affine.store %zero, %b[%i] : memref<256xf32>
        }'''
        if overlap:
            second='''affine.for %i = 0 to 256 {
              %v = affine.load %a[%i] : memref<256xf32>
              affine.store %v, %b[%i] : memref<256xf32>
            }'''
        alias='%alias = memref.cast %a : memref<256xf32> to memref<?xf32>' if view else ''
        return f'''func.func @buffers() {{
          %zero = arith.constant 0.0 : f32
          %a = memref.alloc() : memref<256xf32>
          %b = memref.alloc() : memref<256xf32>
          {alias}
          {first}
          {second}
          memref.dealloc %a : memref<256xf32>
          memref.dealloc %b : memref<256xf32>
          return
        }}'''
    for name,kw in [('disjoint',{}),('overlap',dict(overlap=True)),('view',dict(view=True))]:
        for order in [('local_memory_reuse',),('local_memory_reuse','local_memory_reuse')]:
            run('reuse_'+name+'_'+'_'.join(order),buffers(**kw),order,
                count('memref.alloc()',1 if name=='disjoint' else 2))

    def fusion(fanout=False,permuted=False):
        shape='16x16' if permuted else '256'
        dims='(d0,d1)' if permuted else '(d0)'
        identity=f'affine_map<{dims} -> {dims}>'
        producer_map='affine_map<(d0,d1) -> (d1,d0)>' if permuted else identity
        types=f'tensor<{shape}xf32>'
        maps=f'[{identity}, {identity}]'
        iters='["parallel", "parallel"]' if permuted else '["parallel"]'
        return_type=f'({types}, {types})' if fanout else types
        returns=f'%p, %q : {types}, {types}' if fanout else f'%q : {types}'
        return f'''func.func @fusion(%x: {types}, %init: {types}) -> {return_type} {{
          %p = linalg.generic {{indexing_maps = [{producer_map}, {identity}], iterator_types = {iters}}}
            ins(%x : {types}) outs(%init : {types}) {{
              ^bb0(%a: f32, %old: f32):
                %v = arith.addf %a, %a : f32
                linalg.yield %v : f32
            }} -> {types}
          %q = linalg.generic {{indexing_maps = {maps}, iterator_types = {iters}}}
            ins(%p : {types}) outs(%init : {types}) {{
              ^bb0(%a: f32, %old: f32):
                %v = arith.mulf %a, %a : f32
                linalg.yield %v : f32
            }} -> {types}
          return {returns}
        }}'''
    for name,kw in [('identity',{}),('fanout',dict(fanout=True)),('permutation',dict(permuted=True))]:
        for order in [('elementwise_fusion',),('elementwise_fusion','elementwise_fusion')]:
            run('fusion_'+name+'_'+'_'.join(order),fusion(**kw),order,
                count('linalg.generic',1 if name=='identity' else 2))

    def register(bound=64, variant=False, view=False, conditional=False, carried=False):
        index='%j' if variant else '%r'
        derive='%j = affine.apply affine_map<(d0,d1) -> (d0+d1)>(%k, %r)' if variant else ''
        alias='%alias = memref.cast %input : memref<128x128xf32> to memref<?x?xf32>' if view else ''
        load='%alias' if view else '%input'
        loadtype='memref<?x?xf32>' if view else 'memref<128x128xf32>'
        contents=f'''{derive}
          %a = affine.load {load}[%r, %k] : {loadtype}
          %b = affine.load %acc[{index}] : memref<256xf32>
          %v = arith.addf %a, %b : f32
          affine.store %v, %acc[{index}] : memref<256xf32>'''
        if conditional: contents='scf.if %flag {\n'+contents+'\n}'
        args=' iter_args(%carry = %zero) -> (f32)' if carried else ''
        terminator='affine.yield %carry : f32' if carried else ''
        assignment='%result = ' if carried else ''
        return f'''func.func @register(%flag: i1) {{
          %zero = arith.constant 0.0 : f32
          %input = memref.alloc() : memref<128x128xf32>
          %acc = memref.alloc() : memref<256xf32>
          {alias}
          affine.for %r = 0 to 64 {{
            {assignment}affine.for %k = 0 to {bound}{args} {{
              {contents}
              {terminator}
            }} {{sycl.reduction}}
          }}
          return
        }}'''

    for name,kw in [('independent',{}),('zero_trip',dict(bound=0)),
                    ('derived_index',dict(variant=True)),('view',dict(view=True)),
                    ('conditional',dict(conditional=True)),('carried',dict(carried=True))]:
        for order in [('register_accumulator',),('register_accumulator','register_accumulator'),
                      ('register_accumulator','group_reduction','local_memory_reuse'),
                      ('local_memory_reuse','group_reduction','register_accumulator')]:
            run('register_'+name+'_'+'_'.join(order),register(**kw),order,
                count('sycl.thread_private',1 if name=='independent' else 0))

    def distribution(annotated=True, reduction=False, triangular=False,
                     duplicate=False, nonzero=False, neighbor_read=False):
        outer='sycl.parallel' if annotated else ''
        inner='sycl.reduction' if reduction else outer
        bound='affine_map<(d0) -> (d0)>(%r)' if triangular else '16'
        lower='4' if nonzero else '0'
        indices='%r,%r' if duplicate else '%r,%c'
        read='''%read = affine.load %a[%r, 0] : memref<16x16xf32>''' if neighbor_read else ''
        value='%read' if neighbor_read else '%zero'
        return f'''func.func @distribution() {{
          %zero=arith.constant 0.0 : f32
          %a=memref.alloc() : memref<16x16xf32>
          affine.for %r={lower} to 16 {{
            affine.for %c=0 to {bound} {{
              {read}
              affine.store {value}, %a[{indices}] : memref<16x16xf32>
            }} {{ {inner} }}
          }} {{ {outer} }}
          return
        }}'''
    for name,kw in [('parallel',{}),('unproven',dict(annotated=False)),
                    ('reduction',dict(reduction=True)),('triangular',dict(triangular=True)),
                    ('duplicate_address',dict(duplicate=True)),
                    ('neighbor_read',dict(neighbor_read=True)),
                    ('nonzero_lower_bound',dict(nonzero=True))]:
        for order in [('work_distribution',),('work_distribution','work_distribution'),
                      ('local_memory_reuse','work_distribution')]:
            run('distribution_'+name+'_'+'_'.join(order),distribution(**kw),order,
                count('sycl.distribution_depth',
                      1 if name in ('parallel','reduction','triangular') else 0))

    def contraction(n=32, k=32, alias=False, permuted=False, half=False, mixed=False):
        right='%a' if alias else '%b'
        aindices='%k,%r' if permuted else '%r,%k'
        dtype='f16' if half else 'f32'
        rhs_dtype='f32' if mixed else dtype
        widening='''%xf=arith.extf %x : f16 to f32
                %yf=arith.extf %y : f16 to f32''' if half else ''
        x,y=('%xf','%yf') if half else ('%x','%y')
        if mixed:
            widening='%xf=arith.extf %x : f16 to f32'
            x,y='%xf','%y'
        return f'''func.func @matmul() {{
          %a=memref.alloc() : memref<32x32x{dtype}>
          %b=memref.alloc() : memref<32x32x{rhs_dtype}>
          %c=memref.alloc() : memref<32x32xf32>
          affine.for %r=0 to 32 {{
            affine.for %n=0 to {n} {{
              affine.for %k=0 to {k} {{
                %x=affine.load %a[{aindices}] : memref<32x32x{dtype}>
                %y=affine.load {right}[%k,%n] : memref<32x32x{rhs_dtype}>
                %z=affine.load %c[%r,%n] : memref<32x32xf32>
                {widening}
                %p=arith.mulf {x},{y} : f32
                %q=arith.addf %z,%p : f32
                affine.store %q,%c[%r,%n] : memref<32x32xf32>
              }} {{sycl.reduction}}
            }} {{sycl.parallel}}
          }} {{sycl.parallel}}
          return
        }}'''
    for name,kw in [('static',{}),('half',dict(half=True)),
                    ('mixed',dict(half=True,mixed=True)),('short',dict(k=8)),('tail',dict(n=31)),
                    ('alias',dict(alias=True)),('permuted',dict(permuted=True))]:
        for order in [('matmul_register_tiling',),
                      ('matmul_register_tiling','matmul_register_tiling'),
                      ('work_distribution','matmul_register_tiling'),
                      ('work_distribution','matmul_register_tiling','register_accumulator'),
                      ('work_distribution','register_accumulator','matmul_register_tiling'),
                      ('register_accumulator','work_distribution','matmul_register_tiling')]:
            expected=int(name=='half' and order in (
                ('work_distribution','matmul_register_tiling'),
                ('work_distribution','matmul_register_tiling','register_accumulator'),
                ('work_distribution','register_accumulator','matmul_register_tiling')))
            def check_tiling(s, expected=expected, order=order, name=name):
                assert s.count('sycl.register_tile =') == expected, (expected, s)
                promoted = int('register_accumulator' in order or expected)
                assert s.count('sycl.register_accumulator') == promoted, (promoted, s)
                composed = 0
                if expected and 'register_accumulator' in order:
                    composed = int(order.index('register_accumulator') <
                                   order.index('matmul_register_tiling'))
                assert s.count('sycl.register_tile_composed_accumulator') == composed, (composed, s)
                if expected:
                    assert 'iter_args(' in s and '-> (f32, f32, f32, f32)' in s, s
                    assert s.count('memref.store') == 4, s
            run('tiling_'+name+'_'+'_'.join(order),contraction(**kw),order,check_tiling)

    def batched_contraction(depth, half=True):
        dtype='f16' if half else 'f32'
        widening='''%xf=arith.extf %x : f16 to f32
                  %yf=arith.extf %y : f16 to f32''' if half else ''
        x,y=('%xf','%yf') if half else ('%x','%y')
        return f'''func.func @batched_matmul() {{
          %a=memref.alloc() : memref<2x32x32x{dtype}>
          %b=memref.alloc() : memref<2x32x32x{dtype}>
          %c=memref.alloc() : memref<2x32x32xf32>
          affine.for %batch=0 to 2 {{
            affine.for %r=0 to 32 {{
              affine.for %n=0 to 32 {{
                affine.for %k=0 to 32 {{
                  %x=affine.load %a[%batch,%r,%k] : memref<2x32x32x{dtype}>
                  %y=affine.load %b[%batch,%k,%n] : memref<2x32x32x{dtype}>
                  %z=affine.load %c[%batch,%r,%n] : memref<2x32x32xf32>
                  {widening}
                  %p=arith.mulf {x},{y} : f32
                  %q=arith.addf %z,%p : f32
                  affine.store %q,%c[%batch,%r,%n] : memref<2x32x32xf32>
                }} {{sycl.reduction}}
              }} {{sycl.parallel}}
            }} {{sycl.parallel}}
          }} {{sycl.parallel, sycl.distribute, sycl.distribution_depth = {depth} : i64}}
          return
        }}'''
    run('tiling_batched_insufficient_depth',batched_contraction(2),
        ('matmul_register_tiling',),count('sycl.register_tile',0))
    run('tiling_batched_complete_depth',batched_contraction(3),
        ('matmul_register_tiling',),count('sycl.register_tile',1))
    run('tiling_batched_f32_rejected',batched_contraction(3,half=False),
        ('matmul_register_tiling',),count('sycl.register_tile',0))
    pathlib.Path(args.output).write_text(json.dumps(rows,indent=2)+'\n')
    print(json.dumps(dict(passed=len(rows),cases=rows)))


if __name__=='__main__': main()
