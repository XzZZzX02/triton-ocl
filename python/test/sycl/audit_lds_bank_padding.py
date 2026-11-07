"""Audit the exploratory padding matrix without accepting incomplete timing."""
import argparse
import hashlib
import itertools
import json
import math
import pathlib
import statistics


def read(path):
    return json.loads(path.read_text())


def audit(directory):
    fingerprints = {}
    for line in (directory/'lds-pilot-sha256.txt').read_text().splitlines():
        digest,name = line.split()
        assert name not in fingerprints
        fingerprints[name] = digest
        if not name.startswith('python/triton/_C/'):
            assert hashlib.sha256((directory/'measured-source'/name).read_bytes()).hexdigest() == digest, name
    assert len(fingerprints) == 12
    jobs = read(directory/'lds-pilot-jobs.json')
    assert len(jobs) == len({r['jobid'] for r in jobs}) == 3
    states = {}
    for line in (directory/'lds-pilot-jobs.txt').read_text().splitlines():
        fields=line.split('|')
        assert fields[0] not in states
        states[fields[0]]=fields
    assert set(states) == {r['jobid'] for r in jobs}
    totals = dict(device_records=0,device_event_samples=0,elements_checked=0,inert_pairs=0)
    comparisons = []
    incomplete = []
    for job in jobs:
        jobid=job['jobid']
        state=states[jobid]
        if state[1] != 'COMPLETED' or state[3] != '0:0':
            incomplete.append(dict(jobid=jobid,state=state[1],exit=state[3]))
            continue
        argv=job['args']
        shape=list(map(int,argv[argv.index('--shape')+1:argv.index('--shape')+4]))
        layout=argv[argv.index('--layout')+1]
        plans=argv[argv.index('--plans')+1:argv.index('--blocks')]
        blocks=argv[argv.index('--blocks')+1:argv.index('--rounds')]
        rounds=int(argv[argv.index('--rounds')+1])
        repeats=int(argv[argv.index('--repeats')+1])
        log=(directory/'logs'/f'sycl-lds-pilot-{jobid}.log').read_text()
        assert 'gfx906' in log and 'Traceback' not in log
        assert all(name+': OK' in log for name in fingerprints)
        rows=read(directory/f'lds-pilot-{jobid}.json')
        d={(r['round'],r['plan'],r['block'],r['enabled']):r for r in rows}
        assert len(rows)==len(d)==rounds*len(plans)*len(blocks)*2
        assert set(d)==set(itertools.product(range(rounds),plans,blocks,(False,True)))
        for row in rows:
            assert row['status']=='PASS' and not row['compile_only']
            assert row['shape']==shape and row['layout']==layout
            assert row['elements_checked']==shape[0]*shape[1]*3+7
            samples=row['samples_ns']
            assert len(samples)==repeats and all(x>0 for x in samples)
            assert row['median_ns']==statistics.median(samples)
            source=directory/f'lds-pilot-{jobid}-sources'/f'{row["plan"]}-enabled{row["enabled"]}.sycl'
            assert hashlib.sha256(source.read_bytes()).hexdigest()==row['source_sha256']
            assert source.stat().st_size==row['source_bytes']
            totals['elements_checked']+=row['elements_checked']
            totals['device_event_samples']+=len(samples)
        for plan,block in itertools.product(plans,blocks):
            off=[d[r,plan,block,False] for r in range(rounds)]
            on=[d[r,plan,block,True] for r in range(rounds)]
            active=bool(on[0]['markers']['sycl.lds_bank_padding'])
            for left,right in zip(off,on):
                assert left['markers']['sycl.lds_bank_padding']==0
                for marker,value in left['markers'].items():
                    if marker!='sycl.lds_bank_padding':
                        assert right['markers'][marker]==value
                if not active:
                    assert left['source_sha256']==right['source_sha256']
                    totals['inert_pairs']+=1
            ratios=[a['median_ns']/b['median_ns'] for a,b in zip(off,on)]
            comparisons.append(dict(label=job['label'],jobid=jobid,plan=plan,block=block,active=active,
                ratios=ratios,speedup=statistics.median(x['median_ns'] for x in off)/
                statistics.median(x['median_ns'] for x in on)))
        totals['device_records']+=len(rows)
    active=[c for c in comparisons if c['active']]
    if not incomplete:
        assert totals['device_records']==216 and totals['device_event_samples']==6696
        assert len(active)==24 and totals['inert_pairs']==36
        assert all(math.isfinite(v) for c in comparisons for v in c['ratios'])
    regressions=[c for c in active if c['speedup']<1 or any(r<1 for r in c['ratios'])]
    return dict(status='INCOMPLETE' if incomplete else
                'PERFORMANCE_REVIEW_REQUIRED' if regressions else 'PILOT_PASS',
                totals=totals,incomplete=incomplete,active_contexts=len(active),
                comparisons=comparisons,regressions=regressions,
                acceptance_scope='Exploratory evidence only. A pilot PASS is not final acceptance.')


def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('directory',type=pathlib.Path)
    p.add_argument('--output',type=pathlib.Path,required=True)
    a=p.parse_args()
    result=audit(a.directory)
    a.output.write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps(result))
    raise SystemExit(result['status']!='PILOT_PASS')


if __name__=='__main__':
    main()
