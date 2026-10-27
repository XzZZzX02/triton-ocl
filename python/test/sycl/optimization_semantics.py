"""Safety regressions for vector copies, local reuse, and typed group trees."""
import ctypes
import json
import math
import random
import re
import triton
import triton.language as tl
from triton.backends.sycl.sycl_utils import run_standalone


class Tensor:
    def __init__(self, values, integer=False):
        self.dtype = tl.int32 if integer else tl.float32
        self.c_array = ((ctypes.c_int32 if integer else ctypes.c_float)*len(values))(*values)

    def data_ptr(self):
        return ctypes.addressof(self.c_array)


@triton.jit
def copies(x, z, y, MODE: tl.constexpr):
    i = tl.program_id(0)*256 + tl.arange(0, 256)
    if MODE == 'copy':
        a = tl.load(x+i)
        tl.store(y+i, a)
    elif MODE == 'masked':
        v = tl.load(x+i, (i < 501) & (i%3 != 1), -7.)
        tl.store(y+i, v+1., i < 501)
    elif MODE == 'overlap':
        a = tl.load(x+i)
        b = tl.load(z+i)
        tl.store(y+i, a*2.+b)
    else:
        a = tl.load(x+i)
        tl.store(y+i, a*2.+1.)
        b = tl.load(z+i)
        tl.store(y+512+i, b*3.-1.)


@triton.jit
def mixed(x, bits, sums, xors):
    i = tl.arange(0, 1024)
    a = tl.load(x+i)
    b = tl.load(bits+i)
    tl.store(sums, tl.sum(a, 0))
    tl.store(xors, tl.xor_sum(b, 0))


def launch(compiled, args, grid, block):
    run_standalone(*grid, compiled.name, compiled.asm['sycl'], args,
                   signature=compiled.src.signature, metadata=compiled.metadata,
                   block_size=block)


def main():
    rows = []
    for mode in ('sequential', 'overlap', 'masked', 'copy'):
        xv = [float(i%17-8)/4 for i in range(512)]
        zv = [float(i%13-6)/2 for i in range(512)]
        x, z, y = Tensor(xv), Tensor(zv), Tensor([-99.]*1024)
        c = copies.warmup(x, z, y, MODE=mode, grid=(2,), vectorize_memory=True)
        code = c.asm['sycl']
        if isinstance(code, bytes):
            code = code.decode()
        storage = re.search(r'local storage: ([0-9]+) -> ([0-9]+) bytes', code)
        assert storage, ('missing local storage plan', type(code).__name__, repr(code[:450]))
        before, after = map(int, storage.groups())
        if mode == 'sequential':
            assert 'packed.load' in code, 'vector load path missed'
            assert after < before, (before, after)
        if mode == 'copy':
            assert 'packed.store' in code, 'vector store path missed'
        if mode == 'masked':
            assert 'packed.load' not in code and 'packed.store' not in code, 'masked access vectorized'
        expected = [-99.]*1024
        for i in range(512):
            if mode == 'sequential':
                expected[i], expected[512+i] = xv[i]*2+1, zv[i]*3-1
            elif mode == 'overlap':
                expected[i] = xv[i]*2+zv[i]
            elif mode == 'copy':
                expected[i] = xv[i]
            elif i < 501:
                expected[i] = (xv[i] if i%3 != 1 else -7.)+1
        for block in (48, (8, 8), (4, 4, 4)):
            launch(c, [x, z, y, mode], (2, 1, 1), block)
            assert list(y.c_array) == expected, (mode, block)
            row = dict(case=mode, block=block, status='PASS', max_abs_error=0,
                       local_bytes_before=before, local_bytes_after=after)
            rows.append(row)
            print(json.dumps(row), flush=True)
    rng = random.Random(846)
    x = Tensor([rng.uniform(-1, 1) for _ in range(1024)])
    values = [(i*7919)%65536 for i in range(1024)]
    bits, sums, xors = Tensor(values, True), Tensor([0.]), Tensor([0], True)
    expected = 0
    for v in values:
        expected ^= v
    c = mixed.warmup(x, bits, sums, xors, grid=(1,))
    for block in (48, (8, 8), (4, 4, 4)):
        launch(c, [x, bits, sums, xors], (1, 1, 1), block)
        error = abs(sums.c_array[0]-math.fsum(x.c_array))
        assert error < 1.e-4 and xors.c_array[0] == expected, (block, error, xors.c_array[0])
        row = dict(case='mixed_tree_random', block=block, status='PASS', max_abs_error=error)
        rows.append(row)
        print(json.dumps(row), flush=True)
    print(json.dumps(rows), flush=True)


if __name__ == '__main__':
    main()
