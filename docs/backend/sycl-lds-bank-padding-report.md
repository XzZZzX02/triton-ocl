# LDS bank padding: rejected after gfx906 measurements

Completed 2026-11-08 against ce060585. The candidate is withdrawn from the
production pipeline, build and option bindings. The measured source, a revised
ordering, tests and failed experiments remain in
`sycl-validation/lds-bank-padding/`. Passing correctness or reducing a bank
estimate did not establish the requested performance benefit.

## Candidate and primary sources

IREE's GPUReduceBankConflicts implementation pads physical shared allocation
pitch and checks capacity. AMD Composable Kernel documents GCN's 32 four-byte
banks and instruction-dependent access phases. Both sources were retrieved
on 2026-11-08; URLs and exact hashes are in research-provenance.json. Their
heuristics are not a gfx906 profitability result for this scalar backend.

The experimental named pass added one four-byte word to the inner physical
pitch of owned f16/f32 input scratch. It preserved logical indices, bounds
and arithmetic, accepted bounded static identity rank-two/three load/store
uses, and declined views, escapes, observable shapes, unknown domains,
unsupported storage, reduction writes and absent initialization writes.
Two-column candidates declined until both launch alternatives could be modeled.
The default-off option was cache keyed.

The cost filter enumerated bounded static scalar accesses, counted distinct
words per bank in groups of 32 logical points, allowed broadcast reads and
required non-worsening estimated cost at every access plus a strict aggregate
improvement. It imposed a four-million-lane analysis limit and a coarse
LDS-only capacity/residency check (64 KiB, 512-byte granularity, at most 16
groups). Actual instruction selection, register limits, physical partial-wave
scheduling and hidden latency were not established by that estimate.

## Completed device study

Jobs 23034642/23034644/23034645 all completed with exit 0 on allocated nodes
k15r1n07/i02r3n08/k15r1n10 and logged gfx906. Their sources and binary hashes
matched the 12-input launch manifest. The compiler was libtriton
537452b7bd425e9c9a5dac6f9f30defcaaf6c439830016bb6488691497cd4462;
the renderer was 4ee80564c5d9cbd2a6439b261176fb194f79354d7c54420f4bf8fc81a9e0caf4.

The complete matrix contains 216 correct device configurations, 913,896 exact
output/padding comparisons and 6,696 device-event samples. Each comparison
uses three alternating rounds, ten warmups and 31 samples per configuration
at local=64/128/256. There are 24 active and 12 inert contexts; the 36 paired
inert rounds have byte-identical generated sources. Host compilation,
transfers and dispatch are outside the event durations.

| Context | Baseline / padded median | Interpretation |
| --- | --- | --- |
| NN 8x16x64, full, local=128 | 0.982709x | All three rounds regress; approximately 1.76% slower overall |
| Same, full, local=64/256 | 0.998196x / 0.996633x | No gain |
| NN 64x32x64, full, local=64/128/256 | 1.001030x / 0.999428x / 0.997928x | Small mixed/negative results |
| Same, reuse disabled, local=64 | 1.005121x | Small gain without a stable broader class |
| TT 32x64x64 | Source identical | Residency filter declines padding; timing is a control |

For the small full-stack/local=128 case, individual speed ratios are
0.985573/0.982709/0.979885x. The complete offline audit reports
PERFORMANCE_REVIEW_REQUIRED: 20 of 24 active contexts have at least one
below-baseline paired round. Some small losses alone could be timing noise,
but the stable loss and lack of a substantial general gain reject this rule.
The actual four-column schedule is active for NN 64x32x64; the small NN case
has insufficient work for four-column tiling, so requesting its option there
is not evidence of an independent tiling effect. TT is an inert control.
No dimension whitelist or tolerance was added to manufacture acceptance.

## Correctness, interactions and costs

- Initial measured structural suite: 139 checks, 21 selecting padding.
  A revised isolated build passes 148 new plus 2,555 preceding checks.
- 15 historical disabled/inert sources replay byte-identically.
- Initial TT CPU study: 64 records and 393,664 comparisons, all inert.
  Actual-padding NN CPU IEEE/rounding study: four paired records over eight
  local ranges, totaling 196,832 exact comparisons.
- A later raw layout study completes ten records: f16 multi-phase storage
  reuse (finite and special bit patterns) and actual rank-three f16, totaling
  323,120 comparisons. The following f32 case fails on the **disabled baseline**,
  before testing padding. Its partial matrix is retained, not counted as a
  complete layout suite. LLVM contains implicit contract flags, and its wrong
  answer matches an independent fused-multiply-add reference. This separate
  numerical lowering issue is being repaired by the FP contract guard.
- 36 cold Triton-to-SYCL compilations exclude imports, C++ compilation and
  execution. Context medians span about 0.791–0.961 s. Enabled/baseline ratios
  range 0.935–1.175, including a 17.46% increase in the large raw inert case
  and a 12.39% increase in the large full case. These costs are recorded, not
  kernel speedups.

Review found that padding before equal-type storage coloring could lose a
reuse slot. The isolated revision moves padding after coloring, preserves
slots and updates retained byte accounting; it handles index companion storage
and rejects explicit alignment/custom access contracts. The observable
multi-phase fixture verifies one reused slot rather than only an inert option.
The initial three device jobs measured the earlier placement. The revision
has no device acceptance claim. Ten compile-source pairs match the pilot after
removing only the storage-report comment; six are already byte-identical.
This comparison does not validate newly enabled schedules.

The failure does not prove that all LDS layout optimization is unprofitable.
It shows that this bank-count/resource estimate is insufficient for enabling
this padding transform here. A new swizzle/padding proposal needs its own
instruction-aware evidence and independent acceptance cycle.

## Archive and reproduction

`pilot/` retains the exact measured production source, complete jobs/logs,
raw events, LLVM dumps and the failing performance audit. `isolated-next/`
retains the storage-order revision and its structural/compile evidence.
`layout-study/` includes the partial CPU study, original baseline failure,
pre/final LLVM and compilation cost data. `withdrawn-source/` and
`withdrawn-integration.patch` preserve the candidate for research against
ce060585; they are not production code. `diagnostic-next/` additionally
contains a later harness using the FP guard, without claiming device acceptance.

Read-only audit from repository root (exit 1 is expected for this rejection):

```sh
python3 python/test/sycl/audit_lds_bank_padding.py docs/backend/sycl-validation/lds-bank-padding/pilot --output /tmp/lds-analysis.json
```

The full all-model/backend goal remains active. This rejected candidate is
recorded and committed separately from the prerequisite numerical repair.
