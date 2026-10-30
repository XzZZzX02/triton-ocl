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
default performance measurements keep it disabled. Group reductions are also
opt-in (`group_reduction=True`); proven non-overlapping local-buffer lifetime
reuse remains enabled by default.

Additional pointer-loop regressions:

    python-triton scalar_pointer_semantics.py

These reuse the same compiled kernels with runtime loop counts 0/3 and signed
strides 3/-2. They cover nested scalar pointers, conditional same-allocation
updates, mixed scalar/tensor pointer reconstruction, loop results, grid=3, and
local sizes 48/(8,8): 24 exact-output checks plus one allocation-switch negative.
The negative checks the native MLIR diagnostic text, not only an exception.

Independent optimization-pass checks:

    python-triton pass_contracts.py --output contracts.json
    python-triton ordered_unroll_contracts.py --output unroll-contracts.json
    python-triton ordered_unroll_semantics.py --special --factors 1 2 4 8 --output ieee.json
    python-triton model_layout_semantics.py --all --schedule both --python /path/to/python-triton --output layouts.json

The layout runner compares baseline and enabled fusion/group/reuse/accumulator/
tiling/unroll pipelines at local ranges 48 and (3,5), checking optimization
markers as well as every output and padding element. Some passes do not match
these dot kernels; the result is not an all-passes-active benchmark. The
four-column tiling pass requires two f16 loaded operands and f32 accumulation.
F32 and mixed input contractions keep the existing untiled path.
`reduction_unroll` accepts integer factors 1/2/4/8, defaults to 1, and preserves
the SSA recurrence order. In a tiled reduction, unrolling is limited to static
trip counts of at least 32; shorter tiled reductions retain the tiled loop.
Tiling and unroll remain opt-in: measured wins do not establish a universal
profitability guarantee.

Accumulator initialization forwarding:

    python-triton accumulator_init_contracts.py --output init-contracts.json
    python-triton accumulator_init_semantics.py --dtype f16 --rounds 3 --repeats 31 --output init-timing.json
    python-triton accumulator_init_ieee.py --dtype f16 --output init-ieee.json
    python-triton model_layout_semantics.py --all --schedule init-pair --python /path/to/python-triton --output init-layouts.json

The cache-keyed accumulator_init_forwarding option defaults to False. It
requires an existing complete distributed/private accumulator schedule and a
full constant fill of at least 128 output elements. It forwards the exact
initial SSA constant, removes its fill and initial loads, and preserves the
recurrence order. Views, escapes, partial domains and extra buffer uses fall
back unchanged. The init-pair layout schedule holds the existing optimized
stack fixed and toggles only forwarding. See the dedicated pass report for
runtime-versus-source-consistency provenance and measured profitability limits.

Tiling output parallelism regression checks:

Four-column tiling requires at least 64 independent output points after
tiling in the existing distributed nest. Physical batch loops in that nest
count; separate grid programs do not. Smaller cases keep the untiled source.

    python-triton model_layout_semantics.py --all --tile-shape small --schedule init-pair --python /path/to/python-triton --output small.json
    python-triton model_layout_semantics.py --all --tile-shape wide --schedule init-pair --python /path/to/python-triton --output wide.json
    python3 audit_tiling_wave.py ../../../docs/backend/sycl-validation/tiling-wave --output audit.json

The logical tiles are 8x16x16 (small) and 16x16x32 (wide). The same layout
cases assert different tiling markers. See docs/backend/sycl-tiling-wave-report.md
for the measured profitability and interaction limits.
