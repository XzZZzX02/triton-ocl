# Integer Extrema Collective Extension

Date: 2026-11-02. Baseline: d9769e4c. Target: gfx906 via wlx -> dfcs.
AdaptiveCpp 25.10 SSCP / DTK 26.04. No MFMA or dtype-conversion expansion.

## Starting Hypothesis and Implementation

The initial hypothesis was that register accumulator promotion prevented
group-reduction matching. Current source and baseline compilation contradict
it: promotion requires an enclosing affine loop, while collectives require a
top-level function-body reduction. Both options generate the same source for
the tested top-level reductions. The first test incorrectly expected the
collective to disappear with register_accumulator=True and failed after
three records. That incorrect expectation was corrected; the compiler
pipeline order is unchanged.

The actual missing opportunity is scalar integer min/max. The existing named
sycl-group-reduction pass already parallelizes long top-level add/mul/bitwise
reductions but rejects arith.minsi/maxsi/minui/maxui. This extension maps those
four exact associative operations to GPU MINSI/MAXSI/MINUI/MAXUI. Neutral
elements come from the actual MLIR arithmetic combiner: signed min/max use
signed largest/smallest values; unsigned min/max use all-ones/zero.
Thread-strided partials use that identity. The existing owner combines the
group result with the original scalar accumulator, so a non-neutral seed is
not replaced or discarded.

The emitter uses sycl::minimum/maximum with the correct signed/unsigned
storage template, despite MLIR integers being signless. Existing add/mul and
bitwise operations retain unsigned modular emission. No floating extrema or
NaN/signed-zero policy is added to the collective domain.

The final accepted opportunity retains all existing independence/uniformity
checks and adds conservative requirements for the new integer extrema:
complete static rank1 identity-layout shared input, one direct load indexed
only by the reduction IV, separate scalar shared accumulator, default
memory-access attributes, and at least 1024 input elements. Small, conditional,
nested, aliased, private, permuted, multiuse and unsupported combiner cases
retain the original serial/promotion path. The old add/mul/bitwise match
domain is unchanged. The group_reduction option remains off by default and
cache-keyed; no new competing pass or kernel/dimension whitelist is added.

## Evidence Collection

The first broad candidate used the existing N>=256 collective opportunity
threshold. Long inputs show repeatable benefits, while N=256 is neutral or
mixed and N=512 u32 max regresses with serial staging. Additional independently
selected N=512 signed/unsigned 64-bit probes improve, demonstrating that a
length-only 512 threshold does not establish stable benefit across widths.
The accepted candidate conservatively requires N>=1024. Final compiler
source replay confirms accepted long programs are byte-identical to the
measured collective programs, and smaller group requests return to the
already-checked serial program. This is a workload-opportunity gate rather
than a general hardware cost model; the option remains off by default.

The final read-only auditor passes complete expected configuration sets:

- Timed GPU matrix: 408 records across 17 completed jobs, 28,224 scalar and
  padding comparisons, 12,648 device-event samples. It includes the broader
  small-domain opportunity probes, not only accepted long workloads.
- GPU special datasets: 160 records and 9,600 comparisons. Final-binary
  conditional/boundary/short fallback matrix: 64 records and 4,992 comparisons.
- CPU ordinary matrix: 64 records and 3,840 comparisons. CPU special datasets:
  160 records and 9,600 comparisons. Final CPU conditional fallback:
  32 records and 3,072 comparisons.
- Counted runtime total: GPU 632 records / 42,816 comparisons; CPU 256
  records / 16,512 comparisons. Six earlier successful conditional-control
  files are retained but superseded by the final complete eight-case
  conditional matrix, avoiding duplicate coverage claims.
- Final structural contracts: 620/620. Existing pass contracts all pass.
  Source preservation: 136/136 (64 extrema option combinations plus 72
  archived dot programs). Another 96 compile-only before/after records
  preserve existing floating/add/mul/bitwise/tuple/conditional source and
  marker behavior, correcting the original pass-order hypothesis.
