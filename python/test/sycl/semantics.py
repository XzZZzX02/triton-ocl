"""Isolated SYCL semantic regressions; no torch/NumPy dependency.

Run: python semantics.py --all --mode run --output results.json
Use --python /path/to/loader-wrapper when Python needs a custom ELF loader.
Each case runs in a subprocess so a baseline compiler abort is recorded.
"""
import argparse
import ctypes
import json
import math
import os
import pathlib
import statistics
import subprocess
import sys
import time


REDUCTION_CASES = [f"reduce_{kind}_axis{axis}" for kind in
                   ("sum", "max", "min", "and", "or", "xor", "tuple", "argmax")
                   for axis in (0, 1)] + ["reduce_sum_rank1", "reduce_sum_rank3axis0", "reduce_sum_rank3axis1", "reduce_sum_rank3axis2"]
MEMORY_CASES = ["memory_"+kind for kind in ("holes","or","lower","negative","stride","modulo","gather","other","loops","ptrloop","masked_scalar","grid","empty","tail")]
CASES = REDUCTION_CASES + MEMORY_CASES


def run_case(name, mode, repeats):
    if name.startswith("memory_"):
        from memory_semantics import run
        return run(name, mode, repeats)
    import triton
    import triton.language as tl
    from triton.backends.sycl.sycl_utils import profile_standalone

    globals().update(triton=triton, tl=tl)

    class HostTensor:
        def __init__(self, values, integer=False):
            self.dtype = tl.int32 if integer else tl.float32
            self.c_array = ((ctypes.c_int32 if integer else ctypes.c_float) * len(values))(*values)
        def data_ptr(self):
            return ctypes.addressof(self.c_array)

    @triton.jit
    def pair(a, b, c, d):
        return a + c, tl.maximum(b, d)

    @triton.jit
    def bit_and(a, b):
        return a & b

    globals().update(pair=pair, bit_and=bit_and)

    @triton.jit
    def kernel(x, y, z, M: tl.constexpr, N: tl.constexpr,
               AXIS: tl.constexpr, KIND: tl.constexpr):
        rows = tl.arange(0, M)
        cols = tl.arange(0, N)
        values = tl.load(x + rows[:, None] * N + cols[None, :])
        if KIND == "sum":
            result = tl.sum(values, AXIS)
        elif KIND == "max":
            result = tl.max(values, AXIS)
        elif KIND == "min":
            result = tl.min(values, AXIS)
        elif KIND == "and":
            result = tl.reduce(values, AXIS, bit_and)
        elif KIND == "or":
            result = tl.reduce_or(values, AXIS)
        elif KIND == "xor":
            result = tl.xor_sum(values, AXIS)
        elif KIND == "tuple":
            result, second = tl.reduce((values, values), AXIS, pair)
        else:
            result, second = tl.max(values, AXIS, return_indices=True)
        if AXIS == 0:
            offsets = cols
        else:
            offsets = rows
        tl.store(y + offsets, result)
        if KIND == "tuple" or KIND == "argmax":
            tl.store(z + offsets, second)

    _, kind, axis_text = name.split("_")
    if axis_text.startswith("rank"):
        @triton.jit
        def ranked(x, y, RANK: tl.constexpr, AXIS: tl.constexpr):
            a = tl.arange(0, 4)
            if RANK == 1:
                value = tl.load(x + a)
            else:
                b = tl.arange(0, 2)
                value = tl.load(x + b[:, None, None] * 16 + a[None, :, None] * 4 + a[None, None, :])
            result = tl.sum(value, AXIS)
            if RANK == 1:
                tl.store(y, result)
            elif AXIS == 0:
                tl.store(y + a[:, None] * 4 + a[None, :], result)
            else:
                tl.store(y + b[:, None] * 4 + a[None, :], result)
        rank = 1 if axis_text == "rank1" else 3
        axis = 0 if rank == 1 else int(axis_text[-1])
        if kind != "sum":
            raise ValueError("unsupported rank probe")
        vals = [float(i-17) for i in range(4 if rank == 1 else 32)]
        x = HostTensor(vals)
        out = HostTensor([-123.] * (1 if rank == 1 else (16 if axis == 0 else 8)))
        c = ranked.warmup(x, out, RANK=rank, AXIS=axis, grid=(1,))
        if mode == "compile":
            return {"source_bytes": len(c.asm["sycl"])}
        ranked[(1,)](x, out, RANK=rank, AXIS=axis)
        if rank == 1:
            expected = [sum(vals)]
        elif axis == 0:
            expected = [vals[i]+vals[16+i] for i in range(16)]
        elif axis == 1:
            expected = [sum(vals[b*16+r*4+k] for r in range(4)) for b in range(2) for k in range(4)]
        else:
            expected = [sum(vals[b*16+r*4:b*16+r*4+4]) for b in range(2) for r in range(4)]
        if list(out.c_array) != expected:
            raise AssertionError(f"actual={list(out.c_array)}, expected={expected}")
        return {"max_abs_error": 0}
    axis = int(axis_text[-1])
    m, n = 4, 8
    integer = kind in ("and", "or", "xor")
    if integer:
        values = [0x7FFFFFFF ^ (1 << (i % 12)) for i in range(m*n)]
    elif kind == "min":
        values = [float(i % 7 + 1) for i in range(m*n)]
    else:
        values = [-float(i % 7 + 1) for i in range(m*n)]
    x = HostTensor(values, integer)
    length = n if axis == 0 else m
    y = HostTensor([-123] * length, integer)
    z = HostTensor([-123] * length, kind == "argmax")
    kwargs = dict(M=m, N=n, AXIS=axis, KIND=kind)
    start = time.perf_counter()
    compiled = kernel.warmup(x, y, z, grid=(1,), **kwargs)
    compile_ms = (time.perf_counter() - start) * 1000
    if mode == "compile":
        return {"compile_ms": compile_ms, "source_bytes": len(compiled.asm["sycl"])}
    kernel[(1,)](x, y, z, **kwargs)
    expected, second = [], []
    for j in range(length):
        group = [values[i*n+j] for i in range(m)] if axis == 0 else values[j*n:(j+1)*n]
        if kind in ("sum", "tuple"):
            answer = sum(group)
        elif kind in ("max", "argmax"):
            answer = max(group)
        elif kind == "min":
            answer = min(group)
        else:
            answer = group[0]
            for value in group[1:]:
                answer = (answer & value) if kind == "and" else ((answer | value) if kind == "or" else (answer ^ value))
        expected.append(answer)
        second.append(group.index(max(group)) if kind == "argmax" else max(group))
    actual = list(y.c_array)
    if actual != expected:
        raise AssertionError(f"actual={actual}, expected={expected}")
    if kind in ("tuple", "argmax") and list(z.c_array) != second:
        raise AssertionError(f"second={list(z.c_array)}, expected={second}")
    result = {"compile_ms": compile_ms, "max_abs_error": 0}
    if mode == "bench":
        args = [x, y, z, m, n, axis, kind]
        for _ in range(3):
            profile_standalone(1, 1, 1, compiled.name, compiled.asm["sycl"], args,
                               signature=compiled.src.signature, metadata=compiled.metadata)
        times = [profile_standalone(1, 1, 1, compiled.name, compiled.asm["sycl"], args,
                                    signature=compiled.src.signature, metadata=compiled.metadata)
                 for _ in range(repeats)]
        result.update(kernel_ns=times, median_kernel_ns=statistics.median(times))
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--case", choices=CASES)
    parser.add_argument("--all", action="store_true")
    parser.add_argument("--group", choices=("reduction", "memory"))
    parser.add_argument("--mode", choices=("compile", "run", "bench"), default="run")
    parser.add_argument("--output")
    parser.add_argument("--python", default=sys.executable)
    parser.add_argument("--repeats", type=int, default=9)
    parser.add_argument("--timeout", type=int, default=180)
    args = parser.parse_args()
    if args.case:
        result = run_case(args.case, args.mode, args.repeats)
        print(json.dumps(dict(case=args.case, status="PASS", **result)), flush=True)
        return
    if not args.all:
        parser.error("choose --all or --case")
    results = []
    selected = REDUCTION_CASES if args.group == "reduction" else (MEMORY_CASES if args.group == "memory" else CASES)
    for name in selected:
        command = [args.python, str(pathlib.Path(__file__).resolve()), "--case", name,
                   "--mode", args.mode, "--repeats", str(args.repeats)]
        start = time.perf_counter()
        try:
            proc = subprocess.run(command, text=True, stdout=subprocess.PIPE,
                                  stderr=subprocess.STDOUT, timeout=args.timeout)
            lines = [line for line in proc.stdout.splitlines() if line.startswith('{"case":')]
            entry = json.loads(lines[-1]) if proc.returncode == 0 and lines else {
                "case": name, "status": "FAIL", "returncode": proc.returncode,
                "output_tail": proc.stdout[-6000:]}
        except subprocess.TimeoutExpired as exc:
            entry = {"case": name, "status": "TIMEOUT", "output_tail": str(exc.stdout)[-1500:]}
        entry["wall_seconds"] = time.perf_counter() - start
        results.append(entry)
        print(json.dumps(entry), flush=True)
        if args.output:
            pathlib.Path(args.output).write_text(json.dumps(results, indent=2) + "\n")
    raise SystemExit(any(row["status"] != "PASS" for row in results))


if __name__ == "__main__":
    main()
