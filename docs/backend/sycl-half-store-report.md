# Guarded Half Output Distribution

Date: 2026-11-01. Baseline commit: 5d4dbdfe. Target: gfx906 via wlx -> dfcs.

## Implementation

The preceding correctness repair protects some serial binary16 copies with
volatile accesses to their actual uint16_t storage members. It measured a
2.24-2.71x time increase on two serial output-copy controls. This pass
distributes independent output iterations across the work-group while keeping
those bit accesses. It introduces no floating conversion, reduction
reassociation, fast math, MFMA, new dtype or shape/kernel whitelist.

The named sycl-half-store-distribution pass is controlled by the cache-keyed
half_store_distribution option, off by default, and requires distribute_work
in the production pipeline. It runs after wide terminal-store planning and
before the final half-copy guard. The optimizer itself attaches guarded bit
accesses, so its standalone output is safe to emit; the final correctness
pass re-plans them after scheduling. The emitter reuses the existing flattened
work-group ownership loop. The store phase is preceded by a local-memory
barrier so its readers observe the previously written shared input.

The pass shares the existing terminal store address/effect proof rather than
introducing a kernel pattern matcher. Accepted roots are top-level, perfect,
static rank 1-3 affine nests, zero-based, unit-step, without reduction/results,
with at least 256 output iterations. There must be one external store, one
direct f16 local load, one use of the loaded value, and no arithmetic or
conversion of that value. The source is a direct static identity-layout
shared allocation defined before the output phase. Escaping/view-producing
uses, private allocations, external reads, multiple writes, unknown effects,
lane-dependent captures and non-default memory attributes reject.

The output is a one-element reinterpret view of an unranked function argument,
stored at index zero with unit view stride. The offset proof allows scalar
add/subtract, integer casts and constant multiplication, preserving
coefficients modulo the smallest arithmetic width. Absolute dimension strides
must exceed the accumulated span of all smaller dimensions. The span must fit
both that modular width and 63 pointer bits after half-element byte scaling.
This is a sufficient injectivity proof and does not validate user bounds or
make conflicting writes across separate Triton programs defined. Dynamic
stride, modulo/scatter/select and varying affine.apply offsets retain fallback.
Masked stores preserve their predicates and indices. Prior external writes or
subsequent reads/writes reject, because the existing ownership handoff fences
local memory and cannot silently impose new global alias ordering.

Generic work-distribution re-proves marked half outputs after rebuilding
ordinary ownership. Repeating the new pass clears its old schedule before
checking the actual program. Stale or forged markers do not authorize writes.
Wide and narrow terminal passes retain distinct markers and type domains.
The correctness guard recognizes the explicit half-output schedule even when
the load dominates a store inside a mask branch. Other distributed copies
retain their existing emission. This is a documented dependency between
scheduling and safe emission, not a claim that arbitrary pass permutations
are interchangeable.

## Primary-Source Basis

MLIR's GPU mapping/conversion pass documentation separates loop ownership
mapping from conversion to a GPU launch. This implementation follows that
separation with an explicit proven schedule and an existing emitter. Its
injectivity/effect proof is backend-specific; upstream mapping does not prove
this backend's memory independence. LLVM's volatile documentation explains
the access-preservation constraint used by the preceding repair, while also
distinguishing it from synchronization. Existing barriers are preserved.

Official references retrieved 2026-11-01:

- https://mlir.llvm.org/docs/Passes/#-gpu-map-parallel-loops
- https://mlir.llvm.org/docs/Passes/#-convert-parallel-loops-to-gpu
- https://llvm.org/docs/LangRef.html#volatile-memory-accesses

The web search tool returned no usable content; the official pages were
retrieved with curl. These sources motivate the architecture, not the precise
upstream cause of the observed AdaptiveCpp half-copy corruption.

## Validation

All 21 GPU jobs completed with exit 0:0; all four final CPU shards completed.
The archive auditor validates exact workload/configuration sets, output
comparison counts, source hashes, compiler checksums in gfx906 logs, terminal
scheduler states, sample counts and medians. Results:

