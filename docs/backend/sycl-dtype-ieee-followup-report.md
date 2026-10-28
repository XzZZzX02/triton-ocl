# SYCL dtype and IEEE arithmetic follow-up

2026-10-29. Validation ran through `wlx -> dfcs` against gfx906. Harness SHA-256:
`fdf90f17e1ba9c34d85a043ca7a4d5820a2d0131018542754c58726029a2e7bc`.

## Change

Extended `python/test/sycl/dtype_semantics.py` from 73 to 77 cases with a
pairwise IEEE arithmetic matrix for fp16, bf16, f32, and f64. Each dtype checks
add, subtract, multiply, and divide over all 64 ordered pairs from +0, -0, +1,
-1, +infinity, -infinity, NaN, and the minimum subnormal. The independent
Python oracle checks NaN classification, values, and signed zero. The runner
prints and verifies a source fingerprint in each isolated worker so stale
remote harness copies cannot be mistaken for valid results. The division oracle
also handles signed zero produced by finite values divided by infinity.

This follow-up adds regression coverage; it does not change compiler lowering.
The prior 73-case dtype implementation remains documented in
`sycl-numerics-report.md`.

## Results

- CPU: 77/77 PASS, with the expected source fingerprint in every result
  (`dtype-matrix-cpu-fdf90f17.json`).
- gfx906: the original full job 22644866 reached 74 cases before its 30-minute
  limit: 73 PASS and `ieee:float16` exited with SIGBUS (-7) in the generated
  process. The failure output contained an AdaptiveCpp data-layout warning.
- gfx906 recovery: isolated job 22645130 passed `ieee:float16`; jobs 22667678,
  22667682, and 22667688 passed the three reductions omitted after timeout.
  Thus every one of the 77 unique cases passed at least once on gfx906. The
  original failure and isolated passes are both preserved in the JSON evidence.
- The first submission used an older wrapper that ignored a case argument, and
  the next `--wrap` attempt loaded the Bash environment under `/bin/sh`; those
  jobs were cancelled/failed before being counted as tests. The verified retry
  command used Bash and node-local temporary directories.

The previous comparable 73-case matrix passed 73/73 on CPU and gfx906. This
follow-up raises the covered matrix by four cases (5.5%); it does not establish
full IEEE conformance for every operation, rounding mode, NaN payload, or dtype
conversion. No compiler or kernel code changed in this follow-up, so there is no
performance delta to claim. Performance remains measured separately in
`sycl-performance-report.md` and the optimization-pass reports.

## Reproduction

Run `dtype_semantics.py --mode run --jobs 1 --timeout 240 --python <python-triton>`
for the full matrix. Use a loader-capable Python in the configured DFCS
environment; gfx906 runs require a Slurm DCU allocation, `ACPP_VISIBILITY_MASK=hip`,
and node-local `TMPDIR` and `ACPP_APPDB_DIR`. The `.sbatch` file verifies the
same source fingerprint before execution and accepts an optional single case.
