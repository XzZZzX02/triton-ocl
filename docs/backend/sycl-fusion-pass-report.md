# Elementwise fusion pass — 2026-10-27

`sycl-elementwise-fusion`, cache-keyed `fuse_elementwise=False`, runs before
bufferization. It uses upstream Linalg elementwise fusion for pure tensor,
single-use/single-result producers with equal loop rank, identity indexing maps
and memory-effect-free scalar regions. Reductions, fanout and permutations
reject fusion. No fast math or floating reassociation is introduced.

Validation:6 IR accept/reject/idempotence contracts; CPU40/40 and gfx906120/120
fusion×reuse rows, later gfx906240/240 across three toggles;18 reduction cases
across all eight configurations and four irregular local ranges on each device.
The exclusive288-row paired benchmark additionally varies pass combinations
and configuration order across three rounds. See the reuse report for protocol.

For composed sum, generic operations3→2 and local storage3076→2052 or
12292→8196 bytes. Source shrinks1061–1071 bytes. Paired median event speedups:
1.040× at1024 elements,1.057× at16384,1.001× at262144. The large case is
neutral. Chain/fanout examples may already be fused by earlier lowering;
identical generated source is a no-op, not evidence of fusion speedup.

Default remains disabled: modest measured gains and structural savings do
not establish general profitability. No artificial kernel-name/shape whitelist
is used. Combined fusion/group gains retain separate measurable effects in
the tested sum class; all code/source hashes and raw timings remain archived.


2026-10-31 follow-up: a loop-carried destination/bufferization failure is fixed
by guarding only the upstream destination-removal cleanup under tensor loops.
See sycl-fusion-destination-report.md for the 16 new contracts, runtime checks,
200 source invariants and paired device data; the original report remains the
record of its earlier measured compiler version.
