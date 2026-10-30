"""Compile the measured dot set and verify the tiling guard's source invariants.

For f16 the guard must preserve the old program. For f32 a tiling request must
emit the same program as the corresponding untiled configuration. This checks
all selected measurements, not one representative output hash. No timing is
inferred from this compile-only verification.
"""
import argparse
import hashlib
import json
import pathlib

from register_accumulator import Tensor, kernel


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('inputs', nargs='*')
    parser.add_argument('--prefix', nargs=2, action='append', default=[])
    parser.add_argument('--output', required=True)
    args = parser.parse_args()
    rows = []
    for name, prefix in [(name, None) for name in args.inputs] + [
            (name, int(count)) for name, count in args.prefix]:
        selected = json.loads(pathlib.Path(name).read_text())
        rows.extend(selected if prefix is None else selected[:prefix])
    assert rows and all(row['status'] == 'PASS' for row in rows)
    def key(row):
        return tuple(row[k] for k in ('M', 'N', 'K', 'ta', 'tb', 'half', 'enabled', 'tiled'))
    before = {}
    for row in rows:
        fingerprint = row['source_sha256']
        config = key(row)
        assert config not in before or before[config] == fingerprint, config
        before[config] = fingerprint
    result = []
    for config, old_hash in sorted(before.items()):
        M, N, K, ta, tb, half, enabled, tiled = config
        x = Tensor([0.] * (3 * M * K), half)
        y = Tensor([0.] * (3 * K * N), half)
        z = Tensor([0.] * (3 * M * N))
        compiled = kernel.warmup(x, y, z, M - 1, N - 3, K - 1, M=M, N=N, K=K,
            BATCH=3, TA=ta, TB=tb, grid=(3,), register_accumulator=enabled,
            matmul_register_tiling=tiled, fuse_elementwise=False,
            reuse_local_memory=True, group_reduction=False, distribute_work=True,
            reduction_unroll=1)
        code = compiled.asm['sycl']
        code = code.decode() if isinstance(code, bytes) else code
        actual_hash = hashlib.sha256(code.encode()).hexdigest()
        keeps_tiling = half and M*(N//4)>=64
        expected_hash = old_hash if keeps_tiling else before[config[:-1] + (False,)]
        assert actual_hash == expected_hash, (config, actual_hash, expected_hash)
        memir = str(compiled.asm['memir'])
        applies = tiled and half and M >= 8 and N >= 16 and K >= 16 and M*(N//4)>=64
        assert ('sycl.register_tile =' in memir) == applies, config
        assert ('sycl.register_tile_composed_accumulator' in memir) == (applies and enabled), config
        result.append(dict(shape=[M,N,K], ta=ta, tb=tb, half=half,
            accumulator=enabled, tiled=tiled, status='PASS', source_sha256=actual_hash,
            expected_sha256=expected_hash, guard_changed_source=actual_hash != old_hash))
        pathlib.Path(args.output).write_text(json.dumps(result, indent=2) + '\n')
    print(json.dumps(dict(status='PASS', configurations=len(result),
                         changed=sum(row['guard_changed_source'] for row in result))))


if __name__ == '__main__':
    main()
