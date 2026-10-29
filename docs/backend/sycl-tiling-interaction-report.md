# Matmul tiling interaction report

Date: 2026-10-28 (Asia/Shanghai). Device: gfx906:sramecc-:xnack- via wlx -> dfcs.

Update 2026-10-29: the f32 eligibility described below is historical and has
been superseded by the input-type profitability gate in
`sycl-tiling-profitability-report.md`. Current tiling requires two f16 loaded
operands with f32 accumulation; the earlier f32 measurements remain as
evidence for why that path was disabled.

## Finding and implementation

The static 4-column register tile was applied to a contraction even when the
output loops would execute serially. For 32x64x64 NN f32, enabling the tile
without work distribution made standalone execution exceed 30 seconds; the
same shape without tiling and with register-accumulator promotion completed.
The timeout was in execution, not C++ compilation. A 16x16x16 case completed,
so small-shape smoke tests alone did not expose the issue.

The tiling pass now requires an enclosing `sycl.distribute` plan whose depth
covers every loop from the plan root through the output column loop.
`work_distribution` runs before tiling in the normal pipeline. When
distribution is disabled or legality is not proven, tiling leaves the original
loops in place. This gate is based on the verified schedule, not a kernel name
or workload dimensions.

## Correctness and robustness

- Before the gate, gfx906 32x64x64 NN f32 with all passes enabled timed out at
  both local shapes `(48)` and `(3,5)` when work distribution was disabled.
- After the gate, the same all-options request passed at both local shapes.
  The emitted source hash equals the register-accumulator-only fallback hash,
  confirming tiling was skipped.
- With work distribution enabled, the tiled 32x64x64 kernel passed both local
  shapes and exact output checks after the depth-aware gate. The 31-event device
  median was 1,150,389 ns.
- The independent IR contract suite passed 104/104, including no-plan rejection,
  eligible static and batched contractions, insufficient batch-depth rejection,
  short/tail/alias/permuted rejection, repeated pass execution, and pass-order
  combinations.
- `git diff --check` and Python syntax checks passed.

The untiled and tiled baseline ablation before the gate measured 8,661,836 ns
and 1,144,011 ns respectively for 32x64x64, and 17,433,676 ns and 1,669,943 ns
for 64x64x64. Those measurements include different pass configurations and
show the value of distributed execution plus the current optimization stack;
they do not isolate tiling's individual performance contribution. The gate's
post-change distributed measurement is within the earlier tiled sample range.
No new independent speedup claim is made here.

## Evidence

Raw files are `sycl-validation/next/register-ablation-v2-32x64x64.json`,
`register-ablation-v2-64x64x64.json`, `register-ablation-debug-16x16x16.json`,
`tiling-gate-serial-32x64x64.json`, `tiling-gate-distributed-32x64x64.json`,
`tiling-gate-v2-serial-32x64x64.json`,
`tiling-gate-v2-distributed-32x64x64.json`, and `pass-contracts-v15.json`.
GPU follow-up jobs: 22633508 on g09r1n10 and 22633568 on g06r2n12. Both nodes
reported gfx906:sramecc-:xnack-.

The earlier ablation's 32x64x64 undistributed row remains a failure record; it
is retained as regression evidence. The bounded 4-column pass still supports
only its verified static f32 contraction form. Full dtype, IEEE, and model
layout coverage remains outstanding.
