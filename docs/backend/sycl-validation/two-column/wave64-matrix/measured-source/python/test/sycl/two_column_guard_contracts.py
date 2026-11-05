"""Prove launch-variant structure and reject asymmetric/stale tile markers."""
import argparse
import itertools
import json
import pathlib
import tempfile

from two_column_contracts import source


def main():
    from triton._C.libtriton import ir,sycl,passes
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--output',type=pathlib.Path,required=True)
    args=p.parse_args()
    ctx=ir.context();ir.load_dialects(ctx);sycl.load_dialects(ctx)
    rows=[]

    def run(text,order,negative=False):
        with tempfile.NamedTemporaryFile(mode='w',suffix='.mlir') as f:
            f.write(text);f.flush();mod=ir.parse_mlir_module(f.name,ctx)
        pm=ir.pass_manager(ctx)
        for item in order:
            if item=='tile':sycl.passes.memir.matmul_register_tiling(pm,True)
            elif item=='unroll':sycl.passes.memir.ordered_reduction_unroll(pm,4)
            elif item=='cse':passes.common.add_cse(pm)
            else:getattr(sycl.passes.memir,item)(pm)
        try:
            pm.run(mod)
        except RuntimeError as error:
            if not negative:raise
            return str(error)
        assert not negative,'an unsupported candidate was accepted'
        return str(mod).replace(f.name,'two-column-guard.mlir')

    cases=[(8,16,16,None),(8,16,32,None),(9,16,24,None),
           (15,16,31,None),(8,20,64,None),(8,16,32,1)]
    for (m,n,k,batches),promote,init,unroll,cse,reuse_before in itertools.product(cases,(False,True),(False,True),(False,True),(False,True),(False,True)):
        order=['work_distribution']+(['register_accumulator'] if promote else [])+['tile']
        if cse:order+=['cse']
        if init:order+=['accumulator_init_forwarding']
        if unroll:order+=['unroll']
        if cse:order+=['cse']
        if reuse_before:order+=['local_memory_reuse']
        order+=['two_column_launch_guard']
        if unroll:order+=['unroll']
        if cse:order+=['cse']
        if not reuse_before:order+=['local_memory_reuse']
        text=source(m,n,k,batches=batches);out=run(text,order)
        for marker in ('sycl.two_column_launch_guard = 64 : i64',
                       'sycl.two_column_tiled_path','sycl.two_column_untiled_path',
                       'sycl.register_tile = 2 : i64'):
            assert out.count(marker)==1,(order,marker,out)
        assert 'sycl.two_column_candidate' not in out
        assert out.count('gpu.block_dim')==3 and out.count('arith.cmpi eq')==1
        assert out.count('sycl.register_accumulator')==2
        assert out.count('sycl.register_tile_composed_accumulator')==int(promote)
        assert out.count('sycl.accumulator_init_forwarded')==2*int(init)
        count=int(unroll and k%4==0 and k//4>=2)*(1+int(k>=32))
        assert out.count('sycl.ordered_reduction_unroll')==count,(m,n,k,order,out)
        fallback=out.split('} else {',1)[1]
        assert fallback.count('scf.for')==1 and fallback.count('memref.store')==1
        assert 'sycl.register_tile =' not in fallback
        assert '-> (f32)' in fallback and '-> (f32, f32)' not in fallback
        assert out==run(text,order+['two_column_launch_guard'])
        assert out==run(text,order+['tile','two_column_launch_guard'])
        rows.append(dict(shape=[m,n,k],batches=batches,promote=promote,
                         init=init,unroll=unroll,cse=cse,reuse_before=reuse_before,status='PASS'))

    for m,n,k in ((16,16,32),(8,32,32),(4,16,32),(8,8,32)):
        for dtype,promote in itertools.product(('f16','f32'),(False,True)):
            order=['work_distribution']+(['register_accumulator'] if promote else [])+['tile','local_memory_reuse']
            text=source(m,n,k,dtype=dtype)
            assert run(text,order)==run(text,order+['two_column_launch_guard'])
            rows.append(dict(case='inert',shape=[m,n,k],dtype=dtype,promote=promote,status='PASS'))

    plain=source()
    private=plain.replace('func.func @matmul()', 'func.func private @matmul()')
    caller=('func.func @caller() {'+chr(10)+
            'func.call @matmul() : () -> ()'+chr(10)+'return }'+chr(10))
    called=plain.replace('module {','module {'+caller,1)
    for name,text in [('private_entry',private),('called_entry',called)]:
        order=['work_distribution','register_accumulator']
        assert run(text,order)==run(text,order+['tile','two_column_launch_guard'])
        rows.append(dict(case=name,inert=True,status='PASS'))

    before=run(source(),['work_distribution','register_accumulator','tile','accumulator_init_forwarding','unroll'])
    line=next(x for x in before.splitlines() if 'scf.yield ' in x)
    a,b=line.strip().split('scf.yield ',1)[1].split(' : ',1)[0].split(', ')
    negatives={
        'shared_yield':before.replace('scf.yield '+a+', '+b+' :','scf.yield '+a+', '+a+' :',1),
        'swapped_yield':before.replace('scf.yield '+a+', '+b+' :','scf.yield '+b+', '+a+' :',1),
        'missing_distribution':before.replace('sycl.distribute, ',''),
        'stale_depth':before.replace('sycl.distribution_depth = 2 : i64','sycl.distribution_depth = 1 : i64'),
        'effect':before.replace('scf.yield ','gpu.barrier'+chr(10)+'scf.yield ',1),
        'stale_width':before.replace('sycl.register_tile = 2 : i64','sycl.register_tile = 4 : i64'),
    }
    line=next(x for x in before.splitlines() if 'iter_args(' in x)
    old=line.split('iter_args(',1)[1].split(')',1)[0]
    assignments=old.split(', ')
    new=assignments[0]+', '+assignments[1].split(' = ',1)[0]+' = %different'
    text=before.replace('func.func @matmul() {','func.func @matmul() {'+chr(10)+'%different = arith.constant 1.0 : f32')
    negatives['different_initial']=text.replace('iter_args('+old+')','iter_args('+new+')',1)
    indices=[x.strip().split(' = ')[0] for x in before.splitlines() if 'affine.apply ' in x]
    assert len(indices)==2
    load=next(x for x in before.splitlines() if 'memref.load ' in x and 'f16>' in x and indices[0]+']' in x)
    negatives['shared_column']=before.replace(load,load.replace(indices[0]+']',indices[1]+']'),1)
    for name,text in negatives.items():
        diagnostic=run(text,['two_column_launch_guard'],negative=True)
        rows.append(dict(case=name,rejected=True,diagnostic=diagnostic,status='PASS'))
    args.output.write_text(json.dumps(rows,indent=2)+chr(10))
    print(json.dumps(dict(status='PASS',count=len(rows))))


if __name__=='__main__':
    main()
