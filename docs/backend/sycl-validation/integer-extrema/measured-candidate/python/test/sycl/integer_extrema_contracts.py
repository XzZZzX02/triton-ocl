"""Neutral elements, signed comparators and reduction/pass-order boundaries."""
import argparse
import json
import pathlib
import tempfile
from itertools import product


def source(op='arith.maxsi',bits=32,variant='plain'):
    ty=f'i{bits}';buffer=f'memref<1024x{ty}>'
    readtype=f'memref<?x{ty}>' if variant=='alias' else buffer
    readbuf='%alias' if variant=='alias' else '%input'
    alias=f'%alias = memref.cast %input : {buffer} to {readtype}' if variant=='alias' else ''
    idx='1023-%i' if variant=='permuted' else '%i'
    load=f'%x = affine.load {readbuf}[{idx}] : {readtype}'
    body=f'''{load}
      %old = affine.load %acc[] : memref<{ty}>
      %v = {op} %old,%x : {ty}
      affine.store %v,%acc[] : memref<{ty}>'''
    if variant=='multiuse':body+=f'\n%extra = arith.cmpi eq,%x,%x : {ty}'
    if variant=='two_stores':body+=f'\naffine.store %v,%acc[] : memref<{ty}>'
    upper='%n' if variant=='dynamic' else '64' if variant=='short' else '1024'
    loop=f'affine.for %i = 0 to {upper} {{\n{body}\n}} {{sycl.reduction}}'
    if variant=='conditional':loop='scf.if %flag {\n'+loop+'\n}'
    if variant=='nested':loop='affine.for %r = 0 to 2 {\n'+loop+'\n}'
    initial=-(1<<(bits-1)) if op.endswith('maxsi') else (1<<(bits-1))-1 if op.endswith('minsi') else 0 if op.endswith('maxui') else -1
    return f'''module {{func.func @reduce(%flag:i1,%n:index) {{
      %input = memref.alloc() : {buffer}
      %acc = memref.alloc() : memref<{ty}>
      %initial = arith.constant {initial} : {ty}
      affine.store %initial,%acc[] : memref<{ty}>
      {alias}
      {loop}
      return
    }} }}'''


def main():
    from triton._C.libtriton import ir,sycl
    from triton.backends.sycl.compiler import SYCLBackend
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--output',type=pathlib.Path,required=True)
    a=p.parse_args();ctx=ir.context();ir.load_dialects(ctx);sycl.load_dialects(ctx);rows=[]
    group='group_reduction';reg='register_accumulator'
    orders=[[group],[reg,group],[group,reg],[group,'local_memory_reuse'],['local_memory_reuse',group]]
    def run(text,order):
        with tempfile.NamedTemporaryFile(mode='w',suffix='.mlir') as f:
            f.write(text);f.flush();m=ir.parse_mlir_module(f.name,ctx)
        pm=ir.pass_manager(ctx)
        for stage in order:getattr(sycl.passes.memir,stage)(pm)
        pm.run(m)
        # memref.cast is a deliberate alias-proof negative and unsupported by
        # this source emitter; verify only pass rejection for that IR fixture.
        return str(m).replace(f.name,'extrema.mlir'),(
            '' if 'memref.cast' in text else SYCLBackend.emit_sycl(m,{},None))
    for op,bits,variant in product(('arith.minsi','arith.maxsi','arith.minui','arith.maxui'),(32,64),
            ('plain','short','dynamic','conditional','nested','alias','multiuse','two_stores','permuted')):
        text=source(op,bits,variant);eligible=variant=='plain';reference=None
        for order in orders:
            out,code=run(text,order)
            assert out.count('gpu.all_reduce')==int(eligible),(op,bits,variant,order,out)
            if eligible:
                signed=op.endswith('si');ty=f'{"int" if signed else "uint"}{bits}_t'
                function='maximum' if 'max' in op else 'minimum'
                assert f'sycl::{function}<{ty}>' in code,code
                if 'local_memory_reuse' not in order:
                    if reference is not None:assert code==reference,(op,bits,order)
                    reference=code
                assert 'sycl.register_accumulator' not in out,out
            assert (out,code)==run(text,order+[group]),(op,bits,variant,order)
            rows.append(dict(op=op,bits=bits,variant=variant,pipeline=order,selected=eligible,status='PASS'))
    # Floating extrema have a distinct NaN/zero contract and remain rejected.
    for op in ('arith.maxnumf','arith.minnumf','arith.maximumf','arith.minimumf'):
        text=source().replace('i32','f32').replace('arith.maxsi',op).replace('-2147483648','0.0')
        for order in orders:
            out,code=run(text,order);assert 'gpu.all_reduce' not in out
            rows.append(dict(op=op,pipeline=order,selected=False,status='PASS'))
    a.output.write_text(json.dumps(rows,indent=2)+'\n')
    print(json.dumps(dict(status='PASS',count=len(rows))))


if __name__=='__main__':main()
