"""Dtype and IEEE-754 regressions with independent Python/bit references.

No optional array package is required. A failing dtype is recorded, not skipped.
Run with a loader-capable --python on DFCS; --mode compile is a separate gate.
"""
import argparse
import concurrent.futures
import ctypes
import hashlib
import itertools
import json
import math
import os
import pathlib
import struct
import subprocess
import sys


DTYPES = {
    'int1': ('?', ctypes.c_bool),
    'int8': ('b', ctypes.c_int8), 'uint8': ('B', ctypes.c_uint8),
    'int16': ('h', ctypes.c_int16), 'uint16': ('H', ctypes.c_uint16),
    'int32': ('i', ctypes.c_int32), 'uint32': ('I', ctypes.c_uint32),
    'int64': ('q', ctypes.c_int64), 'uint64': ('Q', ctypes.c_uint64),
    'float16': ('e', ctypes.c_uint16), 'bfloat16': ('bf16', ctypes.c_uint16),
    'float32': ('f', ctypes.c_float), 'float64': ('d', ctypes.c_double),
    'float8e5': ('fp8e5', ctypes.c_uint8),
    'float8e5b16': ('fp8e5b16', ctypes.c_uint8),
    'float8e4nv': ('fp8e4nv', ctypes.c_uint8),
    'float8e4b8': ('fp8e4b8', ctypes.c_uint8),
    'float8e4b15': ('fp8e4b15', ctypes.c_uint8),
}
FLOATS = ('float16', 'bfloat16', 'float32', 'float64')
FP8 = tuple(d for d in DTYPES if d.startswith('float8'))
CASES = ([f'storage:{d}' for d in DTYPES] +
         [f'integer:{d}' for d in DTYPES if d.startswith(('int', 'uint')) and d != 'int1'] +
         [f'ieee:{d}' for d in FLOATS] +
         [f'ieee_arithmetic:{d}' for d in FLOATS] +
         [f'constant:{d}' for d in ('float32', 'float64')] +
         [f'convert:{d}' for d in FP8 + ('bfloat16', 'float16')] +
         [f'arithmetic:{d}' for d in DTYPES if d != 'int1'] +
         [f'reduction:{d}' for d in DTYPES if d != 'int1'])
SCRIPT_SHA256 = hashlib.sha256(pathlib.Path(__file__).resolve().read_bytes()).hexdigest()


def pack_value(dtype, value):
    fmt, _ = DTYPES[dtype]
    if fmt == 'bf16':
        bits = struct.unpack('<I', struct.pack('<f', value))[0]
        if bits & 0x7f800000 == 0x7f800000 and bits & 0x7fffff:
            return struct.pack('<H', (bits >> 16) | 0x40)
        return struct.pack('<H', ((bits + 0x7fff + ((bits >> 16) & 1)) >> 16) & 0xffff)
    return struct.pack('<'+fmt, value)


def unpack_value(dtype, data):
    fmt, _ = DTYPES[dtype]
    if fmt == 'bf16':
        return struct.unpack('<f', b'\0\0'+data)[0]
    return struct.unpack('<'+fmt, data)[0]


def ieee_binary(op, a, b, dtype):
    if op == 'add':
        value = a + b
    elif op == 'sub':
        value = a - b
    elif op == 'mul':
        value = a * b
    elif math.isnan(a) or math.isnan(b):
        value = math.nan
    elif (a == 0. and b == 0.) or (math.isinf(a) and math.isinf(b)):
        value = math.nan
    elif op == 'div' and (b == 0. or math.isinf(a)):
        negative = math.copysign(1., a) != math.copysign(1., b)
        value = -math.inf if negative else math.inf
    elif op == 'div' and math.isinf(b):
        negative = math.copysign(1., a) != math.copysign(1., b)
        value = -0. if negative else 0.
    else:
        value = a / b
    try:
        return unpack_value(dtype, pack_value(dtype, value))
    except OverflowError:
        return math.copysign(math.inf, value)


def minimum_subnormal(dtype):
    return {'float16': 2.**-24, 'bfloat16': 2.**-133,
            'float32': 2.**-149, 'float64': 2.**-1074}[dtype]


