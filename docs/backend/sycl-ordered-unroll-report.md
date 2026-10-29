# Ordered reduction unroll pass

Date: 2026-10-29. Device runs use the authorized `wlx -> dfcs` route.
Floating-point scope follows the user's IEEE requirement; no additional dtype
conversion matrix or MFMA implementation is introduced.

## Implementation

`sycl-ordered-reduction-unroll` is a separate MLIR pass, configured by the
cache-keyed `reduction_unroll` option (1, 2, 4, or 8). The default is 1, a no-op.
The pipeline runs distribution, accumulator promotion, register tiling, group
reduction, ordered unroll and CSE, local-buffer reuse, then vector planning.

An eligible SCF loop must carry both `sycl.thread_private` and
`sycl.register_accumulator`. Bounds must be constant, the lower bound nonnegative,
the step one, and the positive trip count divisible by the factor with at least
two expanded groups. There must be 1–8 SSA carries. The body can contain only
loads from directly allocated memrefs and region-free, effect-free arithmetic;
the expanded body budget is 256 operations. Dynamic bounds, tails, stores,
external loads and nested control flow fall through unchanged. A marker prevents
repeated expansion. Invalid factors fail with a compiler diagnostic.

The pass clones consecutive iterations and connects each copy's yield to the
next copy's iter arguments, including tuples. It does not create partial sums,
reassociate operations, speculate tail iterations, or add fast-math flags.
Thus the original update order is retained while reducing loop-control work
and exposing loads/conversions to later scheduling. This approach has a code
size cost, and a profitable automatic choice is not established here.

Follow-up interaction evidence (2026-10-29): on the final four gfx906
shape/layout pairs, factor-four unroll combined with register tiling regressed
the K=16 case by 2.7% before a guard, but improved K=64 and K=128 cases by
roughly 0.5–1.5%. The pass now detects a `sycl.register_tile` ancestor and skips
static trip counts below 32. The untiled short-loop path remains independently
eligible. This uses IR structure and bounds, not kernel names or shape lists.

## Correctness and robustness

- New IR contracts: 65/65 pass; original pass contracts: 109/109 pass. Tests
  include factors 2/4/8, scalar and tuple carries, nonzero lower bounds, explicit
  SSA dependency-chain checks, negative paths, idempotence, option validation,
  cache-key separation and tiling/accumulator composition.
- Four gfx906 dot jobs: 48/48 configurations pass, covering NN f32, TT fp16,
  NT fp16 and TN f32 with tiling on/off and factors 1/4 over three rounds. Each
  configuration checks exact outputs, masked output sentinels and signed zeros
  at local ranges 48 and `(3,5)` before profiling.
- Job 22673568: 6/6 pass for NN f32 with tiling on/off and factors 1/2/8, including
  NaN, infinities and signed-zero inputs. This is correctness evidence only.
- Generic row-reduction v1 CPU runs: 12/12 ordinary and 12/12 special pass.
  gfx906 jobs 22673329/30/31 pass 16/16 interaction, 12/12 ordinary and 12/12
  special configurations. Operations are sum/max/min/and/or/xor. Ordinary
  inputs also have an independent scalar reference. Special inputs compare
  output bits with factor one, with NaNs checked by classification.
- The v1 special fixture accidentally used only its first seven rows. The v2
  harness expands to 15 active rows plus a masked sentinel, exercising all-NaN,
  both infinities, both zero signs, both minimum subnormals, both minimum normals,
  both largest finite f32 values, mixed NaN/number, opposite infinities,
  cancellation and mixed zeros. It explicitly checks fixture dimensions and
  runs factors 1/2/4/8. CPU v2 and gfx906 job 22673600 each pass 24/24
  configurations, checking 2304 outputs per device across both local ranges.
  IR contracts were rerun and again pass 65/65.

Max/min currently retain first-iteration control flow, so accumulator promotion
and this pass conservatively skip them. Their generated source remains unchanged.
The tuple contract proves preservation of SSA updates; it does not establish
coverage of every possible user-defined tuple reduction on hardware.

## Device-event performance

