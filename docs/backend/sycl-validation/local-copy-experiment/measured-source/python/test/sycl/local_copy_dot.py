"""Paired dot/layout forwarding tests with existing schedules held fixed."""
import argparse
import hashlib
import itertools
import json
import pathlib
import re
import statistics
from types import SimpleNamespace
from cooperative_staging_semantics import prepare,check
from full_stack_ablation import ALL
from triton.backends.sycl.sycl_utils import run_standalone,profile_standalone


def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--shape',nargs=3,type=int,default=[16,32,32])
    p.add_argument('--layout',choices=('NN','NT','TN','TT'),required=True)
    p.add_argument('--dtype',choices=('f16','f32'),required=True)
    p.add_argument('--configs',nargs='+',choices=('base','all','no_staging','no_reuse','no_fusion','no_accumulator','no_tiling','no_unroll'),default=['base','all'])
    p.add_argument('--rounds',type=int,default=1);p.add_argument('--repeats',type=int,default=0)
    p.add_argument('--compile-only',action='store_true')
    p.add_argument('--output',required=True,type=pathlib.Path);p.add_argument('--dump-dir',type=pathlib.Path)
    args=p.parse_args();fixture=SimpleNamespace(kind='dot',shape=args.shape,layout=args.layout,dtype=args.dtype)
    kernel,warm,kw,bound,out,expected,grid=prepare(fixture);rows=[];reference={}
    for round_ in range(args.rounds):
        configs=list(itertools.product(args.configs,(False,True)))
        for config,enabled in (configs if round_%2==0 else reversed(configs)):
            opts=dict(ALL,half_store_distribution=True)
            if config=='base':
                opts.update({k:False for k in opts if k not in ('distribute_work','reuse_local_memory','reduction_unroll')})
                opts['reduction_unroll']=1
            elif config.startswith('no_'):
                name={'staging':'cooperative_load_staging','reuse':'reuse_local_memory',
                    'fusion':'fuse_elementwise','accumulator':'register_accumulator',
                    'tiling':'matmul_register_tiling','unroll':'reduction_unroll'}[config[3:]]
                opts[name]=1 if name=='reduction_unroll' else False
            c=kernel.warmup(*warm,grid=(grid,),**kw,**opts,local_copy_forwarding=enabled)
            code=c.asm['sycl'];code=code.decode() if isinstance(code,bytes) else code;memir=str(c.asm['memir'])
            marker=re.search(r'sycl.local_copies_forwarded = (\d+)',memir);copies=int(marker[1]) if marker else 0
            assert copies==(args.layout.count('T') if enabled else 0),(config,enabled,copies,memir)
            preserved={x:memir.count(x) for x in ('sycl.register_accumulator','sycl.register_tile =',
                'sycl.ordered_reduction_unroll','sycl.accumulator_init_forwarded','sycl.cooperative_load_staging',
                'sycl.terminal_store_distribution')}
            # Compare schedules within every fixed option set, not just final output.
            key=(config,enabled);reference.setdefault(key,preserved);assert reference[key]==preserved
            if (config,not enabled) in reference:assert reference[config,not enabled]==preserved,(config,preserved,reference)
            if args.dump_dir:
                args.dump_dir.mkdir(parents=True,exist_ok=True)
                for ext,data in [('sycl',code),('memir',memir)]:
                    (args.dump_dir/f'{config}-enabled{enabled}.{ext}').write_text(data)
            checks=0;samples=[]
            if not args.compile_only:
                for block in (1,3,48,(3,5),64):
                    out.c_array[:]=[-999.]*len(expected)
                    run_standalone(grid,1,1,c.name,code,bound,signature=c.src.signature,metadata=c.metadata,block_size=block)
                    check(list(out.c_array),expected);checks+=len(expected)
                if args.repeats:
                    samples=profile_standalone(grid,1,1,c.name,code,bound,signature=c.src.signature,
                        metadata=c.metadata,block_size=64,warmup=10,repeats=args.repeats)
                    check(list(out.c_array),expected);checks+=len(expected)
            storage=re.search(r'local storage: (\d+) -> (\d+) bytes',code)
            row=dict(shape=args.shape,layout=args.layout,dtype=args.dtype,config=config,enabled=enabled,
                round=round_,status='PASS',compile_only=args.compile_only,copies=copies,markers=preserved,
                source_sha256=hashlib.sha256(code.encode()).hexdigest(),source_bytes=len(code),
                local_bytes=int(storage[2]) if storage else None,elements_checked=checks,
                output_elements=len(expected),samples_ns=samples,median_ns=statistics.median(samples) if samples else None)
            rows.append(row);print(json.dumps(row),flush=True);args.output.write_text(json.dumps(rows,indent=2)+'\n')


if __name__=='__main__':main()
