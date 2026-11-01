"""Strict device regression for local binary16 transposes and dot schedules."""
import argparse
import hashlib
import itertools
import json
import pathlib
from types import SimpleNamespace
from cooperative_staging_semantics import prepare,check
from triton.backends.sycl.sycl_utils import run_standalone


def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--output',required=True);p.add_argument('--layout',choices=('NN','NT','TN','TT'),required=True)
    p.add_argument('--shape',nargs=3,type=int,default=[16,32,32]);p.add_argument('--compile-only',action='store_true')
    p.add_argument('--dump-dir');args=p.parse_args()
    fixture=SimpleNamespace(kind='dot',shape=args.shape,layout=args.layout,dtype='f16')
    kernel,warm,kw,bound,output,expected,grid=prepare(fixture)
    rows=[]
    for distributed,(accumulator,unroll) in itertools.product((False,True),((False,1),(True,1),(True,4))):
        c=kernel.warmup(*warm,grid=(grid,),**kw,distribute_work=distributed,
            register_accumulator=accumulator,reduction_unroll=unroll,fuse_elementwise=True,
            reuse_local_memory=True,matmul_register_tiling=True,group_reduction=True,
            cooperative_load_staging=True,terminal_store_distribution=True,accumulator_init_forwarding=True)
        source=c.asm['sycl'];source=source.decode() if isinstance(source,bytes) else source
        memir=str(c.asm['memir'])
        # Each direct transpose has exactly one guarded load and store.
        copies=0 if distributed else args.layout.count('T')
        single=args.layout.count('T') if distributed else 0
        assert memir.count('sycl.scalar_half_bits')==2*copies,(copies,memir)
        assert memir.count('sycl.single_lane_half_bits')==2*single,(single,memir)
        assert source.count('reinterpret_cast<const volatile uint16_t*>')==copies+bool(single),(copies,single,source)
        assert source.count('reinterpret_cast<volatile uint16_t*>')==copies+bool(single),(copies,single,source)
        if args.dump_dir:
            path=pathlib.Path(args.dump_dir);path.mkdir(parents=True,exist_ok=True)
            for ext,data in [('sycl',source),('memir',memir)]:
                (path/f'{args.layout}-dist{distributed}-acc{accumulator}-u{unroll}.{ext}').write_text(data)
        for block in (1,3,48,(3,5)):
            checked=0
            if not args.compile_only:
                output.c_array[:]=[-999.]*len(expected)
                run_standalone(grid,1,1,c.name,source,bound,signature=c.src.signature,metadata=c.metadata,block_size=block)
                check(list(output.c_array),expected);checked=len(expected)
            row=dict(shape=args.shape,layout=args.layout,distributed=distributed,accumulator=accumulator,unroll=unroll,
                block=block,status='PASS',compile_only=args.compile_only,elements_checked=checked,guarded_copies=copies,
                single_lane_copies=single,
                source_sha256=hashlib.sha256(source.encode()).hexdigest(),source_bytes=len(source))
            rows.append(row);print(json.dumps(row),flush=True)
            pathlib.Path(args.output).write_text(json.dumps(rows,indent=2)+'\n')


if __name__=='__main__':main()
