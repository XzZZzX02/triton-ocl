"""Emission contracts for identical local barriers with no intervening memory."""
import argparse
import json
import pathlib
import tempfile
from triton._C.libtriton import ir,sycl
from triton.backends.sycl.compiler import SYCLBackend,SYCLOptions


def source(variant):
    first='affine.for %i = 0 to 16 { affine.store %v,%a[%i] : memref<16xf32> }'
    second='affine.for %j = 0 to 16 { %x = affine.load %a[%j] : memref<16xf32>\naffine.store %x,%b[%j] : memref<16xf32> }'
    between=''
    if variant=='pure':between='%two = arith.addi %one,%one : index'
    if variant=='alloc':between='%tmp = memref.alloc() : memref<16xf32>'
    if variant=='dealloc':between='%tmp = memref.alloc() : memref<16xf32>\nmemref.dealloc %tmp : memref<16xf32>'
    if variant=='view':between='%alias = memref.reinterpret_cast %a to offset:[0], sizes:[16], strides:[1] : memref<16xf32> to memref<16xf32>'
    if variant=='read':between='%r = memref.load %a[%zero] : memref<16xf32>'
    if variant=='write':between='memref.store %v,%a[%zero] : memref<16xf32>'
    if variant=='conditional':between='scf.if %flag { %r = memref.load %a[%zero] : memref<16xf32> }'
    if variant=='scf':between='scf.for %k = %zero to %one step %one { %r = memref.load %a[%k] : memref<16xf32> }'
    if variant=='explicit':between='gpu.barrier'
    if variant=='two_explicit':between='gpu.barrier\ngpu.barrier'
    if variant=='pure_after_read':between='%r = memref.load %a[%zero] : memref<16xf32>\n%two = arith.addi %one,%one : index'
    if variant=='explicit_after_read':between='%r = memref.load %a[%zero] : memref<16xf32>\ngpu.barrier'
    if variant=='first_explicit':first='gpu.barrier'
    if variant=='distributed_first':first=first[:-1]+'} {sycl.distribute, sycl.distribution_depth = 1 : i64}'
    if variant=='distributed_second':second=second[:-1]+'} {sycl.distribute, sycl.distribution_depth = 1 : i64}'
    if variant=='nested':second='scf.if %flag { '+second+' }'
    if variant=='stale_explicit':between='%r = memref.load %a[%zero] : memref<16xf32>\ngpu.barrier {sycl.coalesced_local_barrier}'
    if variant=='nested_stale':second='scf.if %flag { '+second+' {sycl.coalesced_entry_barrier} }'
    if variant=='stale':first+=' {sycl.coalesced_entry_barrier}'
    if variant=='only_first':second=''
    return f'''module {{func.func @phases(%flag:i1) {{
      %zero = arith.constant 0 : index
      %one = arith.constant 1 : index
      %v = arith.constant 3.0 : f32
      %a = memref.alloc() : memref<16xf32>
      %b = memref.alloc() : memref<16xf32>
      {first}
      {between}
      {second}
      return
    }} }}'''


def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--output',type=pathlib.Path,required=True)
    args=p.parse_args();ctx=ir.context();ir.load_dialects(ctx);sycl.load_dialects(ctx);rows=[]
    def transform(text,order):
        with tempfile.NamedTemporaryFile(mode='w',suffix='.mlir') as f:
            f.write(text);f.flush();mod=ir.parse_mlir_module(f.name,ctx)
        pm=ir.pass_manager(ctx)
        for name in order:getattr(sycl.passes.memir,name)(pm)
        pm.run(mod)
        return str(mod).replace(f.name,'phases.mlir'),SYCLBackend.emit_sycl(mod,{},None)
    cases={'plain':1,'pure':1,'alloc':1,'dealloc':1,'view':1,'read':0,'write':0,'conditional':0,
           'scf':0,'explicit':2,'two_explicit':3,'pure_after_read':0,'explicit_after_read':1,
           'first_explicit':1,'distributed_first':1,'distributed_second':0,'nested':0,
           'stale':1,'only_first':0,'stale_explicit':1,'nested_stale':0}
    stage='phase_barrier_coalescing'
    for variant,count in cases.items():
        text=source(variant)
        clean=text.replace(' {sycl.coalesced_entry_barrier}','').replace(' {sycl.coalesced_local_barrier}','')
        base,basecode=transform(clean,[])
        out,code=transform(text,[stage])
        actual=out.count('sycl.coalesced_entry_barrier')+out.count('sycl.coalesced_local_barrier')
        assert actual==count,(variant,count,out)
        token='item.barrier(sycl::access::fence_space::local_space);'
        assert basecode.count(token)-code.count(token)==count,(variant,basecode,code)
        again,againcode=transform(text,[stage,stage])
        assert out==again and code==againcode
        rows.append(dict(case=variant,coalesced=count,status='PASS',
            barriers_before=basecode.count(token),barriers_after=code.count(token)))
    # Work-distribution/reuse ordering can change phase emission. Replan the
    # coalescing proof last and verify exact actual source barrier differences.
    text=source('plain')
    for order in [['work_distribution'],['local_memory_reuse'],
                  ['work_distribution','local_memory_reuse'],['serial_half_copy_guard']]:
        base,basecode=transform(text,order)
        out,code=transform(text,order+[stage])
        assert basecode.count('item.barrier(')-code.count('item.barrier(')==1
        assert transform(text,order+[stage,stage])==(out,code)
        rows.append(dict(case='pipeline',pipeline=order,coalesced=1,status='PASS'))
    assert not SYCLOptions().phase_barrier_coalescing
    assert SYCLOptions().hash()!=SYCLOptions(phase_barrier_coalescing=True).hash()
    rows.append(dict(case='default_cache',status='PASS'))
    args.output.write_text(json.dumps(rows,indent=2)+'\n')
    print(json.dumps(dict(status='PASS',count=len(rows))))


if __name__=='__main__':main()
