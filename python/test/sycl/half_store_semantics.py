"""Bit-exact paired half output distribution over static layouts and fallbacks."""
import argparse
import hashlib
import itertools
import json
import pathlib
import statistics
import tempfile
import triton
from serial_half_copy_bits import Bits,source as copy_source
from terminal_store_layouts import copy_layout,copy_rank3,LAYOUTS
from triton.backends.sycl.sycl_utils import run_standalone,profile_standalone

SPECIAL=[0,0x8000,0x3c00,0xbc00,0x7c00,0xfc00,0x7e00,0x7d01,
         0xfe55,1,0x8001,0x3ff,0x83ff,0x400,0x8400,0x7bff,0xfbff]


def raw_fixture(shape,middle):
    from triton._C.libtriton import ir,sycl
    from triton.backends.sycl.compiler import SYCLBackend
    R,C=shape;grid=3;sentinel=0x3555
    raw=[SPECIAL[i%len(SPECIAL)] for i in range(grid*R*C)]
    expected=[sentinel]*(grid*R*C+7)
    for b in range(grid):
        for r in range(R):
            for c in range(C):expected[b*R*C+r*C+c]=raw[b*R*C+c*R+r]
    x,y=Bits(raw),Bits(expected)
    # Use equivalent scalar arithmetic accepted by the existing modular proof.
    # The unrelated affine.apply addressing form remains a conservative fallback.
    text=copy_source(R,C,'affine').replace(
        f'%at = affine.apply affine_map<(d0,d1,d2)->(d0+d1*{C}+d2)>(%base,%r,%c)',
        f'%stride = arith.constant {C} : index\n%row = arith.muli %r,%stride : index\n%rowbase = arith.addi %base,%row : index\n%at = arith.addi %rowbase,%c : index')
    ctx=ir.context();ir.load_dialects(ctx);sycl.load_dialects(ctx)
    def compile(enabled,stack):
        with tempfile.NamedTemporaryFile(mode='w',suffix='.mlir') as f:
            f.write(text);f.flush();mod=ir.parse_mlir_module(f.name,ctx)
        pm=ir.pass_manager(ctx)
        if middle:sycl.passes.memir.work_distribution(pm)
        if stack:sycl.passes.memir.local_memory_reuse(pm)
        if enabled:sycl.passes.memir.half_store_distribution(pm)
        sycl.passes.memir.serial_half_copy_guard(pm);pm.run(mod)
        return 'half_copy',SYCLBackend.emit_sycl(mod,{},None),str(mod),None,None
    return compile,[x,y],y,expected,grid,R*C>=256


def layout_fixture(case,grid):
    R,C=(4,32) if case=='small' else (16,16)
    sr,sc=LAYOUTS.get(case,(16,1))
    if case=='rank3':
        R,C=16,32
        offsets=[a*550+b*65-c for a,b,c in itertools.product(range(2),range(8),range(32))]
        bs=1100;coords=list(itertools.product(range(2),range(8),range(32)))
    else:
        offsets=[r*sr+c*sc for r,c in itertools.product(range(R),range(C))]
        bs=max(offsets)-min(offsets)+17
    base=9-min(offsets);size=base+(grid-1)*bs+max(offsets)+11
    n=grid*R*C-3 if case!='empty' else 0
    raw=[SPECIAL[i%len(SPECIAL)] for i in range(max(1,grid*R*C))]
    x,y=Bits(raw),Bits([0x3555]*size);expected=[0x3555]*size
    for b in range(grid):
        for r,c in itertools.product(range(R),range(C)):
            lane=b*R*C+r*C+c
            if case=='rank3':
                a=r//8;bb=r%8;off=a*550+bb*65-c;valid=lane<n and lane%5!=2
            else:
                valid=lane<n and (r*C+c)%5!=2
                if case in ('collision','scatter'):valid=valid and r==0 and c==0
                off=r+c if case=='collision' else (r*C+c)%7 if case=='scatter' else r*sr+c*sc
            if valid:expected[base+b*bs+off]=raw[lane]
    if case=='rank3':kernel=copy_rank3;warm=[x,y,n,base];kw={};bound=warm
    else:
        kernel=copy_layout;warm=[x,y,n,base,sr]
        kw=dict(R=R,C=C,SR=sr,SC=sc,BS=bs,KIND=case);bound=warm+[R,C,sr,sc,bs,case]
    def compile(enabled,stack):
        c=kernel.warmup(*warm,grid=(grid,),**kw,half_store_distribution=enabled,
            terminal_store_distribution=stack,cooperative_load_staging=stack,
            fuse_elementwise=stack,reuse_local_memory=True,group_reduction=stack)
        code=c.asm['sycl'];code=code.decode() if isinstance(code,bytes) else code
        return c.name,code,str(c.asm['memir']),c.src.signature,c.metadata
    return compile,bound,y,expected,grid,case not in ('small','dynamic','collision','scatter')


