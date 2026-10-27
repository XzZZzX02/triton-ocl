# SYCL semantic and failure regressions

No PyTorch or NumPy is required. Supply a Triton-enabled Python interpreter;
on DFCS this is the ELF-loader wrapper /public/home/dtune/zzx/triton/bin/python-triton.
Source the corresponding env.sh. Build both triton and triton-sycl-translate,
and install the translator into python/triton/_C after rebuilding it.

    python semantics.py --all --mode run --python /path/to/python-triton --output results.json
    python semantics.py --all --group reduction --mode run --python /path/to/python-triton
    python semantics.py --all --group memory --mode run --python /path/to/python-triton
    python semantics.py --all --group dot --mode run --python /path/to/python-triton
    python3 reliability.py

Use ACPP_VISIBILITY_MASK=omp and OMP_NUM_THREADS=4 for CPU. On an allocated
gfx906 node set ACPP_VISIBILITY_MASK=hip and unset LD_PRELOAD. Never run DCU
work on a login node. Each semantic case runs in a subprocess with a timeout;
nonzero exit, signal, timeout and reference mismatch are failures.

58 deterministic cases cover 20 reductions (all axes in rank1/2/3, bitwise,
independent tuples, coupled argmax and tie), 14 memory patterns (holes, OR,
bounds, negative address, dynamic stride, modulo, gather, other, nested loops,
loop pointer updates, false scalar mask, 3D grid, empty and tail), and 24 dot
combinations (2D/3D, NN/TN/NT/TT, f32/fp16/stride2 and boundary masks).
Integer/bitwise results compare exactly. Current floating inputs are exactly
representable; general fp16/random numeric error coverage remains future work.

--jobs N enables independent test processes. Default jobs=1 is recommended for
reproducibility, especially with shared AdaptiveCpp persistent compilation cache.
Parallel executable publication is atomic. Do not run multiple benchmark jobs
against the same device at once. --mode compile checks translator output only;
--mode run also compiles the generated C++ and checks actual output.

Translator negative test:

    triton-sycl-translate negative_memir.mlir -triton-sycl-emit-sycl -o /tmp/negative.cpp

Expected exit=1 with source diagnostic, never SIGABRT. Host failure contracts
exercise runtime timeout/signal/error handling without requiring the device.
To use a loader-wrapped Python for all subprocesses, always supply --python.

For performance use performance.py, which runs ten warmups and 31 event samples
inside each process. It verifies output before timing, varies local sizes
64/128/256, and writes raw samples. Report compilation/launch overhead separately
from the device event interval; do not infer kernel speedup from failed baselines.

Optimization safety regressions:

    python-triton optimization_semantics.py
    python-triton optimized_reductions.py

These check vector copies, masked fallback, buffer reuse versus overlapping
lifetimes, mixed f32/i32 scratch, random floating inputs, and 1D/2D/3D local
ranges. Long reductions cover 48/64/128 lanes. On DFCS, use node-local TMPDIR
and ACPP_APPDB_DIR when possible. A shared-filesystem CPU run produced SIGBUS
even with per-executable publication locks; that failure is recorded separately.

Four-element vector memory copies are experimental and disabled by default.
Enable them explicitly with vectorize_memory=True in the Triton compile options.
The safety test enables this option to exercise the generated vector load/store
paths. gfx906 measurements showed a copy regression with that option enabled;
default performance measurements keep it disabled. Tree reductions and proven
non-overlapping local-buffer lifetime reuse remain enabled.

Additional pointer-loop regressions:

    python-triton scalar_pointer_semantics.py

These reuse the same compiled kernels with runtime loop counts 0/3 and signed
strides 3/-2. They cover nested scalar pointers, conditional same-allocation
updates, mixed scalar/tensor pointer reconstruction, loop results, grid=3, and
local sizes 48/(8,8): 24 exact-output checks plus one allocation-switch negative.
The negative checks the native MLIR diagnostic text, not only an exception.
