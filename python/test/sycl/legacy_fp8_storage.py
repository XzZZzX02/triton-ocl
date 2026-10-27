"""Exhaustive legacy e4b15 decoding, including binary16 subnormal storage."""
import argparse
import ctypes
import json
import pathlib
import re

import triton
import triton.language as tl
from triton.backends.sycl.sycl_utils import run_standalone


class Tensor:
    def __init__(self, dtype, ctype, values):
        self.dtype = dtype
        self.c_array = (ctype * len(values))(*values)

    def data_ptr(self):
        return ctypes.addressof(self.c_array)


@triton.jit
def decode(x, half, raw, numeric, direct, bytecopy, B: tl.constexpr):
    i = tl.arange(0, B)
    value = tl.load(x + i).to(tl.float16)
    tl.store(half + i, value)
    tl.store(raw + i, value.to(tl.uint16, bitcast=True))
    tl.store(numeric + i, value.to(tl.float32))
    tl.store(direct + i, ((i & 127) << 7) | ((i & 128) << 8))
    tl.store(bytecopy + i, tl.load(x + i).to(tl.uint8, bitcast=True))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--dump')
    parser.add_argument('--variant', choices=('baseline', 'volatile', 'no-vector'), default='baseline')
    args = parser.parse_args()
    x = Tensor(tl.float8e4b15, ctypes.c_uint8, list(range(256)))
    half = Tensor(tl.float16, ctypes.c_uint16, [65535] * 256)
    raw = Tensor(tl.uint16, ctypes.c_uint16, [65535] * 256)
    numeric = Tensor(tl.float32, ctypes.c_float, [99.] * 256)
    direct = Tensor(tl.uint16, ctypes.c_uint16, [65535] * 256)
    bytecopy = Tensor(tl.uint8, ctypes.c_uint8, [255] * 256)
    compiled = decode.warmup(x, half, raw, numeric, direct, bytecopy, B=256, grid=(1,))
    code = compiled.asm['sycl']
    if isinstance(code, bytes):
        code = code.decode()
    if args.variant == 'volatile':
        # Diagnostic: prevent the device compiler from widening narrow stores.
        code = re.sub(r'\((var_[124]) \+ ([^\n]+?)\)\[0\] = (var_\d+);',
            lambda m: 'reinterpret_cast<volatile uint16_t*>(' + m[1] + ' + ' + m[2]
                      + ')[0] = ' + m[3] + ('.bits' if m[1] == 'var_1' else '') + ';', code)
    if args.variant == 'no-vector':
        code = code.replace('  for (', '  #pragma clang loop vectorize(disable) interleave(disable)\n  for (')
    if args.dump:
        path = pathlib.Path(args.dump)
        path.mkdir(parents=True, exist_ok=True)
        for stage, data in compiled.asm.items():
            if isinstance(data, bytes):
                data = data.decode()
            if isinstance(data, str):
                (path / ('legacy.' + stage)).write_text(data)
    failed = False
    for block in (1, 3, 48, 64, (3, 5), 257):
        for tensor in (half, raw, direct):
            for i in range(256):
                tensor.c_array[i] = 65535
        run_standalone(1, 1, 1, compiled.name, code,
                       [x, half, raw, numeric, direct, bytecopy, 256], signature=compiled.src.signature,
                       metadata=compiled.metadata, block_size=block)
        mismatches = []
        for i in range(256):
            expected = ((i & 127) << 7) | ((i & 128) << 8)
            if (half.c_array[i] != expected or raw.c_array[i] != expected
                    or direct.c_array[i] != expected or bytecopy.c_array[i] != i):
                mismatches.append(dict(code=i, expected=expected, half=half.c_array[i],
                                       bits=raw.c_array[i], numeric=numeric.c_array[i],
                                       direct=direct.c_array[i], bytecopy=bytecopy.c_array[i]))
        print(json.dumps(dict(block=block, variant=args.variant, status='FAIL' if mismatches else 'PASS',
                              mismatches=mismatches[:20])), flush=True)
        failed |= bool(mismatches)
    assert not failed


if __name__ == '__main__':
    main()