- Final opportunity-gated source replay: 136/136 over all 17 measured workload
  option sets. Accepted long programs match measured source exactly; rejected
  smaller programs match their independently checked group-off baseline.
  The final binary additionally executes the u64 max rerun and all 64 final
  runtime records. The initial broad timings were not all repeated on the
  final binary; exact code replay is the evidence linking those versions.

The paired runner holds the existing staging/fusion/reuse/initializer/
unroll/tiling requests fixed, crosses group reduction off/on and register
promotion off/on, then alternates order across three rounds. Register
promotion is an observed no-op on these top-level reductions; repeated
requests are measured controls, not independent active promotions.

Each program checks local ranges 1,3,48,(3,5),64,257 and grid=3 or 1 against
independent integer references, resets output/padding sentinels, and validates
the profiled final output. Signed max uses all-negative values, signed min
uses all-positive values, and unsigned inputs exercise the high sign bit.
Special cases cover signed/unsigned endpoints, all-neutral data, values near
numeric limits, empty runtime masks, single valid input, conditional execution
and a short static reduction. All comparisons are exact integer values.

Timing uses local=64, ten warmups and 31 raw device-event samples per
configuration, three alternating rounds, excluding compilation/process/
transfer costs. Correctness at other local sizes does not establish their
profitability. No performance ratio is inferred from a failing baseline.

## Composition and Semantic Scope

Floating sum/product and min/max, tuple and conditional reduction compilation
are retained as unchanged source controls. Signed and unsigned extrema are
exactly associative, so regrouping them does not introduce floating
reassociation or rounding behavior. Tuple/coupled combiners and floating
NaN/zero semantics remain on their existing path. Actual collective count,
identity constants, signed comparator instantiation, pass repetition and
order tests are checked separately from output equality.

The final 620 structural contracts cover positive long complete reductions and
negative shape/alias/ownership/effect/attribute cases, both signednesses and
widths, group/register order, local-memory reuse order and idempotence.
The alias fixture uses unsupported dynamic memref.cast source emission;
that negative is IR-proof-only, not falsely claimed as device coverage.
An early contracts invocation raced translator installation and observed the
old translator's unsupported-operation diagnostic; subsequent counted
checks use frozen matching binaries. A second fixture initially compared
reuse-annotated source against unannotated source and was corrected to
compare only equivalent pipeline metadata.
The strengthened final negatives additionally verify rank2 input rejection,
private buffers, unknown load attributes, mismatched source extent and complete
but too-short 256/512-element inputs. Neither type conversion nor extra
rounding/NaN encoding work is introduced by these integer tests.

## Device Results and Profitability

The measured opportunity study covers B=64,256,512,1024,2048,4096. Final
acceptance retains B>=1024 only. At B=256 results are mixed around one;
B=512 i32 min and i64/u64 max improve, but u32 max serial-input ratios
0.9911/0.9893/0.9893 regress in all rounds. A universal 512-element opportunity
claim would therefore be unsupported. No workload-name or shape whitelist
was introduced.

The accepted long-domain study contains 44 paired contexts (two register
requests x two existing stacks across eleven dtype/kind/size/grid workloads).
They represent 20 distinct generated source pairs. Register requests are a
no-op control here; grid=1/3 may also share code. Every one of the 132 paired
rounds improves, with minimum round ratio 1.2878x. Aggregate ratios range
1.2978-4.0081x. Those are bounded device results, not a promise for all
local sizes, models, lengths, or register-pressure regimes.

| 1024 elements, grid=3 | Serial input | Input staging/fusion stack |
|---|---:|---:|
| i32 min | 1.3570x | 2.4848x |
| i32 max | 1.3391x | 2.4849x |
| u32 min | 1.3580x | 2.4849x |
| u32 max | 1.3030x | 2.4956x |
| i64 min | 1.3338x | 2.9279x |
| i64 max | 1.3331x | 2.9198x |
| u64 min | 1.3074x | 2.9033x |
| u64 max | 1.2978x | 2.8992x |

