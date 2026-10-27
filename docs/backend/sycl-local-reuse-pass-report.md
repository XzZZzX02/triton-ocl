# Local-memory reuse pass — 2026-10-27

`sycl-local-memory-reuse` replaces the former emitter heuristic with an IR
transformation, controlled by cache-keyed `reuse_local_memory=True`. Only
equal static memref types with disjoint lifetimes in synchronized top-level
affine phases share allocation storage. Views, escaping uses, nested allocations
and overlapping phases reject the optimization. Allocations/uses change in IR;
the translator only reports the retained allocations.

Validation: 6 dedicated IR reuse/idempotence contracts; fusion×reuse CPU40/40
and gfx906120/120; the later fusion×reuse×group matrix gfx906240/240; independent
18-case reduction matrix on CPU/gfx906 across all eight configurations and
local sizes3/48/(3,5)/257. Group/reuse order permutations are covered separately.
Evidence is under sycl-validation/next/pass-{contracts-v6,v5-cpu,v5-dcu,group-v3-dcu}.json
and group-{edge-v3-cpu,v3-dcu}.json.

Exclusive gfx906 job22627125 measures four workloads ×three sizes ×eight
configurations ×three alternating rounds:288/288 correct rows,10 warmups and
31 event samples per row. On the actual reuse workload local memory falls
2048→1024 or8192→4096 bytes. Paired median speed ratios are1.005/1.005/1.001×
for1024/16384/262144 elements. These are effectively neutral timing, not a
meaningful speedup claim. The reliable gain is50% local storage reduction.

Sum/chain/transpose generated sources are identical when reuse cannot apply.
Timing variation on these no-op pairs is noise. No universal non-regression
claim follows from this bounded suite; smaller storage may alter occupancy
or code placement. First-round compile medians are about0.10s, while later
rounds hit the Python compiled-kernel cache; they are not fresh compile costs.
Analysis: analyze_pass_matrix.py and pass-group-paired-{dcu,analysis}.json.
