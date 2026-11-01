# Local Copy Forwarding: Rejected for Production

Date: 2026-11-01. Baseline: 127ec096. Device route: wlx -> dfcs, gfx906.

## Implementation and Decision

The experimental named sycl-local-copy-forwarding pass redirects readers of
a fully copied local buffer to its immutable source, composing their indices
with the copy permutation. It removes the redundant destination allocation
and the complete copy phase. Accepted copies are perfect static rank 1-3
affine nests, zero-based and unit-step, with one direct affine load/store,
one-to-one source/destination IV permutations, and shapes matching the full
loop domain. Source/destination allocations must be distinct, direct, shared,
static and identity-layout with equal element type/memory space. Partial,
conditional, colliding, arithmetic, alias-producing and multi-store copies
reject. Source writes/deallocation between the snapshot and last forwarded
reader reject. Consumers must remain in later synchronized affine phases;
only default direct affine/memref reads are rewritten.

The pass ran after accumulator promotion, register tiling and ordered unroll,
before local-memory reuse. This retains the logical contraction pattern for
existing scheduling passes, then remaps physical reads and recomputes buffer
lifetimes before storage reuse. It had an independent cache-keyed option,
off by default, and recorded the number of removed copies. It introduces no
MFMA, dtype conversion, fast math or reduction reassociation.

The candidate is **withdrawn from the production build and pipeline**.
Local-memory reduction alone did not satisfy the user's profitability and
composition requirement. It regresses consistently in 13 of 21 active
comparisons, including both baseline and optimized f32 layouts. No justified
general profitability gate emerged. Selecting a kernel/shape whitelist from
the few small gains would not establish a broadly profitable IR class.
The complete measured implementation and reversible patch are preserved in
sycl-validation/local-copy-experiment/measured-source/ and experiment.patch.
Production source and options have been restored to 127ec096.
DFCS was rebuilt after the diagnostic finished. Its restored libtriton.so
matches 26cf1ce392721876a88b8fc3471eaf9fa09af7ca591bc7c5714bad78736e0346,
the accepted half-store compiler, byte for byte. The experimental option and
pass factory are absent, and all 146 prior half-store source checks pass again.

## Correctness and Robustness Evidence

- Contracts: 690/690. Identity and every rank-1/2/3 permutation pair, two
  floating storage types, two reader dialects, four scheduling/reuse orders,
  idempotence, snapshot mutation/alias/partial/dynamic/conditional negatives,
  multiple readers, source mutation after the final use and nontrivial affine
  consumer maps. Permutation correspondence is independently enumerated.
- CPU dot: 32 configurations, 246,880 output/padding comparisons, f16/f32
  NN/NT/TN/TT at 16x32x32, two existing schedules and forwarding off/on.
- GPU dot: 150 successful measurement records, 1,388,700 comparisons and
  4,650 device events. Ten complete jobs cover the same layout/type domain,
  an additional f16 TT32x16x64 shape, and full-stack TT ablations of staging,
  reuse, fusion, accumulator, tiling and unroll. Every successful program
  passes local sizes 1,3,48,(3,5),64 and its profiled output.
- Raw IEEE binary16 copy tests: CPU and GPU each 80/80 records and 108,080
  bit comparisons. Shapes 16x32,32x16,8x64,16x16 cover serial/distributed
  middle ownership, forwarding off/on and five local shapes. Payloads include
  signed zeros, quiet/signaling NaNs, infinities, subnormals and finite bounds.
  CPU/GPU result records match exactly.
- Source/schedule contracts: 144/144 against 72 archived dot option sets.
  All disabled-option sources match exactly. The enabled pass transforms 48
  transposed programs; NN no-op paths preserve source identity. Existing
  accumulator, tile, initializer, staging, unroll and terminal-store markers
  remain present and equal within measured pairs.
- Existing general, terminal-store, half-copy guard, half-store, initializer,
  staging, ordered-unroll and fusion-destination contract suites pass.

These positives establish a tested legality/bit-preservation domain, not
all-model coverage, universally valid pass permutations or profitability.
A C++ build initially redeclared an if-initializer variable in its else branch;
the corrected version was rebuilt before counted tests.

