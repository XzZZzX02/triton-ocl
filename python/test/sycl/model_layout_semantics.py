"""Strided, padded, reversed, and broadcast model-like dot regressions."""
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
EXTRA_LAYOUTS = (("nn", "negative_a_rows"), ("tn", "negative_a_k"),
                 ("nt", "negative_b_cols"), ("tt", "negative_b_k"),
                 ("nn", "broadcast_a_rows"), ("nt", "broadcast_b_cols"))
CASES = ([f"layout_2d_{layout}_{precision}_none"
          for layout, precision in itertools.product(LAYOUTS, PRECISIONS)] +
         [f"layout_3d_{layout}_{precision}_{batch}"
          for layout, precision, batch in itertools.product(
              LAYOUTS, PRECISIONS, BATCH_MODES)] +
         [f"layout_2d_{layout}_{precision}_none_{variant}"
          for layout, variant in EXTRA_LAYOUTS
          for precision in PRECISIONS])
SCRIPT_SHA256 = hashlib.sha256(pathlib.Path(__file__).resolve().read_bytes()).hexdigest()
BM, BN, BK = 8, 16, 16
SHAPES = ((5, 11, 13), (7, 9, 5), (3, 16, 15))


class Tensor:
    def __init__(self, values, dtype, pointer_offset=0):
        self.dtype = dtype
        half = dtype == tl.float16
        if half:
            values = [int.from_bytes(struct.pack("<e", x), "little") for x in values]
        ctype = ctypes.c_uint16 if half else ctypes.c_float
        self.c_array = (ctype * len(values))(*values)
        self.pointer_offset = pointer_offset
        self.itemsize = ctypes.sizeof(ctype)

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
    batch_end = (batches - 1) * batch_stride
    row_end = (rows - 1) * row_stride
    col_end = (cols - 1) * col_stride
    minimum = min(0, batch_end) + min(0, row_end) + min(0, col_end)
    maximum = max(0, batch_end) + max(0, row_end) + max(0, col_end)
    guard = 7
    storage = [-91.] * (guard + maximum - minimum + 1 + guard)
    pointer_offset = guard - minimum
    for batch in range(batches):
        for row in range(rows):
            for col in range(cols):
                offset = pointer_offset + batch * batch_stride + row * row_stride + col * col_stride
                storage[offset] = logical[batch][row][col]
    return Tensor(storage, dtype, pointer_offset)


