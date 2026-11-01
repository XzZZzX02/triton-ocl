# Linear Affine Half Output Support and Wide-Copy Profitability Study

Date: 2026-11-01–2026-11-02. Baseline: bf232e17; accepted compiler behavior from 1781a63a.
Target: gfx906, wlx -> dfcs, AdaptiveCpp 25.10 SSCP / DTK 26.04.

## Implementation

The existing terminal-store and guarded-half-store passes prove independent
output addresses before distributing a terminal copy across the work-group.
They previously understood scalar arith add/subtract, casts and constant
multiplication, but rejected the same linear address expressed with
affine.apply. The wide-store proof also rejected an ordinary affine.load's
inherent map attribute as unknown metadata. Both limitations left proven
static layouts on a serial fallback, depending on their lowered IR form.

The accepted half-store address proof now interprets the linear subset of affine maps:
dimensions and symbols substitute their actual SSA operands, constants add
no varying coefficient, addition merges coefficient vectors, and multiplication
requires a literal affine constant. Nested affine.apply operations recurse
through the same address proof. Integer casts preserve the minimum 32-64 bit
arithmetic width on the path; coefficient arithmetic is checked in 128 bits.
The existing superincreasing absolute-stride uniqueness check and pointer-byte
span check remain unchanged. Explicit uniform bases/symbols cannot establish
injectivity by themselves. A depth limit and 1,024-visit analysis budget bound
recursive expression traversal; a depth bound alone does not prevent repeated
expansion of a shared SSA DAG. Budget exhaustion conservatively keeps fallback.

Varying floor/ceil division, modulo, dynamic symbolic multiplication, scatter,
zero/colliding strides, coefficient overflow and modular/pointer wrap outside
the sufficient proof retain fallback. This is not a general polyhedral solver,
alias analysis or output bounds checker. Uniform base arithmetic already
accepted outside the output loop is preserved. Cross-program address overlap
remains the kernel author's responsibility.

The accepted half-store access-attribute check now recognizes an affine load's
intrinsic map attribute while continuing to reject unknown or non-default
memory attributes. The initial broader implementation also enabled this in
the wide proof, but wide-copy profitability probes exposed regressions and
that extension was withdrawn. The existing wide arithmetic-address and
attribute-selection behavior is preserved for bounded expressions; oversized
analysis graphs conservatively fall back under the common visit budget.
The pass does not rewrite that load or address
expression; it uses the existing emission and scheduling mechanism. Output
predicates, value bits and indices are unchanged. Half copies retain the
established unconditional bit-storage protection; there is no unsafe bypass.

The initial study extended both existing named terminal-store passes. The
accepted optimization extends the guarded half-store pass only, with its
existing cache-keyed option and default retained. It adds no third competing
scheduler, dtype format/conversion, MFMA or floating-point reordering. The
same prior-write/following-use, local-allocation, group-uniform capture and
terminal-phase checks still govern eligibility. Generic work-distribution
re-proves marked wide/half stores after rebuilding ownership.

## Baseline and Structural Validation

The old implementation was rebuilt separately and used to compile the same
16 dtype/address-form/read-dialect programs with four scheduling/option
settings each. Sixty-four old-selection/source records establish actual
fallback before the extension. After rebuilding the candidate, a source
replay checks all 64 records. Removing only the new input-copy conditional
guard in a test-only inverse transform reconstructs byte-identical old
programs for unchanged selection; newly selected output phases differ.
This separates output scheduling from the independently needed input repair.

Seventy-two independent f32-output dot configurations (f32/f16 input,
NN/NT/TN/TT and existing optimization ablations) retain exact accepted source
fingerprints and prior accumulator/tiling/unroll/initializer/staging/store
markers. They are preserved paths, not newly accelerated dot workloads.

Final structural contracts: 874/874 (the broad measured candidate had 872).
They cover both storage types, both load
dialects, flat/nested affine and equivalent scalar arithmetic, rank1/2/3,
transpose/padding/negative/strided layouts, six pass orders, repetition,
existing guard interactions, unknown attributes/effects, floor/ceil/modulo,
dynamic symbolic stride, partial small-domain fallback, source-width modular
boundaries, pointer wrap, recursive depth and exponentially shared arithmetic
DAGs. Independently enumerated
addresses reject any accepted colliding configuration.
In the final contract matrix, newly proposed wide affine paths are explicit
negative cases; the old arithmetic/memref path remains a positive control.

Existing suites pass: general 150, terminal store 241, half-copy guard 312,
guarded half store 482, initializer 55, staging 66, ordered unroll 71 and
fusion destination 16. The translator source and binary are unchanged.

## Runtime Correctness and Performance

The full broad-candidate matrix and independent stride probes are complete.
They support accepting the guarded f16-copy class and withdrawing the wide
extension.
The boundary is the existing serial-emission requirement (half copies require
volatile bit accesses), not a selected kernel, layout name or magic dimension.

