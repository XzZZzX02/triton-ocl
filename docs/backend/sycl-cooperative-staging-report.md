# Cooperative Load Staging: Implementation and Validation

Date: 2026-10-31. Baseline: 7be15ce6. Target: gfx906 through wlx -> dfcs.
The opt-in pass passes the bounded correctness, robustness and performance
gates below. All 31 accepted GPU jobs completed with exit 0:0.
No all-model profitability or pass-independence claim is made.

## Implementation

The scalar-memory lowering constructs external-load-to-local-buffer loops that
lack parallel annotations. Their input copies execute on the original scalar
owner even when subsequent compute is distributed. The independent
sycl-cooperative-load-staging pass proves those copies can be distributed,
changes the unique local memref.store into affine.store, and annotates the
parallel loop nest. Existing work distribution and the emitter own lane
assignment and local barriers. Neither predicates nor address arithmetic move.
The cache-keyed cooperative_load_staging option defaults to False. Its pass
runs immediately before work distribution and is skipped when distribution is
disabled. No MFMA, new allocation, floating reassociation or dtype matrix is
introduced.

The gate accepts only static, full-domain, zero-based, unit-step rank 1-3
perfect affine nests with at least 256 elements. The destination must be a
direct identity-layout allocation with no alias-producing users. Each local
coordinate must be the corresponding induction variable. Only external reads
from function arguments, scalar mask branches, arithmetic and the single
local store are permitted. Captured values must be group-uniform. In this
backend gpu.global_id means the Triton program/work-group ID, as documented
by emitGlobalId; it is not a general MLIR interpretation of that operation.

Nested phases, dynamic bounds, local reads, duplicate writes, unknown effects,
unknown memory attributes, non-default nontemporal attributes, volatile stages
and lane-dependent captures fall back. A prior external write also prevents
cooperation: the existing phase barrier fences local memory, so aliasing
external reads must not change owner without a global-fence/noalias proof.
Volatile loads receive a preservation marker in scalar lowering; this is a
staging rejection rule, not a claim that the existing emitter implements full
volatile hardware semantics. The 256-element threshold is an opportunity
guard, not a universal cost model.

## Completed Evidence

The compiler and binary stayed frozen throughout validation. The pass SHA-256 is
b2f52ad003966ce501f84c961b3bb546e53f0ff7ddd66263d2c924b0b719fba6;
libtriton.so is
e2e2983c2e8cc7927fca131fca1351339b99d206a4bc56d582adb5bbacc6d700.
The archive records every other source fingerprint.

- IR contracts: 66/66, including rank 1/2/3 positives, rank 4 rejection,
  masks, alias/escape/effect negatives, idempotence and pass orders with
  distribution/reuse. The initial 60-case suite is retained separately.
- CPU model layouts: 88/88, 57,352 output/padding comparisons. Both 8x16x16
  and 16x16x32 logical tiles test NN/NT/TN/TT, rank 2/3, padding, non-unit
  stride, reversed dimensions and broadcast dimensions/batches. Each compares
  forwarded and staged stacks at local ranges 48 and (3,5). These are 44
  representative layouts at two tiles, not all possible model layouts.
- CPU boundary suite: 84 executed configurations, 259,272 output/padding
  comparisons; four additional configurations reproduce an existing fusion
  compile failure and are explicitly excluded from runtime passes. Cases
  cover a true index-buffer gather, 3D grid, negative runtime stride, empty
  domain, invalid masked addresses, rank-3 input, volatile, nested loop,
  small-domain and undistributed fallback, and an active group reduction.
- CPU reuse pairs: 8/8, 24,744 comparisons. Disjoint buffer lifetimes still
  reduce storage from 2048 to 1024 bytes. Overlapping lifetimes stay at 2048.
  The load after a prior external write remains serial; the earlier load can
  cooperate. A vector option probe generated no packed loads/stores in these
  kernels and supplies no evidence of an active vector-pass interaction.
- GPU layout matrix: 88/88, 57,352 comparisons. Every CPU/GPU schedule
  has an identical source hash, active markers and output-check count.
- GPU boundary suite: 252 executed configurations and 12 recorded known
  fusion compile failures across three rounds. GPU reuse pairs: 24/24.
  All 21 performance jobs together execute 372 configurations (plus those
  12 compile failures) and compare 1,305,216 output/padding elements.
- IEEE dot initializer pairs: CPU 32/32 and gfx906 32/32, with 49,600
  output/padding comparisons per device. Both zero signs, finite, infinities,
  NaN and positive/negative f32 subnormals are checked against an independent
  ordered-f32 recurrence and the unstaged output; f32/f16 inputs accumulate
  in f32 with the existing accumulator/tiling/unroll/initializer stack.
- Existing regression contracts: general 150/150, ordered unroll 71/71,
  initializer forwarding 55/55 on the frozen compiler.
- Original CPU copies/dots: 36/36, including seven IEEE-special memory cases
  (NaN class, infinities, both zero signs and subnormals) and f32/f16 dot.
- Initial GPU jobs 22714938-22714945: 96/96 executed configurations,
  453,168 comparisons, all jobs COMPLETED exit 0:0 and confirmed gfx906.

## Initial Paired Device Performance

Each row is a separate device job. Each configuration checks local ranges
3, 48 and (3,5), resetting sentinels each time, then profiles local size 64
with ten warmups and 31 events. Three rounds alternate configuration order.
Ratios are median baseline round medians / median staged round medians.
Compilation, process startup and transfer time are not measured here.