Ten warmups and 31 event samples per configuration, three alternating rounds
on the same allocated device. Table entries are the median of the three
per-round medians, in microseconds. Speedup is baseline time / expanded time.
All rows use accumulator promotion and local-buffer reuse.

| Shape / layout / input | Untiled factor 1 → 4 | Speedup | Tiled factor 1 → 4 | Speedup |
|---|---:|---:|---:|---:|
| 16×32×32 / NN / f32 | 236.802 → 236.642 | 1.0007× | 239.843 → 240.162 | 0.9987× |
| 16×32×32 / TT / fp16 | 379.686 → 369.927 | 1.0264× | 346.086 → 343.367 | 1.0079× |
| 32×32×64 / NT / fp16 | 1049.615 → 1007.695 | 1.0416× | 910.895 → 901.294 | 1.0107× |
| 64×16×32 / TN / f32 | 468.806 → 469.126 | 0.9993× | 477.927 → 478.566 | 0.9987× |

These samples show modest benefit on two fp16 cases and essentially flat f32
results. They do not establish general profitability, statistical significance
for small deltas, or a universal non-regression guarantee. The option therefore
remains disabled by default. No reduction speedup is claimed from the noisier
generic-row timings.

Factor four adds 900–1329 bytes to untiled generated source and 2232–3376 bytes
to tiled source in this set. Cold compilation and cache-hit timings are mixed
in the harness, so no compilation-time improvement is claimed. Factor two/eight
have contract and correctness coverage, not a performance claim.

## Interactions and limitations

IR contracts verify that promoted, tiled contractions retain four carries and
the unroll marker, including group/reuse passes before or after expansion.
Device tests compare tiling on/off while expansion is active. The generic
row-sum toggle matrix includes fusion/reuse/group options, but fusion and group
are mostly no-ops on that kernel. It cannot prove independence when every pass
actually transforms a model.

IEEE tests establish the listed values and baseline equivalence, not exhaustive
rounding/NaN-payload coverage. Tiling profitability is assessed separately and
is not attributed to the unroll pass.

## Reproduction and provenance

Source SHA-256 for `OrderedReductionUnroll.cpp`:
`ed09f8e7d698f36eaccf0854cb9df59d9f6663463cad7cf93dba6c75ac35941e`.
The source compiled and `libtriton.so` linked in the DFCS build.

- IR: `ordered_unroll_contracts.py --output result.json`;
  the updated contracts pass 71/71 including short tiled fallback;
  tiling contracts pass 122/122 under the DFCS Triton Python.
- Dot: `sycl-validation/next/ordered-unroll-dcu.sbatch`, accepting layout, dtype
  and M/N/K arguments. It pins the current harness SHA.
- Generic reductions: `ordered-unroll-semantics-dcu.sbatch --special --factors
  1 2 4 8`; CPU uses the same harness with `ACPP_VISIBILITY_MASK=omp` and four
  OpenMP threads.
- Raw evidence: `sycl-validation/next/ordered-unroll-*.json` and
  `pass-contracts-unroll-v1.json`. Dots are jobs 22673245, 22673246, 22673332,
  22673333; factor follow-up is 22673568; v2 IEEE run is 22673600.
- First two dot jobs used harness SHA `4b09433d…dc49d`; later jobs use
  `7048375bebb3c2867d8ff24e2488f03bbd2270b62e1d72c033ab6d94c8701dac`,
  which additionally resets output sentinels before each local range.
- v1 generic harness SHA: `88adaee9257e99809b98ae80d61cdb21250423c78b2b8765d21a20d6718a4bbc`.
  v2 SHA: `5dc3a50c8a7315dd5ee7831aa1558f705fad1e8b754e9c4a0afff6b2f01fd54c`.
- Final schedule-interaction GPU jobs: 22677308–22677311 (96/96 PASS);
  analysis: `tiling-guard-analysis-final.json`.

Background sources recorded during design: LLVM/MLIR pass documentation, AMD's
register-pressure article and *A Tiling Perspective for Register Optimization*
(arXiv:1406.0582). This implementation does not reproduce the paper's solver or
claim its reported performance. The table above comes from this repository's
own device measurements.
