# SYCL backend gap implementation and validation

Started 2026-10-27 (Asia/Shanghai). Base: `063d0d38` (`sycl-dev`).
Existing uncommitted runtime/compiler/emitter edits are preserved; a backup of
their initial tracked diff is stored outside the repository at
`/tmp/triton-sycl-pre-gap-changes.patch`.

## Execution plan

1. Correct reduction initialization, arbitrary axes, and tuple results; compare
   baseline and patched compiler/device behavior and commit this gap.
2. Preserve arbitrary memory masks and pointer expressions, including loop and
   runtime bounds; add regressions, compare, report, and commit.
3. Cover transposed/batched dot layouts and a focused fp16 probe; validate,
   report, and commit.
4. Replace externally reachable compiler/runtime aborts with actionable errors;
   add negative cases, validate, report, and commit.
5. Consolidate fixed correctness/negative/regression and grid coverage; document
   repeatable execution, report, and commit.
6. Optimize only after correctness passes; benchmark identical workloads on
   gfx906 with warmups, repetitions, and device timing, report, and commit.

Each gap report records implementation, measured benefits, test commands, and
remaining limitations. Hardware performance is never inferred from host timing.
DFCS access uses the existing authenticated connection on `wlx` (the configured
jump host); direct `ssh dfcs` currently requests password authentication.

## Completed milestones

- Reduction: fb9da051; CPU/gfx906 20/20.
- Memory: 73801725; CPU/gfx906 14/14, downstream reduction 20/20.
- Dot: 061d381d; CPU/gfx906 24/24.
- Reliability: 3cb4418f; host negative contracts 9/9, translator diagnostic exit=1,
  full functional suite CPU/gfx906 58/58.
- Fixed repository test suite: 58 semantics + 9 host failures + translator negative.
- Performance: default CPU/gfx906 58/58; optimization safety 15/15 and long
  reductions 18/18 on both. gfx906 warm sum improves 1.52–1.59x; experimental
  vector copies remain disabled after a measured regression. See performance report.
