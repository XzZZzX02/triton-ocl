# Single-Work-Item Binary16 Copy Repair

Date: 2026-11-01. Baseline: 07aeb915 (compiler behavior from 127ec096).
Device route: wlx -> dfcs; gfx906, AdaptiveCpp 25.10 SSCP / DTK 26.04.

## Diagnosis and Implementation

The rejected local-copy-forwarding experiment exposed a pre-existing failure
in f16 TT8x32x16 dot, logical dimensions 7x29x15, grid=3. With output forwarding
disabled, local size 1 produced 53 wrong outputs; the first mismatch was
index 160, -5.25 instead of -4.3125. Local sizes 3,48,(3,5),64 passed.

Diagnostic job 22800150 compared the unmodified source, A-only volatile-bit
copy protection, B-only protection and protection of both. A-only and both
passed all five local shapes. Original and B-only each failed local size 1
and passed the four larger shapes. These 20 records, including two MISMATCH
outcomes, are preserved in the before/ archive. A diagnostic process exit zero
does not turn mismatches into a passed test. The evidence isolates an effective
storage-emission workaround; no precise upstream miscompilation root cause is
claimed.

The existing named sycl-serial-half-copy-guard pass now classifies a direct
static identity-layout local f16 load-to-store copy under affine loops into:

1. Existing unconditional scalar bit protection for serial copies or the
   separately proved half-output distribution schedule.
2. Conditional protection for ordinary distributed local-to-local copies,
   marked sycl.single_lane_half_bits.
3. Existing fallback when the copy structure/type/ownership is outside scope.

The new path calls two small emitted helpers. At runtime local range size 1,
they load/store the actual uint16_t bits member through volatile-qualified
pointers. For larger local ranges they perform the original aggregate copy.
The condition uses the complete local range product, not only its x axis.
It neither changes work ownership nor inserts a barrier. Existing barriers
remain responsible for cross-work-item synchronization.

Recognition is structural: direct local allocations, static identity layouts,
one-use loaded value, same-block copy, and an explicitly distributed affine
ancestor. It contains no kernel-name, shape, layout-name or small-buffer
whitelist. It applies only to f16 storage copies. No dtype conversions, new
formats, fast math, reduction reassociation or MFMA are introduced.

The pass clears both guard attributes before re-proving selection, so
serial/distributed ownership changes remove stale markers. Unconditional and
conditional markers are mutually exclusive. The SYCL emitter supports both
affine and memref loads/stores. Helper definitions are emitted only when
selected operations need them; f32, NN and serial paths do not acquire unused
helper source. There is no production switch to disable this correctness
repair.

## Structural and Source Validation

- Updated guard contracts: 296, covering the existing 294-case matrix plus
  two stale conditional-marker cases. Both load/store dialect combinations,
  serial/distributed ownership replanning and idempotence are checked.
- Existing suites: general 150, wide terminal stores 241, guarded half stores
  482, initializer forwarding 55, staging 66, ordered unroll 71 and fusion
  destinations 16. All pass on the new compiler.
- Seventy-two archived dot option sets preserve existing optimization markers.
  Forty-four distributed transposed-f16 programs change; 28 nonselected
  programs retain exact source identity. A test-only inverse transformation
  strips the helper and restores the original aggregate copy statements;
  every reconstructed program matches its independently archived old SHA-256.
  This establishes exact control-path reconstruction, not native-assembly
  identity or universal pass independence.

## Runtime Correctness and Performance

All 16 submitted GPU jobs completed with exit 0:0 on one frozen compiler and
translator. The final auditor confirms:

- GPU dot: 120 paired measurement records, 967,692 output/padding comparisons,
  3,720 positive device events. Ten workloads cover all NN/NT/TN/TT layouts
  for f16/f32 at 16x32x32, the original short f16 TT8x32x16 failure and f16
  TT32x16x64, each with fixed base/all schedules and three rounds.
- CPU dot: 18 records and 131,190 comparisons for the four layouts/types and
  short TT failure, each with base/all. The additional larger TT shape is
  GPU-only and is not counted as CPU coverage.
- Raw IEEE copy: CPU and GPU each 100 records and 115,900 bit comparisons.
  The five shapes are 8x16,16x32,32x16,8x64,16x16, with both dialect variants,
  requested serial/distributed ownership and five local shapes.
- Mixed affine/memref copies: CPU and GPU each ten records and 3,910 bit
  comparisons. They exercise memref load + affine store and affine load +
  memref store. The latter uses an explicitly supplied independent test
  schedule; it does not imply expanded generic WorkDistribution support.
- All 296 new/updated guard contracts and the listed existing suites pass.
  All 72 archived source/control-path checks pass. CPU/GPU raw-bit records
  match exactly. Total runtime comparison count is 1,338,502.

