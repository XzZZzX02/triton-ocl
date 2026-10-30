# gfx906 Tiling Output Parallelism Guard

Date: 2026-10-30. Baseline: 82d6275a. Hardware route: wlx -> dfcs.
This follow-up changes the existing sycl-matmul-register-tiling pass. No MFMA,
floating reassociation, fast math or dtype conversion expansion is introduced.

## Finding and implementation

The initializer-forwarding boundary experiment exposed a separate tiling
regression on 8x16x16 NT f16. In job 22683478, untiled/tiled median speed
ratios were 0.9490-0.9622x without initializer forwarding and 0.9633-0.9750x
with it. Improving an initializer pair did not make that tile profitable.
These are within-job comparisons, not a cross-node before/after speedup.

Four-column tiling trades independent output points for scalar reuse. Both
standalone affine and promoted SCF entrypoints now require at least 64
independent output points after tiling in the existing work-distribution
plan. The helper walks static parallel loops from the columns to the plan
root, divides the column extent by four, and multiplies with saturation.
Physical batch loops within that plan count. Separate Triton grid programs
do not count: different work-groups cannot fill one another's wavefronts.

The existing f16-input/f32-accumulation, ownership, distribution depth, static
bounds, index, tail and ordered-recurrence restrictions remain. Small cases
keep the untiled program. The threshold is a minimum-work profitability
guard, not an occupancy calculation or a universal cost model. The option
remains opt-in. No workload names or benchmark shape lists are matched.

## Correctness and robustness

The executable archive audit, python/test/sycl/audit_tiling_wave.py, verifies
exact configuration sets, fingerprints, job terminal states, hardware logs,
nonempty runtime checks, transformation markers and CPU/GPU source equality.
A successful process exit alone is not treated as coverage evidence.

- General pass contracts: 150/150. Boundary cases cover 32/48/60/64/68
  post-tile output points, both entrypoints, idempotence and physical-batch
  counting. Existing negative and distribution checks remain.
- Ordered-unroll contracts: 71/71. Initializer-forwarding contracts: 55/55.
- Historical source checks: initial 56/56 and boundary 40/40. The groups are
  deliberately separate because small enabled programs differ across the
  initializer-threshold versions. They verify original hashes or the exact
  corresponding untiled fallback. These are compile-only checks, not timings.
- Five combined GPU jobs: 120/120 configurations, with 184,320 output/padding
  comparisons. A standalone fallback job: 12/12 with promotion and tiling
  toggles. Its older harness does not record element counts; none is inferred.
- Two complete 44-case layout matrices per device: CPU 88/88 and gfx906
  88/88, each checking 57,352 output/padding elements. Small tile 8x16x16
  proves fallback; wide tile 16x16x32 proves active tiling. Each case compares
  the existing optimized stack and initializer-forwarded stack at local
  ranges 48 and (3,5). The wide f16 cases have accumulator, tile, composed
  accumulator and unroll markers: 44 GPU schedules actually tile. Small
  cases retain unroll/initializer effects and have no tile marker.
- IEEE initializers: CPU 32/32 and gfx906 32/32, each checking 49,600
  output/padding elements. Initializers are both zero signs, 2.5, both
  infinities, NaN and both minimum f32 subnormals. f32/f16 inputs accumulate
  in f32 on 16x16x32 tiles. The test compares non-NaN bits, NaN classification,
  padding, baseline equality and an independent ordered-f32 recurrence.
- All 22 GPU jobs are COMPLETED with exit 0:0. Every device log confirms
  gfx906 and the same libtriton fingerprint; local source matches provenance.

These are actual runtime tests of the new gate. Both layout sizes reuse the
same logical matrices and layout families while compiled tile extents differ.
This is representative layout coverage, not every possible external model.

## Paired device performance

Outputs are checked at local ranges 48 and (3,5), then profiled at local size
64: ten warmups, 31 device events, three alternating rounds, one allocated
device per job. Compilation, process startup and transfers are excluded.
Ratio is median of untiled round medians / median of requested-tile round
medians. Each comparison holds initializer and unroll fixed. Ranges span
four settings of those axes; they are not confidence intervals.

| Shape / layout / f16 input | Requested tiling ratio | Result |
|---|---:|---|
| 8x16x16 / NT | 0.9966-1.0000x | identical untiled-source fallback |
| 8x16x32 / TT | 1.0000-1.0010x | identical untiled-source fallback |
| 16x16x32 / NN | 1.0579-1.0800x | active tile at 64 output points |
| 8x32x16 / TN | 1.0435-1.0675x | active tile at 64 output points |
| 16x32x32 / TT | 1.0754-1.0966x | active larger tile |

All 12 active tiling comparisons improve, including all 36 paired rounds.
Initializer forwarding remains effective on those three active-tile workloads
(about 1.0-2.4% in this set); it is approximately neutral on the fallback
workloads. Ordered unroll remains active when its existing gate permits it.
The K=16 tiled case correctly keeps the prior no-unroll rule. Small timing
changes for identical-source pairs are noise, not optimizer gains.

The gate removes the observed small-case schedule regression and retains
measured benefits at the tested boundary. It does not prove every 64-point
schedule profitable. K length, layout, local size, register pressure and
future passes can still interact. Independent switches do not imply
independent or multiplicative gains. Fusion/group/vector passes do not all
actually transform these dot kernels; no all-passes-active claim is made.

## Evidence and reproduction

Raw JSON, hardware logs, manifests, terminal job states, build log, audit.json,
analysis.json and source fingerprints are in sycl-validation/tiling-wave/.
The pass SHA-256 is
35acace7304cd55e4002232049f39c4979c014dde82ddd5f4a4e8d45baec5fe8.
GPU jobs are 22688636-22688640, 22688642, 22688662-22688669 and
22688780-22688787; manifests map each to its workload.

    python3 python/test/sycl/audit_tiling_wave.py docs/backend/sycl-validation/tiling-wave --output audit.json
    python3 python/test/sycl/analyze_tiling_wave.py docs/backend/sycl-validation/tiling-wave/tile-wave-dcu-*.json --output analysis.json
    python-triton python/test/sycl/model_layout_semantics.py --all --tile-shape small --schedule init-pair --python /path/to/python-triton --output small.json
    python-triton python/test/sycl/model_layout_semantics.py --all --tile-shape wide --schedule init-pair --python /path/to/python-triton --output wide.json

The tiling-wave*.sbatch wrappers pin the measured source. Earlier initializer
or pre-wavefront experiments need their matching compiler and harness;
changing a wrapper checksum alone does not reproduce historical timings.

Overall goal remains active: this bounded suite does not establish all-model
layout coverage, universal profitability, or independence of every pass.
