# Phase Barrier Coalescing: Rejected for Production

Date: 2026-11-01. Baseline: 1781a63a. Device route: wlx -> dfcs, gfx906.

## Implementation and Decision

The experimental sycl-phase-barrier-coalescing pass records which duplicate
local-space SYCL barriers can be skipped between unconditional top-level
phases. Every top-level affine phase in this backend retains its exit barrier.
The candidate skips a later identical explicit gpu.barrier or scalar phase
entry barrier only when nothing between them has device memory effects or
control flow. It never crosses a load/store, SCF/conditional region, call or
collective. The emitter consumes two explicit attributes; schedules, masks,
address arithmetic, floating operations and ownership remain unchanged.

The pass runs last, after scheduling, storage reuse, terminal-store planning
and half-copy guards, behind an independent cache-keyed default-off option.
It clears stale annotations and re-proves the plan on repetition. It uses no
kernel/shape whitelist, MFMA, dtype expansion or implicit floating fast math.

The candidate is **withdrawn from the production build and pipeline**.
Correctness passed in the tested domain, and lower-level LLVM IR confirms a
real barrier reduction. However, 16 of 35 active contexts regress in aggregate,
five regress in all three rounds, and the improvements do not establish a
reliable general profitability gate. Keeping a pass just because its source
has fewer barrier calls would not satisfy the user's acceptance requirement.
Production has been restored to baseline behavior; measured and unvalidated
candidate overlays remain archived for future research.
After every related job reached a terminal state, DFCS was rebuilt with the
production build/pipeline/emitter files. Both binary fingerprints match the
1781a63a versions exactly: libtriton.so
b109ccab452f3b7ab9e58fb2d7acdff42a61dd628b54eb2a1ba9f025178c1319 and translator
77722519f18ef7ab87b0bda0ed360967e294b3d239cfc22c5ce455248fb28f64.
The experimental option/factory are absent; 72 source checks and 296 half-copy
contracts pass again.

## Legality and Source Evidence

- 24 measured-version emission contracts cover duplicate explicit barriers,
  pure register arithmetic, allocation/deallocation/view declarations,
  intervening reads/writes, SCF/conditional regions, distributed phases,
  stale annotations, idempotence and cache defaults. Every accepted mark must
  reduce the actual emitted source barrier count by exactly one.
- 18 explicit pass-order contracts re-plan after staging/distribution,
  accumulator/tiling/initializer/reuse and terminal store changes. Repeating
  the final coalescing proof is idempotent. Other optimization markers remain.
- 144 archived dot records: 72 disabled-option programs have exact prior source
  identity. The enabled pass transforms all 72, preserving schedules, half-bit
  guards and other pass markers while reducing emitted barrier counts by the
  recorded amount. These are source-level checks, not proof of universal
  pass-order independence.
- Existing suites pass on the measured compiler: general 150, terminal stores
  241, half-copy guard 296, guarded half stores 482, initializer 55, staging
  66, ordered unroll 71 and fusion destinations 16.

The initial cast fixture used an unsupported dynamic memref.cast emission
and failed before counting final contracts; it was replaced with a supported
reinterpret view. Later review proposed restricting transparent arithmetic
to scalar types: shaped pure operations may materialize local arrays during
source emission. That refinement plus two additional stale-marker fixtures
was saved under unvalidated-latest/ and was **not rebuilt or device-tested**.
It is not represented as validated by the 24 measured contracts. This concern
is another reason not to retain the candidate in production.

## Runtime Correctness

All 15 performance jobs completed with exit 0:0, and all three CPU shards
completed. A separate final-IR probe also completed.

- GPU: 222 measurement records, 1,819,188 exact/reference output and padding
  comparisons, 6,882 positive device events.
- CPU: 40 configurations and 226,440 comparisons. Memory fixtures include
  NaNs, signed zeros, infinities and f32 subnormal/finite bounds; dot uses
  exactly representable quarter-fraction inputs with an independent reference.
- GPU memory: small B16/n61, B256 copy, B1024 holes, reverse input, gather and
  empty mask. Reduction is a source-identical no-op control. Dot includes
  f32 NN/TT and f16 NN/NT/TT at 16x32x32, f16 TN32x16x64, and the repaired
  f16 TT8x32x16 case.