- GPU: 252 measurement records (84 option/workload configurations in three
  alternating rounds), 1,801,800 output/padding comparisons and 7,812 device
  event samples.
- Final CPU: 48 configurations and 278,840 raw-bit comparisons. Every CPU
  source/marker/fixture record matches the corresponding GPU configuration;
  CPU execution covers the 12 high-level workloads at grid=3.
- GPU high-level workloads: dense, transpose, padding, negative rows,
  stride-2, reversed columns, rank-3, small, dynamic stride, masked collision,
  masked scatter and empty mask at grid=3; dense also runs grid=1.
- GPU raw transposes: 16x32, 32x16, 8x64, 16x16, each with serial/distributed
  middle transpose, each with reuse off/on and output distribution off/on.
  They exercise the previously failing work-group ownership combination with
  bit-preserving output emission. No unsupported dtype conversion is tested.

Structural validation and bounded composition evidence:

- New contracts: 482, covering both affine/memref loads, seven scheduling/
  reuse/guard orders, repetition, standalone guarded emission, masks,
  rank/size boundaries, strides, modular/pointer wrap, alias/effect negatives,
  arithmetic/multiuse rejection, wrong-type negatives, forged markers and
  independent address enumeration. BF16/i16 occur only as rejection tests.
- Existing suites: terminal store 241, half-copy guard 294, general pass 150,
  initializer 55, cooperative staging 66, ordered unroll 71, fusion destination
  16. All run on the final compiler.
- Dot source preservation: 72 measured f32-output dot configurations, with
  f32/f16 inputs, NN/NT/TN/TT, and existing optimization ablations, each replayed
  with the new option off/on. All 144 source fingerprints and existing markers
  match the previous compiler. Two additional records prove that disabling
  work distribution also disables the half-output optimization.
- Initial high-level performance matrix: 13 workloads, each with four
  combinations of half-store distribution and staging/fusion/group/wide-store
  requests, with local-memory reuse held on, repeated in three alternating rounds.
  The final compiler reproduces all 52 measured source/marker configurations.
- Device references compare raw IEEE binary16 storage, including signed
  zeros, infinities, quiet/signaling NaN payloads, subnormals and finite bounds.
  Tests reset sentinels, use grid=1/3 and local sizes 1,3,48,(3,5),64, and check
  the profiled launch's final output too. No speedup is measured against a
  failing baseline.

## Performance and Profitability

Timings use local size 64, ten warmups and 31 raw device events per option,
three alternating rounds. Each timed program first passes five local shapes
and then its profiled output check. Compilation, process startup and transfers
are excluded. Ratios are median baseline round medians divided by median
distributed round medians within the same exclusive job, with the existing
stack held fixed. The baseline retains the applicable correctness guard.

| Workload, grid=3 | Existing stack off | Existing stack on |
|---|---:|---:|
| Dense output | 1.2092x | 1.5218x |
| Transposed output | 1.2057x | 1.5217x |
| Padded output | 1.2086x | 1.5291x |
| Negative row stride | 1.2114x | 1.5290x |
| Stride-2 output | 1.2023x | 1.4993x |
| Reversed columns | 1.2149x | 1.5225x |
| Rank-3 output | 2.2635x | 2.5213x |
| Empty runtime mask | 1.1036x | 1.1345x |

Dense grid=1 improves 1.2085x/1.5072x. Raw transposes with serial middle
ownership improve 2.4179-2.8617x; distributed middle ownership improves
4.3206-5.7050x. All 34 active paired contexts improve in aggregate and in all
102 paired rounds (minimum individual-round ratio 1.09697). These contexts
contain 22 distinct generated-source pairs; repeated pairs under changed
runtime fixtures or reuse requests are not independent optimization kernels.
The raw transpose reuse toggle is often a no-op because lifetimes overlap.

Small, dynamic-stride, collision and scatter cases form eight fallback pairs.
Each has byte-identical source with the option off/on. Their measured
differences are retained in the JSON and cannot be attributed to the new
transformation. Colliding/scatter runtime fixtures intentionally mask to one
writer per program so both baselines are defined; the unmasked full-domain
collision is rejected separately by structural contracts.

