"""Proof boundaries for immutable complete local permutation forwarding."""
import argparse
import itertools
import json
import pathlib
import re
import tempfile


def source(shape=(8,16),perm=(1,0),outperm=None,dtype='f16',reader='memref',variant='plain'):
    rank=len(shape);outperm=tuple(range(rank)) if outperm is None else outperm
    srcshape=tuple(shape[i] for i in perm);dstshape=tuple(shape[i] for i in outperm)
    ty=lambda dims:'memref<'+'x'.join(map(str,dims))+'x'+dtype+'>'
    a,b=ty(srcshape),ty(dstshape);local='%a = memref.alloc() : '+a
    if variant=='external':local='';signature='%a:'+a
    else:signature=''
    value='%v'
    ld=f'%v = affine.load %a[{",".join("%d"+str(i) for i in perm)}] : {a}'
    if variant=='arithmetic':ld+=f'\n%v2 = arith.addf %v,%v : {dtype}';value='%v2'
    indices=','.join('%d'+str(i) for i in outperm)
    if variant=='collision':indices=','.join(['%d0']*rank)
    copy=f'{ld}\naffine.store {value},%b[{indices}] : {b}'
    if variant=='extra_store':copy+=f'\naffine.store {value},%b[{indices}] : {b}'
    if variant=='conditional':copy='scf.if %flag {\n'+copy+'\n}'
    for i in reversed(range(rank)):
        high='%limit' if variant=='dynamic' and i==rank-1 else shape[i]-(1 if variant=='partial' and i==0 else 0)
        copy=f'affine.for %d{i} = 0 to {high} {{\n{copy}\n}}'
    def phase(buffer,typ,dims,name,load=False):
        idx=','.join('%'+name+str(i) for i in range(rank))
        body=(f'%read = {reader}.load {buffer}[{idx}] : {typ}' if load else
              f'affine.store %zero,{buffer}[{idx}] : {typ}')
        for i in reversed(range(rank)):body=f'affine.for %{name}{i} = 0 to {dims[i]} {{\n{body}\n}}'
        return body
    producer=phase('%a',a,srcshape,'p')
    consumer=phase('%b',b,dstshape,'q',True)
    between=phase('%a',a,srcshape,'w') if variant=='source_mutation' else ''
    if variant=='dst_mutation':between=phase('%b',b,dstshape,'w')
    before=consumer if variant=='early_read' else ''
    if variant=='source_alias':between=f'%alias = memref.cast %a : {a} to memref<*x{dtype}>'
    if variant=='dst_alias':between=f'%alias = memref.cast %b : {b} to memref<*x{dtype}>'
    if variant=='private':local='%a = memref.alloc() {sycl.thread_private} : '+a
    if variant=='unknown_attr':copy=copy.replace('affine.store '+value+',%b','affine.store '+value+',%b').replace('] : '+b,'] {custom.flag} : '+b)
    return f'''module {{func.func @copy({signature}{',' if signature else ''}%flag:i1,%limit:index) {{
      %zero = arith.constant 0.0 : {dtype}
      {local}
      %b = memref.alloc() : {b}
      {producer if variant!='external' else ''}
      {before}
      {copy}
      {between}
      {consumer}
      return
    }} }}'''


def main():
    from triton._C.libtriton import ir,sycl
    from triton.backends.sycl.compiler import SYCLOptions
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--output',required=True,type=pathlib.Path)
    args=p.parse_args();ctx=ir.context();ir.load_dialects(ctx);sycl.load_dialects(ctx);rows=[]
    def transform(text,order):
        with tempfile.NamedTemporaryFile(mode='w',suffix='.mlir') as f:
            f.write(text);f.flush();mod=ir.parse_mlir_module(f.name,ctx)
        pm=ir.pass_manager(ctx)
        for stage in order:getattr(sycl.passes.memir,stage)(pm)
        pm.run(mod);return str(mod).replace(f.name,'local-copy.mlir')
    stage='local_copy_forwarding'
    for rank in (1,2,3):
        shape=(4,8,16)[:rank]
        for perm,outperm,reader,dtype in itertools.product(itertools.permutations(range(rank)),
            itertools.permutations(range(rank)),('affine','memref'),('f16','f32')):
            text=source(shape,perm,outperm,dtype,reader)
            for order in ([stage],['work_distribution',stage],[stage,'work_distribution'],
                          [stage,'local_memory_reuse']):
                out=transform(text,order)
                assert 'sycl.local_copies_forwarded = 1' in out,(rank,perm,outperm,reader,order,out)
                assert out.count('memref.alloc()')==1
                assert out==transform(text,order+[stage]),out
                rows.append(dict(rank=rank,perm=perm,outperm=outperm,reader=reader,dtype=dtype,pipeline=order,status='PASS'))
            # Independently enumerate the permutation correspondence.
            for coords in itertools.product(*(range(n) for n in shape)):
                src=tuple(coords[i] for i in perm);dst=tuple(coords[i] for i in outperm)
                assert src==tuple(dst[outperm.index(i)] for i in perm)
    for variant in ('partial','dynamic','collision','conditional','arithmetic','extra_store',
                    'source_mutation','dst_mutation','early_read','source_alias','dst_alias',
                    'private','unknown_attr','external'):
        for reader in ('affine','memref'):
            text=source(reader=reader,variant=variant)
            out=transform(text,[stage])
            assert 'sycl.local_copies_forwarded' not in out,(variant,reader,out)
            rows.append(dict(variant=variant,reader=reader,status='PASS',selected=False))
    # Multiple readers share the same immutable snapshot. Nontrivial affine
    # consumer expressions must be permuted as expressions, not just operands.
    for reader in ('affine','memref'):
        text=source(reader=reader)
        start=text.rfind('affine.for %q0')
        end=text.index('\n      return',start)
        readphase=text[start:end]
        for variant in ('fanout','source_write_after','read_map'):
            probe=text
            if variant=='fanout':probe=text[:end]+readphase+text[end:]
            if variant=='source_write_after':
                probe=text[:end]+readphase.replace('%read = '+reader+'.load %b[%q0,%q1] : memref<8x16xf16>',
                     'affine.store %zero,%a[%q1,%q0] : memref<16x8xf16>')+text[end:]
            if variant=='read_map':
                if reader!='affine':continue
                probe=text.replace('affine.load %b[%q0,%q1]',
                     'affine.load %b[7-%q0,15-%q1]')
            out=transform(probe,[stage])
            assert 'sycl.local_copies_forwarded = 1' in out,(variant,out)
            rows.append(dict(variant=variant,reader=reader,status='PASS',selected=True))
    assert not SYCLOptions().local_copy_forwarding
    assert SYCLOptions().hash()!=SYCLOptions(local_copy_forwarding=True).hash()
    rows.append(dict(variant='cache_default',status='PASS'))
    args.output.write_text(json.dumps(rows,indent=2)+'\n')
    print(json.dumps(dict(status='PASS',count=len(rows))))


if __name__=='__main__':main()