def decode_fp8(dtype, bits):
    mantissa, bias, special = {
        'float8e5': (2, 15, 'ieee'), 'float8e5b16': (2, 16, 'fnuz'),
        'float8e4nv': (3, 7, 'fn'), 'float8e4b8': (3, 8, 'fnuz'),
        'float8e4b15': (3, 15, 'legacy'),
    }[dtype]
    sign = -1. if bits & 128 else 1.
    code = bits & 127
    exponent, fraction = code >> mantissa, code & ((1 << mantissa)-1)
    if special == 'fnuz' and bits == 128: return math.nan
    if special == 'fn' and code == 127: return math.nan
    if special == 'ieee' and exponent == 31:
        return sign*math.inf if fraction == 0 else math.nan
    return sign*math.ldexp(fraction if exponent == 0 else (1 << mantissa)+fraction,
                          (1-bias if exponent == 0 else exponent-bias)-mantissa)


def encode_fp8(dtype, value, rtz=False):
    sign = 128 if math.copysign(1., value) < 0 else 0
    fnuz = dtype in ('float8e5b16', 'float8e4b8')
    nan = 128 if fnuz else 127
    if math.isnan(value) and dtype != 'float8e4b15': return nan
    limit = {'float8e5': 123, 'float8e4nv': 126}.get(dtype, 127)
    magnitude = abs(value)
    if dtype == 'float8e4b15':
        # Existing Triton custom-conversion contract: fp16 RTZ intermediate,
        # finite saturation and nearest ties away from zero. Its rounding
        # argument is ignored by the upstream CUDA helper as well. NaN is
        # mapped to the positive finite limit by minnum before restoring sign.
        magnitude = 1.75 if math.isnan(magnitude) else min(magnitude, 1.75)
        half = struct.pack('<e', magnitude)
        if struct.unpack('<e', half)[0] > magnitude:
            half = (int.from_bytes(half, 'little')-1).to_bytes(2, 'little')
        magnitude = struct.unpack('<e', half)[0]
        levels = [decode_fp8(dtype, i) for i in range(127)]
        return min(range(127), key=lambda i:(abs(levels[i]-magnitude), -i)) | sign
    levels = [decode_fp8(dtype, i) for i in range(limit+1)]
    if math.isinf(magnitude): return (124 | sign) if dtype == 'float8e5' else nan
    if rtz:
        code = max(i for i,v in enumerate(levels) if v <= magnitude)
    else:
        code = min(range(len(levels)), key=lambda i:(abs(levels[i]-magnitude), i%2))
        boundary = levels[-1]+(levels[-1]-levels[-2])/2
        if magnitude >= boundary and dtype != 'float8e4b15':
            return (124 | sign) if dtype == 'float8e5' else nan
    return code | (0 if fnuz and code == 0 else sign)