The wide terminal pass and group-reduction request are no-ops on these half
copies; no speedup is assigned to either. Staging actually applies in eligible
stack-on cases and its marker is preserved. Unrelated accumulator/tiling/
unroll/initializer paths are checked through exact preservation of the 72 dot
programs with the new option off/on. This demonstrates bounded coexistence,
not arbitrary-pass independence or multiplicative speedups. Local size 64 is
the measured performance domain; the five local shapes establish correctness,
not profitability for every launch shape. The pass remains opt-in.

The first 13 GPU jobs used compiler SHA
29c547d8fa61a29e844a9b6d5ae8fbc050a5d617fe38fa50860876c71dac869a.
After their terminal states and snapshots were captured, the Affine load
attribute fix and standalone protection were built. Final compiler SHA is
26cf1ce392721876a88b8fc3471eaf9fa09af7ca591bc7c5714bad78736e0346;
all existing suites, CPU shards and eight raw-copy GPU jobs use this final
binary. Source replay proves all 52 initial measured configurations unchanged.
The translator SHA is unchanged:
4521f01b70d1d3ebdac6f90fb57ef237e069d1c1c6be727d2a3fbeb36498f837.
No claim is made that the initial timings were remeasured with the final
binary; the identical generated programs and independent final device tests
are the evidence connecting the versions.

## Development Evidence and Limits

The first build missed the AffineOps include and was corrected. A new escape
negative exposed an overly permissive local-buffer check; the half pass now
rejects alias-producing uses. An explicit raw-copy fixture then exposed
rejection of affine loads because their inherent map attribute was treated
as unknown metadata. Only the half proof now accepts that inherent attribute;
wide-store behavior is unchanged. The fixture uses equivalent scalar integer
address arithmetic accepted by the existing proof; varying affine.apply
addressing remains a conservative fallback, without pretending it optimized.

A pause interrupted the initial CPU orchestration after three completed
layouts. Authoritative process inspection found no live CPU runner before
starting final shards. Its valid partial results are retained separately.
Initial archive collection encountered unavailable remote rg, expired Slurm
batch-script retrieval and a shell glob evaluated before tar changed directory.
The archive was rebuilt using Python and explicit terminal scheduler states;
unavailable submitted scripts are not treated as verified provenance.
Five initial and two final submitted scripts were recoverable; the scheduler
had expired the other script records. All 21 execution logs and accounting
states remain available, and every log verifies its frozen compiler/source
checksums and identifies gfx906. The original batch wrapper source and failed
retrieval records are archived without inventing missing submissions.

The 256-iteration threshold exposes potential parallel work, not a universal
cost model. The option remains off by default. Bounded improvements, exact
fallback source equality and preserved dot code do not establish all-model
coverage, all local sizes' profitability or arbitrary-pass independence.
The overall backend goal remains open.

## Reproduction

Runner: python/test/sycl/half_store_semantics.py. Structural checks:
half_store_contracts.py and half_store_source_contracts.py. GPU batch wrapper:
docs/backend/sycl-validation/next/half-store-dcu.sbatch. Archive/auditor:
docs/backend/sycl-validation/half-store/ and analyze_half_store.py.

After loading the DFCS environment, run contracts and a selected workload:

~~~sh
python-triton python/test/sycl/half_store_contracts.py --output contracts.json
python-triton python/test/sycl/half_store_semantics.py --case transpose \
  --rounds 3 --repeats 31 --output transpose.json
python3 python/test/sycl/analyze_half_store.py \
  docs/backend/sycl-validation/half-store --output /tmp/half-store-audit.json
~~~

Python compilation, batch-script syntax and handwritten source diff checks
pass. Raw generated source and scheduler output retain original trailing
whitespace/EOF blank lines to preserve their fingerprints. The evidence-only
whitespace check ignores those two categories. A SHA-256 manifest covers all
archived evidence. No overall goal completion is claimed.
