"""Cooperative staging boundaries, true indirect addresses, and active pass pairs.

Each invocation tests one case and writes results incrementally. Special-value
copies use exact float32 bits (NaN class); reductions use exact binary fractions.
"""
import argparse
import ctypes
import hashlib
import itertools
import json
import pathlib
import re
import statistics

import triton
import triton.language as tl
from cooperative_staging_semantics import check
from register_accumulator import Tensor
from triton.backends.sycl.sycl_utils import run_standalone, profile_standalone


@triton.jit(do_not_specialize=['n', 'stride', 'origin', 'iterations'])
def boundary(x, indices, y, n, stride, origin, iterations,
             B: tl.constexpr, KIND: tl.constexpr, GX: tl.constexpr, GY: tl.constexpr):
    program = tl.program_id(0) + GX * (tl.program_id(1) + GY * tl.program_id(2))
    lane = program * B + tl.arange(0, B)
    valid = lane < n
    if KIND == 'indirect':
        index = tl.load(indices + lane, valid, 0)
        address = tl.where(valid, index, 1073741824)
    else:
        address = tl.where(valid, origin + lane * stride, 1073741824)
    if KIND == 'volatile':
        value = tl.load(x + address, valid, -7., volatile=True)
    elif KIND == 'loop':
        value = tl.full((B,), 0., tl.float32)
        for step in range(iterations):
            value += tl.load(x + address, valid, 0.)
    else:
        value = tl.load(x + address, valid, -7.)
    value = value * 2. + 3.
    if KIND == 'sum':
        total = tl.sum(value, 0)
        tl.store(y + program, total)
    else:
        tl.store(y + lane, value, valid)


@triton.jit(do_not_specialize=['n'])
def rank3(x, y, n):
    p = tl.program_id(0)
    a = tl.arange(0, 2)[:, None, None]
    b = tl.arange(0, 8)[None, :, None]
    c = tl.arange(0, 32)[None, None, :]
    lane = p * 512 + a * 256 + b * 32 + c
    value = tl.load(x + lane, (lane < n) & (lane % 5 != 1), -7.)
    tl.store(y + lane, value * 2. + 3., lane < n)


