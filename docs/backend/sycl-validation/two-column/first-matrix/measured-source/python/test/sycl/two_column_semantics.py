"""Paired two-column fallback tests with ordered output references and stack ablations."""
import argparse
import hashlib
import itertools
import json
import math
import pathlib
import re
import statistics
import struct
from types import SimpleNamespace
from cooperative_staging_semantics import prepare,check
from full_stack_ablation import ALL
from triton.backends.sycl.sycl_utils import run_standalone,profile_standalone


def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--shape',nargs=3,type=int,default=[8,16,32])
    p.add_argument('--layout',choices=('NN','NT','TN','TT'),required=True)
    p.add_argument('--dtype',choices=('f16','f32'),default='f16')
    p.add_argument('--configs',nargs='+',choices=('base','full','no_staging','no_init','no_accumulator','no_reuse','no_fusion','no_unroll','no_distribution','tiling_off'),default=['base','full'])
    p.add_argument('--rounds',type=int,default=1);p.add_argument('--repeats',type=int,default=0)
    p.add_argument('--special',action='store_true')
    p.add_argument('--compile-only',action='store_true')
    p.add_argument('--output',type=pathlib.Path,required=True);p.add_argument('--dump-dir',type=pathlib.Path)
    a=p.parse_args();M,N,K=a.shape;fixture=SimpleNamespace(kind='dot',shape=a.shape,layout=a.layout,dtype=a.dtype)
    kernel,warm,kw,bound,out,expected,grid=prepare(fixture)
    if a.special:
        # Exact 0/1 inputs preserve an independent reference while exercising
        # NaN, opposite infinities and signed zeros in separate programs.
        values=[(-0. if i%2 else 0.) for i in range(grid*M*K)]
        values[0]=math.nan;values[M*K+1]=math.inf;values[2*M*K+2]=-math.inf
        other=[1.]*(grid*K*N)
        from register_accumulator import Tensor
        x,y=Tensor(values,a.dtype=='f16'),Tensor(other,a.dtype=='f16')
        warm[:2]=[x,y];bound[:2]=[x,y]
        expected=[-999.]*(grid*M*N+7);ta,tb=[v=='T' for v in a.layout]
        for batch in range(grid):
            for r in range(M-1):
                for c in range(N-3):
                    acc=0.
                    for h in range(K-1):
                        av=values[batch*M*K+(h*M+r if ta else r*K+h)]
                        bv=other[batch*K*N+(c*K+h if tb else h*N+c)]
                        prod=struct.unpack('<f',struct.pack('<f',av*bv))[0]
                        acc=struct.unpack('<f',struct.pack('<f',acc+prod))[0]
                    expected[batch*M*N+r*N+c]=acc
    rows=[];markers={}
    for round_ in range(a.rounds):
        plans=list(itertools.product(a.configs,(False,True)))
        for plan,enabled in (plans if round_%2==0 else reversed(plans)):
            opts=dict(ALL)
            if plan=='base':
                opts.update({k:False for k in opts if k not in ('register_accumulator','matmul_register_tiling','distribute_work','reuse_local_memory','reduction_unroll')})
                opts['reduction_unroll']=1
            elif plan=='tiling_off':opts['matmul_register_tiling']=False
            elif plan.startswith('no_'):
                key={'staging':'cooperative_load_staging','init':'accumulator_init_forwarding',
                     'accumulator':'register_accumulator','reuse':'reuse_local_memory','fusion':'fuse_elementwise',
                     'unroll':'reduction_unroll','distribution':'distribute_work'}[plan[3:]]
                opts[key]=1 if key=='reduction_unroll' else False
            c=kernel.warmup(*warm,grid=(grid,),**kw,**opts,matmul_register_tiling_2col=enabled)
            code=c.asm['sycl'];code=code.decode() if isinstance(code,bytes) else code;memir=str(c.asm['memir'])
            found=re.search(r'sycl.register_tile = (\d+)',memir);tile=int(found[1]) if found else 0
            eligible=opts['matmul_register_tiling'] and opts['distribute_work'] and a.dtype=='f16' and M>=8 and N>=16 and K>=16 and N%4==0
            want=4 if eligible and M*(N//4)>=64 else 2 if eligible and enabled and M*(N//2)>=64 else 0
            assert tile==want,(a.shape,a.dtype,plan,enabled,tile,want,memir)
            promoted=opts['register_accumulator'] or tile>0
            expected_unroll=opts['reduction_unroll']>1 and promoted and K//4>=2 and (tile==0 or K>=32)
            assert memir.count('sycl.ordered_reduction_unroll')==int(expected_unroll),memir
            other={k:memir.count(k) for k in ('sycl.accumulator_init_forwarded','sycl.cooperative_load_staging','sycl.terminal_store_distribution','sycl.single_lane_half_bits')}
            markers[plan,enabled]=other
            if (plan,not enabled) in markers:assert markers[plan,not enabled]==other,(plan,enabled,other,markers)
            if a.dump_dir:
                a.dump_dir.mkdir(parents=True,exist_ok=True)
                for ext,text in [('sycl',code),('memir',memir)]:
                    (a.dump_dir/f'{plan}-enabled{enabled}.{ext}').write_text(text)
            checks=0;samples=[]
            if not a.compile_only:
                for local in (1,3,48,(3,5),64):
                    out.c_array[:]=[-999.]*len(expected)
                    run_standalone(grid,1,1,c.name,code,bound,signature=c.src.signature,metadata=c.metadata,block_size=local)
                    check(list(out.c_array),expected);checks+=len(expected)
                if a.repeats:
                    samples=profile_standalone(grid,1,1,c.name,code,bound,signature=c.src.signature,
                        metadata=c.metadata,block_size=64,warmup=10,repeats=a.repeats)
                    check(list(out.c_array),expected);checks+=len(expected)
            row=dict(shape=a.shape,layout=a.layout,dtype=a.dtype,plan=plan,enabled=enabled,round=round_,tile=tile,
                status='PASS',special=a.special,compile_only=a.compile_only,elements_checked=checks,
                output_elements=len(expected),source_sha256=hashlib.sha256(code.encode()).hexdigest(),
                source_bytes=len(code),markers=other,composed=memir.count('sycl.register_tile_composed_accumulator'),
                unrolled=memir.count('sycl.ordered_reduction_unroll'),samples_ns=samples,
                median_ns=statistics.median(samples) if samples else None)
            rows.append(row);print(json.dumps(row),flush=True);a.output.write_text(json.dumps(rows,indent=2)+'\n')


if __name__=='__main__':main()