## Performance

Ten warmups and 31 device-event samples per configuration, three alternating
rounds. Compilation/startup/transfers are excluded. Ratios are median baseline
round medians / median forwarded round medians within the same exclusive job,
with the other settings fixed. NN source-identical controls are noise probes.

| Dot | Schedule | Baseline / forwarding |
|---|---|---:|
| f16 NT16x32x32 | base / all | 1.0044x / 0.9795x |
| f16 TN16x32x32 | base / all | 1.0050x / 1.0096x |
| f16 TT16x32x32 | base / all | 1.0038x / 0.9903x |
| f32 NT16x32x32 | base / all | 0.9597x / 0.7934x |
| f32 TN16x32x32 | base / all | 0.9861x / 0.9753x |
| f32 TT16x32x32 | base / all | 0.9501x / 0.8843x |
| f16 TT32x16x64 | base / all | 1.0067x / 0.9929x |

The worst aggregate pair increases time by about 26%. Every one of the 13
regressing pairs loses in all three rounds. f32 TT removes 6,144 local bytes
(14,336 -> 8,192) while still slowing down; f16 TT16x32x32 removes 3,072
(8,192 -> 5,120). This directly contradicts treating less local storage as a
sufficient cost model.

In the separate f16 TT composition job, forwarding with the full stack has
ratio 0.9868. Without staging it is 1.0098; without tiling 1.0052; with no
reuse/fusion/accumulator it still regresses (0.9919/0.9887/0.9871). Without
unroll it is effectively neutral. Preserved optimization markers therefore
do not prove preserved optimization effects. Rewritten access locality is a
plausible contributor; no bank-conflict, cache or instruction-level root cause
is claimed without lower-level profiling.

## Failed Baseline and Follow-Up

The additional f16 TT8x32x16 job 22799792 fails before forwarding is enabled:
only base-enabledFalse source/MemIR were emitted, and the first runtime
comparison fails at output index 160, -5.25 versus -4.3125. No timing or PASS
record is fabricated for this job, and it is excluded openly from paired
performance analysis. It is a pre-existing baseline correctness issue, not
evidence for a forwarding speedup. A diagnostic job separately tests
bit-protected A/B local copies to locate the issue; its outcomes must be
evaluated per record, not from diagnostic process exit zero.

Diagnostic job 22800150 completes 20 records. Original aggregate copies and
B-only protection each fail at local size 1 with 53 mismatches; both pass
3,48,(3,5),64. A-only protection and both-copy protection pass all five local
shapes. This localizes the effective workaround to the A copy in the measured
kernel and single-lane schedule. It does not prove an upstream compiler root
cause or constitute a production fix. Raw modified sources, hashes, mismatch
records and the diagnostic's successful process exit are preserved together.

## Primary Sources and Reproduction

Official MLIR affine-scalrep documentation describes forwarding stores/loads
and eliminating storage after memory-dependence checks. It motivated the
experiment; it does not guarantee that eliminating a shared-memory transpose
is profitable on gfx906. The experiment forwards complete buffers across
synchronized phases rather than invoking affine-scalrep directly.
Source: https://mlir.llvm.org/docs/Passes/#-affine-scalrep
(retrieved 2026-11-01; web search returned no usable content, official page
retrieved with curl). The design note is retained alongside evidence.

The archive contains raw outputs/logs, generated sources, scheduler states,
compiler/harness fingerprints and the complete experiment overlay. Compiler
SHA: 8f6b89887955b5774a2e6f4271c2db2bc008d03124128122aa1d9540ab45ab35.
The unchanged translator SHA is
4521f01b70d1d3ebdac6f90fb57ef237e069d1c1c6be727d2a3fbeb36498f837.
The overlay requires rebuilding that experimental compiler to rerun device
harnesses; those harnesses are not supported commands on restored production.
The read-only analyzer runs on production:

~~~sh
python3 python/test/sycl/analyze_local_copy_experiment.py \
  docs/backend/sycl-validation/local-copy-experiment --output /tmp/local-copy-audit.json
~~~

This rejection preserves the production performance behavior and documents a
real pass interaction. The broader backend goal and the newly exposed short
TT baseline defect remain open.
