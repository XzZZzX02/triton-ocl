# Two-column optimization evidence

The accepted 2026-11-06 exact-wave64 iteration is audited with:

```sh
python3 python/test/sycl/audit_two_column_wave64.py docs/backend/sycl-validation/two-column --repo . --output /tmp/wave64-analysis.json
```

Run from the repository root. The read-only auditor requires only Python's
standard library. `wave64-analysis.json` is the checked result. Source manifests
and historical snapshots describe what actually ran; do not overwrite them
with later harness versions.

| Directory | Role |
| --- | --- |
| wave64-matrix | Accepted compiler, 34 completed Slurm device jobs, compile/contract regressions, final LLVM dumps and historical-source replay |
| wave64-extended | Same production binaries/sources, three further launch/ablation jobs, CPU checks, cold compilation costs, and clean-diagnostic rerun |
| first-matrix | Early study with retained failed marker assertion and partial results |
| final-matrix | Historical unguarded local=64 study; its PASS does not accept other local sizes |
| launch-matrix | Rejected unguarded physical-launch study with repeatable regressions; historical audit intentionally fails |
| device-guard-matrix | Intermediate device-branch repair, superseded by separate template kernels |
| template-pilot | Intermediate host-template rule allowing local-product<=64; local=48 regression motivated exact equality |

Accepted production fingerprints are identical in both wave64 manifests.
The extended launch runner adds only the `--plans` test parameter. The final
clean-diagnostics harness adds only the required exit-1 assertion and is frozen
separately as `wave64-extended/clean-diagnostics-source.py`. Its successful
33-case result includes four rejected malformed inputs.

Final LLVM comparisons are bounded identifier/graph renaming checks, not ISA
identity or a general equivalence theorem. All timing is retained. See
`../../sycl-two-column-tiling-report.md` for exact scope, counts, failures,
compile costs, fallback exceptions and performance interpretation.
