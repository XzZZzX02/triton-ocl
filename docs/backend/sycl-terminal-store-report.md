# Terminal Store Distribution: Implementation and Validation

Date: 2026-10-31. Baseline: b27f45ef. Target: gfx906 through wlx -> dfcs.
The new sycl-terminal-store-distribution pass runs last in the memir pipeline,
after local-memory reuse and vector-copy planning. Its cache-keyed option
terminal_store_distribution defaults to False and requires distribute_work.
No MFMA, dtype conversion expansion, fast math or reduction reassociation is
introduced. This is a bounded accepted optimization, not all-model completion.

## Implementation and Safety Proof

Scalar-memory lowering leaves terminal output copies without a work-group
schedule. The pass proves independence and records sycl.distribute plus the
existing flattened-loop depth. The existing emitter assigns iterations by
linear local ID. Predicates, values and address arithmetic remain in place;
there is no new emitter-side pattern guess, allocation or balancing fallback.
An explicit local barrier before the output phase protects its shared inputs.

Accepted roots are top-level, perfect static rank 1-3 affine nests, zero-based,
unit-step, without results/reduction markers and with at least 256 iterations.
Only one external store is allowed. Its value may read direct, static,
identity-layout local allocations defined before the root. External reads,
extra writes, unknown effects, lane-dependent captures and nested loop/control
phases reject the transformation. Scalar mask branches remain unchanged.
Non-default nontemporal/unknown memory attributes reject. Stores are limited
to f32/f64/i32/i64; narrower outputs retain the original path. This gate does
not expand the dtype system or claim runtime coverage of every accepted type.

The output is a direct reinterpretation of an unranked function argument, at
index zero and unit view stride. The offset proof accepts additions,
subtractions, integer casts and multiplication by a constant. It tracks loop
coefficients modulo the smallest arithmetic width along the varying path
(32-64 bits). Uniform bases cannot turn a modular injectivity proof into an
address collision, including signed wrap before widening. Absolute strides
are sorted; each must exceed the accumulated span of all smaller dimensions.
Total span must fit both that modular width and the target pointer width after
element-to-byte scaling (62 bits for four-byte and 61 for eight-byte values).
Checked coefficient arithmetic uses 128-bit intermediates. Dynamic strides,
select/division/modulo in the varying address and loaded scatter indices need
a stronger proof and reject. This is a sufficient, conservative injectivity
criterion, not a complete dependence solver or bounds checker.

Only deallocations and return may follow the root. Prior external writes or
unknown side effects also reject: the backend's existing barriers fence local
memory, so moving an alias-dependent later store to a new owner would need a
stronger global-memory ordering proof. Shared inputs are read-only within the
phase, and all captured nonlocal scalars must be group-uniform. As elsewhere
in this backend, gpu.global_id emits Triton's work-group/program ID.

## Pass Composition Repair

The first version lost its schedule when work-distribution was rerun. That
failure is retained in the initial order probe. WorkDistribution now collects
previously marked terminal stores and calls the same complete proof after
rebuilding ordinary local-buffer ownership. A stale or forged marker never
authorizes a schedule: old attributes are cleared, legality is re-proved, and
a changed/conflicting program falls back. A preceding barrier is reused to
avoid repeated insertion. Default pipelines without a marked store retain
the original planning behavior.

The 241 contracts cover six pass orders with reuse/distribution, repetition,
rank 1/2/3 positives, rank-4/small/dynamic/alias/effect negatives, modular and
pointer-byte-wrap boundaries, and forged colliding markers. Forty-five
additional address configurations are independently enumerated modulo the
relevant width; any accepted case must have distinct addresses. These are
compile-only proofs, not execution of enormous or invalid offsets.

## Correctness and Robustness

The archive audit requires exact configuration sets, positive output-check
counts, frozen harness/source fingerprints, actual submitted Slurm scripts,
successful binary checksums and gfx906 logs, terminal states, stable source
across rounds, preserved other-pass markers and raw event samples.

- Final GPU jobs: 26/26 COMPLETED, exit 0:0, with one frozen compiler binary.
- New contracts: 241/241. Existing suites: general 150/150, ordered unroll
  71/71, initializer forwarding 55/55, staging 66/66 and fusion destinations
  16/16 on the final compiler.
- Static output layouts: CPU 108/108 and GPU 108/108, each comparing 359,280
  output/padding elements at local ranges 3, 48 and (3,5), resetting sentinels
  each time. Dense, transposed, padded, negative-row, reverse-column, stride-2
  and rank-3 copies include NaN classification, signed zeros, infinities and
  subnormals with bit checks. Dot covers NN/NT/TN/TT, f32/f16 input with f32
  output, transposed/negative output strides, boundary masks and grid=3.
- Dynamic output stride, colliding full-domain addresses, modulo scatter and
  small domains run as safe fallbacks. Collision/scatter runtime fixtures mask
  to one defined writer per program; rejection of the unmasked conflicting
  address domain is established separately by the IR contracts. No speedup is
  inferred from an undefined baseline.