def execute(case, mode):
    import triton
    import triton.language as tl
    from triton.backends.sycl.sycl_utils import run_standalone
    # Triton resolves kernel symbols through the function's global namespace.
    globals().update(triton=triton, tl=tl)

    class Tensor:
        def __init__(self, dtype, values=None, raw=None):
            self.dtype = getattr(tl, dtype)
            self.name = dtype
            ctype = DTYPES[dtype][1]
            payload = raw if raw is not None else b''.join(pack_value(dtype, v) for v in values)
            self.c_array = (ctype*(len(payload)//ctypes.sizeof(ctype))).from_buffer_copy(payload)

        def data_ptr(self):
            return ctypes.addressof(self.c_array)

        def raw(self):
            return ctypes.string_at(self.data_ptr(), ctypes.sizeof(self.c_array))

        def values(self):
            size = ctypes.sizeof(DTYPES[self.name][1])
            return [unpack_value(self.name, self.raw()[i:i+size]) for i in range(0, len(self.raw()), size)]

    @triton.jit
    def copy(x, y, N: tl.constexpr, B: tl.constexpr):
        i = tl.program_id(0)*B+tl.arange(0, B)
        tl.store(y+i, tl.load(x+i, i<N, 0.), i<N)

    @triton.jit
    def integer(x, y, B: tl.constexpr):
        i = tl.arange(0, B)
        v = tl.load(x+i)
        tl.store(y+i, v//3)
        tl.store(y+B+i, v >> 2)
        tl.store(y+2*B+i, tl.maximum(v, 3))
        tl.store(y+3*B+i, v > 3)
        tl.store(y+4*B+i, (v & 63).to(tl.float64).to(v.dtype))

    @triton.jit
    def ieee(x, y, z, flags, B: tl.constexpr):
        i = tl.arange(0, B)
        a, b = tl.load(x+i), tl.load(y+i)
        tl.store(z+i, tl.maximum(a, b, propagate_nan=tl.PropagateNan.ALL))
        tl.store(z+B+i, tl.minimum(a, b, propagate_nan=tl.PropagateNan.ALL))
        tl.store(z+2*B+i, tl.maximum(a, b, propagate_nan=tl.PropagateNan.NONE))
        tl.store(z+3*B+i, tl.minimum(a, b, propagate_nan=tl.PropagateNan.NONE))
        tl.store(flags+i, a == b)
        tl.store(flags+B+i, a != b)
        tl.store(flags+2*B+i, a < b)
        tl.store(flags+3*B+i, a <= b)
        tl.store(flags+4*B+i, a > b)
        tl.store(flags+5*B+i, a >= b)

    @triton.jit
    def conversion(x, y, z, B: tl.constexpr):
        i = tl.arange(0, B)
        tl.store(y+i, tl.load(x+i).to(tl.float32))
        tl.store(z+i, tl.load(y+B+i).to(z.dtype.element_ty))
        tl.store(z+B+i, tl.load(y+B+i).to(z.dtype.element_ty, fp_downcast_rounding='rtz'))

    @triton.jit
    def arithmetic(x, y, B: tl.constexpr):
        i = tl.arange(0, B)
        v = tl.load(x+i)
        tl.store(y+i, v+v)
        tl.store(y+B+i, v*v)
        tl.store(y+2*B+i, tl.minimum(v, v))

    @triton.jit
    def ieee_arithmetic(x, y, z, B: tl.constexpr):
        i = tl.arange(0, B)
        a, b = tl.load(x+i), tl.load(y+i)
        tl.store(z+i, a+b)
        tl.store(z+B+i, a-b)
        tl.store(z+2*B+i, a*b)
        tl.store(z+3*B+i, a/b)

    @triton.jit
    def reduction(x, y, B: tl.constexpr):
        i = tl.arange(0, B)
        v = tl.load(x+i)
        if v.dtype.is_fp8():
            tl.store(y, tl.sum(v.to(tl.float32), 0))
            tl.store(y+3, tl.sum(tl.where(i < 4, v, 0.), 0))
        else:
            tl.store(y, tl.sum(v, 0))
        tl.store(y+1, tl.max(v, 0))
        tl.store(y+2, tl.min(v, 0))

    @triton.jit
    def constants(y):
        tl.store(y, 1.e-12)
        tl.store(y+1, -0.)
        tl.store(y+2, 1.23456789012345)
        tl.store(y+3, 1.e-30)

    kind, dtype = case.split(':')
    if kind == 'storage':
        size = ctypes.sizeof(DTYPES[dtype][1])
        # Every 8-bit representation, including NaNs; deterministic byte patterns
        # for wider types. Masked tail checks that the final guard is unchanged.
        raw = bytes(range(256)) if size == 1 else bytes((i*73+11)%256 for i in range(257*size))
        if dtype == 'int1':
            raw = bytes(i%2 for i in range(257))
        n = len(raw)//size
        x, y = Tensor(dtype, raw=raw), Tensor(dtype, raw=b'\0'*(len(raw)+size))
        c = copy.warmup(x, y, N=n, B=64, grid=((n+63)//64,))
        bound = [x, y, n, 64]
        expected = raw+b'\0'*size
    elif kind == 'integer':
        bits = 8*ctypes.sizeof(DTYPES[dtype][1])
        signed = dtype.startswith('int')
        vmax = (1 << (bits-int(signed)))-1
        values = ([0, 1, 2, 3, 7, 15, 31, 63] if signed else
                  [0, 1, 3, 7, 1 << (bits-1), (1 << (bits-1))+8, vmax-1, vmax])
        if signed:
            values = [-v if i%2 else v for i,v in enumerate(values)]
        x, y = Tensor(dtype, values), Tensor(dtype, [0]*40)
        c = integer.warmup(x, y, B=8, grid=(1,))
        bound = [x, y, 8]
        # Triton's // is signed division rounded toward zero (arith.divsi),
        # unlike Python's floor division for negative operands.
        expected_values = [(abs(v)//3)*(-1 if v < 0 else 1) for v in values]+[v >> 2 for v in values]+[max(v, 3) for v in values]+[int(v>3) for v in values]+[v & 63 for v in values]
        expected = b''.join(pack_value(dtype, v) for v in expected_values)
    elif kind == 'convert':
        raw = bytes(range(256)) if dtype in FP8 else b''.join(pack_value(dtype, v) for v in [0.,-0.,1.,-1.,0.5,-0.5,math.inf,math.nan]*32)
        decoded = [decode_fp8(dtype, i) for i in range(256)] if dtype in FP8 else [unpack_value(dtype,raw[i:i+2]) for i in range(0,len(raw),2)]
        probes = [0., -0., math.inf, -math.inf, math.nan, 1.e-8, 1., -1.]
        if dtype in FP8:
            limit = {'float8e5': 123, 'float8e4nv': 126}.get(dtype,127)
            levels = [decode_fp8(dtype, i) for i in range(limit+1)]
            probes += [v for pair in zip(levels,[(a+b)/2 for a,b in zip(levels,levels[1:])]) for v in pair]
        else:
            probes += [1.+i/1024 for i in range(120)] + [2.**-24, 2.**-133, 65504., 65520.]
        probes = (probes*32)[:256]
        # Inputs are stored in fp32 for these probes, so quantize the oracle.
        probes = [unpack_value('float32',pack_value('float32',v)) for v in probes]
        x = Tensor(dtype, raw=raw)
        y = Tensor('float32', [0.]*256+probes)
        output = Tensor(dtype, raw=b'\0'*(512*ctypes.sizeof(DTYPES[dtype][1])))
        c = conversion.warmup(x,y,output,B=256,grid=(1,))
        bound = [x,y,output,256]
    elif kind in ('arithmetic','reduction'):
        values = [float(i%4)/4 for i in range(64)] if dtype.startswith(('float','bfloat')) else [i%4 for i in range(64)]
        raw = bytes(encode_fp8(dtype,v) for v in values) if dtype in FP8 else None
        x = Tensor(dtype, values if raw is None else None, raw=raw)
        if kind == 'arithmetic':
            y = Tensor(dtype, raw=b'\0'*(192*ctypes.sizeof(DTYPES[dtype][1])))
            expected_values = [v+v for v in values]+[v*v for v in values]+values
            expected = bytes(encode_fp8(dtype,v) for v in expected_values) if dtype in FP8 else b''.join(pack_value(dtype,v) for v in expected_values)
            c = arithmetic.warmup(x,y,B=64,grid=(1,))
        else:
            y = Tensor('float32' if dtype.startswith(('float','bfloat')) else dtype, [0]*(4 if dtype in FP8 else 3))
            expected_values = [sum(values),max(values),min(values)]
            if dtype in FP8:
                # Every intermediate in the four-value native sum is exactly
                # representable. The long sum is explicitly widened: fp8
                # default accumulation otherwise rounds differently for legal
                # serial and tree reduction orders.
                expected_values.append(sum(values[:4]))
            expected = b''.join(pack_value(y.name,v) for v in expected_values)
            c = reduction.warmup(x,y,B=64,grid=(1,))
        bound = [x,y,64]
    elif kind == 'constant':
        y = Tensor(dtype, [0.]*4)
        c = constants.warmup(y, grid=(1,))
        bound = [y]
        # Triton Python literals default to fp32 before a wider store.
        literals = [1.e-12, -0., 1.23456789012345, 1.e-30]
        expected = b''.join(pack_value(dtype, struct.unpack('<f',struct.pack('<f',v))[0]) for v in literals)
    elif kind == 'ieee_arithmetic':
        special = [0., -0., 1., -1., math.inf, -math.inf, math.nan, minimum_subnormal(dtype)]
        pairs = list(itertools.product(special, repeat=2))
        x, y = Tensor(dtype, [a for a,b in pairs]), Tensor(dtype, [b for a,b in pairs])
        output = Tensor(dtype, [0.]*256)
        c = ieee_arithmetic.warmup(x, y, output, B=64, grid=(1,))
        bound = [x, y, output, 64]
        expected = [ieee_binary(op, a, b, dtype) for op in ('add','sub','mul','div')
                    for a,b in pairs]
    else:
        sub = minimum_subnormal(dtype)
        special = [0., -0., 1., -1., math.inf, -math.inf, math.nan, sub]
        pairs = list(itertools.product(special, repeat=2))
        x = Tensor(dtype, [a for a,b in pairs])
        y = Tensor(dtype, [b for a,b in pairs])
        output, flags = Tensor(dtype, [0.]*256), Tensor('int1', [False]*384)
        c = ieee.warmup(x, y, output, flags, B=64, grid=(1,))
        bound = [x, y, output, flags, 64]
    if os.environ.get('SYCL_DTYPE_DUMP'):
        directory = pathlib.Path(os.environ['SYCL_DTYPE_DUMP'])
        directory.mkdir(parents=True, exist_ok=True)
        for stage, source in c.asm.items():
            if isinstance(source, bytes):
                source = source.decode()
            if isinstance(source, str):
                (directory / (case.replace(':', '-') + '.' + stage)).write_text(source)
    if mode == 'compile':
        return dict(source_bytes=len(c.asm['sycl']))
    for block in (48, (8,8)):
        grid = ((n+63)//64,1,1) if kind == 'storage' else (1,1,1)
        run_standalone(*grid,c.name,c.asm['sycl'],bound,signature=c.src.signature,
                       metadata=c.metadata,block_size=block)
        if kind == 'convert':
            actual_decode = y.values()[:256]
            for i,(got,want) in enumerate(zip(actual_decode,decoded)):
                assert math.isnan(got) if math.isnan(want) else got == want, (case,'decode',i,got,want)
                if want == 0.: assert math.copysign(1.,got) == math.copysign(1.,want), (case,'decode zero',i)
            size = ctypes.sizeof(DTYPES[dtype][1])
            for rounding in (0,1):
                actual = output.raw()[rounding*256*size:(rounding+1)*256*size]
                for i,v in enumerate(probes):
                    if dtype in FP8:
                        want = encode_fp8(dtype,v,bool(rounding))
                        got = actual[i]
                        if math.isnan(decode_fp8(dtype,want)):
                            assert math.isnan(decode_fp8(dtype,got)), (case,'NaN encode',v,got,want)
                        else: assert got == want, (case,'encode',rounding,i,v,got,want)
                    else:
                        got = unpack_value(dtype,actual[i*size:(i+1)*size])
                        try: want = unpack_value(dtype,pack_value(dtype,v))
                        except OverflowError: want = math.copysign(math.inf,v)
                        if rounding and not math.isnan(v) and abs(want)>abs(v):
                            bits = int.from_bytes(pack_value(dtype,want),'little')-1
                            want = unpack_value(dtype,bits.to_bytes(size,'little'))
                        assert math.isnan(got) if math.isnan(want) else got == want, (case,'encode',rounding,i,v,got,want)
                        if want == 0.: assert math.copysign(1.,got) == math.copysign(1.,want), (case,'encode zero',rounding,i)
            continue
        if kind == 'ieee_arithmetic':
            actual = output.values()
            for operation, op in enumerate(('add','sub','mul','div')):
                for i, (a,b) in enumerate(pairs):
                    got, want = actual[operation*64+i], expected[operation*64+i]
                    assert math.isnan(got) if math.isnan(want) else got == want, \
                        (case,block,op,i,a,b,got,want)
                    if want == 0.:
                        assert math.copysign(1.,got) == math.copysign(1.,want), \
                            (case,block,op,i,'zero sign',a,b,got,want)
            continue
        if kind != 'ieee':
            actual = y.raw()
            check_expected = expected
            assert actual == check_expected, (case,block,actual.hex(),check_expected.hex())
            continue
        actual = output.values()
        for operation in range(4):
            maximum, propagate = operation%2 == 0, operation < 2
            for i,(a,b) in enumerate(pairs):
                got = actual[operation*64+i]
                if math.isnan(a) or math.isnan(b):
                    want = math.nan if propagate or (math.isnan(a) and math.isnan(b)) else (b if math.isnan(a) else a)
                elif a == b == 0.:
                    want = (0. if maximum else -0.) if math.copysign(1,a) != math.copysign(1,b) else a
                else:
                    want = max(a,b) if maximum else min(a,b)
                assert (math.isnan(got) if math.isnan(want) else got == want), (case,operation,i,a,b,got,want)
                # maxnum/minnum leave the sign of mixed zeros unspecified in
                # this checkout's MLIR contract. maximum/minimum specify it.
                mixed_zero = a == b == 0. and math.copysign(1,a) != math.copysign(1,b)
                if want == 0. and (propagate or not mixed_zero):
                    assert math.copysign(1,got) == math.copysign(1,want), (case,operation,i,'zero sign',a,b,got,want)
        expected_flags = [predicate(a,b) for predicate in (
            lambda a,b:a==b, lambda a,b:a!=b, lambda a,b:a<b,
            lambda a,b:a<=b, lambda a,b:a>b, lambda a,b:a>=b) for a,b in pairs]
        assert list(flags.c_array) == expected_flags, (case,'comparison flags')
    return dict(checks=2, status='PASS')


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--case',choices=CASES)
    p.add_argument('--mode',choices=('run','compile'),default='run')
    p.add_argument('--output')
    p.add_argument('--python',default=sys.executable)
    p.add_argument('--jobs',type=int,default=1)
    p.add_argument('--timeout',type=int,default=180)
    args = p.parse_args()
    if args.case:
        print(json.dumps(dict(status='HARNESS',sha256=SCRIPT_SHA256)), flush=True)
        print(json.dumps(dict(case=args.case,status='PASS',harness_sha256=SCRIPT_SHA256,
                              **{k:v for k,v in execute(args.case,args.mode).items() if k != 'status'})),flush=True)
        return
    def isolated(case):
        try:
            r = subprocess.run([args.python,str(pathlib.Path(__file__).resolve()),'--case',case,'--mode',args.mode],stdout=subprocess.PIPE,stderr=subprocess.STDOUT,text=True,timeout=args.timeout)
            records = []
            for line in r.stdout.splitlines():
                try:
                    records.append(json.loads(line))
                except json.JSONDecodeError:
                    continue
            fingerprints = [row for row in records if row.get('status') == 'HARNESS']
            observed_sha256 = fingerprints[-1]['sha256'] if fingerprints else None
            cases = [row for row in records if row.get('case') == case]
            if r.returncode == 0 and cases:
                result = cases[-1]
                result['harness_sha256'] = observed_sha256
                result['expected_harness_sha256'] = SCRIPT_SHA256
                result['harness_match'] = observed_sha256 == SCRIPT_SHA256
                if not result['harness_match']:
                    result['status'] = 'INVALID_HARNESS'
                return result
            return dict(case=case,status='FAIL',returncode=r.returncode,
                        harness_sha256=observed_sha256,
                        expected_harness_sha256=SCRIPT_SHA256,output_tail=r.stdout[-9000:])
        except subprocess.TimeoutExpired:
            return dict(case=case,status='TIMEOUT',expected_harness_sha256=SCRIPT_SHA256)
    results=[]
    with concurrent.futures.ThreadPoolExecutor(max_workers=args.jobs) as pool:
        for row in pool.map(isolated,CASES):
            results.append(row); print(json.dumps(row),flush=True)
            if args.output:
                pathlib.Path(args.output).write_text(json.dumps(results,indent=2)+'\n')
    raise SystemExit(any(r['status'] != 'PASS' for r in results))


if __name__ == '__main__':
    main()
