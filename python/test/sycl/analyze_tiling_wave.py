"""Validate complete same-job tiling pairs; keep initializer/unroll axes explicit."""
import argparse
import itertools
import json
import pathlib
import statistics


def paired(configs, keys, before, after, axis):
    pairs = [(configs[key + before], configs[key + after]) for key in keys]
    for row in (r for pair in pairs for r in pair):
        assert len(row['samples_ns']) == 31 and min(row['samples_ns']) > 0, row
        assert statistics.median(row['samples_ns']) == row['median_ns'], row
    for index in (0, 1):
        assert len({pair[index]['source_sha256'] for pair in pairs}) == 1, axis
        assert len({pair[index]['source_bytes'] for pair in pairs}) == 1, axis
    baseline = statistics.median(a['median_ns'] for a, b in pairs)
    changed = statistics.median(b['median_ns'] for a, b in pairs)
    ratios = [a['median_ns'] / b['median_ns'] for a, b in pairs]
    return dict(axis=axis, before_ns=baseline, after_ns=changed,
                speedup=baseline / changed, round_speedups=ratios,
                nonregressing_rounds=sum(r >= 1 for r in ratios),
                identical_source=all(a['source_sha256'] == b['source_sha256']
                                     for a, b in pairs),
                source_bytes_delta=pairs[0][1]['source_bytes'] - pairs[0][0]['source_bytes'])


def analyze(path):
    rows = json.loads(path.read_text())
    assert rows and all(r['status'] == 'PASS' for r in rows), path
    standalone = 'M' in rows[0]
    configs = {}
    if standalone:
        assert len(rows) == 12, (path, len(rows))
        shapes = {(r['M'], r['N'], r['K'], r['ta'], r['tb'], r['half']) for r in rows}
        assert len(shapes) == 1, (path, shapes)
        M, N, K, ta, tb, half = next(iter(shapes))
        assert half and M * (N // 4) < 64, 'standalone run is a small fallback probe'
        for r in rows:
            assert r['distributed'] and not r['fused'] and r['reuse'] and not r['group'], r
            assert not r['special'] and r['unroll'] == 1, r
            key = (r['round'], r['enabled'], r['tiled'])
            assert key not in configs, (path, key)
            configs[key] = r
        assert set(configs) == set(itertools.product(range(3), (False, True), (False, True))), path
        comparisons = []
        for acc in (False, True):
            result = paired(configs, [(i, acc) for i in range(3)], (False,), (True,), 'tiling')
            assert result['identical_source'], (path, acc)
            result.update(accumulator=acc, active=False)
            comparisons.append(result)
        return dict(input=path.name, mode='standalone', shape=[M, N, K],
                    layout=('T' if ta else 'N') + ('T' if tb else 'N'), dtype='f16',
                    rows=len(rows), comparisons=comparisons)

    assert len(rows) == 24, (path, len(rows))
    shapes = {(tuple(r['shape']), r['layout'], r['dtype']) for r in rows}
    assert len(shapes) == 1, (path, shapes)
    shape, layout, dtype = next(iter(shapes))
    M, N, K = shape
    assert dtype == 'f16', path
    tile_active = M >= 8 and N >= 16 and N % 4 == 0 and K >= 16 and M * (N // 4) >= 64
    for r in rows:
        assert not r['special'] and r['elements_checked'] == 6 * M * N, r
        assert r['marker'] == (r['enabled'] and M * N >= 128), r
        key = (r['round'], r['enabled'], r['unroll'], r['tiled'])
        assert key not in configs, (path, key)
        configs[key] = r
    assert set(configs) == set(itertools.product(range(3), (False, True), (1, 4), (False, True))), path
    comparisons = []
    for init, factor in itertools.product((False, True), (1, 4)):
        result = paired(configs, [(i, init, factor) for i in range(3)], (False,), (True,), 'tiling')
        assert result['identical_source'] == (not tile_active), (path, init, factor, result)
        result.update(initializer=init, unroll=factor, active=tile_active)
        comparisons.append(result)
    initializers = []
    for tiled, factor in itertools.product((False, True), (1, 4)):
        before = [configs[i, False, factor, tiled] for i in range(3)]
        after = [configs[i, True, factor, tiled] for i in range(3)]
        assert all(b['barriers'] == a['barriers'] - 1 for a, b in zip(before, after)), path
        assert all(a['local_bytes'] == b['local_bytes'] for a, b in zip(before, after)), path
        temporary = {(i, False): before[i] for i in range(3)}
        temporary.update({(i, True): after[i] for i in range(3)})
        result = paired(temporary, [(i,) for i in range(3)], (False,), (True,), 'initializer')
        result.update(tiled=tiled, unroll=factor)
        initializers.append(result)
    unroll_comparisons = []
    for init, tiled in itertools.product((False, True), (False, True)):
        temporary = {(i, factor): configs[i, init, factor, tiled]
                     for i, factor in itertools.product(range(3), (1, 4))}
        result = paired(temporary, [(i,) for i in range(3)], (1,), (4,), 'unroll')
        if tile_active and tiled and K < 32:
            assert result['identical_source'], path
        result.update(initializer=init, tiled=tiled)
        unroll_comparisons.append(result)
    return dict(input=path.name, mode='combined', shape=shape, layout=layout, dtype=dtype,
                rows=len(rows), elements_checked=sum(r['elements_checked'] for r in rows),
                comparisons=comparisons, initializer_comparisons=initializers,
                unroll_comparisons=unroll_comparisons)


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('inputs', nargs='+')
    p.add_argument('--output', required=True)
    args = p.parse_args()
    jobs = [analyze(pathlib.Path(name)) for name in args.inputs]
    result = dict(status='PASS', rows=sum(j['rows'] for j in jobs), jobs=jobs)
    pathlib.Path(args.output).write_text(json.dumps(result, indent=2) + '\n')
    for job in jobs:
        print(json.dumps({k: v for k, v in job.items()
                          if k not in ('initializer_comparisons', 'unroll_comparisons')}))


if __name__ == '__main__':
    main()
