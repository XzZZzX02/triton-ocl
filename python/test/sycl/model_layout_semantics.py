"""Strided, padded, and batch-broadcast model-like dot regressions."""
import argparse
import concurrent.futures
import ctypes
import hashlib
import itertools
import json
import pathlib
import struct
import subprocess
import sys


LAYOUTS = ("nn", "tn", "nt", "tt")
PRECISIONS = ("f32", "f16")
BATCH_MODES = ("none", "a", "b")
CASES = ([f"layout_2d_{layout}_{precision}_none"
          for layout, precision in itertools.product(LAYOUTS, PRECISIONS)] +
         [f"layout_3d_{layout}_{precision}_{batch}"
          for layout, precision, batch in itertools.product(
              LAYOUTS, PRECISIONS, BATCH_MODES)])
SCRIPT_SHA256 = hashlib.sha256(pathlib.Path(__file__).resolve().read_bytes()).hexdigest()
BM, BN, BK = 8, 16, 16
SHAPES = ((5, 11, 13), (7, 9, 5), (3, 16, 15))


class Tensor:
    def __init__(self, values, dtype):
        self.dtype = dtype
        half = dtype == tl.float16
        if half:
            values = [int.from_bytes(struct.pack("<e", x), "little") for x in values]
        ctype = ctypes.c_uint16 if half else ctypes.c_float
        self.c_array = (ctype * len(values))(*values)

    def data_ptr(self):
        return ctypes.addressof(self.c_array)


def physical_strides(rows, cols, transposed, inner_stride, padding):
    if transposed:
        row_stride = inner_stride
        col_stride = rows * inner_stride + padding
    else:
        row_stride = cols * inner_stride + padding
        col_stride = inner_stride
    span = (rows - 1) * row_stride + (cols - 1) * col_stride + 1
    return row_stride, col_stride, span + 7


def pack_matrix(logical, row_stride, col_stride, batch_stride, dtype):
    batches = len(logical)
    rows = len(logical[0])
    cols = len(logical[0][0])
    size = ((batches - 1) * batch_stride + (rows - 1) * row_stride +
            (cols - 1) * col_stride + 1)
    storage = [-91.] * size
    for batch in range(batches):
        for row in range(rows):
            for col in range(cols):
                offset = batch * batch_stride + row * row_stride + col * col_stride
                storage[offset] = logical[batch][row][col]
    return Tensor(storage, dtype)


