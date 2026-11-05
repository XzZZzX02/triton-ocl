# SYCL optimization design sources

Read 2026-10-27. Sources are upstream compiler documentation and original
publication pages, not secondary benchmark summaries.

- MLIR structured Linalg tutorial, sections “Tiling and Loop Materialization”
  and “Producer/Consumer Fusion and Rematerialization”:
  https://mlir.llvm.org/docs/Tutorials/transform/Ch0/
  Preserve indexing maps and iterator kinds until legality is established.
  Tiling must preserve dependencies. Fusion can remove temporaries but can
  rematerialize work; therefore only single-use elementwise producers with
  compatible maps are candidates for unconditional fusion in this backend.
- Ansor, OSDI 2020, original paper/abstract:
  https://www.usenix.org/conference/osdi20/presentation/zheng
  Hierarchical schedule search, measured candidates and a cost model motivate
  separating legality from profitability. This implementation does not claim
  to reproduce Ansor's learned model or published speedups. Candidate tilings
  need paired measurements and held-out shapes before default enablement.
- Adams et al., SIGGRAPH 2019, Halide autoscheduler:
  https://halide-lang.org/papers/autoscheduler2019.html
  Schedule search and features such as intermediate storage/register pressure
  motivate explicit cost guards and combination testing. Disabling a pass is
  not a substitute for testing interactions with other transformations.
- Tillet, Kung, and Cox, MAPL/PLDI 2019, *Triton: An Intermediate Language and
  Compiler for Tiled Neural Network Computations*:
  https://research.ibm.com/publications/triton-an-intermediate-language-and-compiler-for-tiled-neural-network-computations
  The paper describes tile-level machine-dependent passes and autotuning. For
  this backend, that motivates benchmarking tile parameters on gfx906 rather
  than assuming a CUDA/MFMA schedule transfers to this target.
- Domagala et al., *A Tiling Perspective for Register Optimization*:
  https://arxiv.org/abs/1406.0582
  The work treats register promotion, unrolling, and instruction scheduling
  jointly. Our measured short-loop tile/unroll regression motivates an
  IR-derived interaction guard; this implementation does not reproduce the
  paper's constraint solver or claim its results.

Implementation commitments: no matching kernel names; no implicit fast math;
no MFMA on gfx906; cache-keyed controls; safe fallback for unproven dependencies;
retain raw timing samples, compile cost and rejected candidates. Performance
claims apply only to measured classes. Negative/zero/NaN/subnormal tests precede
any reordering or reduction optimization claims.

## 2026-10-30: Integer Compute LICM Candidate

- MLIR pass documentation, affine and generic loop-invariant code motion:
  https://mlir.llvm.org/docs/Passes/
  The candidate handles both affine.for and scf.for because actual Triton
  scalar loops in this checkout lower to SCF. It avoids moving memory
  operations and floating arithmetic.
- LLVM's LICM design notes:
  https://llvm.org/docs/Passes.html#licm-loop-invariant-code-motion
  Hoisting can lengthen live ranges; lower-level rematerialization and register
  pressure handling remain relevant. Fewer source operations in a loop are
  therefore not a device speedup claim.
- LLVM MachineLICM implementation:
  https://llvm.org/doxygen/MachineLICM_8cpp_source.html
  Its register-pressure safeguards motivate paired GPU measurement rather
  than enabling the new candidate from static trip count alone.

Status: rejected after gfx906 timing; production integration removed. See
`sycl-licm-experiment-report.md` and the archived measured source/results.
The initial integer-chain IR contracts exposed a pass-order dependency with
ordered unroll when an affine.apply remains in a promoted recurrence. A
candidate placement before unroll would need revalidation after scheduling.
The measured version put hoisting last. No universal profitability or
pass-independence conclusion follows from its contract results.

## 2026-10-30: Accumulator Initializer Forwarding

- MLIR scalar replacement documentation:
  https://mlir.llvm.org/docs/Passes/#affine-scalrep
  Store-to-load forwarding removes redundant memory traffic when access
  equivalence and ordering can be proved. The SYCL pass specializes this idea
  to a complete constant fill followed by promoted, fully covered outputs.
- MLIR affine forwarding implementation and its conditions:
  https://mlir.llvm.org/doxygen/Dialect_2Affine_2Utils_2Utils_8cpp_source.html
  Dominance, access equivalence and no intervening conflicting writes motivate
  the owned-allocation/full-domain/phase checks. This is a bounded backend
  transformation, not a replacement for upstream alias analysis.
