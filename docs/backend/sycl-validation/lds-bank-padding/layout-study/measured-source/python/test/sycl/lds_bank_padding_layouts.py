"""Execute actual rank-three and storage-colored padding with observable outputs."""
import argparse
import hashlib
import itertools
import json
import math
import pathlib
import re
import struct
import tempfile

from cooperative_staging_semantics import check
from lds_bank_padding_contracts import initialized
from register_accumulator import Tensor
from serial_half_copy_bits import Bits
from triton.backends.sycl.sycl_utils import run_standalone


def nests(shape, body, prefix='q', parallel=False):
    indices=[f'%{prefix}{i}' for i in range(len(shape))]
    text=body(indices)
    for iv,extent in reversed(list(zip(indices,shape))):
        text=f'affine.for {iv} = 0 to {extent} {{\n{text}\n}}'
        if parallel:text+=' {sycl.parallel}'
        text+='\n'
    return text


def flat(indices, shape, reverse=False):
    terms=[]
    for i,index in enumerate(indices):
        stride=math.prod(shape[i+1:])
        terms.append(f'd{i+1}*{stride}')
    inner='+'.join(terms)
    elements=math.prod(shape)
    expr=f'd0*{elements}+'+(f'({elements-1}-({inner}))' if reverse else inner)
    operands=','.join(['%pid']+indices)
    dims=','.join('d'+str(i) for i in range(len(indices)+1))
    return f'%at = affine.apply affine_map<({dims})->({expr})>({operands})\n'


def external_load(name, dtype):
    ty=f'memref<1x{dtype}, strided<[1], offset: ?>>'
    return f'''%view = memref.reinterpret_cast %{name} to offset:[%at], sizes:[1], strides:[1] : memref<*x{dtype}> to {ty}
%value = memref.load %view[%c0] : {ty}
'''


def source(case,dtype):
    batches=None if case=='reuse' else 2
    M,N,K=(32,64,64) if case=='reuse' else (4,8,64 if dtype=='f16' else 32)
    dims=[batches] if batches is not None else []
    a_shape=dims+[M,K]
    b_shape=dims+[K,N]
    c_shape=dims+[M,N]
    a_ty='memref<'+'x'.join(map(str,a_shape))+f'x{dtype}>'
    b_ty='memref<'+'x'.join(map(str,b_shape))+f'x{dtype}>'
    c_ty='memref<'+'x'.join(map(str,c_shape))+'xf32>'
    text=initialized(M,N,K,dtype,batches=batches)
    text=text.replace('func.func @matmul()',f'''func.func @padding_layout(
%ain:memref<*x{dtype}>,%bin:memref<*x{dtype}>,%out:memref<*xf32>,
%late_out:memref<*x{dtype}>,%limit:index)''')
    text=text.replace('%input =','%c0 = arith.constant 0 : index\n%pid = gpu.global_id x\n%input =',1)
    for name,shape,ty in (('a',a_shape,a_ty),('b',b_shape,b_ty)):
        indices=(['%batch'] if batches is not None else [])+['%i','%j']
        old=f'affine.store %input, %{name}['+','.join(indices)+f'] : {ty}'
        new=flat(indices,shape)+external_load(name+'in',dtype)
        new+=f'affine.store %value, %{name}['+','.join(indices)+f'] : {ty}'
        assert old in text
        text=text.replace(old,new,1)

    def output(indices):
        local=','.join(indices)
        ty='memref<1xf32, strided<[1], offset: ?>>'
        return flat(indices,c_shape)+f'''
%value = affine.load %c[{local}] : {c_ty}
%valid = arith.cmpi ult, %at, %limit : index
scf.if %valid {{
  %view = memref.reinterpret_cast %out to offset:[%at], sizes:[1], strides:[1] : memref<*xf32> to {ty}
  memref.store %value, %view[%c0] : {ty}
}}
'''
    ending=nests(c_shape,output,prefix='o')
    if case=='reuse':
        text=text.replace('%c = memref.alloc()',f'%late = memref.alloc() : {a_ty}\n%c = memref.alloc()',1)
        def late_fill(indices):
            return flat(indices,a_shape,True)+external_load('ain',dtype)+f'''
affine.store %value, %late[{','.join(indices)}] : {a_ty}
'''
        def late_copy(indices):
            view=f'memref<1x{dtype}, strided<[1], offset: ?>>'
            return flat(indices,a_shape)+f'''
%value = affine.load %late[{','.join(indices)}] : {a_ty}
%view = memref.reinterpret_cast %late_out to offset:[%at], sizes:[1], strides:[1] : memref<*x{dtype}> to {view}
memref.store %value, %view[%c0] : {view}
'''
        ending+=nests(a_shape,late_fill,prefix='l',parallel=True)
        ending+=nests(a_shape,late_copy,prefix='w')
    text=text.replace('return',ending+'\nreturn')
    return text,a_shape,b_shape,c_shape