The new runner feeds explicit MemIR to the real compiler pass/emitter and
executes generated SYCL with independent address and raw-storage oracles.
This keeps affine.apply visible instead of letting upstream canonicalization
erase the form under test. It is execution of the actual output phase, not a
claim that every model currently emits this IR or a synthetic proof of model
speedups.

Dense, transposed, padded, negative-row, reverse-column, stride-2, rank1 and
rank3 outputs are paired with pass off/on and serial/distributed input staging,
with the local-memory reuse pass requested in the distributed setting. Each
fixture has one local allocation, so that reuse request is a no-op; its presence
does not establish a measured reuse optimization effect. Small,
runtime-stride, collision and modulo cases check fallback. Collision/scatter
runtime fixtures mask to one valid writer per program so their baselines are
defined; full-domain collision rejection is established separately by the
IR contracts. Another fixture uses grid=1. Nested maps, mixed i32 arithmetic
and affine/memref reader combinations receive separate device execution.

IEEE f16/f32 storage tests include signed zeros, infinities, quiet/signaling
NaN payloads, subnormals, normal bounds and maximum finite values. They compare
uint16/uint32 bits directly, with no conversions, tolerance or weakened NaN
classification. All output and padding sentinels are reset before every launch.
Each configuration checks local shapes 1,3,48,(3,5),64 and the profiled output.
Timing uses local size 64, ten warmups and 31 raw device-event samples in
three alternating rounds; compilation/startup/transfers are excluded.

## Development Evidence and Limits

An initial unknown-load negative accidentally annotated the producer store
instead of the reader; it was corrected before the counted contract result.

Switching from the separately rebuilt legacy compiler to the candidate
exposed a timestamp issue: tar preserved a source timestamp older than the
legacy object, so Ninja reused that object despite changed source content.
The binary checksum and exact-source replay detected the mismatch. The first
29 submitted GPU jobs were cancelled (two had started), and their results
are excluded. The source was touched, rebuilt, and its new binary and
selection checks verified before resubmission. All cancelled states/logs
are preserved separately. This is a build/deployment error, not a compiler
semantic failure or accepted performance evidence.

The first f32 fixture stored its raw bits in a ctypes uint32 array despite
declaring a float32 pointer. Runtime ABI validation correctly rejected it
before executing the kernel. The corrected fixture owns a ctypes float array
and accesses its storage through a separate uint32 view, preserving signaling
NaN payloads without conversion. Those early ABI failures are retained and
excluded; they did not require weakening runtime checks.

The initial rank3 f16 input-distributed baseline also exposed 504 wrong
elements at local size 1 before the new output optimization. Diagnostic
22813870 confirms that protecting its direct global-to-local input copy
fixes all five local shapes; the original fails local=1 and passes the other
four. This is the same observed single-work-item storage-emission hazard as the
prior local-copy repair, now on a direct unmasked input stage. A first diagnostic
attempt (22813739) used an incompatible harness and records execution errors;
none of those records is counted as a semantic test pass.

The existing half-copy guard is therefore extended structurally to a direct
one-use f16 load from a one-element unranked-argument view followed by a local
store under an explicitly distributed affine loop. It uses the existing
single-lane helper: volatile bit accesses at total local range size 1, original
aggregate accesses at larger sizes. Serial input copies and masked loads
yielded through SCF remain unchanged. Sixteen additional input-copy contracts
cover both load/store dialects, f16/f32 selection, serial/distributed ownership
and idempotence. It has no kernel/shape whitelist and no unsafe bypass. The
final measurements use the repaired input baseline on both output options;
no speedup is inferred from the previously incorrect rank3 baseline.

The unchanged 256-output-iteration opportunity gate and strict independence
proof identify potential parallel work; they are not universal cost models.
Options remain off by default. Measurements support only their tested
workload/local-size domain. Source preservation and bounded pass-order tests
cannot establish arbitrary transformation independence, complete dynamic-shape
optimization or all-model/layout profitability. The overall goal stays open.

## Acceptance Boundary

The first broad matrix found a stable f32 rank1/stride-2 regression. Eight
additional one-dimensional probes varied lengths 256,512,1024 and strides
1,2,3,4,-2. Length 512 with stride 1 also regressed under serial input staging;
256 and 1024 examples improved. A stride/coalescing restriction therefore
does not explain or reliably bound the cost. No dimension whitelist was added.
The entire new wide affine-address/read capability is withdrawn instead.
These negative results do not establish that the old wide arithmetic-only
optimization is universally profitable; its earlier bounded evidence and
the broader goal remain separate.

All tested guarded-half-copy active pairs improve, with the mandatory
half-bit protection preserved. The accepted implementation keeps the new
linear interpreter enabled only for that pass. The wide pass retains its
previous operator/attribute domain with the new common analysis-work budget.
A final 116-record source replay covers all
29 workload/option groups: half programs match the measured candidate, and
wide option-off/on programs match the already-checked old serial fallback.
No measured wide speedup is attributed to the accepted implementation.

