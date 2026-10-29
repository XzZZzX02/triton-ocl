"""Paired generic row reductions, IEEE inputs, and optimization interactions."""
import argparse
import ctypes
import hashlib
import itertools
import json
import math
import pathlib
import statistics
import struct

import triton
import triton.language as tl
from triton.backends.sycl.sycl_utils import run_standalone, profile_standalone


class Tensor:
    def __init__(self, values, integer=False):
        self.dtype = tl.int32 if integer else tl.float32
        ctype = ctypes.c_int32 if integer else ctypes.c_float
        self.c_array = (ctype * len(values))(*values)

    def data_ptr(self):
        return ctypes.addressof(self.c_array)


@triton.jit
def row_reduce(x, y, m, n, R: tl.constexpr, C: tl.constexpr, OP: tl.constexpr):
    r = tl.arange(0, R)
    c = tl.arange(0, C)
    p = tl.program_id(0)
    if OP == 'max':
        other = -float('inf')
    elif OP == 'min':
        other = float('inf')
    elif OP == 'and':
        other = -1
    else:
        other = 0
    v = tl.load(x + p * R * C + r[:, None] * C + c[None, :],
                (r[:, None] < m) & (c[None, :] < n), other)
    if OP == 'sum':
        value = tl.sum(v, 1)
    elif OP == 'max':
        value = tl.max(v, 1)
    elif OP == 'min':
        value = tl.min(v, 1)
    elif OP == 'and':
        value = tl.reduce(v, 1, _and)
    elif OP == 'or':
        value = tl.reduce(v, 1, _or)
    else:
        value = tl.xor_sum(v, 1)
    tl.store(y + p * R + r, value, r < m)


@triton.jit
def _and(a, b):
    return a & b


@triton.jit
def _or(a, b):
    return a | b


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--output', required=True)
    p.add_argument('--op', choices=('sum', 'max', 'min', 'and', 'or', 'xor'))
    p.add_argument('--special', action='store_true')
    p.add_argument('--repeats', type=int, default=0)
    p.add_argument('--rounds', type=int, default=1)
    p.add_argument('--interactions', action='store_true')
    p.add_argument('--factors', nargs='+', type=int, choices=(1, 2, 4, 8), default=[1, 4])
    args = p.parse_args()
    results = []
    R, C, m, n, batches = 16, 64, 15, 61, 3
    ops = (args.op,) if args.op else ('sum', 'max', 'min', 'and', 'or', 'xor')
    for op in ops:
        integer = op in ('and', 'or', 'xor')
        values = [(i * 37) % 251 - 125 if integer else ((i * 37) % 251 - 125) / 8
                  for i in range(batches * R * C)]
        if args.special and not integer:
            # Keep every fixture inside the active rows. The previous m=7
            # silently omitted normal/subnormal boundaries and large values.
            largest = struct.unpack('<f', bytes.fromhex('ffff7f7f'))[0]
            special = [math.nan, math.inf, -math.inf, -0., 0., 2 ** -149, -2 ** -149,
                       2 ** -126, -2 ** -126, largest, -largest]
            fixtures = [[value] * n for value in special]
            fixtures += [[math.nan, 2.] + [math.nan] * (n - 2),
                         [math.inf, -math.inf] + [0.] * (n - 2),
                         [2 ** 24, 1., -(2 ** 24)] + [0.] * (n - 3),
                         [-0., 0.] * (n // 2) + [-0.]]
            assert len(fixtures) == m and all(len(row) == n for row in fixtures)
            for batch in range(batches):
                for row, data in enumerate(fixtures):
                    origin = batch * R * C + row * C
                    values[origin:origin + n] = data
        x, y = Tensor(values, integer), Tensor([-999] * (batches * R), integer)
        reference = None
        config = list(itertools.product((False, True), repeat=3)) if args.interactions else [(False, True, False)]
        for round_index in range(args.rounds):
            # Always establish a factor-one reference before other schedules.
            factors = [1] + [factor for factor in dict.fromkeys(args.factors) if factor != 1]
            schedules = [(fused, reuse, group, factor) for fused, reuse, group in config for factor in factors]
            if round_index % 2:
                schedules.reverse()
            for fused, reuse, group, factor in schedules:
                y.c_array[:] = [-999] * len(y.c_array)
                compiled = row_reduce.warmup(x, y, m, n, R, C, op, grid=(batches,),
                    register_accumulator=True, reduction_unroll=factor,
                    fuse_elementwise=fused, reuse_local_memory=reuse, group_reduction=group)
                code = compiled.asm['sycl']
                memir = str(compiled.asm['memir'])
                promoted = 'sycl.register_accumulator' in memir
                transformed = 'sycl.ordered_reduction_unroll' in memir
                assert transformed == (factor > 1 and promoted), memir
                for block in (48, (3, 5)):
                    y.c_array[:] = [-999] * len(y.c_array)
                    bound = [x, y, m, n, R, C, op]
                    run_standalone(batches, 1, 1, compiled.name, code, bound,
                        signature=compiled.src.signature, metadata=compiled.metadata, block_size=block)
                    actual = list(y.c_array)
                    if reference is None:
                        reference = actual
                    for i, (got, expected) in enumerate(zip(actual, reference)):
                        if not integer and math.isnan(expected):
                            assert math.isnan(got), (op, i, got, expected)
                        elif integer:
                            assert got == expected, (op, i, got, expected)
                        else:
                            assert struct.pack('<f', got) == struct.pack('<f', expected), (op, i, got, expected)
                    for batch in range(batches):
                        assert actual[batch * R + m] == -999
                        if not args.special or integer:
                            for row in range(m):
                                data = values[batch * R * C + row * C:batch * R * C + row * C + n]
                                if op == 'sum':
                                    want = sum(data)
                                elif op == 'max':
                                    want = max(data)
                                elif op == 'min':
                                    want = min(data)
                                else:
                                    want = -1 if op == 'and' else 0
                                    for v in data:
                                        want = want & v if op == 'and' else want | v if op == 'or' else want ^ v
                                assert actual[batch * R + row] == want, (op, row, actual, want)
                samples = profile_standalone(batches, 1, 1, compiled.name, code, bound,
                    signature=compiled.src.signature, metadata=compiled.metadata,
                    block_size=64, repeats=args.repeats, warmup=10) if args.repeats else []
                source = code.decode() if isinstance(code, bytes) else code
                result = dict(op=op, factor=factor, fused=fused, reuse=reuse, group=group,
                    special=args.special, round=round_index, status='PASS', transformed=transformed,
                    active_rows=m, active_columns=n, batches=batches, local_shapes=[48, [3, 5]],
                    elements_checked=len(actual) * 2,
                    samples_ns=samples, median_ns=statistics.median(samples) if samples else None,
                    source_sha256=hashlib.sha256(source.encode()).hexdigest(), source_bytes=len(source))
                results.append(result)
                print(json.dumps(result), flush=True)
                pathlib.Path(args.output).write_text(json.dumps(results, indent=2) + '\n')


if __name__ == '__main__':
    main()
