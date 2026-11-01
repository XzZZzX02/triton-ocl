"""Linear affine address proof, modular boundaries and composition contracts."""
import argparse
import itertools
import json
import pathlib
import random
import tempfile
from affine_store_cases import source


def main():
    from triton._C.libtriton import ir,sycl
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--output',type=pathlib.Path,required=True)
    args=p.parse_args();ctx=ir.context();ir.load_dialects(ctx);sycl.load_dialects(ctx);rows=[]
    def transform(text,order):
        with tempfile.NamedTemporaryFile(mode='w',suffix='.mlir') as f:
            f.write(text);f.flush();mod=ir.parse_mlir_module(f.name,ctx)
        pm=ir.pass_manager(ctx)
        for name in order:getattr(sycl.passes.memir,name)(pm)
        pm.run(mod);return str(mod).replace(f.name,'affine-store.mlir')
    specs=[('dense',(16,32),(32,1),True),('transpose',(16,32),(1,19),True),
        ('negative',(16,32),(-43,1),True),('stride2',(16,32),(72,2),True),
        ('rank1',(512,),(2,),True),('rank3',(2,8,32),(600,65,-1),True),
        ('small',(8,16),(16,1),False),('collision',(16,32),(1,1),False),
        ('zero',(16,32),(32,0),False),('span_limit',(512,),(2**62,),False)]
    for dtype,reader,form,(name,shape,coef,eligible) in itertools.product(
        ('f16','f32'),('memref','affine'),('affine','nested','arith'),specs):
        stage='half_store_distribution' if dtype=='f16' else 'terminal_store_distribution'
        marker='sycl.half_store_distribution' if dtype=='f16' else 'sycl.terminal_store_distribution'
        text=source(shape,coef,dtype,form,reader,masked=True)
        for order in ([stage],['work_distribution',stage],[stage,'work_distribution'],
            ['local_memory_reuse',stage],['serial_half_copy_guard',stage],
            [stage,'serial_half_copy_guard','work_distribution',stage]):
            out=transform(text,order+['serial_half_copy_guard'])
            assert out.count(marker)==int(eligible),(dtype,reader,form,name,order,out)
            assert out==transform(text,order+['serial_half_copy_guard',stage,'serial_half_copy_guard'])
            rows.append(dict(dtype=dtype,reader=reader,form=form,case=name,pipeline=order,
                selected=eligible,status='PASS'))
    for dtype in ('f16','f32'):
        stage='half_store_distribution' if dtype=='f16' else 'terminal_store_distribution'
        marker='sycl.half_store_distribution' if dtype=='f16' else 'sycl.terminal_store_distribution'
        text=source(dtype=dtype)
        expr='s0 + d0*(32) + d1*(1)'
        for name,replacement in [('floor','s0 + (d0*32+d1) floordiv 2'),
            ('ceil','s0 + (d0*32+d1) ceildiv 2'),('mod','s0 + (d0*32+d1) mod 7'),
            ('symbol_stride','s0 + d0*s0+d1')]:
            assert expr in text
            probe=text.replace(expr,replacement)
            out=transform(probe,[stage])
            assert marker not in out,(name,out)
            rows.append(dict(dtype=dtype,case=name,selected=False,status='PASS'))
        for name,probe in [('unknown_load',text.replace('affine.load %local[%d0,%d1]', 'affine.load %local[%d0,%d1] {custom.flag}')),
            ('prior_external',text.replace('      %local =',f'''%prior = memref.reinterpret_cast %output to offset:[0], sizes:[1], strides:[1] : memref<*x{dtype}> to memref<1x{dtype}>
%vprior = arith.constant 0.0 : {dtype}
memref.store %vprior,%prior[%zero] : memref<1x{dtype}>
      %local ='''))]:
            out=transform(probe,[stage]);assert marker not in out,(name,out)
            rows.append(dict(dtype=dtype,case=name,selected=False,status='PASS'))
        # Depth-limited analysis must fall back rather than recurse without
        # bounds on chains produced by other compiler transformations.
        for length,eligible in ((8,True),(80,False)):
            probe=text.replace('%out = memref.reinterpret_cast %output to offset:[%at]',
                '\n'.join(f'%chain{i} = affine.apply affine_map<(d0)->(d0)>({previous})'
                    for i,previous in enumerate(['%at']+[f'%chain{j}' for j in range(length-1)]))+
                f'\n%out = memref.reinterpret_cast %output to offset:[%chain{length-1}]')
            out=transform(probe,[stage])
            assert (marker in out)==eligible,(dtype,length,out)
            rows.append(dict(dtype=dtype,case='recursion_depth',length=length,selected=eligible,status='PASS'))
    rng=random.Random(906)
    for dtype in ('f16','f32'):
        stage='half_store_distribution' if dtype=='f16' else 'terminal_store_distribution'
        marker='sycl.half_store_distribution' if dtype=='f16' else 'sycl.terminal_store_distribution'
        for form,shape,coeff,eligible in [('mixed',(256,),(2**24,),True),
            ('mixed',(257,),(2**24,),False),('mixed',(256,),(2**31,),False),
            ('nested',(16,32),(2**62,1),False)]:
            out=transform(source(shape,coeff,dtype,form,masked=False),[stage])
            assert (marker in out)==eligible,(dtype,form,shape,coeff,out)
            rows.append(dict(dtype=dtype,form=form,shape=shape,coefficients=coeff,
                case='modular_width',selected=eligible,status='PASS'))
    for dtype,form in itertools.product(('f16','f32'),('affine','nested')):
        stage='half_store_distribution' if dtype=='f16' else 'terminal_store_distribution'
        marker='sycl.half_store_distribution' if dtype=='f16' else 'sycl.terminal_store_distribution'
        for _ in range(32):
            coef=(rng.randrange(-48,49),rng.randrange(-48,49))
            out=transform(source((16,16),coef,dtype,form),[stage])
            selected=marker in out
            addresses=[sum(c*i for c,i in zip(coef,coords)) for coords in itertools.product(range(16),repeat=2)]
            assert not selected or len(set(addresses))==256
            rows.append(dict(dtype=dtype,form=form,case='enumerated',coefficients=coef,
                selected=selected,status='PASS'))
    args.output.write_text(json.dumps(rows,indent=2)+'\n')
    print(json.dumps(dict(status='PASS',count=len(rows))))


if __name__=='__main__':main()
