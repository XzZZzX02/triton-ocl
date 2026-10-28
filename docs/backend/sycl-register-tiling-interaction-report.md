# Register accumulator and matmul tiling interaction

2026-10-29. gfx906 validation used the `wlx -> dfcs` route. This report records
a measured pass conflict; it does not mark the two-pass independence gap as
resolved.

## Test design

The paired test used NN f32 contractions at `(M,N,K) = (4,8,8), (16,32,32),
(32,64,64), (64,16,32)`. It crossed `register_accumulator` and
`matmul_register_tiling` on/off, held work distribution and local-memory reuse
on, and held fusion and group reduction off. Each of the four combinations ran
in three alternating rounds. Every run checked exact reference output at local
ranges 48 and `(3,5)`, then took 31 device-event samples after 10 warmups.
Job 22667834 ran exclusively on gfx906. All 48 rows passed.

## Results

Paired speed ratio is `median(no tiling) / median(tiling)`, so values above 1
favor tiling.

| Shape | Accumulator off | Accumulator on |
|---|---:|---:|
| 4×8×8 | 1.000× | 0.995× |
| 16×32×32 | 1.032× | 0.990× |
| 32×64×64 | 1.062× | 0.980× |
| 64×16×32 | 1.013× | 0.988× |

For all three eligible shapes, `register_accumulator=true` plus
`matmul_register_tiling=true` generated the same source hash as tiling alone,
and a different hash from accumulator-only. The tiling pass consumes the affine
reduction nest and materializes its own SCF-carried accumulators; the later
register-accumulator pass then has no affine reduction to transform. The
combined configuration therefore loses the accumulator-only result and is
about 1.0–2.0% slower than accumulator-only in these measurements. With the
small ineligible shape, tiling is a no-op and all corresponding hashes match.

This confirms the transforms are not composable in the current pipeline. It
does not justify a general selector: the measurements cover one device, NN f32,
four shapes, and a fixed set of other pass settings. No compiler change was
made. A runtime exclusion would hide the conflict rather than make both
optimizations independently effective. The next implementation needs either a
tiling transform that preserves/consumes the promoted accumulator state, or a
reframed single schedule pass with explicit alternatives and independent
ablation. Until then, the no-interaction requirement remains open.

## Robustness evidence

The existing IR contract suite was rerun on CPU: 104/104 pass. Those contracts
cover eligibility, rejection, idempotence, and ordering of the individual IR
passes; they do not prove device-level composition. The previous
`register-ablation-v2-{32x64x64,64x64x64}.json` results also showed the same
interaction in larger kernels.

Raw evidence: `sycl-validation/next/register-tiling-isolation-22667834.json`
and `sycl-validation/next/pass-contracts-v16.json`. The benchmark source is
`python/test/sycl/register_accumulator.py`; its fingerprint for the measured run
is `d4f6cc6639759de9e86e7c925221b22b95816bf853825727d73caf2be6b67d3c`.
