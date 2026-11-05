"""Two-column fallback opportunity, ordered carries and pass interaction checks."""
import argparse
import itertools
import json
import pathlib
import tempfile


def source(m=8,n=16,k=32,dtype='f16',variant='plain',batches=None):
    rank=3 if batches is not None else 2
    prefix=f'{batches}x' if rank==3 else ''
    a=f'memref<{prefix}{m}x{k}x{dtype}>'
    b=f'memref<{prefix}{k}x{n}x{dtype}>'
    c=f'memref<{prefix}{m}x{n}xf32>'
    rhs='%a' if variant=='alias' else '%b'
    batch='%batch,' if rank==3 else ''
    ai=batch+('%k,%r' if variant=='permuted' else '%r,%k')
    xi,yi=('%xf','%yf') if dtype=='f16' else ('%x','%y')
    widening='%xf = arith.extf %x : f16 to f32\n%yf = arith.extf %y : f16 to f32' if dtype=='f16' else ''
    compute=f'''affine.for %r = 0 to {m} {{
      affine.for %n = 0 to {n} {{
        affine.for %k = 0 to {k} {{
          %x = affine.load %a[{ai}] : {a}
          %y = affine.load {rhs}[{batch}%k,%n] : {b}
          %old = affine.load %c[{batch}%r,%n] : {c}
          {widening}
          %p = arith.mulf {xi},{yi} : f32
          %v = arith.addf %old,%p : f32
          affine.store %v,%c[{batch}%r,%n] : {c}
        }} {{sycl.reduction}}
      }} {{sycl.parallel}}
    }} {{sycl.parallel}}'''
    fill=f'''affine.for %i = 0 to {m} {{
      affine.for %j = 0 to {n} {{
        affine.store %zero,%c[{batch}%i,%j] : {c}
      }} {{sycl.parallel}}
    }} {{sycl.parallel}}'''
    if rank==3:
        compute=f'affine.for %batch = 0 to {batches} {{\n{compute}\n}} {{sycl.parallel}}'
        fill=f'affine.for %batch = 0 to {batches} {{\n{fill}\n}} {{sycl.parallel}}'
    return f'''module {{func.func @matmul() {{
      %zero = arith.constant 0.0 : f32
      %a = memref.alloc() : {a}
      %b = memref.alloc() : {b}
      %c = memref.alloc() : {c}
      {fill}
      {compute}
      return
    }} }}'''


def main():
    from triton._C.libtriton import ir,sycl
    from triton.backends.sycl.compiler import SYCLOptions
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--output',type=pathlib.Path,required=True)
    a=p.parse_args();ctx=ir.context();ir.load_dialects(ctx);sycl.load_dialects(ctx);rows=[]
    def run(text,order):
        with tempfile.NamedTemporaryFile(mode='w',suffix='.mlir') as f:
            f.write(text);f.flush();mod=ir.parse_mlir_module(f.name,ctx)
        pm=ir.pass_manager(ctx)
        for item in order:
            if isinstance(item,tuple):sycl.passes.memir.matmul_register_tiling(pm,item[1])
            elif item=='unroll':sycl.passes.memir.ordered_reduction_unroll(pm,4)
            else:getattr(sycl.passes.memir,item)(pm)
        pm.run(mod);return str(mod).replace(f.name,'two-column.mlir')
    cases=[(8,16,16,None,2),(8,16,32,None,2),(8,16,64,None,2),
        (12,16,32,None,2),(15,16,32,None,2),(16,16,32,None,4),
        (8,32,32,None,4),(4,16,32,None,0),(8,8,32,None,0),
        (8,18,32,None,0),(8,20,32,None,2),(8,16,8,None,0),
        (8,16,32,1,2),(8,16,32,2,4)]
    for (m,n,k,batches,tile),promote,allow,init in itertools.product(cases,(False,True),(False,True),(False,True)):
        order=['work_distribution']+(['register_accumulator'] if promote else [])+[('tile',allow)]
        if init:order+=['accumulator_init_forwarding']
        order+=['unroll','local_memory_reuse']
        text=source(m,n,k,batches=batches);out=run(text,order)
        expected=tile if allow or tile!=2 else 0
        if expected:assert out.count(f'sycl.register_tile = {expected} : i64')==1,(m,n,k,batches,promote,allow,out)
        else:assert 'sycl.register_tile =' not in out,(m,n,k,batches,out)
        assert out==run(text,order+[('tile',allow)]),(m,n,k,batches,promote,allow,'idempotence')
        if expected:
            assert out.count('memref.store')==expected
            assert '-> ('+', '.join(['f32']*expected)+')' in out
            assert out.count('sycl.register_tile_composed_accumulator')==int(promote)
            assert out.count('sycl.ordered_reduction_unroll')==int(k>=32)
            assert out.count('sycl.accumulator_init_forwarded')==int(init and m*n*(batches or 1)>=128)
        rows.append(dict(shape=[m,n,k],batches=batches,promote=promote,allow=allow,init=init,tile=expected,status='PASS'))
    for dtype,variant in itertools.product(('f16','f32'),('plain','alias','permuted')):
        if dtype=='f16' and variant=='plain':continue
        for promoted in (False,True):
            order=['work_distribution']+(['register_accumulator'] if promoted else [])+[('tile',True)]
            # Alias/permutation negatives need square allocations to remain
            # well-typed and in-bounds independently of legality rejection.
            text=source(16,16,16,dtype=dtype,variant=variant);out=run(text,order)
            assert 'sycl.register_tile =' not in out,(dtype,variant,out)
            rows.append(dict(dtype=dtype,variant=variant,promoted=promoted,tile=0,status='PASS'))
    assert not SYCLOptions().matmul_register_tiling_2col
    assert SYCLOptions().hash()!=SYCLOptions(matmul_register_tiling_2col=True).hash()
    rows.append(dict(case='cache_default',status='PASS'))
    a.output.write_text(json.dumps(rows,indent=2)+'\n')
    print(json.dumps(dict(status='PASS',count=len(rows))))


if __name__=='__main__':main()