Held-out u64 max B=2048 improves 1.3207x/3.5055x, u64 min B=4096 improves
1.3269x/3.9968x and i64 min B=1024 grid=1 improves 1.3239x/2.9157x
for the register-off requests. The full range above includes repeated
register-on contexts. The shared-memory reuse, tiling and ordered-unroll
requests are not assumed active on these scalar outputs. Input staging is
actually selected in the full stack; its marker is verified separately.
This demonstrates bounded coexistence and combined benefit, not arbitrary
pass independence or multiplication of independent speedups.

## Development Failures Kept Separate

An original u64 max job reached the 25-minute time limit without a complete
result file. Its accounting state is TIMEOUT; the scheduler continued showing
cleanup on the original node at the last observation, and the expected output
log could no longer be read from the login node. This does not prove a
compiler/runtime root cause. It is excluded, and a final-binary rerun on a
different node completed all 24 records in 6m55s. Neither an observation
timeout nor a missing log alone was used to restart a live worker.

Two special-data batches completed their five positive datasets, then failed
at unsigned-max conditional-kernel compilation: a bare constant zero in the
else branch was inferred as int32, inconsistent with the uint32/uint64 then
branch. The test now constructs the fallback scalar with the explicit input
integer type. No runtime type or compiler validation was relaxed. The original
data records remain individually checked, while the two failed conditional
records are excluded and replaced by complete final-binary conditional tests.

A verifier was also started during shared-library relinking and observed a
missing libtriton import; it produced no accepted result. After rebuilding
finished, the verification ran with a fresh cache directory and frozen
fingerprints. Historical source snapshots and before/after result distinctions
are retained so those development errors cannot be counted as semantic passes.

## Sources and Reproduction

Primary sources retrieved 2026-11-02:

- MLIR GPU all_reduce operation and signed/unsigned operation enums:
  https://mlir.llvm.org/docs/Dialects/GPU/#gpuall_reduce-gpuallreduceop
- Official SYCL group algorithm reference:
  https://github.khronos.org/SYCL_Reference/iface/group-algorithms-library.html

The sources establish operation/uniform participation semantics, not a
gfx906 cost model. The browser tool returned no usable content; the official
pages were retrieved with curl. Pinned LLVM headers independently confirm
the signed/unsigned enum choices. Runtime exact references and paired
measurements are the acceptance evidence.

Runners: integer_extrema.py, integer_extrema_contracts.py,
integer_extrema_sources.py and the corrected reduction_composition.py.
GPU wrappers live under docs/backend/sycl-validation/next/.
Raw archive: docs/backend/sycl-validation/integer-extrema/.
The overall all-model/backend optimization goal remains open.

Measured broad-candidate libtriton.so SHA:
bc41e56f556a469e3ee69f17827ca22efb845823641941e3720e0329d97891cd.
Final accepted libtriton.so SHA:
3104f924ac6af4761f5bb2e2c0c6dd230730fa5f9cdf89c590dcc1303fb19c08.
Translator SHA (same for broad/final candidate):
90b71c61e4a0d8c1daf8a8ff8c3c10813a241d18969ac2b21f18d47767a66bf8.
The compiler.py fingerprint is unchanged from the accepted baseline:
0981d01e8ef63992ad9e5253119bbff95c4e5ea55600f90f92e7d2e39ef84736.

The archive keeps measured-candidate/ separate from accepted-source/.
Submission script retrieval has explicit success/failure records: some early
script handles expired, so missing originals are not invented. Execution logs,
accounting states, source/binary checksums, exact oracles and raw samples
support the individual counted records. Failed/timeout batches are not called
successful jobs merely because their partial positive cases are valid.

~~~sh
python3 python/test/sycl/analyze_integer_extrema.py \
  docs/backend/sycl-validation/integer-extrema --output /tmp/extrema-audit.json
~~~

Python compilation, batch-script syntax and handwritten-source diff checks
pass. Generated source, submitted scripts and native scheduler/log output
retain original whitespace for fingerprint verification. A SHA-256 manifest
covers every archived file. No all-model, all-local-size or arbitrary-pass
independence claim follows from this bounded acceptance.
