# Serial IEEE Binary16 Local Copy Guard

Date: 2026-10-31. Baseline: c5906032. Target: gfx906, wlx -> dfcs.

## Problem and Implementation

Full-stack ablation uncovered a correctness failure in the serial fallback
for a 16x32x32 TT dot with binary16 inputs and f32 accumulation. Logical
dimensions are 15x29x31, grid=3, with seven sentinel elements after output.
The first output was -4.5 instead of -5.125. On the captured default serial
schedule, 1,305 of 1,543 output/padding elements differed. CPU execution passed.

The failure persists without register accumulator promotion, with promotion
and unroll=1 or 4, with local range 1, and after disabling LLVM loop
vectorization/interleaving. Stage extraction from the exact generated kernel
isolated corruption in the A local transpose: 656 incorrect elements, including
zeros in even columns. Its global load, and both B stages, passed. Disabling a
high-level scheduling optimization did not repair this serial path.

The diagnostic compares aggregate copies, ordinary .bits member copies, and
volatile uint16_t member accesses. The first two fail all four local ranges;
the last passes all four. This establishes an observed toolchain-sensitive
failure and an effective workaround on AdaptiveCpp 25.10 SSCP / DTK 26.04
gfx906. It does not identify a proven upstream LLVM/AdaptiveCpp root cause.

The new named pass, sycl-serial-half-copy-guard, runs after all scheduling in
make_memir. It recognizes direct affine/memref load-to-store copies between
static identity-layout f16 memref.alloc buffers, under an affine loop, in the
same block, where the loaded value has one use. It also accepts a serial
local-to-external output copy whose destination is a one-element f16
reinterpret view of an unranked function argument. Distributed ancestors reject
the guard. Both operations receive sycl.scalar_half_bits. The SYCL emitter
then reads/writes the actual uint16_t bits member through volatile-qualified
pointers. No floating arithmetic, conversion, rounding, index map, mask,
barrier or ownership plan changes. No MFMA or dtype matrix expansion is added.

This is an always-on correctness repair, with no unsafe production bypass.
Every invocation clears old guards and re-proves selection. It is idempotent
and handles ownership changes before replanning. Dynamic local buffers,
nonidentity layouts, external input sources, wider/ranked output bases,
arithmetic/multiuse values and SCF-only loops are
outside this guard's proven boundary. Rejection leaves existing emission; it
does not assert that every rejected case is independently bug-free.

LLVM's Language Reference, “Volatile Memory Accesses”, documents preservation
of volatile access count/order and restrictions on merging or changing the
types of target-legal volatile loads/stores. Volatile is not cross-thread
synchronization; the backend's existing barriers remain necessary. This
documentation explains the chosen emission constraint, not the precise cause
of the observed corruption. Primary source: https://llvm.org/docs/LangRef.html#volatile-memory-accesses
(retrieved 2026-10-31 with curl; BPS search returned no content).

## Structural Validation

- New contracts: 294/294. The 240-case product covers f16/f32/bf16 (the latter
  two only selection negatives), both load dialects x both store dialects,
  serial/distributed, and ten copy/negative/stale variants. Six additional
  cases replan serial -> distributed -> serial ownership. Each product case
  also verifies pass idempotence. Forty-eight output-copy cases cover both
  memory dialects, f16/f32, distribution and scalar/wide/ranked views. BF16 is
  not new runtime/dtype support.
- Existing suites: general 150, initializer forwarding 55, staging 66,
  terminal store 241, fusion destinations 16, ordered unroll 71: all pass.
- Archived full-stack source comparison: 72/72 configurations preserve the
  expected other-pass markers. Exactly four serial f16 transposed sources
  change; all 68 others are byte-identical, including distributed and f32
  paths. This is bounded composition evidence, not universal pass independence.

## Device Validation and Cost

The strict dot regression passes on CPU and gfx906: 96 configurations and
148,128 output/padding comparisons per device, with identical compiler output
and coverage records. GPU job 22744899 completed with exit 0:0. CPU raw-bit
copy tests on the initial guard pass 64 configurations and 86,464 element
comparisons. The final extended guard also passes 64/64 configurations and
86,464 raw-bit comparisons on each device, with identical source/coverage
records. Final gfx906 shards 22745700-22745703 all complete with exit 0:0.
The archive auditor confirms exact configuration sets, compiler markers,
output counts, raw special-bit inputs and CPU/GPU record equality.

The first GPU bit-copy run exposed an additional failure: after a distributed
transpose, the serial local-to-global output copy emitted zero for the first
element of groups 1 and 2. Protecting the input phase or middle transpose alone
does not repair it. Protecting the output phase passes all four local ranges;
protecting all phases also passes. These 20 diagnostic records retain 12
MISMATCH and eight PASS outcomes; their process exit zero is not a test pass.
The guard therefore includes the narrowly defined serial output copy above.
Final source replay proves that this extension leaves all 72 measured dot
sources and all 96 strict-dot source/guard records identical to the measured
compiler. All existing contract suites pass again on the final binary.

Full-stack ablation passes all six workloads: 216 configurations, 751,032
element comparisons and 6,696 device events, in jobs 22745330-22745335, each
COMPLETED 0:0. Baseline/all ratios are 3.8842x (f16 TT16x32x32), 4.9871x
(f32 NN16x32x32), 3.8863x (f16 TN32x16x64), 3.5979x (f16 NT16x16x32),
2.3586x (f16 TN8x32x16) and 4.6474x (f16 NN16x16x128). These compare the
entire enabled stack against its defined distributed baseline, not speedups
from the correctness guard. Of 35 changed-source single-pass ablations, 33
have aggregate ratio above one and one has ratio exactly 1.0 (TN8x32x16
initializer forwarding). TT initializer forwarding has ratio 0.997981
and mixed rounds [0.994736, 1.001135, 0.998369], so universal non-degradation
or independence is not established. No-op/source-identical pairs remain
separate. Earlier small regressions are retained in before/ rather than hidden.

