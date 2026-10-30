# gfx906 register tiling profitability guard

Date: 2026-10-29. Floating inputs follow the requested IEEE scope; no new dtype
conversion matrix or MFMA lowering is added. Device work uses `wlx -> dfcs`.

Update 2026-10-30: current tiling also requires at least 64 independent
distributed output points after four-column tiling. Earlier eligibility and
small-layout markers in this report are historical. See
sycl-tiling-wave-report.md for the regression, shared gate and actual
two-size runtime validation.

## Finding and change

The previous four-column schedule was legal for both f32 and widened f16
contractions. Legality alone did not establish profitability. In the canonical
pipeline, accumulator promotion already removed repeated accumulator traffic;
tiling f32 then increased execution time on every eligible shape/layout in the
initial measurement set. Independent held-out shapes also exposed a small
standalone f32 regression.

Both standalone and promoted tiling now require two directly loaded f16
operands, widened for f32 accumulation. The decision inspects MLIR value types,
not kernel names, model labels or a list of benchmark shapes. Existing ownership,
index-map, distribution-depth, static-bound and resource-scope restrictions
remain. F32 and mixed inputs preserve the untiled path. The option still
defaults to false: evidence for this bounded input class is not a universal
profitability or non-regression proof.

No arithmetic order is changed. The tile shares left-operand work over four
independent outputs and preserves each output's K recurrence. The guard removes
an ineffective composition rather than replacing the arithmetic algorithm.

The ordered-unroll pass also has a measured interaction guard: when its loop is
inside a register-tile loop, it leaves trip counts below 32 unchanged. A
pre-guard gfx906 run showed factor-four expansion regressing the 16-step tiled
case by about 2.7%; K=32, 64 and 128 cases retained small gains. The rule uses
the tile marker and static loop bounds, not a model or kernel name. The
independently configurable passes remain available, while the short tiled
combination falls back to the tile-only schedule.

## Initial and held-out measurements

All measurements verify scalar-reference output and padding before profiling,
at local ranges 48 and `(3,5)`. Each configuration uses ten warmups, 31 device
events and three alternating rounds. Timings exclude compilation and host data
transfer. Every comparison is paired within one job/device.

The initial complete matrix contains 384 PASS rows: four shapes
`4×8×8`, `16×32×32`, `32×64×64`, `64×16×32`; NN/NT/TN/TT; f32/f16;
accumulator on/off; tiling on/off; three rounds. The smallest shape is a tiling
negative. Job 22669628 timed out after 193 successful rows; only its first
192 rows, constituting complete groups, enter analysis. Eight 24-row shards
(22673352–22673359) complete the other shapes. The 193rd partial-group row is
retained in raw evidence and explicitly excluded.

Held-out shapes were selected before changing the gate: `8×64×16`,
`32×16×64`, `16×16×128`, each with NN/TT and both input types. Jobs 22673650,
22673652–22673656 each pass 24/24, totaling 144/144 rows. They extend aspect
ratio, short and long reductions beyond the initial set. Each node's job log
includes a HIP probe confirming gfx906.

Speedup below is median untiled time / median tiled time over the three rounds.
Ranges span distinct shape/layout comparisons; they are not confidence intervals.

| Input / accumulator | Initial eligible shapes | Held-out shapes |
|---|---:|---:|
| f32 / off | 1.007–1.062× | 0.995–1.033× |
| f32 / on | 0.964–0.994× | 0.990–1.000× |
| f16 / off | 1.094–1.178× | 1.049–1.115× |
| f16 / on | 1.088–1.166× | 1.047–1.107× |

These are pre-guard measurements used to make the current decision. Initial f32
composition regressed about 0.6–3.7%; f16 composition improved about 8.8–16.6%
in throughput. Held-out f16 improvements were smaller but positive. They are
class-specific results, not end-to-end model gains. The current pass skips f32
tiling entirely because standalone f32 results varied across held-out shapes.

