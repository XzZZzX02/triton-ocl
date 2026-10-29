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
