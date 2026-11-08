# Floating-product rounding: validated repair

Accepted 2026-11-09 after the 2026-11-08 gfx906 study, based on 636a3f1d.
This is a numerical lowering repair, not a kernel speedup claim. The mandatory
`sycl-fp-contract-guard` pipeline pass identifies products needing separate
rounding; the renderer mechanically lowers the resulting per-product marker.
The rejected LDS-padding candidate is absent from the production build,
options and bindings.

## Reproduced defect

An actual rank-three f32 reduction fails with padding disabled: at output index
3, separate rounded multiplication/addition gives -0.25000011920928955, while
the backend returns -0.25000008940696716. Independent C fmaf evaluation matches
the wrong result exactly. Initial/final AdaptiveCpp LLVM contains
`fmul contract` and `fadd contract` despite ordinary separate source MLIR
arithmetic without contraction permission. That initial failure, original
harness and dumps remain in the rejected LDS study's `layout-study/` archive.

Source experiments first disable contraction for the function, then for the
product only. Both restore the exact reference on both sides of the padding
toggle. The implementation uses the smaller per-product scope, preserving
unrelated arithmetic opportunities. Diagnostic source experiments are retained
separately from the final production build and acceptance matrix.

## Pipeline and proof

The final pipeline pass marks native float/double products whose intermediate
rounding might otherwise disappear. The renderer declares the SSA result in its
original scope and assigns it in a nested block with
`#pragma clang fp contract(off)`. It makes no scheduling/profitability decision.
LLVM contraction requires the relevant rewrite permission on the participating
operations, so removing it from the product prevents implicit FMA. Original
arithmetic order is retained, without volatile memory, extra accumulators or
new dtypes.

An APFloat type/range proof retains exact widened products. With source
precisions pa/pb and destination precision pd, it requires pa+pb <= pd, the
largest finite product exponent to fit, and the smallest source-subnormal
product to be normal in the destination. Binary16 x binary16 -> binary32 and
binary32 x binary32 -> binary64 meet that bound. Bfloat16 x bfloat16 -> binary32
does not, because its product can overflow or underflow in binary32. This
proof uses neither kernel names nor a benchmark dimension/value list.

Nonfinite classification and signed zeros are separately tested. Floating
exception flags, arbitrary rounding modes and NaN payload guarantees are not
expanded. Explicitly permitted direct contractions remain available when the
product and all direct add/sub users carry contract permission. Memory,
unknown or unmarked consumers do not authorize fusion of a later read.
Replanning clears stale markers. Software low-precision operators already
materialize storage rounding; the new marker addresses native f32/f64 products.

Hand-authored MemIR tests run the pass explicitly. The Triton backend runs it
after scheduling/unrolling and before the existing half-copy guard. Triton's
compilation key includes the libtriton hash, and changed source alters the
native executable cache key where protection applies.

## Final acceptance evidence

`sycl-validation/fp-contract/analysis.json` is reproduced by
`audit_fp_contract.py`. With `--repo`, it verifies current measured production
and test-source hashes, expected complete configuration sets, raw samples and
medians, seven completed Slurm states, gfx906 logs and actual source markers.
Production fingerprints:

- libtriton: `2b473a47e771180bacc0ab6c5b5b81d659be817b2a98e944f2b2ef8bd3ec72d9`
- renderer: `6d22ebb0a80fb76e58a96b6a692ac8817a3b9ede2fd323de7458778522c6c943`

Evidence is bounded as follows:

- 409 new structural contracts plus 2,555 preceding contracts, all passing.
  They cover mixed precisions, explicit fast-math permission, memory users,
  stale markers, repeated passes and transitive widening. Renderer contracts
  check source structure; actual executable coverage is provided separately.
- Seven gfx906 jobs completed with exit 0: 23037327–23037331 for direct
  arithmetic and 23037713/23037714 for actual frontend dots. All kernels ran
  on allocated Slurm nodes. No device job was restarted after observation or
  archive-transfer failures.
- The direct device matrix has 180 records. Its 126 correct records pass;
  54 intentionally unprotected f32/f64/bf16 baseline records reproduce errors.
  These incorrect records are counted separately, never as correctness passes.
