"""Paired device-event tiling tests across physical local-range sizes."""
import argparse
import hashlib
import itertools
import json
import os
import pathlib
import statistics
from types import SimpleNamespace

from cooperative_staging_semantics import prepare, check
from full_stack_ablation import ALL
from triton.backends.sycl.sycl_utils import profile_standalone


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--layout', choices=('NN','NT','TN','TT'), required=True)
    p.add_argument('--k', type=int, required=True)
    p.add_argument('--blocks', nargs='+', choices=('1','3','48','3x5','64','128','256','4x4x4','4x4x8'),
                   default=['64','128','256'])
    p.add_argument('--rounds', type=int, default=3)
    p.add_argument('--repeats', type=int, default=31)
    p.add_argument('--plans', nargs='+', choices=('base','full','no_accumulator','no_init','no_unroll','no_staging','no_reuse','no_fusion'), default=['base','full'])
    p.add_argument('--output', type=pathlib.Path, required=True)
    p.add_argument('--dump-dir', type=pathlib.Path)
    p.add_argument('--capture-codegen', action='store_true')
    args = p.parse_args()
    kernel,warm,kw,bound,out,expected,grid = prepare(
        SimpleNamespace(kind='dot',shape=[8,16,args.k],layout=args.layout,dtype='f16'))
    rows = []
    sources = {}
    for r in range(args.rounds):
        plans = list(itertools.product(args.plans,args.blocks,(False,True)))
        for plan,block,enabled in (plans if r%2==0 else reversed(plans)):
            options = dict(ALL)
            if plan == 'base':
                options.update({k:False for k in options if k not in (
                    'register_accumulator','matmul_register_tiling','distribute_work',
                    'reuse_local_memory','reduction_unroll')})
                options['reduction_unroll'] = 1
            elif plan.startswith('no_'):
                name={'accumulator':'register_accumulator','init':'accumulator_init_forwarding',
                      'unroll':'reduction_unroll','staging':'cooperative_load_staging',
                      'reuse':'reuse_local_memory','fusion':'fuse_elementwise'}[plan[3:]]
                options[name]=1 if name=='reduction_unroll' else False
            options['matmul_register_tiling_2col'] = enabled
            c = kernel.warmup(*warm,grid=(grid,),**kw,**options)
            code = c.asm['sycl']
            code = code.decode() if isinstance(code,bytes) else code
            digest = hashlib.sha256(code.encode()).hexdigest()
            key = plan,enabled
            if key in sources:
                assert sources[key] == digest, 'physical launch changed compiled source'
            sources[key] = digest
            assert ('sycl.register_tile = 2 : i64' in str(c.asm['memir'])) == enabled
            assert str(c.asm['memir']).count('sycl.two_column_launch_guard')==int(enabled)
            assert code.count('template <bool triton_sycl_two_column>')==int(enabled)
            assert code.count('if (blockX * blockY * blockZ == 64ULL)')==2*int(enabled)
            local = tuple(map(int,block.split('x'))) if 'x' in block else int(block)
            if args.dump_dir:
                args.dump_dir.mkdir(parents=True,exist_ok=True)
                for ext,data in [('sycl',code),('memir',str(c.asm['memir']))]:
                    (args.dump_dir/f'{plan}-enabled{enabled}.{ext}').write_text(data)
            before_dump=os.environ.get('ACPP_S2_DUMP_IR_FINAL')
            if args.capture_codegen and args.dump_dir and r==0:
                os.environ['ACPP_S2_DUMP_IR_FINAL']=str(args.dump_dir/f'{plan}-{block}-enabled{enabled}.ll')
            else:
                os.environ.pop('ACPP_S2_DUMP_IR_FINAL',None)
            out.c_array[:] = [-999.] * len(expected)
            try:
                samples = profile_standalone(grid,1,1,c.name,code,bound,
                    signature=c.src.signature,metadata=c.metadata,block_size=local,
                    warmup=10,repeats=args.repeats)
            finally:
                if before_dump is None:os.environ.pop('ACPP_S2_DUMP_IR_FINAL',None)
                else:os.environ['ACPP_S2_DUMP_IR_FINAL']=before_dump
            check(list(out.c_array),expected)
            row = dict(status='PASS',shape=[8,16,args.k],layout=args.layout,plan=plan,
                       enabled=enabled,guarded=enabled,host_multiversion=enabled,
                       round=r,block=block,options=options,
                       source_sha256=digest,source_bytes=len(code),
                       selected_path=('tiled' if enabled and (local==64 or local==(4,4,4)) else 'untiled'),
                       elements_checked=len(expected),samples_ns=samples,
                       median_ns=statistics.median(samples))
            rows.append(row)
            print(json.dumps(row),flush=True)
            args.output.write_text(json.dumps(rows,indent=2)+chr(10))


if __name__ == '__main__':
    main()
