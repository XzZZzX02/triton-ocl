"""Measured full-stack ablations; source identity distinguishes no-ops from wins."""
import argparse
import hashlib
import itertools
import json
import pathlib
import re
import statistics
import time

from cooperative_staging_semantics import prepare, check
from triton.backends.sycl.sycl_utils import run_standalone, profile_standalone


ALL = dict(distribute_work=True, register_accumulator=True,
           matmul_register_tiling=True, reduction_unroll=4,
           accumulator_init_forwarding=True, cooperative_load_staging=True,
           terminal_store_distribution=True, reuse_local_memory=True,
           fuse_elementwise=True, group_reduction=True, vectorize_memory=False)
DISABLE = dict(accumulator=('register_accumulator', False),
               tiling=('matmul_register_tiling', False),
               unroll=('reduction_unroll', 1),
               initializer=('accumulator_init_forwarding', False),
               staging=('cooperative_load_staging', False),
               store=('terminal_store_distribution', False),
               reuse=('reuse_local_memory', False),
               fusion=('fuse_elementwise', False),
               group=('group_reduction', False),
               distribution=('distribute_work', False))
CONFIGS = ('baseline', 'all') + tuple('without_' + name for name in DISABLE)


def expected_markers(args, options, memir):
    M, N, K = args.shape
    distributed = options['distribute_work']
    tiled = (distributed and options['matmul_register_tiling'] and args.dtype == 'f16'
             and M >= 8 and N >= 16 and K >= 16 and N % 4 == 0 and M * (N // 4) >= 64)
    accumulator = options['register_accumulator']
    # Standalone tiling creates a private accumulator even without promotion.
    private = accumulator or tiled
    unrolled = (options['reduction_unroll'] > 1 and private and K % options['reduction_unroll'] == 0
                and K // options['reduction_unroll'] >= 2 and (not tiled or K >= 32))
    checks = {'sycl.register_tile =': int(tiled),
              'sycl.ordered_reduction_unroll': int(unrolled),
              'sycl.cooperative_load_staging': sum(x >= 256 for x in (M*K, K*N))
                if distributed and options['cooperative_load_staging'] else 0,
              'sycl.terminal_store_distribution': int(distributed and options['terminal_store_distribution'] and M*N >= 256)}
    for marker, expected in checks.items():
        assert memir.count(marker) == expected, (marker, expected, options, memir)
    assert ('sycl.register_accumulator' in memir) == private, (options, memir)
    # Without distribution, promotion may still occur, but init forwarding
    # needs a complete distributed output ownership plan.
    assert ('sycl.accumulator_init_forwarded' in memir) == bool(
        distributed and options['accumulator_init_forwarding'] and private and M*N >= 128), (options, memir)


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--output', required=True)
    p.add_argument('--shape', type=int, nargs=3, required=True)
    p.add_argument('--layout', choices=('NN','NT','TN','TT'), required=True)
    p.add_argument('--dtype', choices=('f32','f16'), required=True)
    p.add_argument('--rounds', type=int, default=1)
    p.add_argument('--repeats', type=int, default=0)
    p.add_argument('--configs', nargs='+', choices=CONFIGS, default=list(CONFIGS))
    p.add_argument('--compile-only', action='store_true')
    p.add_argument('--check-blocks', choices=('all','48'), default='all')
    p.add_argument('--dump-dir')
    args = p.parse_args()
    assert args.rounds > 0 and args.repeats >= 0 and len(args.configs) == len(set(args.configs))
    args.kind = 'dot'
    kernel, warm, kwargs, bound, output, expected, grid = prepare(args)
    rows = []
    for round_ in range(args.rounds):
        order = args.configs if round_ % 2 == 0 else list(reversed(args.configs))
        for config in order:
            options = dict(ALL)
            if config == 'baseline':
                options.update({name: False for name in options if name not in ('distribute_work','reuse_local_memory','reduction_unroll')})
                options['reduction_unroll'] = 1
            elif config.startswith('without_'):
                name, value = DISABLE[config.removeprefix('without_')]
                options[name] = value
            started = time.perf_counter()
            compiled = kernel.warmup(*warm, grid=(grid,), **kwargs, **options)
            warmup_seconds = time.perf_counter() - started
            code = compiled.asm['sycl']
            code = code.decode() if isinstance(code, bytes) else code
            memir = str(compiled.asm['memir'])
            expected_markers(args, options, memir)
            if args.dump_dir:
                path = pathlib.Path(args.dump_dir);path.mkdir(parents=True, exist_ok=True)
                for ext, data in (('sycl', code), ('memir', memir)):
                    (path / (config + '.' + ext)).write_text(data)
            checked = 0
            blocks = (3,48,(3,5)) if args.check_blocks == 'all' else (48,)
            if not args.compile_only:
                for block in blocks:
                    output.c_array[:] = [-999.] * len(expected)
                    run_standalone(grid,1,1,compiled.name,code,bound,
                        signature=compiled.src.signature,metadata=compiled.metadata,block_size=block)
                    check(list(output.c_array), expected)
                    checked += len(expected)
            samples = []
            if args.repeats and not args.compile_only:
                samples = profile_standalone(grid,1,1,compiled.name,code,bound,
                    signature=compiled.src.signature,metadata=compiled.metadata,
                    block_size=64,warmup=10,repeats=args.repeats)
                if isinstance(samples, int): samples = [samples]
            storage = re.search(r'local storage: ([0-9]+) -> ([0-9]+) bytes',code)
            markers = {name: memir.count(name) for name in (
                'sycl.register_accumulator','sycl.register_tile =',
                'sycl.register_tile_composed_accumulator','sycl.ordered_reduction_unroll',
                'sycl.accumulator_init_forwarded','sycl.cooperative_load_staging',
                'sycl.terminal_store_distribution','sycl.distribution_depth')}
            row = dict(shape=args.shape,layout=args.layout,dtype=args.dtype,config=config,
                options=options,round=round_,status='PASS',elements_checked=checked,
                check_blocks=list(blocks),markers=markers,source_bytes=len(code),
                source_sha256=hashlib.sha256(code.encode()).hexdigest(),
                local_bytes_before=int(storage[1]) if storage else None,
                local_bytes=int(storage[2]) if storage else None,
                warmup_seconds=warmup_seconds,samples_ns=samples,
                median_ns=statistics.median(samples) if samples else None)
            rows.append(row);print(json.dumps(row),flush=True)
            pathlib.Path(args.output).write_text(json.dumps(rows,indent=2)+chr(10))


if __name__ == '__main__': main()
