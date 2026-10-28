# SYCL IEEE reduction coverage follow-up

Date: 2026-10-29. GPU validation used `wlx -> dfcs`, Slurm job `22668138`,
node `g09r1n02`. Harness SHA-256:
`0f9de798f62da6e75828c542535abb667bcaadbf6bba8048c8ea88a0c21b275a`.

## Change

Added four `ieee_reduction` cases to `python/test/sycl/dtype_semantics.py` for
fp16, bf16, f32, and f64. Each case reduces eight rows with `sum`, `max`, and
`min`, covering all-negative and all-positive values, one NaN, all NaNs,
opposite infinities, mixed signed zeros, all positive infinities, and all
negative infinities. Outputs are checked by value or NaN classification, with
zero signs checked explicitly. Each case runs with local shapes 48 and `(8,8)`.
Added `--cases` to run a selected subset while leaving the default full matrix
unchanged.

The oracle follows Triton's default `tl.max`/`tl.min` behavior:
`PropagateNan.NONE` ignores a single NaN when combined with a number, while an
all-NaN reduction remains NaN. An initial oracle expected a mixed NaN to
propagate; the CPU result exposed that test mistake, and the expected result
was corrected to the API contract. No backend lowering change was needed.

## Before and after

Before this follow-up, the 77-case dtype matrix used ordinary small values for
its per-dtype reductions. Separate f32 collective tests covered selected NaN
and signed-zero cases, but the corresponding cases were absent for fp16, bf16,
and f64. Afterward, the new matrix checks 24 outputs per dtype in each of two
launch configurations: 192 output comparisons per device, plus NaN and zero
sign assertions.

| Measure | Before | After |
|---|---:|---:|
| IEEE reduction dtype cases in this matrix | 0 | 4 |
| Added scalar output comparisons per device | 0 | 192 |
| CPU | not covered by this matrix | 4/4 cases pass |
| gfx906 | not covered by this matrix | 4/4 cases pass |
| Compiler/runtime code changed | no | no |
| Performance change | none measured | none expected from test-only change |

This improves regression detection and does not claim a runtime semantic fix
or a kernel speedup. The existing reduction implementation passed the added
contract checks. No performance benchmark was needed because generated
compiler code is unchanged.

## Validation

- CPU: `ieee_reduction:{float16,bfloat16,float32,float64}`, two local shapes
  per case; all pass. Evidence: `sycl-validation/next/ieee-reduction-cpu-0f9de798.json`.
- gfx906: same four cases and local shapes; all pass in job `22668138`.
  Evidence: `sycl-validation/next/ieee-reduction-dcu-22668138.json` and
  `sycl-validation/next/ieee-reduction-dcu-22668138.log`.
- The result JSON records the expected harness SHA and confirms it matched on
  each case. `python3 -m py_compile` and `git diff --check` pass locally.

To reproduce on an allocated gfx906 node, submit
`sycl-validation/next/ieee-reduction-dcu.sbatch`. The CPU run uses
`ACPP_VISIBILITY_MASK=omp`, the `numerics-v6-python` validation snapshot,
`TRITON_ALWAYS_COMPILE=1`, and the same four `--cases` arguments as the batch
script.

## Scope

This closes a fixed-test gap for the four IEEE floating formats and these
reduction inputs. It does not add exhaustive rounding or NaN-payload coverage,
cover every reduction axis/shape, or expand fp8 semantics. The existing full
dtype/conversion and reduction suites remain separate checks.
