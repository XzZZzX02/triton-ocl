"""Paired candidate padding study; preserve raw events and actual pass markers."""
import argparse
import hashlib
import itertools
import json
import os
import pathlib
import re
import statistics
from types import SimpleNamespace

from cooperative_staging_semantics import prepare, check
from full_stack_ablation import ALL
from triton.backends.sycl.sycl_utils import profile_standalone, run_standalone


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--shape', nargs=3, type=int, required=True)
    p.add_argument('--layout', choices=('NN','NT','TN','TT'), required=True)
    p.add_argument('--dtype', choices=('f16','f32'), default='f16')
    p.add_argument('--plans', nargs='+', choices=('raw','promoted','tiled','full','no_unroll',
                   'no_staging','no_reuse','no_init','no_fusion','two_column'), default=['full'])
    p.add_argument('--blocks', nargs='+', default=['64','128'])
    p.add_argument('--rounds', type=int, default=3)
    p.add_argument('--repeats', type=int, default=31)
    p.add_argument('--compile-only', action='store_true')
    p.add_argument('--cpu-check', action='store_true')
    p.add_argument('--capture-codegen', action='store_true')
    p.add_argument('--output', type=pathlib.Path, required=True)
    p.add_argument('--dump-dir', type=pathlib.Path, required=True)
    args = p.parse_args()
    assert args.rounds > 0 and args.repeats >= 0
    args.dump_dir.mkdir(parents=True, exist_ok=True)
    kernel,warm,kw,bound,out,expected,grid = prepare(SimpleNamespace(
        kind='dot',shape=args.shape,layout=args.layout,dtype=args.dtype))
    rows = []
    observed = {}
    for r in range(args.rounds):
        order = list(itertools.product(args.plans, args.blocks, (False, True)))
        for plan, block, enabled in (order if r % 2 == 0 else reversed(order)):
            options = dict(ALL)
            if plan in ('raw','promoted','tiled'):
                options = dict(distribute_work=True, reuse_local_memory=True,
                    register_accumulator=plan != 'raw', matmul_register_tiling=plan == 'tiled')
            elif plan == 'two_column':
                options['matmul_register_tiling_2col'] = True
            elif plan.startswith('no_'):
                key = {'unroll':'reduction_unroll','staging':'cooperative_load_staging',
                       'reuse':'reuse_local_memory','init':'accumulator_init_forwarding',
                       'fusion':'fuse_elementwise'}[plan[3:]]
                options[key] = 1 if key == 'reduction_unroll' else False
            compiled = kernel.warmup(*warm, grid=(grid,), **kw, **options, lds_bank_padding=enabled)
            code = compiled.asm['sycl']
            code = code.decode() if isinstance(code,bytes) else code
            memir = str(compiled.asm['memir'])
            digest = hashlib.sha256(code.encode()).hexdigest()
            markers = {name:memir.count(name) for name in (
                'sycl.lds_bank_padding','sycl.register_accumulator','sycl.register_tile =',
                'sycl.register_tile_composed_accumulator','sycl.ordered_reduction_unroll',
                'sycl.accumulator_init_forwarded','sycl.cooperative_load_staging',
                'sycl.terminal_store_distribution','sycl.two_column_launch_guard')}
            assert enabled or markers['sycl.lds_bank_padding'] == 0
            key = plan, enabled
            if key in observed:
                assert observed[key] == (digest, markers)
            observed[key] = digest, markers
            if (plan, not enabled) in observed:
                previous = observed[plan, not enabled]
                assert all(previous[1][name] == value for name,value in markers.items()
                           if name != 'sycl.lds_bank_padding'), (plan, markers, previous)
                if not markers['sycl.lds_bank_padding']:
                    # Either this side is disabled, or the candidate was inert.
                    if enabled or not previous[1]['sycl.lds_bank_padding']:
                        assert digest == previous[0], (plan, 'inert source changed')
            for ext, data in (('sycl',code),('memir',memir)):
                (args.dump_dir/f'{plan}-enabled{enabled}.{ext}').write_text(data)
            local = tuple(map(int,block.split('x'))) if 'x' in block else int(block)
            samples = []
            checked = 0
            if not args.compile_only:
                out.c_array[:] = [-999.] * len(expected)
                if args.cpu_check or not args.repeats:
                    run_standalone(grid,1,1,compiled.name,code,bound,
                        signature=compiled.src.signature,metadata=compiled.metadata,block_size=local)
                else:
                    before_dump = os.environ.get('ACPP_S2_DUMP_IR_FINAL')
                    try:
                        if r == 0 and args.capture_codegen:
                            os.environ['ACPP_S2_DUMP_IR_FINAL'] = str(
                                args.dump_dir/f'{plan}-{block}-enabled{enabled}.ll')
                        else:
                            os.environ.pop('ACPP_S2_DUMP_IR_FINAL',None)
                        samples = profile_standalone(grid,1,1,compiled.name,code,bound,
                            signature=compiled.src.signature,metadata=compiled.metadata,
                            block_size=local,warmup=10,repeats=args.repeats)
                    finally:
                        if before_dump is None:os.environ.pop('ACPP_S2_DUMP_IR_FINAL',None)
                        else:os.environ['ACPP_S2_DUMP_IR_FINAL'] = before_dump
                check(list(out.c_array),expected)
                checked = len(expected)
            storage = re.search(r'local storage: (\d+) -> (\d+) bytes',code)
            row = dict(status='PASS',shape=args.shape,layout=args.layout,dtype=args.dtype,
                plan=plan,block=block,enabled=enabled,round=r,options=options,
                compile_only=args.compile_only,markers=markers,source_sha256=digest,
                source_bytes=len(code),local_bytes=int(storage[2]) if storage else None,
                elements_checked=checked,samples_ns=samples,
                median_ns=statistics.median(samples) if samples else None)
            rows.append(row)
            args.output.write_text(json.dumps(rows,indent=2)+'\n')
            print(json.dumps(row),flush=True)


if __name__ == '__main__':
    main()
