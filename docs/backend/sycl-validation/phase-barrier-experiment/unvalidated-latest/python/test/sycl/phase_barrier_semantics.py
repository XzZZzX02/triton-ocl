"""Paired phase-barrier timings with independent output and actual emitter checks."""
import argparse
import hashlib
import itertools
import json
import pathlib
import re
import statistics
from types import SimpleNamespace
import triton
import triton.language as tl
from cooperative_staging_semantics import prepare,check
from register_accumulator import Tensor
from full_stack_ablation import ALL
from triton.backends.sycl.sycl_utils import run_standalone,profile_standalone


@triton.jit(do_not_specialize=['n'])
def reduction(x,y,n,B:tl.constexpr):
    p=tl.program_id(0)
    i=tl.arange(0,B)
    v=tl.load(x+p*B+i,i<n,0.)
    tl.store(y+p,tl.sum(v,0))


def fixture(args):
    if args.kind=='reduce':
        B=args.block;n=B-7;grid=3
        raw=[(i%17-8)/4 for i in range(grid*B)]
        x,y=Tensor(raw),Tensor([-999.]*10)
        expected=[sum(raw[b*B:b*B+n]) for b in range(grid)]+[-999.]*7
        return reduction,[x,y,n],dict(B=B),[x,y,n,B],y,expected,grid
    return prepare(args)


def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--kind',choices=('copy','holes','or','negative','gather','broadcast','empty','dot','reduce'),required=True)
    p.add_argument('--block',type=int,default=256);p.add_argument('--n',type=int,default=1021)
    p.add_argument('--stride',type=int,default=1);p.add_argument('--special',action='store_true')
    p.add_argument('--shape',nargs=3,type=int,default=[16,32,32])
    p.add_argument('--layout',choices=('NN','NT','TN','TT'),default='NN')
    p.add_argument('--dtype',choices=('f16','f32'),default='f32')
    p.add_argument('--rounds',type=int,default=1);p.add_argument('--repeats',type=int,default=0)
    p.add_argument('--compile-only',action='store_true')
    p.add_argument('--configs',nargs='+',choices=('base','all','no_staging','no_store','no_reuse','no_fusion','no_accumulator','no_tiling','no_unroll','serial'),default=['base','all'])
    p.add_argument('--output',type=pathlib.Path,required=True);p.add_argument('--dump-dir',type=pathlib.Path)
    args=p.parse_args();kernel,warm,kw,bound,out,expected,grid=fixture(args);rows=[];compare={}
    for round_ in range(args.rounds):
        configs=list(itertools.product(args.configs,(False,True)))
        for plan,enabled in (configs if round_%2==0 else reversed(configs)):
            opts=dict(ALL,half_store_distribution=True)
            if plan=='base':
                opts.update({k:False for k in opts if k not in ('distribute_work','reuse_local_memory','reduction_unroll')})
                opts['reduction_unroll']=1
            elif plan=='serial':opts['distribute_work']=False
            elif plan.startswith('no_'):
                name={'staging':'cooperative_load_staging','store':'terminal_store_distribution',
                    'reuse':'reuse_local_memory','fusion':'fuse_elementwise','accumulator':'register_accumulator',
                    'tiling':'matmul_register_tiling','unroll':'reduction_unroll'}[plan[3:]]
                opts[name]=1 if name=='reduction_unroll' else False
            c=kernel.warmup(*warm,grid=(grid,),**kw,**opts,phase_barrier_coalescing=enabled)
            code=c.asm['sycl'];code=code.decode() if isinstance(code,bytes) else code;memir=str(c.asm['memir'])
            m=re.search(r'sycl.phase_barriers_coalesced = (\d+)',memir);removed=int(m[1]) if m else 0
            actual=code.count('item.barrier(sycl::access::fence_space::local_space);')
            markers={k:memir.count(k) for k in ('sycl.register_accumulator','sycl.register_tile =',
                'sycl.ordered_reduction_unroll','sycl.accumulator_init_forwarded','sycl.cooperative_load_staging',
                'sycl.terminal_store_distribution','sycl.half_store_distribution','sycl.distribution_depth',
                'sycl.scalar_half_bits','sycl.single_lane_half_bits')}
            compare[plan,enabled]=(actual,markers,removed)
            if (plan,not enabled) in compare:
                a,b=compare[plan,False],compare[plan,True]
                assert a[0]-b[0]==b[2] and a[1]==b[1],(plan,a,b)
            if args.dump_dir:
                args.dump_dir.mkdir(parents=True,exist_ok=True)
                for ext,data in [('sycl',code),('memir',memir)]:
                    (args.dump_dir/f'{plan}-enabled{enabled}.{ext}').write_text(data)
            checked=0;samples=[]
            if not args.compile_only:
                for block in (1,3,48,(3,5),64):
                    out.c_array[:]=[-999.]*len(expected)
                    run_standalone(grid,1,1,c.name,code,bound,signature=c.src.signature,metadata=c.metadata,block_size=block)
                    check(list(out.c_array),expected);checked+=len(expected)
                if args.repeats:
                    samples=profile_standalone(grid,1,1,c.name,code,bound,signature=c.src.signature,
                        metadata=c.metadata,block_size=64,warmup=10,repeats=args.repeats)
                    check(list(out.c_array),expected);checked+=len(expected)
            row=dict(kind=args.kind,block=args.block,n=args.n,stride=args.stride,special=args.special,
                shape=args.shape,layout=args.layout,dtype=args.dtype,plan=plan,enabled=enabled,round=round_,
                grid=grid,status='PASS',compile_only=args.compile_only,barriers=actual,removed=removed,markers=markers,
                source_sha256=hashlib.sha256(code.encode()).hexdigest(),source_bytes=len(code),
                output_elements=len(expected),elements_checked=checked,samples_ns=samples,
                median_ns=statistics.median(samples) if samples else None)
            rows.append(row);print(json.dumps(row),flush=True);args.output.write_text(json.dumps(rows,indent=2)+'\n')


if __name__=='__main__':main()
