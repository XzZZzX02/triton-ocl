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


Cooperative external-to-local load staging (experimental, default off):

    python-triton cooperative_staging_contracts.py --output stage-contracts.json
    python-triton cooperative_staging_semantics.py --kind dot --shape 16 32 32 --rounds 3 --repeats 31 --output stage-dot.json
    python-triton cooperative_staging_boundaries.py --case indirect --output stage-gather.json
    python-triton cooperative_staging_reuse.py --case sequential --output stage-reuse.json
    python-triton model_layout_semantics.py --all --schedule staging-pair --python /path/to/python-triton --output stage-layouts.json

The option cooperative_load_staging requires proven independent static full
local-buffer writes and read-only external accesses. It runs before work
distribution. Small, nested, volatile, aliased and prior-external-write cases
fall back. Staging-pair changes only staging in the existing forwarded stack.
Historical staging evidence retains a fusion/bufferization failure for tensor
recurrences as EXPECTED_COMPILE_FAILURE; it is not a runtime pass. The loop
destination guard repairs that failure; use the dedicated tests below to
require successful current execution. The vector
option does not actually transform the current boundary kernels. See
sycl-cooperative-staging-report.md for exact validated scope, measured gains and remaining backend limitations.


Fusion loop-destination regression:

    python-triton fusion_destination_contracts.py --output fusion-contracts.json
    python-triton fusion_destination_semantics.py --case nested --output fusion-nested.json
    python-triton fusion_destination_semantics.py --case ieee --output fusion-ieee.json
    python3 audit_fusion_destination.py ../../../docs/backend/sycl-validation/fusion-destination --output audit.json

The existing fusion pass protects DPS destination ties under tensor-carrying
loops and delegates unchanged to upstream cleanup elsewhere. Exact loop counts
0/3, nested loops and IEEE special values are tested without tolerance-based
NaN masking. The real chain may retain two generics due to its input+destination
uses; constant folding is measured separately from actual generic fusion.
See docs/backend/sycl-fusion-destination-report.md for limits and raw evidence.


Terminal local-to-external store distribution (experimental, default off):

    python-triton terminal_store_contracts.py --output terminal-contracts.json
    python-triton terminal_store_semantics.py --kind dot --dtype f16 --rounds 3 --repeats 31 --output terminal-dot.json
    python-triton terminal_store_layouts.py --suite memory --output output-layouts.json
    python3 audit_terminal_store.py ../../../docs/backend/sycl-validation/terminal-store --output audit.json

The cache-keyed terminal_store_distribution option runs last in memir and
requires distribute_work. It proves unique modular addresses, read-only local
inputs and a terminal phase, inserts a local barrier and uses the existing
linear-lane schedule. Dynamic output strides, conflicting/scatter addresses,
small domains and unproven effects keep the original source. Re-running work
distribution re-proves a marked terminal store rather than dropping its schedule
or trusting stale attributes. The store-pair schedule in model_layout_semantics
checks runtime-output-stride fallback; terminal_store_layouts supplies actual
static output transpose/reverse/padded/stride-2/rank-3 execution coverage.
See docs/backend/sycl-terminal-store-report.md for measured profitability limits.


Two-column register tiling and exact-wave64 launch specialization (default off):

    python-triton two_column_contracts.py --output two-column-contracts.json
    python-triton two_column_extended_contracts.py --output two-column-extended.json
    python-triton two_column_guard_contracts.py --output two-column-guard.json
    python-triton two_column_template_contracts.py --output two-column-templates.json
    python-triton two_column_semantics.py --layout TT --rounds 3 --repeats 31 --output two-column-dot.json
    python-triton two_column_launch_performance.py --layout TT --k 32 --blocks 48 64 128 256 --capture-codegen --dump-dir launch-sources --output launch.json
    python-triton model_layout_semantics.py --all --schedule two-column-pair --rounds 3 --repeats 31 --python /path/to/python-triton --output two-column-layouts.json
    python3 -m unittest discover -s . -p test_compare_two_column_llvm.py
    python3 audit_two_column_wave64.py ../../../docs/backend/sycl-validation/two-column --repo ../../.. --output wave64-analysis.json

The cache-keyed `matmul_register_tiling_2col` option requires
`matmul_register_tiling` and preserves its four-column decisions. It recognizes
two-f16-input/f32-accumulator static contractions where four-column tiling loses
one wavefront of output work. A mandatory late pipeline pass proves the untiled
alternative and records actual local-product=64 selection. The renderer validates
that predicate and emits host dispatch between separate template kernels.
Other local sizes retain the untiled branch, including restored K=16 unroll.
Malformed predicates and called specialized entries must fail with translator
exit 1, not a signal or assertion abort. Use Slurm-allocated gfx906 nodes for
device tests; `ACPP_VISIBILITY_MASK=omp` provides CPU correctness checks.

The accepted audit uses `wave64-matrix/` and `wave64-extended/`, retains all
fallback timing and checks final LLVM instructions/attributes/metadata under
bounded identifier renaming. Three different fallback LLVM pairs are measured
SSA-enabling cases when independent accumulator promotion is off. Three cached
no-fusion contexts reuse same-job IR only after both source hashes match.
Historical `audit_two_column.py` and `audit_two_column_launch.py` concern older
experiments; they do not accept the final guard. The unguarded launch audit is
expected to fail. See docs/backend/sycl-two-column-tiling-report.md for the
complete 37-job evidence, scope, compile costs and interaction limits.


Separate rounded products through native SYCL compilation:

    python-triton fp_contract_contracts.py --output fp-contracts.json
    python-triton fp_contract_semantics.py --case f32 --guards 0 1 --output fp-numerics.json --dump-dir fp-sources
    python-triton fp_contract_dot.py --shape 8 16 32 --layout TT --dtype f32 --data rounding --plans raw full --blocks 1 64 3x5 --output fp-dot.json --dump-dir fp-dot-sources
    python3 audit_fp_contract.py ../../../docs/backend/sycl-validation/fp-contract --repo ../../.. --output fp-analysis.json

The mandatory `sycl-fp-contract-guard` pass preserves ordinary native f32/f64
product rounding when C++ compilation would otherwise introduce implicit FMA.
The renderer consumes a per-product marker using a scoped contraction directive.
A significand/exponent proof retains exact widened products, including f16
to f32 dot paths. Explicit contraction requires permission on the product and
all its direct add/sub consumers. The guard runs after optimization scheduling;
hand-authored MemIR tests invoke it explicitly.

In the direct runner, `--guards 0` intentionally bypasses the pass. The known
f32/f64/bf16 errors have status `REPRODUCED_BASELINE_MISMATCH` and are not
correctness passes. Guarded cases use exact rounded references. Timing versus
wrong arithmetic is repair cost, with an observed f64 increase reported in
docs/backend/sycl-fp-contract-report.md. Source-identical half/widened-f32
controls and 44 preserved f16 layout schedule hashes bound preservation claims.