The short TT repaired program passes all five local shapes under both
schedules and all three rounds, including the previously failing local=1.
The historical 53-mismatch source SHA matches the test-only reconstructed
baseline exactly. No mismatching baseline output is counted as success.

The runner checks fixed existing base/all schedules, including active accumulator,
tiling, staging, ordered-unroll, initializer and terminal-store combinations.
Each repaired program checks local shapes 1,3,48,(3,5),64 with an independent
reference, resetting output and padding sentinels before every launch.

For paired cost measurement, the pre-fix source is reconstructed only inside
the test harness. It must pass local shapes 3,48,(3,5),64 and the final profiled
output before contributing timings. The known-broken local=1 baseline is
never used for a speedup claim. Three alternating rounds, ten warmups and 31
device-event samples per variant measure the local=64 kernel only; compilation,
process startup and transfers are excluded. Identical-source pairs are noise
controls, not optimizer gains. Performance at other local sizes is not inferred.

The ten active repaired comparisons have aggregate local=64 elapsed-time
changes between -0.1631% and +0.1647% (positive means slower). Detailed costs:

| f16 workload | Base schedule | Full schedule |
|---|---:|---:|
| TT8x32x16 | 0.0000% | +0.0095% |
| NT16x32x32 | -0.0444% | +0.1647% |
| TN16x32x32 | +0.0833% | -0.1592% |
| TT16x32x32 | +0.0420% | -0.1631% |
| TT32x16x64 | -0.0472% | +0.0880% |

The ten source-identical f32/NN control comparisons also vary in both
directions. These small results do not prove zero cost or universal
non-degradation, and no speedup is attributed to the correctness repair.
They show that the conditional path avoids the substantial unconditional
volatile-copy costs measured earlier in this bounded local=64 domain.
Local=1 is evaluated for repaired correctness; its formerly incorrect
baseline cannot support a meaningful performance ratio.

IEEE bit-copy regression uses explicit MemIR, so frontend transpose folding
cannot remove the copy being tested. It covers five shapes, including 8x16
for the small A buffer, affine/memref access variants, requested serial and
distributed ownership and five local shapes. Inputs include signed zeros,
infinities, quiet/signaling NaN payloads, minimum/maximum subnormals, minimum
normals and maximum finite values. Raw uint16_t outputs and padding must match
exactly, without conversions or NaN classification weakening.

## Scope and Reproduction

This repair addresses the demonstrated single-work-item ownership case for
direct local binary16 copies. It does not establish that all unrelated
AdaptiveCpp lowering paths, dynamic/aliased layouts or all models are correct.
The broader backend optimization goal remains open.

Primary reference: https://llvm.org/docs/LangRef.html#volatile-memory-accesses
(retrieved 2026-11-01). LLVM documents volatile access-preservation constraints
and explicitly separates volatile from thread synchronization. That motivates
retaining the established storage workaround, not a proof of the exact
upstream cause. The web tool returned no usable content; the official document
was retrieved with curl.

Test runners: single_lane_half_dot.py, single_lane_half_sources.py, updated
serial_half_copy_bits.py and serial_half_copy_contracts.py under python/test/sycl.
GPU wrappers are single-lane-half-dcu.sbatch and
single-lane-half-bits-dcu.sbatch. The read-only archive auditor is
analyze_single_lane_half.py. Raw sources, samples, logs, submitted scripts,
scheduler states and compiler/source fingerprints are retained under
docs/backend/sycl-validation/single-lane-half/.

Final binary SHA-256 values:

- libtriton.so: b109ccab452f3b7ab9e58fb2d7acdff42a61dd628b54eb2a1ba9f025178c1319
- triton-sycl-translate: 77722519f18ef7ab87b0bda0ed360967e294b3d239cfc22c5ce455248fb28f64

All 16 submitted scripts were captured before scheduler expiry. The final
archive retains their original source, native logs, states and checksum
checks. Ninety-six compile-only records from the previous half-copy dot
runner also validate its updated marker expectations for serial/distributed
ownership; they are separate from counted runtime comparisons.

~~~sh
python3 python/test/sycl/analyze_single_lane_half.py \
  docs/backend/sycl-validation/single-lane-half --output /tmp/single-lane-audit.json
~~~

Local Python compilation, batch-script syntax and handwritten diff whitespace
checks pass. Raw generated source and scheduler output preserve native
trailing whitespace/EOF blank lines so archived fingerprints remain valid.
A SHA-256 manifest covers the evidence; the evidence-only whitespace check
ignores those two categories. No unsupported dtype expansion or all-model
completion is claimed.
