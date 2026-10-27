"""Nested scalar pointer iter_args, signed strides, and runtime loop bounds."""
import argparse
import ctypes
import json
import os
import tempfile
import triton
import triton.language as tl
from triton.backends.sycl.sycl_utils import run_standalone


class Tensor:
    def __init__(self, values):
        self.dtype = tl.float32
        self.c_array = (ctypes.c_float*len(values))(*values)

    def data_ptr(self):
        return ctypes.addressof(self.c_array)


@triton.jit(do_not_specialize=['loops', 'stride'])
def scalar_pointers(x, y, loops, stride, SELECT: tl.constexpr):
    pointer = x+32+tl.program_id(0)
    value = 0.
    for i in range(loops):
        for j in range(2):
            value += tl.load(pointer)
            if SELECT:
                pointer = tl.where(i%2 == 0, pointer+stride, pointer+2*stride)
            else:
                pointer += stride
    tl.store(y+tl.program_id(0), value+tl.load(pointer))


@triton.jit(do_not_specialize=['loops', 'stride'])
def mixed_pointers(x, y, loops, stride):
    lanes = tl.arange(0, 4)
    pointer = x+32+tl.program_id(0)
    pointers = pointer+lanes
    for i in range(loops):
        pointer += stride
        pointers = pointer+lanes
    tl.store(y+tl.program_id(0)*4+lanes, tl.load(pointers)+tl.load(pointer))


@triton.jit(do_not_specialize=['loops'])
def allocation_switch(x, z, y, loops):
    pointer = x
    for i in range(loops):
        pointer = tl.where(i%2 == 0, x, z)
    tl.store(y, tl.load(pointer))


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--compile-only', action='store_true')
    args = parser.parse_args()
    values = [float(i%19-9)/4 for i in range(128)]
    x, y = Tensor(values), Tensor([-99.]*3)
    rows = []
    for select in (False, True):
        # Reuse this exact compiled kernel for all runtime bounds and strides.
        c = scalar_pointers.warmup(x, y, 3, 3, SELECT=select, grid=(3,))
        for loops in (0, 3):
            for stride in (3, -2):
                if args.compile_only:
                    print(json.dumps(dict(select=select, loops=loops, stride=stride, status='COMPILED')), flush=True)
                    continue
                expected = []
                for pid in range(3):
                    position, value = 32+pid, 0.
                    for i in range(loops):
                        for j in range(2):
                            value += values[position]
                            position += stride*(2 if select and i%2 else 1)
                    expected.append(value+values[position])
                for block in (48, (8, 8)):
                    run_standalone(3, 1, 1, c.name, c.asm['sycl'], [x, y, loops, stride, select],
                                   signature=c.src.signature, metadata=c.metadata, block_size=block)
                    assert list(y.c_array) == expected, (select, loops, stride, block, list(y.c_array), expected)
                    row = dict(select=select, loops=loops, stride=stride, block=block, status='PASS', max_abs_error=0)
                    rows.append(row)
                    print(json.dumps(row), flush=True)
    y = Tensor([-99.]*12)
    c = mixed_pointers.warmup(x, y, 3, 3, grid=(3,))
    if not args.compile_only:
        for loops in (0, 3):
            for stride in (3, -2):
                expected = [values[32+pid+loops*stride+lane]+values[32+pid+loops*stride]
                            for pid in range(3) for lane in range(4)]
                for block in (48, (8, 8)):
                    run_standalone(3, 1, 1, c.name, c.asm['sycl'], [x, y, loops, stride],
                                   signature=c.src.signature, metadata=c.metadata, block_size=block)
                    assert list(y.c_array) == expected, (loops, stride, block, list(y.c_array), expected)
                    row = dict(case='mixed_scalar_tensor', loops=loops, stride=stride,
                               block=block, status='PASS', max_abs_error=0)
                    rows.append(row)
                    print(json.dumps(row), flush=True)
    rejected = False
    # MLIR writes diagnostics to the native stderr descriptor. Check the actual
    # reason, so an unrelated compiler failure cannot pass this negative test.
    with tempfile.TemporaryFile(mode='w+') as diagnostics:
        saved_stderr = os.dup(2)
        try:
            os.dup2(diagnostics.fileno(), 2)
            try:
                allocation_switch.warmup(x, x, y, 3, grid=(1,))
            except RuntimeError:
                rejected = True
        finally:
            os.dup2(saved_stderr, 2)
            os.close(saved_stderr)
        diagnostics.seek(0)
        detail = diagnostics.read()
    expected_diagnostic = 'SYCL loop-carried pointer changes its base allocation'
    assert rejected, 'allocation-changing loop pointer was accepted'
    assert expected_diagnostic in detail, detail
    row = dict(case='allocation_switch_rejected', status='PASS', diagnostic=expected_diagnostic)
    rows.append(row)
    print(json.dumps(row), flush=True)
    print(json.dumps(rows), flush=True)


if __name__ == '__main__':
    main()
