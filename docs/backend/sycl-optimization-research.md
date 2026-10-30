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