## Audited Results

The broad candidate completed all 29 GPU jobs with exit 0:0: 348 measurement
records, 4,059,000 exact output/padding comparisons and 10,788 device events.
CPU completed 96 configurations and 944,160 raw-bit comparisons. These totals
include the subsequently rejected f32 optimization, and are research evidence,
not a claim that its performance behavior was accepted.

The accepted half-store domain has 156 measured GPU records, 1,738,008
comparisons and 48 CPU configurations / 472,080 comparisons. Eighteen active
paired contexts improve in every one of 54 rounds, with aggregate ratios
4.4644-7.7259x (minimum individual round 4.4501x). Remaining f16 pairs are
source-identical fallback controls, whose timing noise is retained.

| f16 output layout, grid=3 | Serial input | Distributed input |
|---|---:|---:|
| Dense | 4.6551x | 7.7259x |
| Transpose | 4.6121x | 7.3032x |
| Padded | 4.6607x | 7.6113x |
| Negative rows | 4.6589x | 7.3031x |
| Reverse columns | 4.6506x | 7.5828x |
| Stride-2 | 4.5233x | 7.3259x |
| Rank1 stride-2 | 4.4644x | 6.9567x |
| Rank3 | 4.5468x | 7.3741x |

Grid=1 dense is also included. Repeated runtime contexts can share generated
programs; the auditor reports distinct source-pair counts instead of treating
every repeated fixture as an independently optimized kernel. Timings compare
correct guarded serial fallback to guarded distributed output, not to an
unsafe half-bit bypass or the known-broken rank3 input.

The additional wide-copy study has 96 records, 2,082,816 comparisons and
2,976 events. Length-512, unit-stride serial-input ratios
0.8898/0.8736/0.8908 lose in all rounds; length-256 and length-1024 controls
improve. These results contradict a simple stride-only profitability gate.
All such new wide affine-address programs are restored to fallback in the
accepted implementation. Their gains and losses remain in the archive.

The final analysis budget is a robustness bound, not a shape or profitability
whitelist. Re-running 874 contracts, all existing suites and 136 source
preservation checks on the accepted binary succeeds. The 116-record final
replay matches every accepted half program to its measured source and every
withdrawn wide program to its already-tested serial fallback. The final
half-only scope and analysis-budget refinement were not the binary used for
the initial timing matrix; exact source replay and independent final GPU
smokes connect those versions without pretending to remeasure all timings.

Final GPU smokes 22817646/22817647 both complete 0:0 on the accepted binary:
eight configurations and 98,620 additional exact comparisons. They exercise
the repaired rank3 f16 input/output phase and unchanged f32 fallback, with
five local shapes each. Before the final analysis-budget refinement, one
rank3 smoke also passed; its queued f32 companion was cancelled before
execution to avoid mixing binaries. Those pre-budget records are separate
and not counted as final smokes.

Measured broad-candidate compiler SHA:
6a33b2b17e6c7d90adc407d904a0f3808b74596c5bd2339720e882947a24fa61.
Final accepted compiler SHA:
8d7148e6e6d3e7073e43adf16fa5942d774ad0e4f133ce29d5189863d38998e6.
Translator SHA is unchanged throughout:
77722519f18ef7ab87b0bda0ed360967e294b3d239cfc22c5ce455248fb28f64.

## Primary Source and Reproduction

Official MLIR Affine dialect documentation defines affine.apply, dimension/
symbol substitution and affine expression operators. It supplies semantics
for the linear expression interpreter, not profitability evidence:
https://mlir.llvm.org/docs/Dialects/Affine/ (retrieved 2026-11-01).
The web tool returned no usable content; curl retrieved the official document.

New runners: affine_store_cases.py, affine_store_contracts.py,
affine_store_sources.py, affine_store_semantics.py. Read-only auditor:
analyze_affine_store.py. GPU wrapper:
docs/backend/sycl-validation/next/affine-store-dcu.sbatch.
Raw archive: docs/backend/sycl-validation/affine-store/.

~~~sh
python-triton python/test/sycl/affine_store_contracts.py --output contracts.json
python-triton python/test/sycl/affine_store_semantics.py \
  --case transpose --dtype f16 --rounds 3 --repeats 31 --output transpose.json
python3 python/test/sycl/analyze_affine_store.py \
  docs/backend/sycl-validation/affine-store --output /tmp/affine-store-audit.json
~~~

The broad wide-copy study is historical: its exact source is retained under
measured-candidate/. Reproducing its timings requires that compiler overlay
and frozen runner; it is not a production capability or default option.
All accepted/rejected outcomes, original failures and cancelled jobs are
retained. A manifest hashes every evidence file. Python compilation,
batch-script syntax and handwritten-source diff checks pass; raw generated
sources/logs preserve native whitespace for fingerprint verification.
