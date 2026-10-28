# Register accumulator and matmul tiling composition

2026-10-29, gfx906 (`g09r1n10`) through `wlx -> dfcs`.

## Problem and implementation

The former compiler order ran `matmul_register_tiling` before
`register_accumulator`. Tiling consumed the affine reduction and made the later
accumulator pass a no-op. The resulting kernel was correct, but the pipeline
never applied accumulator promotion to the eligible contraction.

The pipeline now runs work distribution, accumulator promotion, then matmul
tiling. The accumulator pass tags its SCF reduction. Tiling recognizes that
tagged, statically bounded NN f32 contraction, checks allocation ownership,
loop bounds, output uniqueness and index relationships, then expands the
single SSA carry into four carries. It maps each column lane independently and
keeps the original K update order. Unsupported layouts and shapes fall through
unchanged. A dedicated `sycl.register_tile_composed_accumulator` marker records
that tiling consumed the promoted loop.

This is a composable schedule, not a new arithmetic algorithm: standalone
tiling already makes its own four SSA carries. The composition retains that
register-resident recurrence without leaving a redundant affine reduction or
running two transforms over the same loop.

## Correctness and robustness

- The updated CPU IR contract suite passed 109/109. It checks the four
  `iter_args`, four result stores, the composition marker, repeated pass runs,
  pass orders, and rejection of short reductions, tail columns, aliases,
  permuted inputs and insufficient batch distribution depth.
- gfx906 job 22669079 passed all 48 cases: four shapes, all four accumulator /
  tiling toggle combinations, three alternating rounds, and exact output
  checks at local ranges 48 and `(3,5)`.
- Focused gfx906 job 22669193 passed the 32x64x64 NN f32 case with both options
  enabled. The harness asserted the composition marker and exact outputs at
  both local ranges.
- The pass sources compiled and the Triton module linked in the DFCS build.

## Performance comparison

The full before/after runs used the same benchmark harness SHA-256
`d4f6cc6639759de9e86e7c925221b22b95816bf853825727d73caf2be6b67d3c`, three
rounds, 31 device-event samples per row, and identical device settings. All 16
paired configurations produced identical generated-source hashes before and
after, including the nine eligible contraction rows. The median timings for
the both-enabled configuration were:

| Shape | Before (ns) | After (ns) | Change |
|---|---:|---:|---:|
| 4x8x8 | 31,200 | 31,200 | 0.00% |
| 16x32x32 | 239,362 | 240,005 | +0.27% |
| 32x64x64 | 1,142,415 | 1,141,462 | -0.08% |
| 64x16x32 | 421,604 | 420,965 | -0.15% |

These differences are within run-to-run noise; no performance gain is claimed.
The measurable benefit is that the canonical pipeline now applies both pass
stages and verifies their composition while emitting the same device program,
so the ordering fix adds no observed runtime cost. The current tiling pass is
still profitability-limited to its existing verified pattern; this result is
not evidence that tiling wins over accumulator-only on every shape.

## Evidence

- Before: `sycl-validation/next/register-tiling-isolation-22667834.json`
- After: `sycl-validation/next/register-tiling-isolation-22669079.json`
- IR contracts: `sycl-validation/next/pass-contracts-composition-22669079.json`
- Focused device result: `sycl-validation/next/register-tiling-composition-22669193.json`
- Focused device log: `sycl-validation/next/register-tiling-compose-22669193.log`
- Repeatable smoke job: `sycl-validation/next/register-tiling-composition-smoke-dcu.sbatch`
- The first smoke submission (22669181) stopped at the harness checksum before
  compiling or launching a kernel; its log is retained as
  `sycl-validation/next/register-tiling-compose-stale-harness-22669181.log`.
  The corrected submission (22669193) completed successfully.
