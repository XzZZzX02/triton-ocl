# Preserve Loop Destinations During Elementwise Fusion

Date: 2026-10-31. Baseline: fc287013. Target: gfx906 via wlx -> dfcs.
This repairs the existing sycl-elementwise-fusion pass; its placement and
cache-keyed fuse_elementwise=False default are unchanged. No MFMA, dtype
conversion expansion, fast math or reduction reassociation is introduced.

## Cause and Implementation

The pinned LLVM revision is 3c709802d31b5bc5ed3af8284b40593ff39b9eec.
Its populateElementwiseOpsFusionPatterns helper adds RemoveOutsDependency
independently of the backend's fusion callback. That cleanup changes a
linalg.generic destination from the tensor iter_arg to tensor.empty when the
payload does not read the destination block argument. In a tensor recurrence,
one-shot bufferization then fails: the yielded buffer is not equivalent to
the corresponding loop iter_arg. The archived pre-fix IR captures the exact
outs(%iter_arg) -> outs(%empty) change, even when no producer fusion matches.

GuardLoopDestinations wraps that one upstream pattern. For a generic under
any LoopLikeOpInterface ancestor with a tensor result, it declines destination
removal, including through nested control flow. Elsewhere it delegates to the
original pattern. All original fusion/constant-fold/cleanup patterns, map and
single-use checks remain. The wrapper is in the existing pass, not an emitter
fallback or a kernel/shape whitelist. It preserves operation order and inputs.

Pattern ownership is located by the pinned upstream debug-name suffix. Exactly
one match is required; a changed LLVM pattern set produces a source diagnostic
and pass failure, not an assert or silent loss of the guard. This is a
version-coupled integration point requiring revalidation at LLVM upgrades.
The loop rule is conservative: unrelated generic destinations inside a tensor
loop are also retained. It is not a complete alias/equivalence analysis.

An initial direct-fusion-only implementation and a global removal experiment
repaired compilation but were rejected as the final approach: removing the
cleanup globally changed the existing sum class from two generics back to
three. The final loop-scoped guard restores that class's exact generated source.

## Correctness and Robustness

All five GPU jobs (22733687-22733691) are COMPLETED, exit 0:0; their logs prove
gfx906, the same binary and successful pinned source/harness checks. The audit
compares local fingerprints and archived harnesses, scheduler-retained scripts,
exact configuration sets, CPU/GPU source identity and every raw event sample.

- New IR contracts: 16/16. Single/chain, nested/plain, destination-read/non-read
  and one/two pass applications preserve destinations and successfully run
  one-shot bufferization. Eligible single-use chains actually fuse to one
  generic; this is not merely successful compilation of a disabled pass.
- Existing contracts: general 150/150, ordered unroll 71/71 and initializer
  forwarding 55/55, on the final frozen compiler.
- Original failure: all eight original loop compile combinations now pass;
  the four previously failing fusion-on combinations are repaired. Compile-only
  rows are not counted as runtime validation.
- CPU recurrence suite: 32/32 configurations, 148,224 output/padding comparisons.
  Each reuses its compiled kernel at runtime loop counts 0 and 3 and local
  ranges 3, 48 and (3,5). Cases are single, chain, nested (inner count 2) and
  IEEE special inputs. Non-NaN float32 bits and NaN classification compare
  against an independent ordered-f32 reference; zero signs and subnormals are
  included. Output sentinels are reset for every launch.
- GPU: 104/104 runtime configurations, 371,280 comparisons, including the same
  four recurrence cases and a sum kernel with an active group collective.
  CPU/GPU recurrence source hashes and check counts match exactly.
- Existing model layouts: 176/176 source invariants across 44 layouts, two
  logical tiles and forwarded/staged schedules. Another 24/24 source invariants
  cover sum, true indirect gather and rank-3 input with fusion/staging/reuse
  switches. These recompile and prove source/marker preservation; they are not
  a new execution of all layouts under the repaired compiler.

## Paired Device Performance

There are 96 timed configurations, 31 positive event samples each (2,976 raw
samples), ten warmups, three alternating rounds, local size 64. Correctness
checks precede timing. Compilation, process startup and transfers are excluded.
Ratios are median fusion-off round medians / median fusion-on round medians
in the same device job, with staging/reuse fixed. The old fusion-on recurrence
failed compilation, so no speedup versus that non-running version is claimed.

| Case | Fusion-off / fusion-on | Interpretation |
|---|---:|---|
| Single recurrence | 0.9986-1.0014x | identical generated source |
| Nested recurrence | 0.9991-1.0000x | identical generated source |
| Chain recurrence | 1.0154-1.0183x | constant folding retained; local bytes 3072 -> 2048 |
| Sum plus group collective | 1.0212-1.0562x | three generics -> two; local bytes 3076 -> 2052 |

The real lowered chain uses its producer as both an input and a destination.
It therefore retains two generics under the original single-use gate. Its
benefit is folding the constant-filled operand, not fusing those two generics.
The separate IR contract proves actual eligible-chain fusion remains possible.

All eight comparisons with changed source improve in aggregate. Only 23/24
paired rounds improve: one staged/reused sum round is 0.9932x. The complete
samples are retained; there is no claim of per-round or universal non-regression.
Single/nested variations are noise between identical sources, not optimizer
benefits. Sum's source is identical to the prior committed version, while its
new same-job timing confirms fusion and staging both still work. Independent
switches and preserved markers do not establish arbitrary pass independence.

## Evidence and Reproduction

Evidence: sycl-validation/fusion-destination/. The original failure evidence
remains in sycl-validation/cooperative-staging/. That archive is historical;
its EXPECTED_COMPILE_FAILURE rows must not be recast as current failures.
The live boundary runner still recognizes that historical failure status;
this fix's dedicated runner requires every configuration to compile and run.

Final pass SHA-256:
8d0bf9233c848dce5383fb87c2694955f14f0e4c9edbf532f81c2cef703bb6af.
Final libtriton.so SHA-256:
e14c680cd52fc2106aa4fc80cf80c653b54c1cd65fb50766f42839a098049254.
The sbatch wrapper pins the measured versions and the archive retains submitted
scripts. Reproduction needs matching compiler/harness sources; changing a hash
in a wrapper does not reproduce a historical experiment.

    python-triton python/test/sycl/fusion_destination_contracts.py --output contracts.json
    python-triton python/test/sycl/fusion_destination_semantics.py --case nested --output nested.json
    python-triton python/test/sycl/fusion_destination_semantics.py --case chain --rounds 3 --repeats 31 --output chain.json
    python-triton python/test/sycl/fusion_destination_invariants.py --evidence docs/backend/sycl-validation/cooperative-staging --output invariants.json
    python3 python/test/sycl/audit_fusion_destination.py docs/backend/sycl-validation/fusion-destination --output audit.json

The fixed-version source and official bufferization documentation are referenced
in sycl-optimization-research.md. Overall goal remains active: this is a
specific composition repair, not proof of all model layouts, all pass orders,
universal profitability or complete backend semantics.