Paired guard-cost job 22745565 completes 30 configurations, 930 device events
and 162,330 element checks. On previously correct serial transposed baselines,
the final copy guard costs 1.6575% (TN32x16x64), 9.3335% (NT16x16x32) and
3.8739% (TN8x32x16). The f16 NN16x16x128 and f32 NN16x32x32 controls have
identical source; their -0.0052%/+0.00044% variations are measurement noise.
These costs are accepted for correctness; no performance win is attributed
to volatile access, and no timing comparison is made against the broken TT
baseline. The measured dot sources remain identical after the output extension.

The output-copy extension has a substantial measured cost on two otherwise
correct serial controls: 16x32 increases from 141,442 ns to 316,325 ns
(2.2364x time, +123.64%); 16x16 increases from 55,521 ns to 150,402 ns
(2.7089x time, +170.89%). Jobs 22745756/22745757 complete 12 configurations,
372 events and 83,448 exact bit checks. Each baseline and guarded variant
passes local ranges 1,3,48,(3,5),64 and its profiled output. This cost is not
hidden by the dot results: the narrow serial output repair is necessary for
the demonstrated ownership combination, while a future cheaper proven
emission strategy remains performance work. No profitability gate may re-enable
the known incorrect path. Initial three-minute jobs 22745732/22745733 timed
out during compilation and are excluded from paired conclusions; full
15-minute reruns completed. Two accidentally duplicated pending reruns were
cancelled before execution. All intermediate states are preserved.

The dot runner checks four layouts, serial/distributed, accumulator off/u1,
on/u1 and on/u4, at local ranges 1, 3, 48 and (3,5). It resets output/padding
sentinels and uses an independent exact quarter-fraction reference. The
bit-copy runner uses explicit MemIR so front-end transpose folding cannot
remove the copy under test. Four shapes and both memory dialects cover raw
IEEE signed zeros, infinities, quiet/signaling NaN payloads, subnormals,
minimum normals and maximum finite values; it compares uint16_t storage
exactly without conversions. Requested distribution that is not proved must
retain serial guards.

Performance comparisons use only baselines that pass correctness checks.
The original TT failure cannot support a speedup/regression claim. A separate
test reconstructs the pre-fix source by removing guard attributes, checks its
SHA against the archived program, and validates every timed local range and
profile output. This is test-only reconstruction, not a runtime escape hatch.
Three alternating rounds, ten warmups and 31 device events per variant exclude
compilation, process startup and data transfer. Source-identical pairs are
controls, not optimizer gains. Full-stack ablation separately holds all other
options fixed and openly records regressions, no-ops and pass interactions.

## Evidence and Reproduction

Raw evidence: docs/backend/sycl-validation/serial-half-copy/.
Old failures are preserved under before/, including diagnostic non-successes
even when the diagnostic process itself exited zero. Initial invalid test
fixtures (unescaped Python newlines, an SCF induction variable used as an
affine dimension, and a front-end-folded transpose) were corrected before
counting final results. The first tiling-guard replay omitted its required
measurement inputs; no success is claimed for that invocation. The 72-source
  comparison uses the actual archived full-stack option sets instead,
  including the separately dumped TT failure after the first 11 records.

Remote C++ build: ninja -j8 -C build/cmake.linux-x86_64-cpython-3.11 triton triton-sycl-translate.
The installed translator is a regular file and was explicitly refreshed from
the build output before testing. Both binary fingerprints must match:

- final libtriton.so: ece5cce723f048422d5721d37d8c4d5afadc1ea0b9588b7b502c5bd4356146c1
- initial measured libtriton.so: 1a6310a64f0a982c5a17b52515276a2428c23e1cda5a5918e9eaf39d65fed456
- triton-sycl-translate: 4521f01b70d1d3ebdac6f90fb57ef237e069d1c1c6be727d2a3fbeb36498f837

Use python/test/sycl/serial_half_copy_contracts.py and
serial_half_copy_source_contracts.py for structural checks. Device runners:
serial_half_copy_semantics.py, serial_half_copy_bits.py,
serial_half_copy_cost.py, full_stack_ablation.py. Audit the final archive with
analyze_serial_half_copy.py and analyze_full_stack.py. Submitted Slurm scripts
and provenance are retained with the raw results. Overall backend completion
and all-model/layout performance are not claimed by this bounded repair.

Final audit command (from the repository root):

~~~sh
python3 python/test/sycl/analyze_serial_half_copy.py \
  docs/backend/sycl-validation/serial-half-copy --gpu-job 22744899 \
  --bits-job 22745700 22745701 22745702 22745703 --cost-job 22745565 \
  --output-cost-job 22745756 22745757 --output /tmp/half-copy-audit.json
~~~

Production source/tests and handwritten reports pass ordinary diff whitespace
checks. Raw generated sources and scheduler outputs retain their original EOF
blank lines/trailing spaces to preserve fingerprints; the evidence-only diff
check disables those two whitespace categories. Python compilation and shell
syntax checks pass. No compiler error or semantic mismatch is counted as a
successful final configuration.
