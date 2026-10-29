# Integer LICM Experiment: Rejected for Enablement

Date: 2026-10-30. Baseline: `34b1910f`. Device route: `wlx -> dfcs`.

## Implementation and decision

The experimental named pass moved invariant scalar integer/index computations
out of static serial affine and SCF loops. It never moved loads, stores,
floating arithmetic, division, flagged overflow arithmetic, conditional
regions, or parallel/distributed loops. Dynamic and single-iteration loops
were unchanged. It was integrated behind a cache-keyed default-off option.

The actual Triton scalar loop lowered to SCF; an affine-only first version
therefore missed it. The revised version moved eight integer/address
computations in that probe, and 4–11 operations in broader scalar/reduction
probes. This established a transformation, not profitability.

The candidate is **withdrawn from the production pipeline and build**. Device
measurements did not demonstrate stable benefit or a profitable IR class.
Keeping it merely because it passed legality tests would not satisfy the
requested optimization acceptance rule. The source and failed experiments
are preserved under `sycl-validation/experiments/licm-20261030/`.

## Correctness and robustness

- Measured-version IR contracts: 20/20. They include chain invariance,
  nested-loop fixed point, no-op paths, idempotence, cache keys, active
  accumulator/distribution composition and pass-order checks.
- CPU: scalar smoke 4/4; broader suite 18/18 with 5,004 output/padding
  comparisons at local sizes 3, 48 and `(3,5)`.
- gfx906 jobs 22681400–22681402: 36/36 scalar configurations across
  rows/columns `(3,32)`, `(16,128)`, `(32,512)`; 444,672 comparisons.
- gfx906 job 22681822: 10/10 scalar copy/varying/nested/dynamic/single-trip
  configurations; 4,260 comparisons. Inputs include NaNs, both infinities,
  signed zeros, normal/subnormal boundaries and largest finite f32. Results
  compare exact non-NaN bits and NaN classification.
- gfx906 job 22681823: 24/24 row-reduction configurations with actual
  promotion and ordered-unroll markers; 2,232 comparisons.
- All five Slurm jobs completed with exit status zero and logged gfx906.

Pass-order testing found that an invariant affine.apply inside a promoted
recurrence prevented ordered unroll. Hoisting before unroll enabled both;
hoisting afterwards could not recover the missed opportunity. This is an
explicit interaction, not evidence that independent toggles imply independent
effects. The measured pipeline put hoisting last. A proposed earlier position
and wide-integer bound guards were saved in `unvalidated-latest/`; they were
not the compiler used for the device results and are not claimed validated.

## Performance

Ten warmups, 31 device-event samples per row and three alternating rounds.
Every comparison is within one job/device, with other settings fixed.
Compilation, startup, and transfers are excluded. Median speed ratio is
baseline / hoisted; near-one values do not establish significance.

| Workload | Paired median ratios | Interpretation |
|---|---|---|
| Scalar, 3×32 | 1.0086× / 1.0012× | noisy; accumulator toggle is a source-identical no-op |
| Scalar, 16×128 | 1.0000× / 1.0000× | neutral |
| Scalar, 32×512 | 0.9975× / 1.0025× | neutral, mixed directions |
| Reduction, accumulator off, unroll 1/4 | 0.9959× / 1.0055× | mixed directions |
| Reduction, accumulator on, unroll 1/4 | 0.9972× / 0.9986× | no measured benefit |

Scalar source shrank nine bytes; reduction source shrank four bytes. Such
small structural changes do not imply a runtime improvement. The two scalar
accumulator settings generated identical programs and are repeated measurements,
not an active accumulator interaction. The reduction test does exercise both
promotion and expansion, and still gives no stable LICM improvement.

## Reproduction and evidence

`invariant-analysis-all.json` contains complete paired comparisons. Its
analyzer rejects incomplete/duplicate groups, missing timing samples and
marker mismatches. Raw device JSON, logs, Slurm status and provenance hashes
are kept alongside it. `measured-source/` contains the actual benchmark, pass
and compiler pipeline; do not use `unvalidated-latest/` to reproduce these
timings. The old sbatch wrappers assume that experimental compiler is installed.
They are historical recipes, not commands for the restored production compiler.

Primary design references are LLVM LICM documentation and MLIR pass docs,
recorded in `sycl-optimization-research.md`. Their discussion of live ranges
and register pressure motivated measuring instead of inferring profitability
from loop-body instruction counts.