def main():
    from triton._C.libtriton import ir,sycl,passes
    from triton.backends.sycl.compiler import SYCLBackend
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--case',choices=('reuse','rank3'),required=True)
    p.add_argument('--dtype',choices=('f16','f32'),required=True)
    p.add_argument('--data',choices=('finite','special'),default='finite')
    p.add_argument('--plans',nargs='+',choices=('raw','full'),default=['full'])
    p.add_argument('--reuse',nargs='+',type=int,choices=(0,1),default=[0,1])
    p.add_argument('--blocks',nargs='+',default=['1','3','48','64','128','3x5','4x4x4'])
    p.add_argument('--bounds',choices=('full','tail','empty','unit'),default='tail')
    p.add_argument('--compile-only',action='store_true')
    p.add_argument('--dump-dir',type=pathlib.Path,required=True)
    p.add_argument('--output',type=pathlib.Path,required=True)
    args=p.parse_args()
    text,a_shape,b_shape,c_shape=source(args.case,args.dtype)
    M,N,K=a_shape[-2],b_shape[-1],a_shape[-1]
    B=a_shape[0] if args.case=='rank3' else 1
    ac,bc,cc=map(math.prod,(a_shape,b_shape,c_shape))
    grid=3
    f32=lambda value:struct.unpack('<f',struct.pack('<f',value))[0]
    if args.dtype=='f16':
        half_bits=[0,0x8000,0x3c00,0xbc00,1,0x8001,0x400,0x8400,0x3555,0xb555]
        if args.data=='special':
            half_bits+=[0x7c00,0xfc00,0x7e00,0x7d01,0xfe55,0x7bff,0xfbff]
        raw_a=[half_bits[i%len(half_bits)] for i in range(grid*ac)]
        av=[struct.unpack('<e',int(bits).to_bytes(2,'little'))[0] for bits in raw_a]
        bv=[(i%7-3)/4 for i in range(grid*bc)]
        a,b=Bits(raw_a),Tensor(bv,True)
        late_expected=[0x3555]*(grid*ac+7)
        if args.case=='reuse':
            for i in range(grid):
                late_expected[i*ac:(i+1)*ac]=list(reversed(raw_a[i*ac:(i+1)*ac]))
        late=Bits([0x3555]*len(late_expected))
    else:
        values=[0.,-0.,1.,-1.,2**-149,-2**-149,1.0000001192092896,-1.0000001192092896]
        if args.data=='special':values+=[math.nan,math.inf,-math.inf]
        av=[values[i%len(values)] for i in range(grid*ac)]
        bv=[(i%7-3)/4 for i in range(grid*bc)]
        a,b=Tensor(av),Tensor(bv)
        late_expected=[-999.]*(grid*ac+7)
        if args.case=='reuse':
            for i in range(grid):late_expected[i*ac:(i+1)*ac]=list(reversed(av[i*ac:(i+1)*ac]))
        late=Tensor([-999.]*len(late_expected))
    limit={'full':grid*cc,'tail':grid*cc-3,'empty':0,'unit':1}[args.bounds]
    expected=[-999.]*(grid*cc+7)
    for g,batch,r,col in itertools.product(range(grid),range(B),range(M),range(N)):
        idx=g*cc+batch*M*N+r*N+col
        if idx>=limit:continue
        acc=0.
        for h in range(K):
            acc=f32(acc+f32(av[g*ac+batch*M*K+r*K+h]*bv[g*bc+batch*K*N+h*N+col]))
        expected[idx]=acc
    out=Tensor([-999.]*len(expected))
    ctx=ir.context();ir.load_dialects(ctx);sycl.load_dialects(ctx)
    rows=[]
    args.dump_dir.mkdir(parents=True,exist_ok=True)
    for plan,reuse,enabled in itertools.product(args.plans,args.reuse,(False,True)):
        with tempfile.NamedTemporaryFile(mode='w',suffix='.mlir') as f:
            f.write(text);f.flush();mod=ir.parse_mlir_module(f.name,ctx)
        pm=ir.pass_manager(ctx)
        sycl.passes.memir.work_distribution(pm)
        if plan=='full':
            sycl.passes.memir.register_accumulator(pm)
            sycl.passes.memir.matmul_register_tiling(pm,False)
            passes.common.add_cse(pm)
            sycl.passes.memir.accumulator_init_forwarding(pm)
            sycl.passes.memir.ordered_reduction_unroll(pm,4)
            passes.common.add_cse(pm)
        if reuse:sycl.passes.memir.local_memory_reuse(pm)
        if enabled:sycl.passes.memir.lds_bank_padding(pm)
        sycl.passes.memir.serial_half_copy_guard(pm)
        pm.run(mod)
        memir=str(mod)
        padded=memir.count('sycl.lds_bank_padding')
        selected=args.case=='rank3' or (plan=='full' and args.dtype=='f16')
        assert padded==int(enabled and selected),(args.case,plan,reuse,enabled,memir)
        reused=int(re.search('sycl.local_buffers_reused = ([0-9]+)',memir)[1]) if reuse else 0
        assert reused==int(bool(reuse) and args.case=='reuse'),(args.case,reuse,memir)
        code=SYCLBackend.emit_sycl(mod,{},None)
        code=code.decode() if isinstance(code,bytes) else code
        stem=f'{plan}-reuse{reuse}-enabled{enabled}'
        for ext,data in (('sycl',code),('memir',memir)):
            (args.dump_dir/f'{stem}.{ext}').write_text(data)
        checks=late_checks=0
        if not args.compile_only:
            for block in args.blocks:
                local=tuple(map(int,block.split('x'))) if 'x' in block else int(block)
                out.c_array[:]=[-999.]*len(expected)
                late.c_array[:]=[0x3555 if args.dtype=='f16' else -999.]*len(late_expected)
                run_standalone(grid,1,1,'padding_layout',code,[a,b,out,late,limit],block_size=local)
                check(list(out.c_array),expected)
                if args.dtype=='f16':
                    assert list(late.c_array)==late_expected,(args.case,plan,reuse,enabled,block)
                else:check(list(late.c_array),late_expected)
                checks+=len(expected);late_checks+=len(late_expected)
        row=dict(status='PASS',case=args.case,dtype=args.dtype,data=args.data,bounds=args.bounds,
            plan=plan,reuse=reuse,enabled=enabled,padded=padded,reused_slots=reused,
            allocations=memir.count('memref.alloc'),shape=[B,M,N,K],grid=grid,
            blocks=args.blocks,compile_only=args.compile_only,elements_checked=checks,
            late_elements_checked=late_checks,source_sha256=hashlib.sha256(code.encode()).hexdigest(),
            ordered_unroll=memir.count('sycl.ordered_reduction_unroll'))
        rows.append(row);args.output.write_text(json.dumps(rows,indent=2)+'\n')
        print(json.dumps(row),flush=True)


if __name__=='__main__':main()
