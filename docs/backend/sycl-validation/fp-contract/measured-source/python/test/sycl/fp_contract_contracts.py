"""Protect unpermitted native FMA and prove exact-product exceptions."""
import argparse
import itertools
import json
import pathlib
import tempfile


def source(lhs='f32',rhs='f32',dest='f32',flags='',consumer='arith.addf',consumer_flags='',
           memory=False):
    a='%a';b='%b';lines=[]
    if lhs!=dest:
        lines.append(f'%x = arith.extf %a : {lhs} to {dest}');a='%x'
    if rhs!=dest:
        lines.append(f'%y = arith.extf %b : {rhs} to {dest}');b='%y'
    lines.append(f'%product = arith.mulf {a}, {b}'+(f' fastmath<{flags}>' if flags else '')+f' : {dest}')
    if memory:
        lines+=['%i = arith.constant 0 : index',f'memref.store %product, %out[%i] : memref<1x{dest}>',
                f'%p = memref.load %out[%i] : memref<1x{dest}>']
        a='%p'
    else:a='%product'
    lines.append(f'%result = {consumer} {a}, %c'+(
        f' fastmath<{consumer_flags}>' if consumer_flags else '')+f' : {dest}')
    return (f'module {{func.func @test(%a:{lhs},%b:{rhs},%c:{dest},%out:memref<1x{dest}>) -> {dest} {{\n'
            +'\n'.join(lines)+f'\nreturn %result : {dest}\n}} }}')


def main():
    from triton._C.libtriton import ir,sycl
    from triton.backends.sycl.compiler import SYCLBackend
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--output',type=pathlib.Path,required=True)
    args=p.parse_args()
    ctx=ir.context();ir.load_dialects(ctx);sycl.load_dialects(ctx)
    rows=[]
    def run(text,repeats=1):
        with tempfile.NamedTemporaryFile(mode='w',suffix='.mlir') as f:
            f.write(text);f.flush();mod=ir.parse_mlir_module(f.name,ctx)
        pm=ir.pass_manager(ctx)
        for _ in range(repeats):sycl.passes.memir.fp_contract_guard(pm)
        pm.run(mod)
        return mod,str(mod).replace(f.name,'fp-contract.mlir')
    types=[('f32','f32','f32',True),('f64','f64','f64',True),
           ('f16','f16','f32',False),('bf16','bf16','f32',True),
           ('f16','f32','f32',True),('f32','f16','f32',True),
           ('f16','f16','f64',False),('f32','f32','f64',False),
           ('bf16','f32','f64',False),('bf16','f16','f32',True),
           ('f16','f16','f16',False)]
    for (lhs,rhs,dest,guarded),flags,consumer,other,memory in itertools.product(
            types,('','contract','fast'),('arith.addf','arith.subf'),('','contract','fast'),(False,True)):
        text=source(lhs,rhs,dest,flags,consumer,other,memory)
        mod,out=run(text)
        expected=guarded and not (flags and other and not memory)
        assert out.count('sycl.fp_contract_off')==int(expected),(lhs,rhs,dest,flags,consumer,other,memory,out)
        assert out==run(text,2)[1]
        # The renderer consumes only the pass marker; it does not make its own
        # floating-point scheduling/profitability choice.
        code=SYCLBackend.emit_sycl(mod,{},None)
        assert code.count('#pragma clang fp contract(off)')==int(expected),code
        rows.append(dict(lhs=lhs,rhs=rhs,dest=dest,flags=flags,consumer=consumer,
            consumer_flags=other,memory=memory,guarded=expected,status='PASS'))

    for lhs,rhs,dest,guarded in types:
        text=source(lhs,rhs,dest)
        text=text.replace('arith.mulf %', 'arith.mulf %',1)
        # Replan forged/stale metadata after a caller changes the inputs.
        text=text.replace(f' : {dest}\n%result',f' {{sycl.fp_contract_off}} : {dest}\n%result',1)
        _,out=run(text)
        assert out.count('sycl.fp_contract_off')==int(guarded),(lhs,rhs,dest,out)
        rows.append(dict(case='stale_marker',lhs=lhs,rhs=rhs,dest=dest,status='PASS'))
    # One exact source widened through two extf operations still has the same
    # finite operand range and mantissa proof.
    text=source('f16','f16','f64').replace('%x = arith.extf %a : f16 to f64',
        '%x0 = arith.extf %a : f16 to f32\n%x = arith.extf %x0 : f32 to f64')
    assert 'sycl.fp_contract_off' not in run(text)[1]
    rows.append(dict(case='transitive_exact_widening',status='PASS'))
    # Downstream additions explicitly permit contract only when every use is
    # covered; an unmarked second consumer forbids implicit contraction.
    text=source(flags='contract',consumer_flags='contract').replace(
        'return %result', '%second = arith.addf %product, %c : f32\nreturn %result')
    assert run(text)[1].count('sycl.fp_contract_off')==1
    rows.append(dict(case='mixed_users',status='PASS'))
    args.output.write_text(json.dumps(rows,indent=2)+'\n')
    print(json.dumps(dict(status='PASS',count=len(rows))))


if __name__=='__main__':main()