CASES = ('tail', 'empty', 'negative', 'indirect', 'rank3', 'volatile',
         'loop', 'small', 'undistributed', 'sum', 'vector')


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--case', choices=CASES, required=True)
    p.add_argument('--output', required=True)
    p.add_argument('--rounds', type=int, default=1)
    p.add_argument('--repeats', type=int, default=0)
    p.add_argument('--compile-only', action='store_true')
    p.add_argument('--dump-dir')
    args = p.parse_args()
    assert args.rounds > 0 and args.repeats >= 0
    kind = args.case
    block = 128 if kind == 'small' else 512 if kind == 'rank3' else 256
    grid = (2, 2, 2) if kind in ('tail', 'negative', 'indirect') else (3, 1, 1)
    groups = grid[0] * grid[1] * grid[2]
    n = 0 if kind == 'empty' else groups * block - 3
    values = [(i % 31 - 15) / 4 for i in range(max(1, n) + 7)]
    stride = -1 if kind == 'negative' else 1
    origin = n - 1 if stride < 0 else 0
    iterations = 3
    permutation = [(i * 17 + 7) % max(1, n) for i in range(n)]
    class Indices:
        dtype = tl.int32
        def __init__(self):
            self.c_array = (ctypes.c_int32 * max(1, n))(*(permutation or [0]))
        def data_ptr(self):
            return ctypes.addressof(self.c_array)
    x, idx = Tensor(values), Indices()
    expected = [-999.] * ((groups if kind == 'sum' else n) + 7)
    materialized = []
    for lane in range(groups * block):
        if lane >= n:
            v = -7.
        elif kind == 'rank3' and lane % 5 == 1:
            v = -7.
        else:
            address = permutation[lane] if kind == 'indirect' else origin + lane * stride
            v = values[address] * (iterations if kind == 'loop' else 1)
        materialized.append(v * 2. + 3.)
        if lane < n and kind != 'sum':
            expected[lane] = materialized[-1]
    if kind == 'sum':
        for group in range(groups):
            expected[group] = sum(materialized[group*block:(group+1)*block])
    y = Tensor([-999.] * len(expected))
    kernel = rank3 if kind == 'rank3' else boundary
    warm = [x, y, n] if kind == 'rank3' else [x, idx, y, n, stride, origin, iterations]
    kw = {} if kind == 'rank3' else dict(B=block, KIND=kind, GX=grid[0], GY=grid[1])
    bound = warm if kind == 'rank3' else warm + [block, kind, grid[0], grid[1]]
    # Fusion and lifetime reuse each toggle independently; group is truly active
    # on sum, vectorization on vector. Other cases check their fallbacks.
    configs = list(itertools.product((False, True), repeat=3))
    rows = []
    for round_ in range(args.rounds):
        for stage, fuse, reuse in (configs if round_ % 2 == 0 else reversed(configs)):
            try:
                compiled = kernel.warmup(*warm, grid=grid, **kw,
                    cooperative_load_staging=stage, fuse_elementwise=fuse,
                    reuse_local_memory=reuse, distribute_work=kind != 'undistributed',
                    group_reduction=kind == 'sum', vectorize_memory=kind == 'vector')
            except RuntimeError as error:
                if kind != 'loop' or not fuse or 'PassManager::run failed' not in str(error):
                    raise
                # Existing fusion/bufferization failure occurs before staging.
                # Keep it explicit; it is not a successful runtime configuration.
                row = dict(case=kind, status='EXPECTED_COMPILE_FAILURE', stage=stage,
                    fuse=fuse, reuse=reuse, round=round_, error=str(error),
                    elements_checked=0, samples_ns=[])
                rows.append(row)
                pathlib.Path(args.output).write_text(json.dumps(rows, indent=2)+chr(10))
                print(json.dumps(row), flush=True)
                continue
            memir = str(compiled.asm['memir'])
            lair = str(compiled.asm['lair'])
            code = compiled.asm['sycl']
            code = code.decode() if isinstance(code, bytes) else code
            stages = memir.count('sycl.cooperative_load_staging')
            if kind in ('small', 'volatile', 'loop', 'undistributed'):
                assert stages == 0, (kind, stages, memir)
            else:
                assert stages == int(stage), (kind, stage, stages, memir)
            collectives = code.count('sycl::reduce_over_group')
            assert bool(collectives) == (kind == 'sum'), (kind, code)
            if args.dump_dir:
                d = pathlib.Path(args.dump_dir); d.mkdir(parents=True, exist_ok=True)
                for ext, data in [('memir', memir), ('lair', lair), ('sycl', code)]:
                    (d / f'{kind}-s{stage}-f{fuse}-r{reuse}.{ext}').write_text(data)
            checks = 0
            if not args.compile_only:
                for local in (3, 48, (3, 5)):
                    y.c_array[:] = [-999.] * len(expected)
                    run_standalone(*grid, compiled.name, code, bound,
                        signature=compiled.src.signature, metadata=compiled.metadata,
                        block_size=local)
                    check(list(y.c_array), expected)
                    checks += len(expected)
            samples = []
            if args.repeats and not args.compile_only:
                samples = profile_standalone(*grid, compiled.name, code, bound,
                    signature=compiled.src.signature, metadata=compiled.metadata,
                    block_size=64, warmup=10, repeats=args.repeats)
                if isinstance(samples, int):
                    samples = [samples]
            local_bytes = re.search(r'local storage: (\d+) -> (\d+) bytes', code)
            row = dict(case=kind, status='PASS', stage=stage, fuse=fuse, reuse=reuse,
                round=round_, grid=grid, block=block, n=n, stride=stride,
                stages=stages, collectives=collectives,
                linalg_generics=lair.count('linalg.generic'),
                local_bytes=int(local_bytes[2]) if local_bytes else None,
                elements_checked=checks, source_sha256=hashlib.sha256(code.encode()).hexdigest(),
                samples_ns=samples, median_ns=statistics.median(samples) if samples else None)
            rows.append(row)
            pathlib.Path(args.output).write_text(json.dumps(rows, indent=2)+chr(10))
            print(json.dumps(row), flush=True)


if __name__ == '__main__':
    main()
