# SYCL model-like layout coverage report

2026-10-29. Device validation used the `wlx -> dfcs` route. Harness SHA-256:
`7b8db1a566c827c848e26e82bea541ee131252206356622ce2a19c852ef8da78`.

## Implementation

Added `python/test/sycl/model_layout_semantics.py`, a 32-case, isolated runner for
model-like dot access patterns that were absent from the original 24-case dot
suite. Cases combine 2D/3D execution, NN/TN/NT/TT operand orientation, f32/fp16,
three runtime shapes, padded leading dimensions, non-unit element strides,
output row/batch padding, and broadcast of either batch operand. Inputs use
sentinel-filled backing storage. The result is checked against a Python scalar
reference, including every output padding element. The runner reports and
verifies its SHA fingerprint in child processes. The Slurm wrapper enforces that
fingerprint and uses node-local temporary/appdb directories.

The new probes passed against existing stride and transpose lowering, so this
gap required a durable regression matrix rather than a compiler lowering change.
This is evidence for the covered access patterns, not a claim that every model
layout, gather, negative stride, or arbitrary broadcast form is supported.

## Results and benefit

| Backend | Cases | Pass | Fail | Maximum absolute error |
|---|---:|---:|---:|---:|
| SYCL CPU | 32 | 32 | 0 | 0 |
| gfx906 | 32 | 32 | 0 | 0 |

Both result files contain all 32 unique cases and the expected source SHA:
`sycl-validation/next/model-layout-cpu-7b8db1a5.json` and
`sycl-validation/next/model-layout-dcu-22667778.json`. The previous fixed dot
matrix covered dense/transposed 2D/3D f32/fp16 and an element-stride variant,
but not padded leading dimensions or operand batch broadcast. The added matrix
validates those combinations on both backends. Since no compiler code changed,
there is no kernel-performance delta to report.

## Method references

The test keeps affine strides explicit so layout legality can be reasoned about
from indexing rather than inferred from kernel names. This follows MLIR Linalg's
use of indexing maps for legality analysis and its separate tiling, fast-memory
promotion, fusion, and vectorization transformations. AMD's HIP guide likewise
separates coalescing from LDS bank conflicts. These tests validate address
semantics only and do not infer memory-transaction efficiency from correctness.

- [MLIR Linalg dialect and key transformations](https://mlir.llvm.org/docs/Dialects/Linalg/)
- [AMD HIP performance guidelines](https://rocm.docs.amd.com/projects/HIP/en/latest/how-to/performance_guidelines.html)
- [SYCL optimization research notes](sycl-optimization-research.md)

## Reproduction

On DFCS, source `/public/home/dtune/zzx/triton/env.sh`, allocate a gfx906 DCU,
set `ACPP_VISIBILITY_MASK=hip`, and run the SHA-checked
`sycl-validation/next/model-layout-dcu.sbatch`. CPU uses `ACPP_VISIBILITY_MASK=omp`
and `OMP_NUM_THREADS=4`. Full execution JSON files are retained in the same
validation directory.

## Follow-up: Negative and Zero Strides

2026-10-29. The regression matrix now has 44 cases, up from 32. It adds
negative A row, A reduction-axis, B column, and B reduction-axis strides, plus
zero-stride broadcast across A rows and B columns. Each case runs fp16 and
fp32 and compares every output and padding sentinel against the scalar
reference. The standalone harness passes the backing allocation base and an
explicit logical-origin offset; this is required because its serializer copies
the complete `c_array` starting at `data_ptr()`.

| Backend | Cases | Pass | Fail | Elements checked | Maximum absolute error |
|---|---:|---:|---:|---:|---:|
| SYCL CPU | 44 | 44 | 0 | 7,169 | 0 |
| gfx906 | 44 | 44 | 0 | 7,169 | 0 |

The previous `model-layout-cpu-820f5ce9.json` is preserved as an invalid
harness experiment: its interior `data_ptr()` caused `run_standalone` to copy
from the logical origin while discarding the allocation prefix. The apparent
eight negative-stride failures and one child-process heap error were harness
artifacts, not backend failures. A focused allocation-base load/store probe
also passed fp16/fp32 with strides -1 and -2 (4/4 cases, 52 elements).

The corrected source SHA is
`e072120ef00f293c64030050deed4ce9bc6d94432b2c77f110d783770acfdbe6`. Raw
results are `sycl-validation/next/model-layout-cpu-e072120e.json` and
`sycl-validation/next/model-layout-extended-dcu-22669501.json`; the gfx906 job
completed with exit code 0 on g09r2n01. The invalid harness evidence remains
in `sycl-validation/next/model-layout-cpu-820f5ce9.json`.

This follow-up changes test coverage and pointer construction in the harness;
the compiler and generated kernels did not change, so there is no runtime
performance delta to claim. It establishes correctness only for the listed
stride and broadcast combinations, not arbitrary affine or data-dependent
layouts.