- LLVM dead-store elimination implementation:
  https://llvm.org/docs/doxygen/DeadStoreElimination_8cpp_source.html
  Complete overwrite versus partial overwrite motivates requiring all output
  elements to be written before deleting the initial fill. Original constants
  and recurrence order are retained; no floating identity is invented.

See sycl-accumulator-init-report.md for the exact gate, paired gfx906 data,
runtime/source-hash provenance and remaining interactions. A small f16 tiling
regression found by its boundary matrix is tracked separately from initializer
forwarding profitability.


## 2026-10-31: Cooperative External-to-Local Load Staging

- AMD HIP performance guidelines, device-memory access and coalescing sections:
  https://rocm.docs.amd.com/projects/HIP/en/latest/how-to/performance_guidelines.html
  Consecutive lanes accessing consecutive addresses can combine transactions;
  on-chip shared storage can retain reused inputs. This motivates distributing
  an existing external-to-local copy instead of populating it on one lane.
  Transposed, strided and indirect inputs require separate measurements; lane
  distribution does not itself prove coalescing or profitability.
- MLIR Affine dialect and affine.parallel semantics:
  https://mlir.llvm.org/docs/Dialects/Affine/
  Independence must be proved before parallel scheduling. This backend's
  existing distribution pass consumes proven parallel-loop annotations. The
  candidate proves unique local writes and read-only external accesses while
  retaining predicates and arithmetic. It neither parallelizes reductions nor
  uses affine.parallel's unspecified reduction ordering.

Both official pages were retrieved on 2026-10-31. Their guidance is not device
performance evidence. Within-job timings, frozen source/binary fingerprints,
fallback-source equality and actual pass markers provide backend evidence.
This pass introduces no MFMA, asynchronous copy, double buffering, additional
local allocation or dtype conversion. Its measured domain and exceptions must
be reported separately from legality.


## 2026-10-31: Fusion and Bufferization Destination Contracts

- Fixed LLVM revision used by this checkout, ElementwiseOpFusion.cpp:
  https://github.com/llvm/llvm-project/blob/3c709802d31b5bc5ed3af8284b40593ff39b9eec/mlir/lib/Dialect/Linalg/Transforms/ElementwiseOpFusion.cpp
  The population helper installs RemoveOutsDependency separately from its
  caller's fusion callback. That cleanup replaces unused destination operands
  with tensor.empty. Inspection of this exact source plus pre/post IR identified
  the tensor-loop buffer equivalence failure. Global removal also changed an
  existing successful sum optimization, motivating a loop-scoped wrapper.
- Official one-shot bufferization and destination-passing-style documentation:
  https://mlir.llvm.org/docs/Bufferization/
  Tensor destinations and alias/equivalence relationships guide buffer reuse.
  This backend keeps its existing loop allocation/equivalence policy and
  preserves the needed destination tie instead of enabling allocation returns
  from loops or silently retrying the whole compiler pipeline.

The fixed source was retrieved on 2026-10-31. This is a robustness repair in
an existing pass. Device performance is measured separately; source equality
on 200 recorded configurations supplies bounded preservation evidence rather
than a general claim about every downstream optimization or model.


## 2026-10-31: Terminal Output Store Distribution

- AMD HIP performance guidelines, device-memory access and coalescing:
  https://rocm.docs.amd.com/projects/HIP/en/latest/how-to/performance_guidelines.html
  Distributing unique output addresses across lanes can expose parallel memory
  transactions. Transposed and non-unit-stride outputs need separate device
  measurement; contiguous-input results are not evidence for every output layout.
- MLIR Affine dialect and dependence-oriented loop transformation framework:
  https://mlir.llvm.org/docs/Dialects/Affine/
  Establish independence before scheduling. This backend uses a conservative
  modular linear-address proof and superincreasing absolute strides for distinct
  coordinates, not an unqualified parallel annotation or kernel-name pattern.

The official AMD page was retrieved on 2026-10-31; these sources motivate a
candidate, not its profitability. The new pass preserves memory predicates,
adds a local phase barrier, rejects prior/following external dependencies, and
re-proves marked stores after work-distribution rebuilds ownership. Independent
gfx906 paired timings and static-output layout tests are recorded in
sycl-terminal-store-report.md. No MFMA or dtype conversion extension is involved.


## 2026-11-02: Narrow Register Tiles and Composition

Re-read the original register-optimization paper and AMD performance guidance:

- https://arxiv.org/abs/1406.0582
  Register promotion, unrolling and scheduling interact; their marginal speedups
  cannot be multiplied or assumed independent. The two-column candidate keeps
  each output's recurrence order and reuses the existing short-tiled-unroll guard.
- https://rocm.docs.amd.com/projects/HIP/en/latest/how-to/performance_guidelines.html
  Register reuse must be balanced against available parallel work. The narrower
  tile is considered only when four columns fail the existing 64-output-point
  gate and two columns satisfy it. This is an IR/target-resource rule, not a
  workload-name or benchmark-shape lookup. External strides do not establish
  profitability, so transposed, padded, reversed and broadcast layouts are timed.

The new option is cache keyed, defaults off, and preserves all four-column
decisions. Standalone tiling already creates SSA accumulators: initializer
forwarding can therefore become applicable when the separate promotion option
is off. That is a supported enabling interaction, not evidence of a lost pass.
Unchanged output, actual markers, inert-source equality and alternating paired
device timings are checked separately. See sycl-two-column-tiling-report.md.

## 2026-11-02: Next Candidate, LDS Bank-Conflict Reduction

Primary sources retrieved from the network:

- IREE Common/GPU pass catalogue:
  https://iree.dev/reference/mlir-passes/CodegenCommonGPU/
- IREE GPUReduceBankConflicts implementation:
  https://raw.githubusercontent.com/iree-org/iree/main/compiler/src/iree/compiler/Codegen/Common/GPU/GPUReduceBankConflicts.cpp
  Retrieved source SHA256:
  41aabd5e1345201fd255b1c6eb839180679fab2c6ae627b91368e3e954ab2a60.
- AMD Composable Kernel, LDS bank mapping and access phases:
  https://rocmdocs.amd.com/projects/composable_kernel/en/latest/conceptual/ck_tile/hardware/lds_bank_conflicts.html

IREE pads shared allocations and checks memory capacity; its generic heuristic
is not gfx906 performance evidence. AMD documents the GCN 32-bank, four-byte
bank mapping and emphasizes instruction-dependent access phases. The MFMA and
128-bit examples on that page are not schedules to transplant to gfx906.

Investigate padding only for proven owned, non-escaping, read-only contraction
inputs whose scalar lane/row address mapping predicts conflicts within the
relevant access phase. Reject unknown layouts, views, escapes, observable shape
uses and dynamic domains. Keep accumulation destinations and all arithmetic
unchanged. Check the padded physical storage in local-memory reuse and prevent
capacity/occupancy losses; a smaller bank-conflict estimate alone is not an
acceptance result. Place the candidate after schedule construction and before
storage planning, then measure both raw/promoted contractions and tiling,
staging, unroll and reuse combinations. This remains a research candidate until
its own implementation, semantic and paired gfx906 acceptance cycle completes.

## 2026-11-06: Launch Specialization and Fallback Evidence

Primary sources checked again while closing the two-column iteration:

- Halide Func specialization API:
  https://halide-lang.org/docs/api/generated/Func.html
  Conditional schedules inherit the existing schedule and specialize under
  explicit conditions. This motivates preserving the untiled schedule as a
  separately compiled alternative, rather than assuming one register tile is
  profitable for every physical launch. Halide's API does not establish the
  gfx906 predicate; paired device experiments reject both unguarded tiling and
  a `<=64` condition. The accepted local-product=64 rule is recorded by a
  pipeline pass and mechanically lowered to host template dispatch.
- AdaptiveCpp 25.10.0 environment-variable documentation:
  https://raw.githubusercontent.com/AdaptiveCpp/AdaptiveCpp/v25.10.0/doc/env_variables.md
  `ACPP_S2_DUMP_IR_FINAL` captures the final LLVM state before backend-specific
  lowering. These dumps support the bounded fallback comparison of instructions,
  attributes and transitive alias/TBAA/loop metadata. They are not final ISA
  dumps or a universal semantic-equivalence proof. Reused JIT-cache dumps require
  exact generated-source identity at the same local size.
- Domagala et al., A Tiling Perspective for Register Optimization:
  https://arxiv.org/abs/1406.0582
  The paper jointly considers promotion, unrolling and instruction scheduling.
  The current study likewise distinguishes pass coexistence, enabling effects
  and inert controls instead of multiplying standalone speedups.

The completed iteration remains opt-in. Its 37-job gfx906 evidence and failed
cost-rule candidates are in sycl-two-column-tiling-report.md. LDS bank padding
remains the next independent candidate and is not part of this acceptance.