The final source was remeasured on four additional gfx906 shape/layout pairs
with unroll factors 1 and 4, three alternating rounds and 31 events per row.
All 96 rows passed exact-output and sentinel checks before timing. For f16,
tiling improved median-of-round medians by 5.2–14.6% with unroll 1 and
5.2–12.8% with unroll 4; every one of the 24 paired rounds was faster. For
f32, tiled and untiled source hashes were identical in all eight comparisons;
timing differences stayed within about 0.35% of parity. The K=16 tiled
factor-four request produced the same source as tiled factor one, confirming
the short-loop unroll gate. For K=64 and 128, factor-four unroll remained
active; the median improvement over factor one ranged from 0.5–1.5% in these
four shapes, with one individual event round near parity. These results test
the interaction rather than assuming the two transformations compose
profitably.

`analyze_tiling_matrix.py` validates complete 12-configuration groups, rejects
duplicate/missing configurations and failed rows, requires 31 samples, and
never pairs different input files. The 192-row prefix must be requested
explicitly; incomplete groups are not silently discarded.

## Verification strategy

IR contracts include f16 acceptance, f32/mixed rejection, batched distribution
depth, aliases, permuted maps, short/tail loops, pass orders and idempotence.
The unroll composition contract now uses f16 so it proves an actually eligible
four-carry tile under the new guard.

`tiling_guard_contracts.py` recompiles every unique configuration from the
initial and held-out measurements. It requires the f16 program to remain
byte-identical to its former generated source. A f32 tiling request must match
the corresponding untiled program's SHA, whether accumulator promotion is on
or off. This establishes source preservation/fallback for the measured set,
not a timing improvement by itself.

`model_layout_semantics.py --schedule both` now checks baseline and enabled
fusion/group/reuse/accumulator/tiling/unroll configurations at both irregular
local ranges. The final GPU run passed all 44 cases and checked 28,676 output
and padding elements. Every optimized f16 case has tile and composed-accumulator
markers; K=16 tiled reductions do not have an unroll marker, while longer f16
reductions do. F32 cases use the untiled path. This validates correctness for
the tested layouts, not profitability on every model. Some fusion/group
transformations do not match dot kernels, so this does not prove all passes
simultaneously active are independent.

Final build and contract results: tiling contracts 122/122, ordered-unroll
interaction contracts 71/71, and source-invariance checks 176/176. The four
layout GPU shards are jobs 22677304–22677307; the final performance jobs are
22677308–22677311. No cold-compilation speedup, universal resource bound or
all-model coverage is inferred.

## Evidence and reproduction

- Initial raw: `register-tiling-matrix-dcu-22669628.json` and
  `register-tiling-shard-dcu-{22673352..22673359}.json`.
- Held-out raw: `tiling-heldout-{22673650,22673652..22673656}.json`.
- Analyses: `tiling-matrix-analysis.json`, `tiling-heldout-analysis.json`.
- Frozen initial harness SHA:
  `652bf296e92f46f2b6f506f4557a0e39ca9c5c9f1a6b2ca12a757541e05e93be`;
  held-out harness SHA:
  `7048375bebb3c2867d8ff24e2488f03bbd2270b62e1d72c033ab6d94c8701dac`.
- Original pass SHA:
  `cc00c018ebaadcb152a3a9e83878d648118d8976b6b3a29c537f2f776ca92c20`.
- Guarded pass SHA:
  `5c71ddf684199885318d6c41d57e4ea20e8e76ce8c7186aac3e2869e9f02b923`.
- Guard benchmark and layout job wrappers: `tiling-guard-dcu.sbatch` and
  `model-layout-optimized-dcu.sbatch`. They fingerprint the harness/source and
  use node-local temporary/appdb/cache directories.
- Final interaction analysis: `tiling-guard-analysis-final.json`; raw device
  rows are `tiling-guard-{22677308..22677311}.json` and
  `layout-optimized-{22677304..22677307}.json`.
- Final ordered-unroll pass SHA:
  `ed09f8e7d698f36eaccf0854cb9df59d9f6663463cad7cf93dba6c75ac35941e`;
  current register benchmark harness SHA:
  `054701901cce832ad8089041b83f79306118964bd7c7355bca2ce85e5836736f`.

The older full-matrix wrapper now points to the frozen harness path instead
of the evolving repository script. Replaying a historical timing experiment
also requires its matching compiler revision, not only its old Python harness.
