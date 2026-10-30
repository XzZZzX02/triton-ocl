"""Paired terminal store distribution with established memory/dot references."""
import argparse
import hashlib
import itertools
import json
import pathlib
import re
import statistics

from cooperative_staging_semantics import prepare,check
from triton.backends.sycl.sycl_utils import run_standalone,profile_standalone


def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--output',required=True)
    p.add_argument('--kind',choices=('copy','holes','or','negative','gather','broadcast','empty','dot'),default='copy')
    p.add_argument('--block',type=int,default=256)
    p.add_argument('--n',type=int,default=1021)
    p.add_argument('--stride',type=int,default=1)
    p.add_argument('--shape',nargs=3,type=int,default=[16,32,32])
    p.add_argument('--layout',choices=('NN','NT','TN','TT'),default='NN')
    p.add_argument('--dtype',choices=('f32','f16'),default='f32')
    p.add_argument('--special',action='store_true')
    p.add_argument('--rounds',type=int,default=1)
    p.add_argument('--repeats',type=int,default=0)
    p.add_argument('--compile-only',action='store_true')
    p.add_argument('--undistributed',action='store_true')
    p.add_argument('--dump-dir')
    args=p.parse_args()
    kernel,warm,kw,bound,output,expected,grid=prepare(args)
    configs=list(itertools.product((False,True),repeat=3))
    rows=[]
    for round_ in range(args.rounds):
        for enabled,staging,stack in (configs if round_%2==0 else reversed(configs)):
            c=kernel.warmup(*warm,grid=(grid,),**kw,
                terminal_store_distribution=enabled,cooperative_load_staging=staging,
                distribute_work=not args.undistributed,register_accumulator=stack,
                matmul_register_tiling=stack,reduction_unroll=4 if stack else 1,
                accumulator_init_forwarding=stack,fuse_elementwise=stack,
                group_reduction=stack,reuse_local_memory=True)
            code=c.asm['sycl'];code=code.decode() if isinstance(code,bytes) else code
            memir=str(c.asm['memir'])
            stores=memir.count('sycl.terminal_store_distribution')
            eligible=(args.shape[0]*args.shape[1] if args.kind=='dot' else args.block)>=256
            assert stores==int(enabled and eligible and not args.undistributed),(args.kind,enabled,stores,memir)
            if args.dump_dir:
                d=pathlib.Path(args.dump_dir);d.mkdir(exist_ok=True,parents=True)
                for ext,data in (('memir',memir),('sycl',code)):
                    (d/f'{args.kind}-e{enabled}-s{staging}-o{stack}.{ext}').write_text(data)
            checks=0
            if not args.compile_only:
                for block in (3,48,(3,5)):
                    output.c_array[:]=[-999.]*len(expected)
                    run_standalone(grid,1,1,c.name,code,bound,
                        signature=c.src.signature,metadata=c.metadata,block_size=block)
                    check(list(output.c_array),expected);checks+=len(expected)
            samples=[]
            if args.repeats and not args.compile_only:
                samples=profile_standalone(grid,1,1,c.name,code,bound,
                    signature=c.src.signature,metadata=c.metadata,block_size=64,warmup=10,repeats=args.repeats)
                if isinstance(samples,int):samples=[samples]
            storage=re.search(r'local storage: ([0-9]+) -> ([0-9]+) bytes',code)
            row=dict(kind=args.kind,shape=args.shape,layout=args.layout,dtype=args.dtype,
                block=args.block,n=args.n,stride=args.stride,special=args.special,
                grid=grid,round=round_,enabled=enabled,staging=staging,stack=stack,
                distributed=not args.undistributed,status='PASS',stores=stores,
                stages=memir.count('sycl.cooperative_load_staging'),
                markers={name:memir.count(name) for name in ('sycl.register_accumulator','sycl.register_tile =',
                    'sycl.ordered_reduction_unroll','sycl.accumulator_init_forwarded')},
                elements_checked=checks,source_sha256=hashlib.sha256(code.encode()).hexdigest(),
                local_bytes=int(storage[2]) if storage else None,samples_ns=samples,
                median_ns=statistics.median(samples) if samples else None)
            rows.append(row);print(json.dumps(row),flush=True)
            pathlib.Path(args.output).write_text(json.dumps(rows,indent=2)+chr(10))


if __name__=='__main__':main()
