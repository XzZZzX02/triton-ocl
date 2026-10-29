"""Validate same-job initializer pairs and their tiling/unroll interactions."""
import argparse
import itertools
import json
import pathlib
import statistics


def analyze(path):
    rows = json.loads(path.read_text())
    assert rows and all(r['status'] == 'PASS' for r in rows), path
    identity = {(tuple(r['shape']),r['layout'],r['dtype'],r['special']) for r in rows}
    assert len(identity) == 1, (path,identity)
    assert all(not r['special'] for r in rows), 'special runs are correctness evidence only'
    configs = {}
    for row in rows:
        key = (row['round'],row['tiled'],row['unroll'],row['enabled'])
        assert key not in configs, (path,key)
        assert not row['marker'] or row['enabled'], (path,key)
        assert row['elements_checked'] > 0, (path,key)
        assert len(row['samples_ns']) == 31 and min(row['samples_ns']) > 0, (path,key)
        assert statistics.median(row['samples_ns']) == row['median_ns'], (path,key)
        configs[key] = row
    assert set(configs) == set(itertools.product(range(3),(False,True),(1,4),(False,True))), path
    comparisons = []
    for tiled,unroll in itertools.product((False,True),(1,4)):
        pairs = [(configs[i,tiled,unroll,False],configs[i,tiled,unroll,True]) for i in range(3)]
        for field in ('local_bytes','source_sha256','barriers','source_bytes'):
            assert len({a[field] for a,b in pairs})==1,(path,field)
            assert len({b[field] for a,b in pairs})==1,(path,field)
        assert all(a['local_bytes']==b['local_bytes'] for a,b in pairs), path
        active = all(b['marker'] for a,b in pairs)
        assert all(not a['marker'] for a,b in pairs), path
        if active:
            assert all(b['barriers'] < a['barriers'] for a,b in pairs), path
        else:
            assert all(a['source_sha256'] == b['source_sha256'] and
                       a['barriers'] == b['barriers'] for a,b in pairs), path
        before=statistics.median(a['median_ns'] for a,b in pairs)
        after=statistics.median(b['median_ns'] for a,b in pairs)
        ratios=[a['median_ns']/b['median_ns'] for a,b in pairs]
        comparisons.append(dict(tiled=tiled,unroll=unroll,active=active,before_ns=before,after_ns=after,
            speedup=before/after,round_speedups=ratios,
            nonregressing_rounds=sum(x>=1 for x in ratios),
            source_bytes_delta=pairs[0][1]['source_bytes']-pairs[0][0]['source_bytes'],
            barriers_removed=pairs[0][0]['barriers']-pairs[0][1]['barriers'],
            local_bytes=pairs[0][0]['local_bytes']))
    shape,layout,dtype,special=next(iter(identity))
    return dict(input=path.name,shape=shape,layout=layout,dtype=dtype,
        rows=len(rows),elements_checked=sum(r['elements_checked'] for r in rows),comparisons=comparisons)


def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('inputs',nargs='+')
    p.add_argument('--output',required=True)
    args=p.parse_args()
    results=[analyze(pathlib.Path(name)) for name in args.inputs]
    output=dict(status='PASS',jobs=results)
    pathlib.Path(args.output).write_text(json.dumps(output,indent=2)+'\n')
    for row in results: print(json.dumps(row))


if __name__ == '__main__':main()
