# Rejected LDS padding experiment

All three gfx906 pilot jobs completed, but the performance audit rejects the
candidate. The pass, option and binding are removed from production. See
`../../sycl-lds-bank-padding-report.md` for complete counts, losses, costs and
the baseline floating-point failure found by the expanded CPU tests.

- `pilot/`: exact initial compiler/test sources, hashes, complete device jobs,
  216 configuration records, raw events, LLVM dumps and the failed audit.
- `isolated-next/`: revised storage-slot ordering/access guards, 148 new plus
  2,555 preceding structural checks and ten compile configurations.
- `layout-study/`: ten successful raw CPU records followed by a failing f32
  disabled baseline, exact harnesses, pre/final LLVM and 36 cold compilations.
- `withdrawn-source/` and `withdrawn-integration.patch`: the rejected candidate
  and test code, for research on the recorded ce060585 base only.
- `diagnostic-next/`: later profiling/FP-guard harness, separate from the
  measured v1 CPU source; no new device acceptance claim.

```sh
python3 python/test/sycl/audit_lds_bank_padding.py docs/backend/sycl-validation/lds-bank-padding/pilot --output /tmp/lds-analysis.json
```

Run from repository root. The expected result is
`PERFORMANCE_REVIEW_REQUIRED` with exit 1. Do not relabel it PASS because
correctness passed, sources shrank or a bank estimate improved.
