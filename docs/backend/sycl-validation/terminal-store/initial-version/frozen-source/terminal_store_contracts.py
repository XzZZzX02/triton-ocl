"""Legality boundaries for terminal local-to-external store distribution."""
import argparse
import itertools
import json
import pathlib
import random
import tempfile


def source(shape=(16,32), coefficients=(32,1), bits=32, variant='plain'):
    element='f16' if variant=='narrow' else 'f32'
    local='memref<'+'x'.join(map(str,shape))+'x'+element+'>'
    view='memref<1x'+element+', strided<[1], offset: ?>>'
    lines=[]
    for dim,c in enumerate(coefficients):
        lines += [f'%i{dim} = arith.index_cast %d{dim} : index to i{bits}',
                  f'%c{dim} = arith.constant {c} : i{bits}',
                  f'%p{dim} = arith.muli %i{dim},%c{dim} : i{bits}']
    current='%base' if bits==32 else '%base64'
    for dim in range(len(shape)):
        lines += [f'%a{dim} = arith.addi {current},%p{dim} : i{bits}']
        current=f'%a{dim}'
    if variant=='dynamic_stride':
        lines += [f'%dyn = arith.muli {current},%step : i32'];current='%dyn'
    if variant=='modulo':
        lines += ['%modulus = arith.constant 8 : i32',f'%mod = arith.remsi {current},%modulus : i32'];current='%mod'
    if variant=='select':
        lines += [f'%selected = arith.select %flag,{current},%base : i32'];current='%selected'
    if variant=='trunc8':
        lines += [f'%tiny = arith.trunci {current} : i32 to i8','%back = arith.extsi %tiny : i8 to i32'];current='%back'
    if variant=='thread':
        lines += ['%thread = gpu.thread_id x','%thread32 = arith.index_cast %thread : index to i32',f'%threadsum = arith.addi {current},%thread32 : i32'];current='%threadsum'
    lines += [f'%offset = arith.index_cast {current} : i{bits} to index',
        f'%view = memref.reinterpret_cast %output to offset: [%offset], sizes: [1], strides: [1] : memref<*x{element}> to {view}']
    coords=','.join(f'%d{i}' for i in range(len(shape)))
    if variant=='external_read': lines += [f'%value = memref.load %view[%zero] : {view}']
    else: lines += [f'%value = memref.load %local[{coords}] : {local}']
    attrs=' {nontemporal = true}' if variant=='nontemporal' else ' {unknown.flag}' if variant=='unknown_attr' else ''
    store=f'memref.store %value,%view[%zero]{attrs} : {view}'
    if variant=='extra_store':store+='\n'+store
    if variant=='mask':store='scf.if %flag {\n'+store+'\n}'
    lines.append(store)
    body='\n'.join(lines)
    for dim in reversed(range(len(shape))):
        high='%limit' if variant=='dynamic_bound' and dim==len(shape)-1 else str(shape[dim])
        step=' step 2' if variant=='step2' else ''
        body=f'affine.for %d{dim} = 0 to {high}{step} {{\n{body}\n}}'
    if variant=='nested':body='scf.if %flag {\n'+body+'\n}'
    prior=''
    if variant=='prior_write':prior=f'''%before = memref.reinterpret_cast %output to offset: [0], sizes: [1], strides: [1] : memref<*xf32> to memref<1xf32>
    %init = arith.constant 0.0 : f32
    memref.store %init,%before[%zero] : memref<1xf32>'''
    following=f'%after = memref.load %local[{",".join(["%zero"]*len(shape))}] : {local}' if variant=='following_read' else ''
    if variant=='escape':body='%alias = memref.cast %local : '+local+' to memref<*x'+element+'>\n'+body
    return f'''module {{func.func @store(%output:memref<*x{element}>,%base:i32,%step:i32,%flag:i1,%limit:index) {{
      %zero = arith.constant 0 : index
      %base64 = arith.extsi %base : i32 to i64
      %local = memref.alloc() : {local}
      {prior}
      {body}
      {following}
      return
    }}}}'''