def execute(case, mode, schedule='baseline', tile_shape='small'):
    import triton
    import triton.language as tl
    from triton.backends.sycl.sycl_utils import run_standalone
    globals().update(triton=triton, tl=tl)
    BM, BN, BK = (8, 16, 16) if tile_shape == 'small' else (16, 16, 32)

    @triton.jit(do_not_specialize=["m", "n", "k"])
    def kernel(x, y, z, m, n, k, a_rm, a_ck, a_bs, a_base,
               b_rk, b_cn, b_bs, b_base,
               z_rm, z_bs, BM: tl.constexpr, BN: tl.constexpr,
               BK: tl.constexpr, BATCHED: tl.constexpr):
        rows = tl.arange(0, BM)
        cols = tl.arange(0, BN)
        inner = tl.arange(0, BK)
        batch = tl.program_id(0)
        if not BATCHED:
            batch = 0
        a = tl.load(x + a_base + batch * a_bs + rows[:, None] * a_rm + inner[None, :] * a_ck,
                    (rows[:, None] < m) & (inner[None, :] < k), 0.)
        b = tl.load(y + b_base + batch * b_bs + inner[:, None] * b_rk + cols[None, :] * b_cn,
                    (inner[:, None] < k) & (cols[None, :] < n), 0.)
        result = tl.dot(a, b)
        tl.store(z + batch * z_bs + rows[:, None] * z_rm + cols[None, :], result,
                 (rows[:, None] < m) & (cols[None, :] < n))

    parts = case.split("_")
    _, rank, layout, precision, batch_mode = parts[:5]
    variant = "_".join(parts[5:])
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
    if variant == "negative_a_rows":
        a_rm = -a_rm
    elif variant == "negative_a_k":
        a_ck = -a_ck
    elif variant == "negative_b_cols":
        b_cn = -b_cn
    elif variant == "negative_b_k":
        b_rk = -b_rk
    elif variant == "broadcast_a_rows":
        a_rm = 0
        logical_a = [[batch[0] for _ in range(m)] for batch in logical_a]
    elif variant == "broadcast_b_cols":
        b_cn = 0
        logical_b = [[row[:1] * n for row in batch] for batch in logical_b]
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
                  a_base=x.pointer_offset, b_rk=b_rk, b_cn=b_cn,
                  b_bs=b_batch_stride, b_base=y.pointer_offset,
                  z_rm=z_rm, z_bs=z_bs, BM=BM, BN=BN, BK=BK,
                  BATCHED=batched)
    bound = [x, y, z, m, n, k, a_rm, a_ck, a_batch_stride, x.pointer_offset,
             b_rk, b_cn, b_batch_stride, y.pointer_offset, z_rm, z_bs,
             BM, BN, BK, batched]
    expected = [-99.] * out_size
    for batch in range(batch_count):
        a_batch = 0 if len(source_a) == 1 else batch
        b_batch = 0 if len(source_b) == 1 else batch
        for row in range(m):
            for col in range(n):
                expected[batch * z_bs + row * z_rm + col] = sum(
                    logical_a[a_batch][row][step] * logical_b[b_batch][step][col]
                    for step in range(k))
    schedules = (('baseline', 'optimized') if schedule == 'both' else
                 ('optimized', 'forwarded') if schedule == 'init-pair' else
                 ('forwarded', 'staged') if schedule == 'staging-pair' else (schedule,))
    variants = []
    for selected in schedules:
        options = (dict(register_accumulator=True, matmul_register_tiling=True,
                        fuse_elementwise=True, group_reduction=True,
                        reuse_local_memory=True, reduction_unroll=4)
                   if selected in ('optimized', 'forwarded', 'staged') else {})
        if selected in ('forwarded', 'staged'):
            options['accumulator_init_forwarding'] = True
        if selected == 'staged':
            options['cooperative_load_staging'] = True
        compiled = kernel.warmup(x, y, z, m, n, k, grid=(batch_count,), **kwargs, **options)
        code = compiled.asm['sycl']
        code = code.decode() if isinstance(code, bytes) else code
        memir = str(compiled.asm['memir'])
        markers = {name: name in memir for name in (
            'sycl.register_accumulator', 'sycl.register_tile =',
            'sycl.register_tile_composed_accumulator', 'sycl.ordered_reduction_unroll',
            'sycl.accumulator_init_forwarded')}
        stages = memir.count('sycl.cooperative_load_staging')
        expected_stages = sum(size >= 256 for size in (BM*BK, BK*BN)) if selected == 'staged' else 0
        assert stages == expected_stages, (case, selected, stages, memir)
        if selected in ('optimized', 'forwarded', 'staged'):
            expect_tile = half and BM * (BN // 4) >= 64
            assert markers['sycl.register_accumulator'], (case, memir)
            assert markers['sycl.register_tile ='] == expect_tile, (case, memir)
            assert markers['sycl.register_tile_composed_accumulator'] == expect_tile, (case, memir)
            assert markers['sycl.ordered_reduction_unroll'] == (not expect_tile or BK >= 32), (case, memir)
        assert markers['sycl.accumulator_init_forwarded'] == (selected in ('forwarded', 'staged')), (case, memir)
        checks = 0
        if mode == 'run':
            for local_shape in (48, (3, 5)):
                z.c_array[:] = [-99.] * len(z.c_array)
                run_standalone(batch_count, 1, 1, compiled.name, code, bound,
                               signature=compiled.src.signature, metadata=compiled.metadata,
                               block_size=local_shape)
                for index, (got, want) in enumerate(zip(z.c_array, expected)):
                    assert got == want, (case, selected, local_shape, index, got, want)
                checks += len(z.c_array)
        variants.append(dict(schedule=selected, source_bytes=len(code), markers=markers,
                             cooperative_stages=stages,
                             source_sha256=hashlib.sha256(code.encode()).hexdigest(),
                             elements_checked=checks))
    return {"elements_checked": sum(v['elements_checked'] for v in variants), "max_abs_error": 0,
            "tile_shape": tile_shape, "logical_tile": [BM, BN, BK],
            "schedules": variants, "local_shapes": [48, [3, 5]],
            "shape": [m, n, k],
            "batch_count": batch_count, "broadcast": batch_mode,
            "layout": layout, "precision": precision,
            "variant": variant or "base"}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--case", choices=CASES)
    parser.add_argument("--cases", nargs='+', choices=CASES)
    parser.add_argument("--all", action="store_true")
    parser.add_argument("--mode", choices=("run", "compile"), default="run")
    parser.add_argument("--tile-shape", choices=("small", "wide"), default="small")
    parser.add_argument("--schedule", choices=("baseline", "optimized", "both", "forwarded", "init-pair", "staged", "staging-pair"), default="baseline")
    parser.add_argument("--python", default=sys.executable)
    parser.add_argument("--timeout", type=int, default=240)
    parser.add_argument("--jobs", type=int, default=1)
    parser.add_argument("--output")
    args = parser.parse_args()
    if args.case:
        print(json.dumps({"status": "HARNESS", "sha256": SCRIPT_SHA256}), flush=True)
        print(json.dumps(dict(case=args.case, status="PASS", harness_sha256=SCRIPT_SHA256,
                              **execute(args.case, args.mode, args.schedule, args.tile_shape))), flush=True)
        return
    if not args.all and not args.cases:
        parser.error("choose --all, --cases or --case")

    def isolated(case):
        try:
            result = subprocess.run(
                [args.python, str(pathlib.Path(__file__).resolve()), "--case", case,
                 "--mode", args.mode, "--schedule", args.schedule,
                 "--tile-shape", args.tile_shape], stdout=subprocess.PIPE,
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
        for row in pool.map(isolated, args.cases or CASES):
            results.append(row)
            print(json.dumps(row), flush=True)
            if args.output:
                pathlib.Path(args.output).write_text(json.dumps(results, indent=2) + "\n")
    raise SystemExit(any(row["status"] != "PASS" for row in results))


if __name__ == "__main__":
    main()