def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--case',choices=list(LAYOUTS)+['rank3','small','dynamic','collision','scatter','empty','raw'],required=True)
    p.add_argument('--grid',type=int,choices=(1,3),default=3)
    p.add_argument('--shape',nargs=2,type=int,default=[16,32])
    p.add_argument('--middle',action='store_true')
    p.add_argument('--output',type=pathlib.Path,required=True)
    p.add_argument('--dump-dir',type=pathlib.Path)
    p.add_argument('--compile-only',action='store_true')
    p.add_argument('--rounds',type=int,default=1)
    p.add_argument('--repeats',type=int,default=0)
    args=p.parse_args()
    fixture=raw_fixture(args.shape,args.middle) if args.case=='raw' else layout_fixture(args.case,args.grid)
    compile,bound,out,expected,grid,eligible=fixture;rows=[]
    for round_ in range(args.rounds):
        configs=list(itertools.product((False,True),repeat=2))
        for stack,enabled in (configs if round_%2==0 else reversed(configs)):
            name,code,memir,signature,metadata=compile(enabled,stack)
            selected='sycl.half_store_distribution' in memir
            assert selected==bool(enabled and eligible),(args.case,enabled,stack,memir)
            if selected:assert memir.count('sycl.scalar_half_bits')>=2,memir
            if args.dump_dir:
                args.dump_dir.mkdir(parents=True,exist_ok=True)
                for ext,data in [('sycl',code),('memir',memir)]:
                    (args.dump_dir/f'stack{stack}-enabled{enabled}.{ext}').write_text(data)
            checks=0;samples=[]
            if not args.compile_only:
                for block in (1,3,48,(3,5),64):
                    out.c_array[:]=[0x3555]*len(expected)
                    run_standalone(grid,1,1,name,code,bound,signature=signature,metadata=metadata,block_size=block)
                    actual=list(out.c_array)
                    assert actual==expected,[(i,a,b) for i,(a,b) in enumerate(zip(actual,expected)) if a!=b][:8]
                    checks+=len(expected)
                if args.repeats:
                    samples=profile_standalone(grid,1,1,name,code,bound,signature=signature,
                        metadata=metadata,block_size=64,warmup=10,repeats=args.repeats)
                    assert list(out.c_array)==expected
                    checks+=len(expected)
            row=dict(case=args.case,shape=args.shape if args.case=='raw' else None,middle=args.middle,
                grid=grid,stack=stack,enabled=enabled,selected=selected,round=round_,
                status='PASS',compile_only=args.compile_only,elements_checked=checks,
                output_elements=len(expected),special_bits=SPECIAL,
                source_sha256=hashlib.sha256(code.encode()).hexdigest(),
                half_guards=memir.count('sycl.scalar_half_bits'),
                staging=memir.count('sycl.cooperative_load_staging'),
                samples_ns=samples,median_ns=statistics.median(samples) if samples else None)
            rows.append(row);print(json.dumps(row),flush=True)
            args.output.write_text(json.dumps(rows,indent=2)+'\n')


if __name__=='__main__':main()
