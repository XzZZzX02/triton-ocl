"""Verify pass-directed host dispatch and separately instantiated device paths."""
import argparse
import itertools
import json
import pathlib
import re
import tempfile

from two_column_contracts import source


def main():
    from triton._C.libtriton import ir,sycl,passes
    from triton.backends.sycl.compiler import SYCLBackend,SYCLOptions
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--output',type=pathlib.Path,required=True)
    args=p.parse_args();rows=[]
    ctx=ir.context();ir.load_dialects(ctx);sycl.load_dialects(ctx)

    def module(text,order):
        with tempfile.NamedTemporaryFile(mode='w',suffix='.mlir') as f:
            f.write(text);f.flush();mod=ir.parse_mlir_module(f.name,ctx)
        pm=ir.pass_manager(ctx)
        for item in order:
            if isinstance(item,bool):sycl.passes.memir.matmul_register_tiling(pm,item)
            elif item=='unroll':sycl.passes.memir.ordered_reduction_unroll(pm,4)
            elif item=='cse':passes.common.add_cse(pm)
            else:getattr(sycl.passes.memir,item)(pm)
        pm.run(mod);return mod

    def emit(mod):
        code=SYCLBackend.emit_sycl(mod,{},SYCLOptions())
        return code.decode() if isinstance(code,bytes) else code

    def pipeline(promote,init,unroll,allow=True):
        order=['work_distribution']+(['register_accumulator'] if promote else [])+[allow,'cse']
        if init:order+=['accumulator_init_forwarding']
        if unroll:order+=['unroll','cse']
        order+=['local_memory_reuse','two_column_launch_guard']
        if unroll:order+=['unroll','cse']
        return order

    for k,promote,init,unroll in itertools.product((16,32,64),(False,True),(False,True),(False,True)):
        mod=module(source(k=k),pipeline(promote,init,unroll));code=emit(mod)
        assert code.count('template <bool triton_sycl_two_column>')==1
        assert code.count('if constexpr (triton_sycl_two_column)')==1
        assert code.count('if (blockX * blockY * blockZ == 64ULL)')==2
        assert code.count('<true>(item')==code.count('<false>(item')==2
        assert code.count('h.parallel_for(')==4
        assert code.count('sycl::event kernel_event;')==1
        body=code.split('inline void matmul(',1)[1].split('extern "C" void launch_matmul(',1)[0]
        assert 'if (' not in body,'a device-side launch decision remains'
        rows.append(dict(k=k,promote=promote,init=init,unroll=unroll,status='PASS'))

    for m,n,dtype in ((8,16,'f32'),(16,16,'f16'),(8,32,'f16'),(4,16,'f16')):
        text=source(m,n,32,dtype=dtype)
        off=emit(module(text,pipeline(True,True,True,False)))
        on=emit(module(text,pipeline(True,True,True,True)))
        assert off==on,(m,n,dtype,'inert source changed')
        assert 'triton_sycl_two_column' not in on
        rows.append(dict(case='inert',shape=[m,n,32],dtype=dtype,status='PASS'))

    text=source();start=text.index('affine.for %r = 0 to 8')
    end=text.index('return',start);compute=text[start:end]
    two=text[:start]+compute+compute+text[end:]
    mod=module(two,pipeline(True,True,True));code=emit(mod)
    assert str(mod).count('sycl.two_column_launch_guard')==2
    assert code.count('template <bool triton_sycl_two_column>')==1
    assert code.count('if constexpr (triton_sycl_two_column)')==2
    assert code.count('if (blockX * blockY * blockZ == 64ULL)')==2
    rows.append(dict(case='two_independent_phases',status='PASS'))

    good=str(module(source(),pipeline(True,True,True)))
    args.output.with_suffix('.input.mlir').write_text(good)
    malformed={
        'predicate':good.replace('arith.cmpi eq','arith.cmpi ule'),
        'duplicate_dimension':re.sub('gpu[.]block_dim +y','gpu.block_dim x',good,count=1),
        'threshold':good.replace('sycl.two_column_launch_guard = 64 : i64','sycl.two_column_launch_guard = 32 : i64'),
    }
    private=good.replace('func.func @matmul()', 'func.func private @matmul()')
    caller='func.func @caller() {'+chr(10)+'func.call @matmul() : () -> ()'+chr(10)+'return }'+chr(10)
    malformed['called_entry']=private.replace('module {','module {'+caller,1)
    for name,text in malformed.items():
        assert text!=good,(name,'fixture did not match the actual printer syntax')
        mod=module(text,[])
        try:
            emit(mod)
        except RuntimeError as error:
            message=str(error)
            assert 'failed (exit 1):' in message,(name,'translator did not fail cleanly',message)
            expected='direct entries' if name=='called_entry' else 'consistent local-size launch guard'
            assert expected in message,(name,message)
        else:
            raise AssertionError((name,'malformed launch metadata was accepted'))
        rows.append(dict(case=name,rejected=True,status='PASS'))
    args.output.write_text(json.dumps(rows,indent=2)+chr(10))
    print(json.dumps(dict(status='PASS',count=len(rows))))


if __name__=='__main__':main()
