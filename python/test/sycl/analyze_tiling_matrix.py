"""Validate complete dot measurement groups and summarize paired tiling costs.

Each input must contain complete configurations for every included shape/layout/
dtype. A timed-out file requires an explicit --prefix FILE COUNT; no incomplete
group is silently discarded. Device files are never paired across jobs.
"""
import argparse
import collections
import json
import pathlib
import statistics


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('inputs', nargs='*')
    parser.add_argument('--prefix', nargs=2, action='append', default=[], metavar=('FILE', 'COUNT'))
    parser.add_argument('--output', required=True)
    args = parser.parse_args()
    sources = [(name, None) for name in args.inputs]
    sources += [(name, int(count)) for name, count in args.prefix]
    if not sources:
        parser.error('provide at least one input')
    summary = []
    total = 0
    for name, prefix in sources:
        rows = json.loads(pathlib.Path(name).read_text())
        full_count = len(rows)
        if prefix is not None:
            assert 0 < prefix <= full_count, (name, prefix, full_count)
            rows = rows[:prefix]
        assert rows and all(row['status'] == 'PASS' for row in rows), name
        groups = collections.defaultdict(dict)
        for row in rows:
            key = (row['M'], row['N'], row['K'], row['ta'], row['tb'], row['half'])
            config = (row['round'], row['enabled'], row['tiled'])
            assert config not in groups[key], (name, key, config)
            assert row.get('unroll', 1) == 1, (name, 'unroll must be held fixed')
            assert row.get('fused') is False and row.get('reuse') is True, row
            assert row.get('group') is False and row.get('distributed') is True, row
            assert len(row['samples_ns']) == 31 and row['median_ns'] > 0, row
            groups[key][config] = row
        for key, configs in sorted(groups.items()):
            assert set(configs) == {(r, a, t) for r in range(3)
                                    for a in (False, True) for t in (False, True)}, (name, key)
            for accumulator in (False, True):
                pairs = [(configs[r, accumulator, False], configs[r, accumulator, True])
                         for r in range(3)]
                before = statistics.median(a['median_ns'] for a, _ in pairs)
                after = statistics.median(b['median_ns'] for _, b in pairs)
                ratios = [a['median_ns'] / b['median_ns'] for a, b in pairs]
                summary.append(dict(input=pathlib.Path(name).name, shape=list(key[:3]),
                    layout=('T' if key[3] else 'N') + ('T' if key[4] else 'N'),
                    dtype='f16' if key[5] else 'f32', accumulator=accumulator,
                    before_ns=before, after_ns=after, speedup=before / after,
                    min_round_speedup=min(ratios), max_round_speedup=max(ratios),
                    identical_source_pairs=sum(a['source_sha256'] == b['source_sha256']
                                               for a, b in pairs),
                    source_bytes_delta=sorted({b['source_bytes'] - a['source_bytes']
                                               for a, b in pairs}),
                    input_rows=full_count, included_rows=len(rows)))
        total += len(rows)
    result = dict(status='PASS', included_rows=total, groups=summary)
    pathlib.Path(args.output).write_text(json.dumps(result, indent=2) + '\n')
    print(json.dumps(dict(status='PASS', included_rows=total, comparisons=len(summary))))


if __name__ == '__main__':
    main()
