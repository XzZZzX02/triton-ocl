"""Analyze final gfx906 tiling-guard measurements with unroll held explicit."""
import argparse
import collections
import hashlib
import json
import pathlib
import statistics


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('inputs', nargs='+')
    parser.add_argument('--output', required=True)
    args = parser.parse_args()

    comparisons = []
    unroll_comparisons = []
    interactions = []
    total_rows = 0
    for filename in args.inputs:
        rows = json.loads(pathlib.Path(filename).read_text())
        assert len(rows) == 24, (filename, len(rows))
        assert all(row['status'] == 'PASS' for row in rows), filename
        shapes = {(r['M'], r['N'], r['K'], r['ta'], r['tb']) for r in rows}
        assert len(shapes) == 1, (filename, shapes)
        grouped = collections.defaultdict(dict)
        for row in rows:
            assert row['enabled'] and not row['fused'] and row['reuse']
            assert not row['group'] and row['distributed']
            assert len(row['samples_ns']) == 31 and row['median_ns'] > 0
            assert row['unroll'] in (1, 4)
            key = (row['half'], row['unroll'], row['round'], row['tiled'])
            assert key not in grouped, (filename, key)
            code_hash = row['source_sha256']
            assert len(code_hash) == 64 and all(c in '0123456789abcdef' for c in code_hash)
            grouped[key] = row

        expected = {(half, unroll, round_, tiled)
                    for half in (False, True) for unroll in (1, 4)
                    for round_ in range(3) for tiled in (False, True)}
        assert set(grouped) == expected, (filename, set(grouped) ^ expected)
        reduction_length = next(iter(shapes))[2]
        for round_ in range(3):
            for half in (False, True):
                if half and reduction_length < 32:
                    assert (grouped[half, 4, round_, True]['source_sha256'] ==
                            grouped[half, 1, round_, True]['source_sha256']), (
                                filename, half, round_)
        for half in (False, True):
            tile_speedups = {}
            for unroll in (1, 4):
                pairs = [(grouped[half, unroll, round_, False],
                          grouped[half, unroll, round_, True])
                         for round_ in range(3)]
                if not half:
                    assert all(before['source_sha256'] == after['source_sha256']
                               for before, after in pairs), (filename, unroll)
                    assert all(before['source_bytes'] == after['source_bytes']
                               for before, after in pairs), (filename, unroll)
                before_ns = statistics.median(x['median_ns'] for x, _ in pairs)
                after_ns = statistics.median(y['median_ns'] for _, y in pairs)
                ratios = [x['median_ns'] / y['median_ns'] for x, y in pairs]
                tile_speedups[unroll] = before_ns / after_ns
                comparisons.append({
                    'input': pathlib.Path(filename).name,
                    'job_id': pathlib.Path(filename).stem.rsplit('-', 1)[-1],
                    'shape': list(next(iter(shapes))[:3]),
                    'layout': ''.join('T' if t else 'N' for t in next(iter(shapes))[3:]),
                    'dtype': 'f16' if half else 'f32',
                    'unroll': unroll,
                    'untiled_median_ns': before_ns,
                    'tiled_median_ns': after_ns,
                    'speedup': before_ns / after_ns,
                    'round_speedups': ratios,
                    'all_rounds_nonregressing': all(r >= 1 for r in ratios),
                    'source_identical': all(x['source_sha256'] == y['source_sha256']
                                            for x, y in pairs),
                    'source_bytes_delta': sorted({y['source_bytes'] - x['source_bytes']
                                                  for x, y in pairs}),
                })
            for tiled in (False, True):
                pairs = [(grouped[half, 1, round_, tiled],
                          grouped[half, 4, round_, tiled])
                         for round_ in range(3)]
                before_ns = statistics.median(x['median_ns'] for x, _ in pairs)
                after_ns = statistics.median(y['median_ns'] for _, y in pairs)
                unroll_comparisons.append({
                    'input': pathlib.Path(filename).name,
                    'shape': list(next(iter(shapes))[:3]),
                    'layout': ''.join('T' if t else 'N' for t in next(iter(shapes))[3:]),
                    'dtype': 'f16' if half else 'f32',
                    'tiled': tiled,
                    'unroll4_speedup_vs_unroll1': before_ns / after_ns,
                    'round_speedups': [x['median_ns'] / y['median_ns']
                                       for x, y in pairs],
                    'source_bytes_delta': sorted({y['source_bytes'] - x['source_bytes']
                                                  for x, y in pairs}),
                })
            interactions.append({
                'input': pathlib.Path(filename).name,
                'dtype': 'f16' if half else 'f32',
                'tiling_speedup_unroll1': tile_speedups[1],
                'tiling_speedup_unroll4': tile_speedups[4],
                'relative_change': tile_speedups[4] / tile_speedups[1],
            })
        total_rows += len(rows)

    assert len(comparisons) == 16
    assert len(unroll_comparisons) == 16 and len(interactions) == 8
    f16 = [x for x in comparisons if x['dtype'] == 'f16']
    f32 = [x for x in comparisons if x['dtype'] == 'f32']
    result = {
        'status': 'PASS',
        'rows': total_rows,
        'jobs': len(args.inputs),
        'comparisons': comparisons,
        'unroll_comparisons': unroll_comparisons,
        'tiling_unroll_interactions': interactions,
        'summary': {
            'f16_comparisons': len(f16),
            'f16_speedup_range': [min(x['speedup'] for x in f16),
                                  max(x['speedup'] for x in f16)],
            'f16_nonregressing_comparisons': sum(
                x['all_rounds_nonregressing'] for x in f16),
            'f16_nonregressing_rounds': sum(
                sum(speedup >= 1 for speedup in x['round_speedups']) for x in f16),
            'f32_comparisons': len(f32),
            'f32_source_identical_pairs': sum(x['source_identical'] for x in f32),
        },
    }
    pathlib.Path(args.output).write_text(json.dumps(result, indent=2) + '\n')
    print(json.dumps(result['summary'], sort_keys=True))


if __name__ == '__main__':
    main()
