# Accumulator Initializer Forwarding

Date: 2026-10-30. Baseline: f282d464. Hardware runs use wlx -> dfcs,
and every GPU log identifies gfx906. No MFMA or dtype conversion expansion.

## Implementation

The separate pass sycl-accumulator-init-forwarding is controlled by cache-keyed
accumulator_init_forwarding=False. It runs after distribution, accumulator
promotion, register tiling and group reduction, before ordered unroll and
local-buffer reuse. It replaces accumulator initial loads with the exact SSA
constant previously stored by a complete fill, then deletes that fill nest.
The resulting program removes local-memory traffic and one fill-phase barrier;
it does not remove the output buffer, reassociate arithmetic, change the K
recurrence, add fast math or synthesize an identity such as zero.

Legality requires a directly owned, static identity-layout rank1/2/3 allocation;
the first use phase must be a complete constant fill and the next use phase a
complete distributed output nest. Each load must feed exactly one private
promoted recurrence. The matching stores must cover the same output addresses.
The four-lane register tile is accepted only with proven disjoint lane maps.
Views, escapes, intervening readers, extra accesses, conditional output phases,
partial fills and partial output coverage reject the transform. The forwarded
constant must be defined outside the deleted fill.

Profitability is separate from legality. Output buffers below 128 elements keep
their original program: the initial 32-element measurement showed no stable
benefit. This is a conservative static work threshold, not a model-name or
shape-list match, and is not a universal cost model. Boundary tests cover
128/256-element buffers. Default enablement remains off because neither the
threshold nor these measurements prove profitability for every kernel.

## Correctness and robustness

- New IR contracts: 55/55. They exercise exact constants including -0.0,
  nonzero, infinity and NaN; rank1/rank3 storage; aliases, tails and readers;
  work thresholds 1/32/64/127/128/256; idempotence; cache keys; actual
  accumulator/tiling/unroll matches; and forwarding before/after unroll.
- Existing contracts: 122/122. Ordered-unroll contracts: 71/71.
- Initial GPU timing matrix: 144/144 configurations and 336,384 output/padding
  comparisons across six shape/layout/input combinations. Separate special
  input job 22682194: 8/8, including NaN, infinities and signed zeros.
- Final boundary and fallback matrix: 120/120 configurations and 115,200
  comparisons, jobs 22683477, 22683478, 22683480, 22683481 and 22683482.
- Layout suite: CPU and gfx906 each 44/44, each checking 28,676 output/padding
  values with the existing optimized stack and forwarding off/on at local
  ranges 48 and (3,5). It covers transposition, padding, nonunit/negative
  strides, broadcasts and batching; it is representative model-like coverage,
  not every possible external model layout.
- IEEE initializer suite: CPU and gfx906 each 32/32 and 25,024 comparisons.
  Initializers are +0, -0, 2.5, both infinities, NaN and both minimum f32
  subnormals. Actual dot inputs are f32 or f16 with f32 accumulation. Results
  compare exact non-NaN bits, NaN classification and padding sentinels, with an
  independently computed ordered-f32 recurrence as well as baseline equality.

The initial runtime suites used the measured pre-threshold pass. After the
constant-scope protection and work gate, all 56 unique measured dot programs
were recompiled: 52 source hashes stayed identical, and four small-output
enabled requests matched their corresponding disabled programs. The final
44-layout and 32-initializer compile suites were matched to both CPU and GPU
runtime results: 240 source/marker consistency checks passed. This is explicit
source-preservation evidence, not a claim that every old runtime job was rerun
with the final compiler. Boundary jobs execute the final compiler directly.

## Performance

Every row verifies outputs before timing. Protocol: 10 warmups, 31 device events,
three alternating rounds, profiling local size 64. Comparisons hold dtype,
layout, tiling and unroll fixed within one job/device. Values below are the
range over four settings of tiling off/on and unroll 1/4; each ratio is the
median of baseline round medians divided by the median of forwarded medians.
Compilation, startup and transfer are excluded. Ranges are not confidence
intervals, and tiny differences are not treated as significant gains.

| Shape / layout / input | Initializer speed ratio | Interpretation |
|---|---:|---|
| 16x32x32 / NN / f32 | 1.0102-1.0123x | modest improvement |
| 16x32x32 / TT / f16 | 1.0193-1.0232x | improvement with/without active tile |
| 32x16x64 / TN / f16 | 1.0064-1.0115x | modest improvement |
| 8x64x16 / NT / f16 | 1.0248-1.0400x | improvement; more timing variation |
| 16x16x128 / TT / f32 | 1.0005-1.0031x | effectively neutral |
| 8x16x16 / NN / f32, final | 1.0208-1.0249x | boundary-domain improvement |
| 8x16x16 / NT / f16, final | 1.0000-1.0150x | untiled neutral, tiled improved |
| 16x16x64 / TN / f16, final | 1.0165-1.0211x | held-out improvement |
| 8x32x32 / TT / f32, final | 1.0042-1.0117x | modest held-out improvement |

The 4x8x8 fallback job emitted identical source for enabled/disabled requests;
ratios ranged 0.9898-0.9949x despite identical programs. This demonstrates timing
noise/order effects and is not attributed to the optimizer. Active pairs remove
one barrier and 347-448 source bytes in these larger measured cases, with
unchanged local-storage capacity. No compilation-time or end-to-end model gain
is claimed.

## Interactions and limitations

Tiling and initializer forwarding both actually match f16 dot cases; unroll
also matches where its existing trip-count guard permits it. Forwarding gains
remain positive or neutral with those schedules, but marginal gains are not
multiplicative or independent constants. Fusion/group/vector options do not
all transform these dots, so this suite cannot prove every pass is independent.

The boundary matrix independently exposes a pre-existing tiling regression:
8x16x16 NT f16 is 0.9490-0.9622x tiled/untiled speed ratio without initializer
forwarding and 0.9633-0.9750x with it. Initializer pairs improve that tiled
program, but do not make the tile itself profitable. This requires a separate
tiling gate follow-up and must not be hidden in the new pass's gain. The full
thread objective therefore remains incomplete.

## Evidence and reproduction

All evidence is under sycl-validation/accumulator-init/: measured/ preserves
the original source, logs and raw samples; boundary/ executes the final gate;
final/ contains contracts, fingerprints, build log and source consistency.
The final pass SHA is
7385025e2f87f3263d508c9e8d13c828c0e633c828318f550008a38d4e434a03.

From the repository with a DFCS Triton Python and allocated GPU:

    python-triton python/test/sycl/accumulator_init_contracts.py --output contracts.json
    python-triton python/test/sycl/accumulator_init_semantics.py --shape 16 32 32 --layout TT --dtype f16 --rounds 3 --repeats 31 --output timing.json
    python-triton python/test/sycl/accumulator_init_ieee.py --dtype f16 --output ieee.json
    python-triton python/test/sycl/model_layout_semantics.py --all --schedule init-pair --python /path/to/python-triton --output layouts.json
    python3 python/test/sycl/analyze_accumulator_init.py timing.json --output analysis.json

Job wrappers are in sycl-validation/next/accumulator-init*.sbatch. Historical
jobs require their measured source; current wrappers pin the final benchmark
and pass where applicable. Do not use the current gated source to claim a
literal replay of the pre-threshold small-output measurement.

Follow-up 2026-10-30: sycl-tiling-wave-report.md resolves the small f16 tiling
regression using an output-parallelism gate. This report and its raw runs
remain the historical initializer-forwarding experiment; the follow-up reruns
actual tiling, initializer forwarding and unroll combinations separately.
