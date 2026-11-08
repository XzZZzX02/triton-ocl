# Separate product rounding: completed acceptance archive

The seven Slurm jobs in `fp-all-jobs.txt` completed with exit 0 and gfx906 logs.
`analysis.json` distinguishes 142 correct device records from 54 intentionally
unprotected baseline mismatch records. This is a correctness repair; timing
versus incorrect arithmetic is not a performance improvement claim.

From repository root, without a GPU or Triton installation:

```sh
python3 python/test/sycl/audit_fp_contract.py docs/backend/sycl-validation/fp-contract --repo . --output /tmp/fp-analysis.json
```

- `fp-device-*` and `fp-frontend-*`: complete direct numerical and real Triton
  dot matrices, exact generated sources/IR, raw event samples and launch hashes.
- `fp-regression-*`: 409 new and 2,555 preceding passing structural checks.
- `fp-production-cpu-*`: final production CPU direct checks; `fp-cpu-enabled*.ll`
  demonstrates removal of contract permission from the multiplication.
- `fp-preservation.json`, `fp-layout-preservation.json`: 15 historical f16
  sources and 44 f16 layout-schedule sources replayed identically. All 44
  representative layout cases also compile in `fp-layout-compile.json`.
- `fp-layout-cpu-*` and `diagnostic-source/`: distinct diagnostic isolated build
  with the now-withdrawn LDS candidate; never counted as final production GPU
  acceptance. The rejected study retains the initial baseline failure.
- `lds-f32-*-probe*`: earlier source-only experiments establishing a narrower
  contraction scope; separate from final pass validation.

`measured-source/` and the launch manifests preserve exactly what ran. The
remote dtype test driver was older than this checkout. The new runner imports
only DTYPES/pack_value/unpack_value; the auditor verifies their AST identity
against the current file. It does not claim full driver identity or execution
of the older file's missing tests. Historical manifests must not be rewritten.

See `../../sycl-fp-contract-report.md` for source rules, exactness proof,
reproduction, numerical scope, observed f64 cost and remaining limitations.
