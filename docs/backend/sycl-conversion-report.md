# SYCL conversion follow-up — 2026-10-27

## Implementation and observed cause

Software fp16/bf16/fp8 cross-format casts explicitly pass through binary64,
avoiding an invalid chain of two implicit C++ user conversions. Storage
bitcasts use the explicit integer member. The latter alone did not fix the
observed gfx906 failure; storage-v1 results retain that failed experiment.

An exhaustive legacy e4b15 reproducer isolated incorrect narrow stores under
AdaptiveCpp 25.10 SSCP automatic loop vectorization. At local size 3 and (3,5),
both half storage and integer-bit output lost values while f32 numeric decoding
remained correct; a direct i16 output also used wrong addresses. Local sizes
1/48/64/257 passed this reproducer. Disabling loop vectorization/interleaving
made all six ranges pass. This establishes a failing optimization path, not
the precise defective LLVM transform. Volatile diagnostic variants were
inconclusive and are not the production fix.

The emitter disables implicit vectorization/interleaving only for generated
loops containing stores narrower than 32 bits. f32/f64 loops and independently
validated explicit vector copies retain their paths. The guard is correctness
lowering, not a claimed speed optimization.

## Validation

conversion_matrix.py covers 18 source × 18 destination types, plus 25 legal
RTZ narrowing pairs: 349 pairs per device, each with 256 probes and local
ranges 48/(3,5). All fp8 byte encodings are exercised for floating targets.
Float-to-int probes exclude undefined nonrepresentable results. NaNs compare
by classification; other results compare exact storage bits.

| Snapshot | CPU | gfx906 |
|---|---:|---:|
| group-v6, before narrow-store guard | 349 pairs in 18/18 source kernels | 17/18 source kernels; legacy e4b15 fails |
| narrow-v2 | 349/349, 18/18 source kernels | 349/349, 18/18 source kernels |

legacy_fp8_storage.py additionally validates every legacy encoding at local
sizes 1/3/48/64/(3,5)/257. Production narrow-v2 passes all six on gfx906.
Evidence: sycl-validation/next/{conversion-v4,narrow-v2}-{cpu,dcu}.json.
Frozen snapshot translator SHA256:
e91bc8f287e00056a9f3118354e39486831cf56241bad6929ae79fcee330bc46.
Slurm job 22628129; DFCS through wlx then dfcs, GPU only on allocated nodes.

## Limits

349 conversion pairs do not prove every dtype operation, reduction, dot or
model layout. Software conversions have costs; no conversion speedup is
claimed. Full numerical and original semantic suites are separate gates.
