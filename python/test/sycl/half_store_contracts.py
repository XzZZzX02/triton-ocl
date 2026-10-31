"""Proof boundaries and pass composition for guarded IEEE half output copies."""
import argparse
import itertools
import json
import pathlib
import random
import tempfile
from terminal_store_contracts import source


def main():
    from triton._C.libtriton import ir,sycl
    from triton.backends.sycl.compiler import SYCLOptions
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--output',required=True)
    args=p.parse_args();ctx=ir.context();ir.load_dialects(ctx);sycl.load_dialects(ctx);rows=[]
    def transform(text,order):
        with tempfile.NamedTemporaryFile(mode='w',suffix='.mlir') as f:
            f.write(text);f.flush();mod=ir.parse_mlir_module(f.name,ctx)
        pm=ir.pass_manager(ctx)
        for name in order:getattr(sycl.passes.memir,name)(pm)
        pm.run(mod)
        return str(mod).replace(f.name,'half-store.mlir')
    stage='half_store_distribution';guard='serial_half_copy_guard'
    orders=[[stage],[stage,'work_distribution'],['work_distribution',stage],
        ['local_memory_reuse',stage],[stage,'local_memory_reuse','work_distribution'],
        [guard,stage],[stage,guard,'work_distribution',stage]]
    cases=[('dense',{},True),('mask',dict(variant='mask'),True),
        ('transpose',dict(coefficients=(1,16)),True),('negative',dict(coefficients=(-32,1)),True),
        ('padded',dict(coefficients=(40,1)),True),('stride2',dict(coefficients=(64,2)),True),
        ('rank1',dict(shape=(256,),coefficients=(1,)),True),
        ('rank3',dict(shape=(2,8,32),coefficients=(256,32,1)),True),
        ('small',dict(shape=(255,),coefficients=(1,)),False),
        ('collision',dict(coefficients=(1,1)),False),
        ('zero_stride',dict(coefficients=(0,1)),False),
        ('wrap32',dict(shape=(256,),coefficients=(2**31,)),False),
        ('pointer_wrap',dict(shape=(256,),coefficients=(2**62,),bits=64),False),
        ('rank4',dict(shape=(2,2,8,16),coefficients=(256,128,16,1)),False)]
    cases += [(v,dict(variant=v),False) for v in ('dynamic_stride','modulo','select',
        'trunc8','thread','external_read','extra_store','nontemporal','unknown_attr',
        'nested','following_read','prior_write','dynamic_bound','step2','escape')]
    for (name,kw,eligible),dialect in itertools.product(cases,('memref','affine')):
        text=source(**kw).replace('f32','f16')
        if dialect=='affine':
            text=text.replace('memref.load %local','affine.load %local')
        for order in orders:
            out=transform(text,order+[guard])
            assert out.count('sycl.half_store_distribution')==int(eligible),(name,order,out)
            assert out.count('sycl.distribution_depth')==int(eligible),(name,order,out)
            assert out.count('gpu.barrier')==int(eligible),(name,order,out)
            if eligible:assert out.count('sycl.scalar_half_bits')==2,(name,out)
            assert out==transform(text,order+[guard,stage,guard]),(name,order)
            rows.append(dict(case=name,dialect=dialect,pipeline=order,selected=eligible,status='PASS'))
    for variant in ('arithmetic','multiuse'):
        text=source().replace('f32','f16')
        if variant=='arithmetic':
            text=text.replace('memref.store %value,','%twice = arith.addf %value,%value : f16\nmemref.store %twice,')
        else:text=text.replace('memref.store %value,','%also = arith.addf %value,%value : f16\nmemref.store %value,')
        out=transform(text,[stage,guard])
        assert 'sycl.half_store_distribution' not in out
        rows.append(dict(case=variant,selected=False,status='PASS'))
    for dialect in ('memref','affine'):
        text=source().replace('f32','f16').replace('memref.load %local',dialect+'.load %local')
        out=transform(text,[stage])
        assert out.count('sycl.scalar_half_bits')==2,out
        assert out==transform(text,[stage,stage]),out
        rows.append(dict(case='standalone_protected',dialect=dialect,selected=True,status='PASS'))
    # Distinct wide/narrow passes cannot steal each other's schedules.
    for dtype in ('f16','f32','bf16','i16'):
        text=source().replace('f32',dtype)
        for order in ([stage,'terminal_store_distribution'],['terminal_store_distribution',stage],
                      [stage,'work_distribution','terminal_store_distribution',stage]):
            out=transform(text,order+[guard])
            assert out.count('sycl.half_store_distribution')==int(dtype=='f16'),out
            assert out.count('sycl.terminal_store_distribution')==int(dtype=='f32'),out
            rows.append(dict(case='dtype_'+dtype,pipeline=order,selected=dtype=='f16',status='PASS'))
    forged=source(coefficients=(1,1)).replace('f32','f16')
    pos=forged.rfind('}\n      ')
    forged=forged[:pos+1]+' {sycl.half_store_distribution, sycl.distribute, sycl.distribution_depth = 2 : i64}'+forged[pos+1:]
    for order in ([stage],['work_distribution'],[stage,'work_distribution',stage]):
        out=transform(forged,order+[guard])
        assert 'sycl.half_store_distribution' not in out and 'sycl.distribute' not in out,out
        rows.append(dict(case='forged_collision',pipeline=order,selected=False,status='PASS'))
    rng=random.Random(906)
    specs=[((16,16),(rng.randrange(-48,49),rng.randrange(-48,49)),32) for _ in range(48)]
    specs += [((256,),(c,),32) for c in (0,1,-1,2,2**24,2**25,2**30,2**31)]
    for shape,coefficients,bits in specs:
        out=transform(source(shape,coefficients,bits).replace('f32','f16'),[stage,guard])
        selected='sycl.half_store_distribution' in out
        addresses=[sum(c*i for c,i in zip(coefficients,coords))%(1<<min(bits,63))
                   for coords in itertools.product(*(range(s) for s in shape))]
        assert not selected or len(set(addresses))==len(addresses)
        rows.append(dict(case='enumerated',shape=shape,coefficients=coefficients,selected=selected,status='PASS'))
    assert not SYCLOptions().half_store_distribution
    assert SYCLOptions().hash()!=SYCLOptions(half_store_distribution=True).hash()
    rows.append(dict(case='cache_default',selected=False,status='PASS'))
    pathlib.Path(args.output).write_text(json.dumps(rows,indent=2)+'\n')
    print(json.dumps(dict(status='PASS',count=len(rows))))


if __name__=='__main__':main()