def main():
    from triton._C.libtriton import ir,sycl
    from triton.backends.sycl.compiler import SYCLOptions
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--output',required=True)
    args=p.parse_args();ctx=ir.context();ir.load_dialects(ctx);sycl.load_dialects(ctx)
    rows=[]
    def transform(text,order):
        with tempfile.NamedTemporaryFile(mode='w',suffix='.mlir') as f:
            f.write(text);f.flush();mod=ir.parse_mlir_module(f.name,ctx)
        pm=ir.pass_manager(ctx)
        for name in order:getattr(sycl.passes.memir,name)(pm)
        pm.run(mod)
        return str(mod).replace(f.name,'terminal-store.mlir')
    stage='terminal_store_distribution'
    cases=[('dense',{},True),('mask',dict(variant='mask'),True),
      ('transposed',dict(coefficients=(1,16)),True),('reverse',dict(coefficients=(-32,1)),True),
      ('padded',dict(coefficients=(40,1)),True),('stride2',dict(coefficients=(64,2)),True),
      ('rank1',dict(shape=(256,),coefficients=(1,)),True),
      ('rank3',dict(shape=(2,8,32),coefficients=(256,32,1)),True),
      ('extent1',dict(shape=(1,256),coefficients=(0,1)),True),
      ('under256',dict(shape=(255,),coefficients=(1,)),False),
      ('collision',dict(coefficients=(1,1)),False),('zero_stride',dict(coefficients=(0,1)),False),
      ('wrapped',dict(shape=(256,),coefficients=(2147483648,)),False),
      ('modular_boundary',dict(shape=(256,),coefficients=(16777216,)),True),
      ('modular_collision',dict(shape=(257,),coefficients=(16777216,)),False),
      ('pointer_byte_wrap',dict(shape=(256,),coefficients=(4611686018427387904,),bits=64),False),
      ('rank4',dict(shape=(2,2,8,16),coefficients=(256,128,16,1)),False)]
    cases += [(name,dict(variant=name),False) for name in ('dynamic_stride','modulo','select','trunc8','thread','external_read','extra_store','nontemporal','unknown_attr','nested','following_read','prior_write','dynamic_bound','step2','narrow')]
    for name,kw,eligible in cases:
        text=source(**kw)
        for order in ([stage],['work_distribution',stage],['local_memory_reuse',stage]):
            out=transform(text,order)
            assert out.count('sycl.terminal_store_distribution')==int(eligible),(name,order,out)
            assert out.count('sycl.distribution_depth')==int(eligible),(name,order,out)
            assert out.count('gpu.barrier')==int(eligible),(name,order,out)
            assert out==transform(text,[*order,stage]),(name,order,out)
            rows.append(dict(case=name,pipeline=order,status='PASS',transformed=eligible))
    # Independently enumerate addresses modulo the minimum arithmetic/pointer
    # width. Any optimized case must have no duplicate; conservative rejection
    # is allowed. Include deterministic random strides and high-bit collisions.
    rng=random.Random(906)
    specs=[((16,16),(rng.randrange(-40,41),rng.randrange(-40,41)),32)
           for _ in range(32)]
    specs += [((256,),(c,),32) for c in (0,1,-1,2,2**24,2**25,2**30,2**31)]
    specs += [((16,16),(c,d),64) for c,d in ((16,1),(1,16),(-16,1),(2**60,1),(2**62,1))]
    for index,(shape,coefficients,bits) in enumerate(specs):
        out=transform(source(shape,coefficients,bits),[stage])
        optimized='sycl.terminal_store_distribution' in out
        modulus=1<<min(bits,62)
        addresses=[sum(c*i for c,i in zip(coefficients,coords))%modulus
                   for coords in itertools.product(*(range(n) for n in shape))]
        independent=len(addresses)==len(set(addresses))
        assert not optimized or independent,(shape,coefficients,bits,out)
        rows.append(dict(case='enumerated_'+str(index),pipeline=[stage],status='PASS',
                         shape=shape,coefficients=coefficients,bits=bits,
                         transformed=optimized,enumerated_unique=independent))
    assert not SYCLOptions().terminal_store_distribution
    assert SYCLOptions().hash()!=SYCLOptions(terminal_store_distribution=True).hash()
    rows.append(dict(case='default_and_cache_key',pipeline=[],status='PASS'))
    pathlib.Path(args.output).write_text(json.dumps(rows,indent=2)+chr(10))
    print(json.dumps(dict(status='PASS',count=len(rows))))


if __name__=='__main__':main()
