"""Broader LICM probes: scalar loops, row reductions, and bitwise IEEE checks."""
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
from triton.backends.sycl.sycl_utils import profile_standalone, run_standalone


class Tensor:
    def __init__(self, values):
        self.dtype = tl.float32
        self.c_array = (ctypes.c_float * len(values))(*values)

    def data_ptr(self):
        return ctypes.addressof(self.c_array)


@triton.jit(do_not_specialize=['limit', 'stride'])
def serial(x, y, limit, stride, N: tl.constexpr, MODE: tl.constexpr):
    p = tl.program_id(0)
    if MODE == 'dynamic':
        stop = limit
    else:
        stop = N
    for col in range(stop):
        origin = p * stride + p * 3 + p * 5
        if MODE == 'nested':
            for step in range(4):
                value = tl.load(x + origin + step)
                tl.store(y + p * N * 4 + col * 4 + step, value)
        elif MODE == 'varying':
            value = tl.load(x + origin + col)
            tl.store(y + p * N + col, value)
        else:
            value = tl.load(x + origin)
            tl.store(y + p * N + col, value)


@triton.jit(do_not_specialize=['n'])
def reduction(x, y, n, R: tl.constexpr, C: tl.constexpr):
    p = tl.program_id(0)
    r = tl.arange(0, R)
    c = tl.arange(0, C)
    a = tl.load(x + p * R * C + r[:, None] * C + c[None, :], c[None, :] < n, 0.)
    tl.store(y + p * R + r, tl.sum(a, 1))


def check(actual, expected):
    assert len(actual) == len(expected)
    for i, (a, b) in enumerate(zip(actual, expected)):
        if math.isnan(b):
            assert math.isnan(a), (i, a, b)
        else:
            assert struct.pack('<f', a) == struct.pack('<f', b), (i, a, b)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--output', required=True)
    parser.add_argument('--cases', nargs='+', choices=['copy','varying','nested','dynamic','one','reduction'],
                        default=['copy','varying','nested','dynamic','one','reduction'])
    parser.add_argument('--special', action='store_true')
    parser.add_argument('--repeats', type=int, default=0)
    parser.add_argument('--rounds', type=int, default=1)
    parser.add_argument('--compile-only', action='store_true')
    parser.add_argument('--dump-dir')
    args = parser.parse_args()
    rows = []
    for kind in args.cases:
        grid, N, stride = 3, (1 if kind == 'one' else 32), 47
        active = 21 if kind == 'dynamic' else N
        values = [((i*37) % 97 - 48) / 8 for i in range(grid*55 + N + 4)]
        if args.special and kind != 'reduction':
            fixtures = [math.nan, math.inf, -math.inf, -0., 0., 2**-149, -2**-149,
                        2**-126, -2**-126, struct.unpack('<f',bytes.fromhex('ffff7f7f'))[0]]
            for p in range(grid):
                for i in range(N + 4):
                    values[p*55+i] = fixtures[(p+i) % len(fixtures)]
        expected = [-999.] * (grid*N*(4 if kind == 'nested' else 1) + 7)
        if kind == 'reduction':
            R,C,active = 8,64,61
            values = [((i*37)%97-48)/8 for i in range(grid*R*C)]
            expected = [sum(values[(p*R+r)*C:(p*R+r)*C+active])
                        for p in range(grid) for r in range(R)] + [-999.]*7
            kernel = reduction
            bound_tail = [active,R,C]
            kwargs = dict(n=active,R=R,C=C)
        else:
            for p in range(grid):
                for col in range(active):
                    if kind == 'nested':
                        for step in range(4):
                            expected[p*N*4+col*4+step] = values[p*55+step]
                    else:
                        expected[p*N+col] = values[p*55+(col if kind=='varying' else 0)]
            kernel = serial
            bound_tail = [active,stride,N,kind]
            kwargs = dict(limit=active,stride=stride,N=N,MODE=kind)
        x,y = Tensor(values), Tensor(expected)
        schedules = list(itertools.product((False,True),(False,True),(1,4))) if kind=='reduction' else [(False,False,1),(True,False,1)]
        for round_ in range(args.rounds):
            for hoist,acc,unroll in (schedules if round_%2==0 else reversed(schedules)):
                compiled = kernel.warmup(x,y,grid=(grid,),
                    loop_invariant_compute_hoisting=hoist, register_accumulator=acc,
                    reduction_unroll=unroll,**kwargs)
                code=compiled.asm['sycl']
                code=code.decode() if isinstance(code,bytes) else code
                memir=str(compiled.asm['memir'])
                if args.dump_dir:
                    d=pathlib.Path(args.dump_dir);d.mkdir(parents=True,exist_ok=True)
                    (d/f'{kind}-{hoist}-{acc}-{unroll}.memir').write_text(memir)
                elements=0
                if not args.compile_only:
                    for block in (3,48,(3,5)):
                        y.c_array[:] = [-999.]*len(y.c_array)
                        run_standalone(grid,1,1,compiled.name,code,[x,y]+bound_tail,
                            signature=compiled.src.signature,metadata=compiled.metadata,block_size=block)
                        check(list(y.c_array),expected)
                        elements += len(expected)
                samples=[]
                if args.repeats and not args.compile_only:
                    samples=profile_standalone(grid,1,1,compiled.name,code,[x,y]+bound_tail,
                        signature=compiled.src.signature,metadata=compiled.metadata,block_size=64,
                        repeats=args.repeats,warmup=10)
                    if isinstance(samples,int): samples=[samples]
                row=dict(case=kind,special=args.special,hoist=hoist,accumulator=acc,unroll=unroll,
                    round=round_,status='PASS',elements_checked=elements,
                    hoisted=memir.count('sycl.loop_invariant_hoisted'),
                    promoted=memir.count('sycl.register_accumulator'),
                    expanded=memir.count('sycl.ordered_reduction_unroll'),
                    source_sha256=hashlib.sha256(code.encode()).hexdigest(),source_bytes=len(code),
                    samples_ns=samples,median_ns=statistics.median(samples) if samples else None)
                rows.append(row);print(json.dumps(row),flush=True)
                pathlib.Path(args.output).write_text(json.dumps(rows,indent=2)+'\n')


if __name__ == '__main__':
    main()