- Every CPU/GPU static-layout record matches exactly, including source hash,
  actual optimization markers and check count. Dot optimized cases retain
  accumulator, unroll, initializer and staging; f16 cases also actually tile.
- CPU merge: 108 unique records, with 19 duplicate records verified identical.
  Raw original/shard files and an origins manifest are retained. The merge
  does not count repeated runs as extra coverage.
- Existing dynamic-output model runner: 44/44 compile-only fallback cases,
  two schedules each with identical source and markers. Its runtime stride
  cannot satisfy this static coefficient proof. These are not all-layout
  execution results or proof of complete dynamic-shape optimization.

Two early C++ errors used const MLIR wrappers with non-const accessors and were
fixed before testing. A layout harness initially expected optimization with a
runtime row stride and failed its assertion; the compiler correctly rejected
that path. The corrected runner requires fallback; a separate static-output
suite exercises actual scheduling. SSH observation disconnects did not prove
process failure: the original processes were rechecked, and their valid
results were preserved. No missing results are inferred from process exit.

## Paired Device Performance

Final timing covers 336 configurations and 10,416 positive device events:
ten warmups, 31 samples per configuration, three alternating rounds, local
size 64, independent correctness checks before profiling. Compilation, host
startup, transfers and cold-cache overhead are not measured. Ratios are
median baseline round medians / median requested-store round medians within
the same exclusive device job, with other toggles fixed.

The main matrix independently varies store distribution, input staging and
the existing optimization stack. It has 216 runtime configurations and
961,704 output/padding comparisons. All 28 active comparisons and all 84
paired rounds improve. Eight fallback comparisons have identical source;
small timing differences on those are noise, not optimizer effects.

| Main workload | Store-distribution ratio across fixed settings |
|---|---:|
| Copy B256 n1021 | 1.3785-1.9219x |
| Holes B1024 n4093 | 1.4220-2.9655x |
| Reverse input B256 n1021 | 1.3204-1.8770x |
| Broadcast input B256 n1021 | 1.5481-2.0181x |
| Dot 16x32x32 f32 NN | 1.1305-1.5871x |
| Dot 16x32x32 f16 TT | 1.0771-1.2871x |
| Dot 32x16x64 f16 TN | 1.0298-1.0989x |

Additional output-layout timing has 120 configurations, 493,848 comparisons
and 20 active comparisons. All 60 paired rounds improve.

| Output class | Ratio with existing stack off/on |
|---|---:|
| Transposed copy | 1.2776 / 1.5878x |
| Padded copy | 1.2703 / 1.6147x |
| Negative-row copy | 1.2709 / 1.6407x |
| Stride-2 copy | 1.2772 / 1.6015x |
| Reverse-column copy | 1.2709 / 1.6230x |
| Rank-3 copy | 2.2942 / 2.7824x |
| f32 NN dot, transposed output | 1.0570 / 1.3008x |
| f32 TT dot, negative output | 1.0590 / 1.3305x |
| f16 TN dot, transposed output | 1.0093 / 1.1108x |
| f16 NT dot, negative output | 1.0493 / 1.1475x |

Together the measured domain has 48/48 improving active comparisons and
144/144 improving paired rounds (1.0093-2.9655x). The 256-element threshold
is an opportunity guard, not a universal cost model. Broad layout classes
and held-fixed toggles reduce pattern overfitting; they do not prove every
kernel, register-pressure regime, local size or compiler pass order profitable.
The option stays off by default. Actual markers and source equality establish
bounded composition evidence, not universal independence or multiplicative
speedups. Group/vector passes do not all actually transform these dot cases.

## Provenance and Reproduction

Final pass SHA-256:
99a8cfc440f20863fb3378a68df4f78afbacfadebf6dc669258e698dfcd75237.
Final WorkDistribution SHA-256:
0554b9f7c0627e42933cb1fb90323b6171acb311ec2c1b27655cecd7bb44e39b.
Final libtriton.so SHA-256:
20559bef65d7ec811e12a0e28168ff5343ca9a6b5c1b16d2f32d3d9381ff528c.

Evidence is in sycl-validation/terminal-store/, including audit.json and raw
JSON/logs/submitted scripts. The initial version's separate 9 GPU jobs and
CPU 72-record suite are archived under initial-version/; they are historical
evidence, not additional final-version coverage. The final compiler re-ran the
main device matrix. Use matching sources/harnesses for frozen wrapper checks.

    python-triton python/test/sycl/terminal_store_contracts.py --output contracts.json
    python-triton python/test/sycl/terminal_store_semantics.py --kind dot --dtype f16 --rounds 3 --repeats 31 --output dot.json
    python-triton python/test/sycl/terminal_store_layouts.py --suite memory --output layouts.json
    python3 python/test/sycl/audit_terminal_store.py docs/backend/sycl-validation/terminal-store --output audit.json

Research basis is recorded in sycl-optimization-research.md. The overall goal
remains active; this pass does not complete all layouts, dynamic stride proofs,
all optimization ablations or the remaining memory/reduction/runtime gaps.
