"""Validate physical-launch coverage before accepting a tiling cost rule."""
import argparse
import hashlib
import itertools
import json
import pathlib
import statistics


def audit(directory):
    def read(name):
        return json.loads((directory/name).read_text())

    jobs = read('two-column-launch-jobs.json')
    assert len(jobs) == 6 and len({j['jobid'] for j in jobs}) == 6
    assert {(j['layout'],j['k']) for j in jobs} == {
        ('NN',16),('TT',16),('NN',32),('TT',32),('NT',64),('TN',128)}
    states = {}
    for line in (directory/'two-column-launch-jobs.txt').read_text().splitlines():
        x = line.split('|')
        assert len(x) >= 4 and x[0] not in states
        states[x[0]] = x
    assert set(states) == {j['jobid'] for j in jobs}
    fingerprints = {}
    for line in (directory/'two-column-launch-sha256.txt').read_text().splitlines():
        digest,name = line.split(None,1)
        fingerprints[name] = digest
        if not name.startswith('python/triton/_C/'):
            assert hashlib.sha256((directory/'measured-source'/name).read_bytes()).hexdigest() == digest, name
    assert len(fingerprints) == 8
    comparisons = []
    total_rows = total_samples = total_elements = 0
    for job in jobs:
        jobid = job['jobid']
        assert states[jobid][1] == 'COMPLETED' and states[jobid][3] == '0:0', states[jobid]
        log = (directory/'logs'/f'sycl-two-column-launch-{jobid}.log').read_text()
        assert 'gfx906' in log and 'Traceback' not in log and 'FAILED' not in log
        assert all(name+': OK' in log for name in fingerprints)
        rows = read(f'two-column-launch-{jobid}.json')
        d = {(r['round'],r['plan'],r['block'],r['enabled']):r for r in rows}
        assert len(rows) == len(d) == 36
        assert set(d) == set(itertools.product(range(3),('base','full'),('64','128','256'),(False,True)))
        for row in rows:
            assert row['status'] == 'PASS' and row['layout'] == job['layout'] and row['shape'] == [8,16,job['k']]
            assert row['elements_checked'] == 391
            assert row['options']['matmul_register_tiling_2col'] == row['enabled']
            samples = row['samples_ns']
            assert len(samples) == 31 and all(v > 0 for v in samples)
            assert statistics.median(samples) == row['median_ns']
            total_samples += len(samples)
            total_elements += row['elements_checked']
        for plan,enabled in itertools.product(('base','full'),(False,True)):
            assert len({r['source_sha256'] for r in rows if r['plan']==plan and r['enabled']==enabled}) == 1
        for plan,block in itertools.product(('base','full'),('64','128','256')):
            ratios = [d[r,plan,block,False]['median_ns']/d[r,plan,block,True]['median_ns'] for r in range(3)]
            ratio = statistics.median([d[r,plan,block,False]['median_ns'] for r in range(3)])/statistics.median(
                [d[r,plan,block,True]['median_ns'] for r in range(3)])
            comparisons.append(dict(layout=job['layout'],k=job['k'],plan=plan,block=block,
                                    ratios=ratios,speedup=ratio))
        total_rows += len(rows)
    regressions = [c for c in comparisons if c['speedup'] < 1 or any(x < 1 for x in c['ratios'])]
    return dict(status='PASS' if not regressions else 'PERFORMANCE_REVIEW_REQUIRED',
                completed_jobs=len(jobs),records=total_rows,event_samples=total_samples,
                elements_checked=total_elements,comparisons=comparisons,regressions=regressions)


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('directory',type=pathlib.Path)
    p.add_argument('--output',type=pathlib.Path,required=True)
    a = p.parse_args()
    result = audit(a.directory)
    a.output.write_text(json.dumps(result,indent=2)+chr(10))
    print(json.dumps(result))
    raise SystemExit(result['status'] != 'PASS')


if __name__ == '__main__':
    main()