- Every timed program checks local shapes 1,3,48,(3,5),64, resetting sentinels,
  then checks its profiled final output. Grid is 3 or 4 depending on fixture.
- The full-stack TT ablation holds each of staging, terminal stores, reuse,
  fusion, accumulator, tiling and ordered unroll fixed/off in turn, and also
  tests a serial ownership plan. Other markers remain equal within pairs.

The complete auditor checks expected configuration sets, source fingerprints,
marker preservation, exact barrier count differences, sample/median validity,
output counts, terminal states, binary checksum logs and gfx906 identity.
No process exit alone is counted as a passed semantic test. This bounded
coverage does not prove arbitrary barrier-moving transformations or all models.

## Performance and Backend Probe

Ten warmups, 31 device-event samples per option, three alternating rounds;
compilation, process startup and transfers excluded. Ratios below one are a
regression: median baseline round medians / median coalesced round medians.

| Workload | Base / full schedule ratio |
|---|---:|
| Small copy B16, n61 | 0.8797x / 0.9302x |
| Copy B256, n1021 | 0.9978x / 1.1969x |
| Holes B1024, n4093 | 1.0073x / 0.9957x |
| Reverse input B256 | 1.0023x / 1.0000x |
| Gather B256 | 0.9967x / 0.9832x |
| Empty mask B256 | 1.0061x / 0.9999x |
| f32 NN16x32x32 | 1.0118x / 1.0065x |
| f32 TT16x32x32 | 0.9878x / 0.9969x |
| f16 TT16x32x32 | 0.9992x / 1.0016x |
| f16 TN32x16x64 | 1.0000x / 1.0009x |
| f16 TT8x32x16 | 0.9971x / 1.0025x |

The strongest aggregate gain (copy/full, 1.1969x) has round ratios
1.1874,1.0079,1.4528, while the small copy/full loses in all three rounds.
It cannot establish a general copy/barrier profitability rule. In the
independent full-stack TT composition job, no-tiling loses in all three rounds,
and other ablations are mostly close to one. Reduction removes no barrier and
has byte-identical source; its timing fluctuations are noise controls.

Final AdaptiveCpp LLVM IR probe 22811509 compiles small copy at local=64 with
fresh appdb caches and ACPP_S2_DUMP_IR_FINAL. Source barriers decrease 4 -> 3,
and actual llvm.amdgcn.s.barrier call instructions likewise decrease 4 -> 3.
Both programs return correct output (136 comparisons total). Thus the edit
does remove a lower-level synchronization instruction in this probe; that is
insufficient to infer device performance. Native ISA, occupancy or scheduling
mechanisms are not claimed from this IR-level evidence.

## Sources, Versions and Reproduction

Official MLIR GPU barrier-elimination documentation describes deleting barriers
whose conflicting effect pairs are already enforced elsewhere. It cites
Moses et al., *High-Performance GPU-to-CPU Transpilation and Optimization via
High-Level Parallel Constructs*, PPoPP 2023 / Polygeist. This backend candidate
implements only identical top-level local barriers, not the upstream complete
effect/alias solver. Official reference retrieved 2026-11-01:
https://mlir.llvm.org/docs/Passes/#-gpu-eliminate-barriers

Measured libtriton.so SHA:
bd80349b961c782c01bee3666110d48ca65d8c569a14d719962b311a0876845e.
Measured translator SHA:
8e11b7528b91240332afb9fa1644cc9f118a67d52a09ee4a30e822dec0bd85eb.
The archive includes raw sources/MemIR, samples, all logs and states, measured
compiler source and a patch against 1781a63a. The unvalidated-latest overlay
is separate. Historical runner commands require applying the measured patch
and rebuilding that compiler; they are not production-supported options.

Read-only audit on the restored repository:

~~~sh
python3 python/test/sycl/analyze_phase_barrier_experiment.py \
  docs/backend/sycl-validation/phase-barrier-experiment --output /tmp/barrier-audit.json
~~~

This negative experiment preserves production behavior and supplies a tested
counterexample to source barrier-count profitability. The larger optimization
goal remains active.

Final handwritten source/Python syntax checks pass. Generated sources, native
logs, submitted scripts and scheduler outputs retain their original trailing
whitespace and EOF blank lines so source fingerprints remain meaningful.
The evidence-only diff check ignores those categories; a manifest verifies
every archived file's SHA-256.