def execute(case, mode):
    import triton
    import triton.language as tl
    from triton.backends.sycl.sycl_utils import run_standalone
    globals().update(triton=triton, tl=tl)

    @triton.jit(do_not_specialize=["m", "n", "k"])
    def kernel(x, y, z, m, n, k, a_rm, a_ck, a_bs, b_rk, b_cn, b_bs,
               z_rm, z_bs, BM: tl.constexpr, BN: tl.constexpr,
               BK: tl.constexpr, BATCHED: tl.constexpr):
        rows = tl.arange(0, BM)
        cols = tl.arange(0, BN)
        inner = tl.arange(0, BK)
        batch = tl.program_id(0)
        if not BATCHED:
            batch = 0
        a = tl.load(x + batch * a_bs + rows[:, None] * a_rm + inner[None, :] * a_ck,
                    (rows[:, None] < m) & (inner[None, :] < k), 0.)
        b = tl.load(y + batch * b_bs + inner[:, None] * b_rk + cols[None, :] * b_cn,
                    (inner[:, None] < k) & (cols[None, :] < n), 0.)
        result = tl.dot(a, b)
        tl.store(z + batch * z_bs + rows[:, None] * z_rm + cols[None, :], result,
                 (rows[:, None] < m) & (cols[None, :] < n))

    _, rank, layout, precision, batch_mode = case.split("_")
    trans_a, trans_b = layout[0] == "t", layout[1] == "t"
    half = precision == "f16"
    batched = rank == "3d"
    batch_count = 3 if batched else 1
    shape_index = (LAYOUTS.index(layout) + PRECISIONS.index(precision) +
                   (BATCH_MODES.index(batch_mode) if batched else 0)) % len(SHAPES)
    m, n, k = SHAPES[shape_index]

    logical_a = [[[(float((batch * 31 + row * 7 + col * 3) % 17) - 8.) / 4.
                   for col in range(k)] for row in range(m)]
                 for batch in range(batch_count)]
    logical_b = [[[(float((batch * 19 + row * 5 + col * 11) % 23) - 11.) / 4.
                   for col in range(n)] for row in range(k)]
                 for batch in range(batch_count)]

    a_rm, a_ck, a_bs = physical_strides(m, k, trans_a, 2 if trans_a else 1, 3)
    b_rk, b_cn, b_bs = physical_strides(k, n, trans_b, 2 if trans_b else 1, 5)
    source_a = [logical_a[0]] if batched and batch_mode == "a" else logical_a
    source_b = [logical_b[0]] if batched and batch_mode == "b" else logical_b
    a_batch_stride = 0 if len(source_a) == 1 and batched else a_bs
    b_batch_stride = 0 if len(source_b) == 1 and batched else b_bs
    dtype = tl.float16 if half else tl.float32
    x = pack_matrix(source_a, a_rm, a_ck, a_bs, dtype)
    y = pack_matrix(source_b, b_rk, b_cn, b_bs, dtype)

    z_rm, _, z_bs = physical_strides(m, n, False, 1, 4)
    z_bs += 5
    out_size = (batch_count - 1) * z_bs + (m - 1) * z_rm + n
    z = Tensor([-99.] * out_size, tl.float32)
    kwargs = dict(a_rm=a_rm, a_ck=a_ck, a_bs=a_batch_stride,
                  b_rk=b_rk, b_cn=b_cn, b_bs=b_batch_stride,
                  z_rm=z_rm, z_bs=z_bs, BM=BM, BN=BN, BK=BK,
                  BATCHED=batched)
    compiled = kernel.warmup(x, y, z, m, n, k, grid=(batch_count,), **kwargs)
    if mode == "compile":
        return {"source_bytes": len(compiled.asm["sycl"])}

    bound = [x, y, z, m, n, k, a_rm, a_ck, a_batch_stride,
             b_rk, b_cn, b_batch_stride, z_rm, z_bs, BM, BN, BK, batched]
    run_standalone(batch_count, 1, 1, compiled.name, compiled.asm["sycl"], bound,
                   signature=compiled.src.signature, metadata=compiled.metadata)

    expected = [-99.] * out_size
    for batch in range(batch_count):
        a_batch = 0 if len(source_a) == 1 else batch
        b_batch = 0 if len(source_b) == 1 else batch
        for row in range(m):
            for col in range(n):
                expected[batch * z_bs + row * z_rm + col] = sum(
                    logical_a[a_batch][row][step] * logical_b[b_batch][step][col]
                    for step in range(k))
    actual = list(z.c_array)
    for index, (got, want) in enumerate(zip(actual, expected)):
        assert got == want, (case, index, got, want)
    return {"checks": 2, "max_abs_error": 0, "shape": [m, n, k],
            "batch_count": batch_count, "broadcast": batch_mode,
            "layout": layout, "precision": precision}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--case", choices=CASES)
    parser.add_argument("--all", action="store_true")
    parser.add_argument("--mode", choices=("run", "compile"), default="run")
    parser.add_argument("--python", default=sys.executable)
    parser.add_argument("--timeout", type=int, default=240)
    parser.add_argument("--jobs", type=int, default=1)
    parser.add_argument("--output")
    args = parser.parse_args()
    if args.case:
        print(json.dumps({"status": "HARNESS", "sha256": SCRIPT_SHA256}), flush=True)
        print(json.dumps(dict(case=args.case, status="PASS", harness_sha256=SCRIPT_SHA256,
                              **execute(args.case, args.mode))), flush=True)
        return
    if not args.all:
        parser.error("choose --all or --case")

    def isolated(case):
        try:
            result = subprocess.run(
                [args.python, str(pathlib.Path(__file__).resolve()), "--case", case,
                 "--mode", args.mode], stdout=subprocess.PIPE,
                stderr=subprocess.STDOUT, text=True, timeout=args.timeout)
        except subprocess.TimeoutExpired as error:
            return {"case": case, "status": "TIMEOUT", "output_tail": str(error.stdout)[-3000:]}
        records = []
        for line in result.stdout.splitlines():
            try:
                records.append(json.loads(line))
            except json.JSONDecodeError:
                pass
        fingerprint = next((row["sha256"] for row in records
                            if row.get("status") == "HARNESS"), None)
        case_rows = [row for row in records if row.get("case") == case]
        if result.returncode == 0 and case_rows:
            row = case_rows[-1]
            row["expected_harness_sha256"] = SCRIPT_SHA256
            row["harness_match"] = fingerprint == SCRIPT_SHA256
            if not row["harness_match"]:
                row["status"] = "INVALID_HARNESS"
            return row
        return {"case": case, "status": "FAIL", "returncode": result.returncode,
                "harness_sha256": fingerprint, "output_tail": result.stdout[-6000:]}

    results = []
    with concurrent.futures.ThreadPoolExecutor(max_workers=max(1, args.jobs)) as pool:
        for row in pool.map(isolated, CASES):
            results.append(row)
            print(json.dumps(row), flush=True)
            if args.output:
                pathlib.Path(args.output).write_text(json.dumps(results, indent=2) + "\n")
    raise SystemExit(any(row["status"] != "PASS" for row in results))


if __name__ == "__main__":
    main()
