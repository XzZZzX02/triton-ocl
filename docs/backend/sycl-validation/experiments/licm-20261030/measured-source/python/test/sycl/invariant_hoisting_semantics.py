"""Correctness and paired device timing for affine invariant compute hoisting."""
import argparse
import ctypes
import hashlib
import json
import math
import pathlib
import statistics

import triton
import triton.language as tl
from triton.backends.sycl.sycl_utils import profile_standalone, run_standalone


class Tensor:
    def __init__(self, values):
        self.dtype = tl.float32
        self.c_array = (ctypes.c_float * len(values))(*values)

    def data_ptr(self):
        return ctypes.addressof(self.c_array)


@triton.jit
def nested_row_kernel(x, y, stride, N: tl.constexpr, INNER: tl.constexpr):
    row = tl.program_id(0)
    for col in range(N):
        base0 = row * stride
        base1 = base0 + row * 3
        base2 = base1 + row * 5
        value = tl.load(x + base2)
        result = value + col * 0.25
        tl.store(y + row * N + col, result)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--output', required=True)
    parser.add_argument('--rows', type=int, default=64)
    parser.add_argument('--columns', type=int, default=512)
    parser.add_argument('--repeats', type=int, default=31)
    parser.add_argument('--rounds', type=int, default=3)
    parser.add_argument('--compile-only', action='store_true')
    parser.add_argument('--dump-dir')
    args = parser.parse_args()

    rows, columns = args.rows, args.columns
    stride = 7
    source = [((i * 17) % 101 - 50) / 8 for i in range(rows * 15 + 1)]
    x, y = Tensor(source), Tensor([-999.] * (rows * columns))
    expected = []
    for row in range(rows):
        value = source[row * 15]
        expected.extend(value + col * 0.25 for col in range(columns))

    configs = [(False, False, 1), (True, False, 1),
               (False, True, 1), (True, True, 1)]
    records = []
    for round_index in range(args.rounds):
        schedule = configs if round_index % 2 == 0 else list(reversed(configs))
        for hoist, accumulator, unroll in schedule:
            y.c_array[:] = [-999.] * len(y.c_array)
            compiled = nested_row_kernel.warmup(
                x, y, stride, columns, 8, grid=(rows,),
                loop_invariant_compute_hoisting=hoist,
                register_accumulator=accumulator,
                reduction_unroll=unroll)
            code = compiled.asm['sycl']
            code = code.decode() if isinstance(code, bytes) else code
            memir = str(compiled.asm['memir'])
            marker_count = memir.count('sycl.loop_invariant_hoisted')
            if args.dump_dir:
                directory = pathlib.Path(args.dump_dir)
                directory.mkdir(parents=True, exist_ok=True)
                prefix = f'hi{int(hoist)}-acc{int(accumulator)}'
                (directory / (prefix + '.memir')).write_text(memir)
                (directory / (prefix + '.sycl')).write_text(code)
            if args.compile_only:
                records.append(dict(hoist=hoist, accumulator=accumulator,
                    round=round_index, status='PASS', marker_count=marker_count,
                    source_sha256=hashlib.sha256(code.encode()).hexdigest(),
                    source_bytes=len(code)))
                pathlib.Path(args.output).write_text(json.dumps(records, indent=2) + '\n')
                continue
            for block in (48, (3, 5)):
                y.c_array[:] = [-999.] * len(y.c_array)
                run_standalone(rows, 1, 1, compiled.name, code,
                               [x, y, stride, columns, 8],
                               signature=compiled.src.signature,
                               metadata=compiled.metadata, block_size=block)
                for index, (got, want) in enumerate(zip(y.c_array, expected)):
                    assert math.copysign(1., got) == math.copysign(1., want) and got == want, (
                        hoist, accumulator, round_index, block, index, got, want)
            samples = profile_standalone(
                rows, 1, 1, compiled.name, code, [x, y, stride, columns, 8],
                signature=compiled.src.signature, metadata=compiled.metadata,
                block_size=64, repeats=args.repeats, warmup=10)
            record = dict(hoist=hoist, accumulator=accumulator, unroll=unroll,
                          round=round_index, status='PASS', marker_count=marker_count,
                          source_bytes=len(code), source_sha256=hashlib.sha256(
                              code.encode()).hexdigest(),
                          elements_checked=len(expected) * 2,
                          samples_ns=samples,
                          median_ns=statistics.median(samples))
            records.append(record)
            print(json.dumps(record), flush=True)
            pathlib.Path(args.output).write_text(json.dumps(records, indent=2) + '\n')


if __name__ == '__main__':
    main()
