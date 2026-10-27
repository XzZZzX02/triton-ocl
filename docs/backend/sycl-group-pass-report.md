# Group reduction pass — 2026-10-27

`sycl-group-reduction` materializes thread-strided SCF partials and explicit
`gpu.all_reduce`, followed by owner combine and a barrier. The emitter maps
the collective to SYCL reduce_over_group and no longer recognizes reduction
patterns or creates hidden scratch storage. Option `group_reduction=False` is
cache keyed. This changes the default relative to the former emitter path:
without opting in, long reductions use the serial semantic fallback.

Legality: top-level uniform explicit reduction; static0..N step1, N≥256;
two loads/one binary combine/one scalar store; separate owned input/accumulator
allocations; identity input map; no escaped load/combine values. Accepted
types are f32/f64/i32/i64, operators add/mul/and/or/xor. Integer collectives
use unsigned arithmetic to preserve modular overflow. Conditional, short,
view/alias, tuple, maxnum/minnum and unsupported dtype cases fall back.

CPU18/18 and gfx90618/18 edge cases each cover eight pass combinations and
local sizes3/48/(3,5)/257. Cases include all-NaN max, mixed-zero min, NaN/zero
sum/product, overflow, runtime tails and conditional execution. IR contracts
exercise positive/negative matches, repeated invocation and group/reuse orders.
The broader gfx906 matrix is240/240.

Exclusive job22627125:288/288 rows pass. Sum paired median speed ratios over
12 pairs per size are1.034×/2.364×/1.575× for1024/16384/262144 elements,
with respective ranges1.018–1.057/2.304–2.433/1.547–1.587×. Other measured
workloads are byte-identical no-ops. Fusion remains independently effective
on the smaller sum workloads; reuse does not change their generated source.

Floating reductions change association. Native fp8 previously happened to
pass a precise-sum oracle with the old tree, while serial fp8 rounds on every
update and produces8/16 instead of24 on that probe. The revised numerical
test explicitly widens the long sum and separately checks a native sum whose
intermediates are representable. No claim of bitwise equivalence across
arbitrary floating reduction orders is made.

Evidence: group-{edge-v3-cpu,v3-dcu}.json, pass-group-v3-dcu.json,
pass-group-paired-{dcu,analysis}.json and pass-contracts-v11.json.
