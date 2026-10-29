"""Execute constant dot initializers before/after forwarding with bit checks."""
import argparse
import hashlib
import json
import math
import pathlib
import struct

import triton
import triton.language as tl
from register_accumulator import Tensor
from triton.backends.sycl.sycl_utils import run_standalone


@triton.jit
def initialized_dot(a, b, z, INIT: tl.constexpr, M: tl.constexpr,
                    N: tl.constexpr, K: tl.constexpr):
    r = tl.arange(0, M)
    c = tl.arange(0, N)
    h = tl.arange(0, K)
    p = tl.program_id(0)
    x = tl.load(a + p*M*K + r[:, None]*K + h[None, :])
    y = tl.load(b + p*K*N + h[:, None]*N + c[None, :])
    acc = tl.full((M, N), INIT, tl.float32)
    value = tl.dot(x, y, acc)
    tl.store(z + p*M*N + r[:, None]*N + c[None, :], value)


def bits(value):
    return struct.pack('<f', value).hex()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--output', required=True)
    parser.add_argument('--dtype', choices=['f32', 'f16'], default='f32')
    parser.add_argument('--initials', nargs='+', default=['zero', 'negative_zero',
        'finite', 'positive_inf', 'negative_inf', 'nan', 'subnormal', 'negative_subnormal'])
    parser.add_argument('--compile-only', action='store_true')
    args = parser.parse_args()
    fixtures = dict(zero=0., negative_zero=-0., finite=2.5, positive_inf=math.inf,
        negative_inf=-math.inf, nan=math.nan, subnormal=2**-149,
        negative_subnormal=-(2**-149))
    half = args.dtype == 'f16'
    M, N, K, grid = 8, 16, 32, 3
    # One exact nonzero sum, one all-negative-zero product sequence and one
    # all-positive-zero sequence exercise initial sign retention and cancellation.
    av = [(0.25 if batch == 0 else -0. if batch == 1 else 0.)
          for batch in range(grid) for _ in range(M*K)]
    bv = [(0.5 if batch == 0 else 1.)
          for batch in range(grid) for _ in range(K*N)]
    a, b = Tensor(av, half), Tensor(bv, half)
    z = Tensor([-999.] * (grid*M*N + 7))
    results = []
    for label in args.initials:
        initial = fixtures[label]
        reference = None
        for enabled in (False, True):
            compiled = initialized_dot.warmup(a, b, z, initial, M, N, K,
                grid=(grid,), register_accumulator=True,
                matmul_register_tiling=half, reduction_unroll=4,
                accumulator_init_forwarding=enabled)
            code = compiled.asm['sycl']
            code = code.decode() if isinstance(code, bytes) else code
            memir = str(compiled.asm['memir'])
            assert ('sycl.accumulator_init_forwarded' in memir) == enabled, memir
            assert ('sycl.register_tile =' in memir) == half, memir
            assert 'sycl.ordered_reduction_unroll' in memir, memir
            checks = 0
            if not args.compile_only:
                for block in (48, (3, 5)):
                    z.c_array[:] = [-999.] * len(z.c_array)
                    run_standalone(grid, 1, 1, compiled.name, code,
                        [a, b, z, initial, M, N, K], signature=compiled.src.signature,
                        metadata=compiled.metadata, block_size=block)
                    actual = list(z.c_array)
                    if reference is None:
                        reference = actual
                    for index, (got, want) in enumerate(zip(actual, reference)):
                        assert (math.isnan(got) if math.isnan(want) else bits(got) == bits(want)), (
                            label, enabled, block, index, got, want)
                    assert actual[-7:] == [-999.] * 7
                    for batch, term in enumerate((0.125, -0., 0.)):
                        expected = initial
                        for _ in range(K):
                            expected = struct.unpack('<f', struct.pack('<f', expected + term))[0]
                        for got in actual[batch*M*N:(batch+1)*M*N]:
                            assert (math.isnan(got) if math.isnan(expected) else bits(got) == bits(expected)), (
                                label, batch, got, expected)
                    checks += len(actual)
            row = dict(initial=label, initial_bits=bits(initial), dtype=args.dtype,
                tiled=half, factor=4, enabled=enabled, status='PASS',
                elements_checked=checks, source_sha256=hashlib.sha256(code.encode()).hexdigest())
            results.append(row)
            print(json.dumps(row), flush=True)
            pathlib.Path(args.output).write_text(json.dumps(results, indent=2) + '\n')


if __name__ == '__main__':
    main()
