"""Isolate negative-stride vector loads from dot operand layout handling."""
import argparse
import ctypes
import json
import struct
import sys


class Tensor:
    def __init__(self, dtype, values, pointer_offset=0):
        self.dtype = dtype
        half = dtype == tl.float16
        ctype = ctypes.c_uint16 if half else ctypes.c_float
        if half:
            values = [int.from_bytes(struct.pack("<e", value), "little")
                      for value in values]
        self.c_array = (ctype * len(values))(*values)
        self.pointer_offset = pointer_offset
        self.itemsize = ctypes.sizeof(ctype)

    def data_ptr(self):
        return ctypes.addressof(self.c_array)


def main():
    import triton
    import triton.language as tl
    from triton.backends.sycl.sycl_utils import run_standalone
    globals().update(tl=tl)

    @triton.jit
    def copy_reverse(x, y, N: tl.constexpr, BASE: tl.constexpr,
                     STRIDE: tl.constexpr,
                     B: tl.constexpr):
        i = tl.arange(0, B)
        value = tl.load(x + BASE + i * STRIDE, i < N, 0.)
        tl.store(y + i, value, i < N)

    rows = []
    n = 13
    for dtype in (tl.float16, tl.float32):
        for stride in (-1, -2):
            base = 8 + (n - 1) * -stride
            storage_size = base + 8
            source = [ -99. ] * storage_size
            expected = [float((i * 3) % 11 - 5) / 4 for i in range(n)]
            for i, value in enumerate(expected):
                source[base + i * stride] = value
            x = Tensor(dtype, source, base)
            y = Tensor(dtype, [0.] * n)
            compiled = copy_reverse.warmup(x, y, N=n, BASE=base, STRIDE=stride,
                                           B=16, grid=(1,))
            run_standalone(1, 1, 1, compiled.name, compiled.asm["sycl"],
                           [x, y, n, base, stride, 16],
                           signature=compiled.src.signature,
                           metadata=compiled.metadata, block_size=48)
            actual = [struct.unpack("<e", struct.pack("<H", y.c_array[i]))[0]
                      if dtype == tl.float16 else y.c_array[i] for i in range(n)]
            want = [struct.unpack("<e", struct.pack("<e", value))[0]
                    if dtype == tl.float16 else value for value in expected]
            assert actual == want, (dtype, stride, actual, want)
            rows.append({"dtype": str(dtype), "stride": stride,
                         "elements_checked": n, "status": "PASS"})
    print(json.dumps({"status": "PASS", "cases": rows}))


if __name__ == "__main__":
    main()
