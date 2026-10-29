# SYCL Semantic and Optimization Work

Objective started 2026-10-27. The floating-point target is IEEE behavior for
the types and operations supported by this backend. Do not expand an exhaustive
dtype-conversion matrix. gfx906 has no MFMA path in this backend; matrix
optimization is dedicated scalar/vector register tiling.

## Acceptance Criteria

1. Preserve IEEE-visible results for supported inputs: signed zero, infinities,
   NaNs by classification where payloads are unspecified, subnormals, overflow,
   and rounding. Do not introduce implicit fast math or reassociation.
2. Keep fixed tests for reduction operations and axes, boundary masks, dynamic
   shapes, pointer/layout families, grid sizes, local ranges, negative paths,
   and regressions. Current model-like layout suite covers 44 strided, batched,
   transposed, padded, reversed, and broadcast cases; it is representative, not
   a claim of exhaustive coverage of every external model.
3. Implement optimizer decisions as named, independently configurable pipeline
   passes with cache-keyed options, a legality fallback, and evidence-based
   profitability rules. Do not match workload names or benchmark shape lists.
4. For gfx906, measure scalar/vector tiling across layouts, aspect ratios and
   reduction lengths. Do not add an MFMA lowering. Keep a transform disabled or
   guarded when its measured class is unstable or regresses.
5. For each pass, record correctness, robustness, generated-code cost, device
   timing, useful ablations, and interactions with passes that actually match
   the workload. Commit the completed pass and its reproducible evidence before
   moving to the next independent optimization.
6. Use primary compiler-project or paper sources to motivate new candidates;
   remeasure them on gfx906 rather than transferring another target's schedule.

## Current Evidence

- Existing stages include work distribution, group reduction, local-memory
  reuse, elementwise fusion, register accumulator promotion, four-output
  register tiling, and ordered reduction unrolling.
- Vector copies and group reduction are opt-in after limited or negative
  profitability evidence. Reduction unrolling is opt-in. Tiling is opt-in and
  requires two f16 inputs widened to f32 accumulation; f32 requests fall back
  to the original source.
- The 2026-10-29 gfx906 study found f16 tiling gains across initial, held-out,
  and final device matrices. A short tiled reduction combined poorly with
  factor-four unrolling, so the unroll pass skips tiled static trip counts
  below 32. The raw measurements and contracts are in
  `sycl-validation/next/`.
- The full optimization objective remains active. Existing correctness and
  interaction evidence does not establish non-regression for all models or
  every combination of passes.
- Integer LICM was rejected after device timing and removed from production;
  f282d464 records the measured source and negative experiment.
- The accumulator initializer forwarding pass has complete-domain legality,
  an explicit 128-element minimum work gate, bitwise IEEE tests, measured
  tiling/unroll combinations, and paired boundary/fallback experiments. It
  remains opt-in; see sycl-accumulator-init-report.md.

## Next Work

Audit remaining memory, mask, pointer, and dynamic-shape limits against actual
compiler IR and representative Triton programs. Then choose one research-backed
pass at a time, with legality and profitability tested separately. For each
candidate, compare baseline, pass-alone, useful combinations, order variants,
and all-on schedules; preserve source hashes and failed experiments. Avoid
claiming pass independence when the transformations do not both match the
tested program.

The new boundary matrix identifies an 8x16x16 f16 tiling regression. Resolve
that independently and recheck the initializer/tile/unroll combinations before
claiming broad schedule profitability.
