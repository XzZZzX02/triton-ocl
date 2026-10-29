"""Validate complete same-job LICM pairs and report interactions without pooling."""
import argparse
import itertools
import json
import pathlib
import statistics


def analyze(path):
    rows = json.loads(path.read_text())
    assert rows and all(r['status'] == 'PASS' for r in rows), path
    reduction = all(r.get('case') == 'reduction' for r in rows)
    assert reduction or all('case' not in r for r in rows), path
    configs = {}
    for r in rows:
        key = (r['round'], r['hoist'], r['accumulator'], r['unroll'])
        assert key not in configs, (path, key)
        assert len(r['samples_ns']) == 31 and all(x > 0 for x in r['samples_ns']), (path, key)
        assert statistics.median(r['samples_ns']) == r['median_ns'], (path, key)
        assert r['elements_checked'] > 0, (path, key)
        configs[key] = r
    factors = (1,4) if reduction else (1,)
    expected = set(itertools.product(range(3), (False,True), (False,True), factors))
    assert set(configs) == expected, (path, expected ^ set(configs))
    comparisons = []
    for acc, unroll in itertools.product((False,True), factors):
        pairs = [(configs[i,False,acc,unroll], configs[i,True,acc,unroll]) for i in range(3)]
        marker = 'hoisted' if reduction else 'marker_count'
        assert all(a[marker] == 0 and b[marker] > 0 for a,b in pairs), (path, acc, unroll)
        assert len({a['source_sha256'] for a,b in pairs}) == 1, path
        assert len({b['source_sha256'] for a,b in pairs}) == 1, path
        if reduction:
            for a,b in pairs:
                assert a['promoted'] == b['promoted'] == int(acc), (path, a, b)
                assert a['expanded'] == b['expanded'] == int(acc and unroll > 1), (path,a,b)
        before = statistics.median(a['median_ns'] for a,b in pairs)
        after = statistics.median(b['median_ns'] for a,b in pairs)
        ratios = [a['median_ns']/b['median_ns'] for a,b in pairs]
        comparisons.append(dict(accumulator=acc,unroll=unroll,baseline_ns=before,hoisted_ns=after,
            speedup=before/after,round_speedups=ratios,all_rounds_nonregressing=all(x>=1 for x in ratios),
            source_bytes_delta=sorted({b['source_bytes']-a['source_bytes'] for a,b in pairs}),
            source_identical=all(a['source_sha256']==b['source_sha256'] for a,b in pairs)))
    # Accumulator is a no-op for the scalar probe. Require source evidence
    # rather than calling its toggle an active interaction experiment.
    if not reduction:
        for round_,hoist in itertools.product(range(3),(False,True)):
            assert (configs[round_,hoist,False,1]['source_sha256'] ==
                    configs[round_,hoist,True,1]['source_sha256']), path
    return dict(input=path.name,rows=len(rows),kind='reduction' if reduction else 'scalar',
                comparisons=comparisons,elements_checked=sum(r['elements_checked'] for r in rows))


def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('inputs',nargs='+')
    p.add_argument('--output',required=True)
    args=p.parse_args()
    results=[analyze(pathlib.Path(x)) for x in args.inputs]
    pathlib.Path(args.output).write_text(json.dumps(dict(status='PASS',jobs=results),indent=2)+'\n')
    for r in results:
        print(json.dumps(r))


if __name__ == '__main__':
    main()