- The frontend matrix has 16 correct configurations with independent ordered
  references: NN/NT/TN/TT, rounded/special f32 inputs, raw/full schedules and
  local ranges 1/64/(3,5). The automatic pipeline emits one guard in raw and
  four in the ordered-unroll full schedule.
- Across direct and frontend device tests there are 142 correct records and
  43,842 exact output/padding comparisons, plus 10,746 attempted comparisons
  in the 54 known-bad baselines. Direct local ranges are 1/3/48/64/(3,5).
  Numerical cases include cancellation, overflowing bfloat products,
  subnormal rounding, infinities, NaNs and signed zeros.
- Final production CPU direct matrix: 40 records, with 28 passing records and
  5,572 exact comparisons; 12 unprotected baseline records reproduce errors.
  The production frontend TT f32 raw/full CPU smoke also passes.
- Final CPU LLVM evidence: unprotected input has a contract multiplication and
  reproduces 39 mismatches; protected output has an ordinary multiplication
  with no contract flag and zero mismatches. The following addition may keep
  its independent flag. No final device-ISA identity claim is made.
- 44 representative model-layout compile cases pass. All 44 f16 schedule hashes
  across 22 layouts are unchanged, as are 15 historical f16 dot hashes. This
  preserves measured promotion/tiling/unroll/staging paths within that scope,
  not every model or arbitrary pass order.
- A diagnostic isolated build, which still contained withdrawn LDS padding,
  passes 14 raw rank-three/multi-phase CPU records and 417,040 comparisons.
  It covers f32 finite/special values, empty/unit masks and observable half-bit
  copies through a reused scratch slot. Those results are identified as
  diagnostic rather than final production evidence.

The remote pre-existing dtype test driver was older than this checkout.
Its actual source/hash is frozen. The only definitions imported by the new
numerical runner (DTYPES, pack_value, unpack_value) are AST-identical to the
current file; the auditor verifies them explicitly. No full-file equality or
execution of that older driver's missing tests is claimed.

## Runtime cost and preservation limits

There are 930 raw device-event samples, with ten warmups, 31 samples per timed
configuration and three alternating rounds at local=64. Host dispatch,
compilation and transfers are excluded. Median-of-round medians:

| Case | Unprotected ns | Protected ns | Interpretation |
| --- | ---: | ---: | --- |
| f32 | 20,640 | 19,840 | Original arithmetic is wrong; no optimization gain claimed |
| f64 | 25,281 | 34,081 | Correct separate rounding costs about 34.81% vs wrong FMA |
| bf16 -> f32 | 57,280 | 57,441 | Original arithmetic is wrong; about 0.28% increase |
| f16 -> f32 | 54,561 | 54,561 | Source identical control |
| f32 -> f64 | 25,440 | 25,281 | Source identical control; timing variation is not a gain |

The exact-product exceptions retain existing measured f16 optimization effects.
This repair deliberately changes native arithmetic when prior implicit FMA
violated separate rounding. It does not promise non-regression versus an
incorrect implementation, and performance work must use the corrected semantics
as its baseline. Native C++/device JIT compile overhead and end-to-end application
latency were not measured here.

## Reproduction and source basis

Run device tests only on allocated gfx906 nodes; CPU correctness uses
`ACPP_VISIBILITY_MASK=omp`. From repository root in the configured DFCS build:

```sh
python-triton python/test/sycl/fp_contract_contracts.py --output contracts.json
python-triton python/test/sycl/fp_contract_semantics.py --case f32 --guards 0 1 --output arithmetic.json --dump-dir arithmetic-sources
python-triton python/test/sycl/fp_contract_dot.py --shape 8 16 32 --layout TT --dtype f32 --data rounding --plans raw full --blocks 1 64 3x5 --output dot.json --dump-dir dot-sources
python3 python/test/sycl/audit_fp_contract.py docs/backend/sycl-validation/fp-contract --repo . --output /tmp/fp-analysis.json
```

Primary sources checked 2026-11-08: LLVM Language Reference rewrite-based
fast-math/contract rules and Clang's contraction flags/lexical controls. URLs
are in `sycl-optimization-research.md`. Actual saved numerical failures, LLVM
and device tests establish this toolchain's behavior. The larger all-model
optimization goal remains incomplete; this repair closes a correctness gap
found while evaluating the next performance candidate.
