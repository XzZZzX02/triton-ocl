"""Audit paired cooperative-staging device samples, never infer missing pairs."""
import argparse
import itertools
import json
import pathlib
import statistics


def analyze(paths):
    comparisons = []
    total_rows = total_elements = 0
    for path in paths:
        rows = json.loads(path.read_text())
        assert rows, path
        boundary = 'case' in rows[0]
        axes = (('stage', 'fuse', 'reuse') if 'fuse' in rows[0] else
                ('stage', 'reuse')) if boundary else ('enabled', 'stack')
        expected = set(itertools.product(range(3), *((False, True),) * len(axes)))
        keyed = {}
        for row in rows:
            key = (row['round'], *(row[a] for a in axes))
            assert key in expected and key not in keyed, (path, key)
            keyed[key] = row
            if row['status'] == 'EXPECTED_COMPILE_FAILURE':
                assert boundary and row['case'] == 'loop' and row['fuse']
                assert row['elements_checked'] == 0 and row['samples_ns'] == []
                continue
            assert row['status'] == 'PASS' and row['elements_checked'] > 0, (path, key)
            samples = row['samples_ns']
            assert len(samples) == 31 and all(isinstance(x, int) and x > 0 for x in samples), (path, key)
            assert statistics.median(samples) == row['median_ns'], (path, key)
            total_elements += row['elements_checked']
        assert set(keyed) == expected, (path, expected - set(keyed))
        total_rows += len(rows)
        for other in itertools.product((False, True), repeat=len(axes)-1):
            before = [keyed[(r, False, *other)] for r in range(3)]
            after = [keyed[(r, True, *other)] for r in range(3)]
            if before[0]['status'] == 'EXPECTED_COMPILE_FAILURE':
                assert all(x['status'] == 'EXPECTED_COMPILE_FAILURE' for x in before+after)
                continue
            assert all(x['status'] == 'PASS' for x in before+after)
            for side in (before, after):
                assert len({r['source_sha256'] for r in side}) == 1, path
                assert len({r['stages'] for r in side}) == 1, path
            active = after[0]['stages'] > 0
            assert before[0]['stages'] == 0, path
            for b, a in zip(before, after):
                assert b['local_bytes'] == a['local_bytes'], (path, 'storage changed')
                assert b['elements_checked'] == a['elements_checked']
                if boundary and 'collectives' in b:
                    assert b['collectives'] == a['collectives']
                    assert b['linalg_generics'] == a['linalg_generics']
                elif not boundary:
                    for name, count in b['markers'].items():
                        if name != 'sycl.distribution_depth':
                            assert count == a['markers'][name], (path, name)
                    assert a['markers']['sycl.distribution_depth'] == b['markers']['sycl.distribution_depth'] + a['stages']
                if not active:
                    assert b['source_sha256'] == a['source_sha256'], (path, 'fallback changed')
            ratios = [b['median_ns']/a['median_ns'] for b,a in zip(before,after)]
            ratio = statistics.median(x['median_ns'] for x in before) / statistics.median(x['median_ns'] for x in after)
            comparisons.append(dict(file=path.name, workload=rows[0].get('case',rows[0].get('kind')),
                fixed=dict(zip(axes[1:],other)), active=active, speedup=ratio, round_ratios=ratios,
                before_median_ns=statistics.median(x['median_ns'] for x in before),
                after_median_ns=statistics.median(x['median_ns'] for x in after)))
    active = [x for x in comparisons if x['active']]
    return dict(rows=total_rows, elements_checked=total_elements, comparisons=comparisons,
        active_comparisons=len(active), improved=sum(x['speedup']>1 for x in active),
        active_speedup_range=[min(x['speedup'] for x in active),max(x['speedup'] for x in active)] if active else [])


def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('files',nargs='+',type=pathlib.Path)
    p.add_argument('--output',required=True,type=pathlib.Path)
    args=p.parse_args()
    result=analyze(args.files)
    args.output.write_text(json.dumps(result,indent=2)+chr(10))
    print(json.dumps({k:v for k,v in result.items() if k!='comparisons'}))


if __name__=='__main__':main()
