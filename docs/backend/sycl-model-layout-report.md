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