| Workload | Existing stack off | Existing stack on |
|---|---:|---:|
| dot 16x32x32 f32 NN | 2.7549x | 2.9614x |
| dot 16x32x32 f16 TT | 2.3265x | 2.6743x |
| dot 32x16x64 f16 TN | 2.6367x | 3.1402x |
| dot 8x32x32 f32 NT | 4.4161x | 4.5171x |
| copy B256 n1021 | 1.8211x | 1.8211x |
| holes B1024 n4093 | 2.3846x | 2.3991x |
| formula gather B256 n1021 | 2.5647x | 2.5322x |
| broadcast B256 n1021 | 1.4311x | 1.4440x |

All 16 comparisons and all paired rounds improve. Formula gather means
(lane*7+3)%n, not an index-buffer read; the latter is a separate boundary
case. The analyzer requires exact config sets, 31 positive raw samples per
row, matching medians, stable source across rounds, unchanged local storage,
preserved other-pass markers, and the expected added distribution roots.
Accumulator/tiling/unroll/initializer effects remain present where applicable.
The existing combined dot stack still improves with staging; these results
do not isolate every pass's individual speedup or imply multiplicative gains.

## Boundary and Active-Pass Performance

The 11 boundary jobs and two reuse jobs use the same ten-warmup/31-event,
three-alternating-round protocol. Staging is paired at fixed fusion/reuse
settings. All 32 active comparisons improve; the other 14 comparisons have
identical before/after source and are fallbacks, not measured optimizer wins.
Together with the initial matrix, all 48 active comparisons improve, including
all 144 paired rounds. Speedup ranges span fixed-option comparisons, not
statistical confidence intervals.

| Additional workload | Staging ratio across fixed settings |
|---|---:|
| 3D grid / boundary tail | 1.7625-1.7846x |
| Negative runtime stride | 1.7634-1.7778x |
| Empty logical domain | 1.6667-1.7000x |
| True index-buffer gather | 1.2527-1.2654x |
| Rank-3 input with holes | 3.6631-3.6968x |
| Sum with an active group collective | 2.3768-2.4215x |
| Vector option requested, no packed transform | 1.8117-1.8157x |
| Sequential buffer lifetimes | 1.3096-1.3211x |
| Overlapping buffer lifetimes | 1.9570x |

The sum kernel actually fuses (three Linalg generics become two) and retains
its collective when staging changes. Fusion improves that kernel by
1.0236-1.0266x without staging and 1.0355-1.0357x with staging. Sequential
buffer reuse still halves local storage and improves measured runtime by
1.0166x without staging and 1.0255x with staging. These bounded interactions
are positive but do not establish independence for arbitrary kernels or
orders. The original tensor-loop fusion compile failure remains contrary
evidence to a universal pass-composition claim.

## Failures and Remaining Gates

The first eight layout launches 22727228-22727235 failed before compiler
execution because child processes bypassed the ELF-loader Python wrapper.
They are retained, excluded from runtime coverage and retried only after
terminal states were confirmed. Corrected wrappers explicitly pass --python.
An initial submission helper also had a Python string escape error; no jobs
were submitted by that invocation.

A boundary probe exposed unsupported tt.get_num_programs lowering. Explicit
grid parameters are used for the 3D-grid test; support for tl.num_programs is
not claimed. A tensor recurrence with elementwise fusion fails one-shot
bufferization with "Yield operand #0 is not equivalent to the corresponding
iter bbArg" before staging. The failure occurs with staging off and on.
The suite records it as EXPECTED_COMPILE_FAILURE, not PASS; it remains an
outstanding backend interaction to fix separately.

All 31 accepted GPU jobs are terminal and the complete archive passes
audit_cooperative_staging.py (audit.json). All 48 active timing comparisons
and all 144 paired rounds improve; fallback pairs have identical source.
This establishes the reported measured domain, not universal profitability.
The option remains off by default. The pre-existing fusion failure is retained
as contrary evidence to arbitrary pass independence and is a separate fix.

## Reproduction

Raw evidence is in sycl-validation/cooperative-staging/. Scheduler script
transcripts have redundant terminal newlines removed; commands are unchanged. The next/ sbatch
wrappers pin measured compiler, binary and harness fingerprints. Use the
matching source versions; changing a checksum alone does not reproduce data.

    python3 python/test/sycl/analyze_cooperative_staging.py docs/backend/sycl-validation/cooperative-staging/staging-dcu-*.json --output initial-analysis.json
    python-triton python/test/sycl/cooperative_staging_contracts.py --output contracts.json
    python-triton python/test/sycl/model_layout_semantics.py --all --schedule staging-pair --tile-shape wide --python /path/to/python-triton --output layouts.json
    python3 python/test/sycl/audit_cooperative_staging.py docs/backend/sycl-validation/cooperative-staging --output audit.json

The audit checks exact configuration sets, CPU/GPU source equality, actual
submitted scheduler scripts, binary checksums, all terminal job states and
raw positive timing samples. It also retains the known compile failures
without counting them as runtime passes. The prior tiling-wave audit uses
its frozen measured layout harness and still passes; it is a historical audit,
not execution of the new staging compiler. Official
AMD memory-access guidance and MLIR dependence/parallel semantics are recorded
in sycl-optimization-research.md; measured backend behavior is the evidence
for speedups. Overall goal remains active.
