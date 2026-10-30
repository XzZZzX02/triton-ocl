"""Strict runtime, provenance and paired-sample audit for cooperative staging."""
import argparse
import hashlib
import itertools
import json
import pathlib
import runpy

from analyze_cooperative_staging import analyze


def audit(directory, repository):
    def read(name):
        return json.loads((directory / (name + '.json')).read_text())

    provenance = read('staging-final-provenance')
    for name, expected in provenance.items():
        if name == 'python/triton/_C/libtriton.so':
            continue
        assert hashlib.sha256((repository/name).read_bytes()).hexdigest() == expected, name
    binary = provenance['python/triton/_C/libtriton.so']
    dependencies = read('staging-harness-dependencies')
    for name, expected in dependencies.items():
        assert hashlib.sha256((repository/name).read_bytes()).hexdigest()==expected, name
        frozen=directory/'frozen-harnesses'/pathlib.Path(name).name
        assert hashlib.sha256(frozen.read_bytes()).hexdigest()==expected, frozen
    manifests = {label: read(f'staging-{label}-jobs') for label in ('perf','layout','boundary','reuse','ieee')}
    assert {k:len(v) for k,v in manifests.items()} == dict(perf=8,layout=8,boundary=11,reuse=2,ieee=2)
    ids = {r['job'] for rows in manifests.values() for r in rows}
    assert len(ids) == 31
    states = {}
    for line in (directory/'staging-all-status.txt').read_text().splitlines():
        fields = line.strip().split('|')
        assert len(fields) >= 5 and fields[0].isdigit(), fields
        job = int(fields[0])
        assert job not in states and fields[1]=='COMPLETED' and fields[3]=='0:0', fields
        states[job] = fields
    assert set(states) == ids
    perf_paths = []
    for label, prefix in (('perf','staging-dcu'),('layout','staging-layout'),
                          ('boundary','staging-boundary'),('reuse','staging-reuse'),('ieee','staging-ieee')):
        for spec in manifests[label]:
            job = spec['job']
            rows = read(f'{prefix}-{job}')
            assert len(rows)==spec['expected_rows'], (label,job)
            logprefix = 'sycl-staging' if label=='perf' else 'sycl-staging-'+label
            log = (directory/f'{logprefix}-{job}.log').read_text()
            assert 'gfx906:sramecc-:xnack-' in log, job
            script=(directory/'submitted-scripts'/f'{job}.sbatch').read_text()
            assert 'set -eo pipefail' in script
            if binary not in log:
                # sha256sum --check prints paths/OK rather than the hash.
                # Verify the actual scheduler-retained script, not a later
                # editable wrapper, and its successful checksum log.
                assert 'sha256sum --check' in script
                assert binary+'  python/triton/_C/libtriton.so' in script
                assert 'python/triton/_C/libtriton.so: OK' in log
            if label not in ('layout','ieee'):
                perf_paths.append(directory/f'{prefix}-{job}.json')
            if label=='boundary' and spec['case']=='loop':
                assert 'Yield operand #0 is not equivalent to the corresponding iter bbArg' in log
            if label in ('boundary','reuse'):
                assert {r['case'] for r in rows}=={spec['case']}

    contracts = read('staging-contracts-expanded')
    assert len(contracts)==66 and len({r['case'] for r in contracts})==66
    assert all(r['status']=='PASS' for r in contracts)
    regressions={}
    for suite,count in (('pass_contracts',150),('ordered_unroll_contracts',71),('accumulator_init_contracts',55)):
        rows=read('staging-regression-'+suite)
        assert len(rows)==count and all(r['status']=='PASS' for r in rows)
        regressions[suite]=count
    cases = set(runpy.run_path(str(repository/'python/test/sycl/model_layout_semantics.py'),run_name='catalog')['CASES'])
    assert len(cases)==44
    assert {(r['tile_shape'],tuple(r['cases'])) for r in manifests['layout']} == {
        (size,tuple(runpy.run_path(str(repository/'python/test/sycl/model_layout_semantics.py'),run_name='catalog')['CASES'][shard::4]))
        for size,shard in itertools.product(('small','wide'),range(4))}
    layout_counts = {}
    for size in ('small','wide'):
        cpu = read('staging-layout-cpu-'+size)
        gpu = [row for spec in manifests['layout'] if spec['tile_shape']==size
               for row in read(f'staging-layout-{spec["job"]}')]
        assert len(cpu)==len(gpu)==44
        assert {r['case'] for r in cpu}=={r['case'] for r in gpu}==cases
        cpu_by_case = {r['case']:r for r in cpu}
        for row in cpu+gpu:
            assert row['status']=='PASS' and row['harness_match']
            assert row['harness_sha256']==provenance['python/test/sycl/model_layout_semantics.py']
            assert row['tile_shape']==size and row['local_shapes']==[48,[3,5]]
            assert row['elements_checked']>0
            variants = {v['schedule']:v for v in row['schedules']}
            assert set(variants)=={'forwarded','staged'}
            a,b=variants['forwarded'],variants['staged']
            assert a['cooperative_stages']==0 and b['cooperative_stages']==(1 if size=='small' else 2)
            assert a['markers']==b['markers']
            assert a['elements_checked']==b['elements_checked']>0
            assert row['elements_checked']==sum(v['elements_checked'] for v in variants.values())
        for row in gpu:
            assert row['schedules']==cpu_by_case[row['case']]['schedules'], row['case']
        layout_counts[size] = dict(cases_per_device=44,elements_per_device=sum(r['elements_checked'] for r in cpu))

    boundary_cases = {'tail','empty','negative','indirect','rank3','volatile','loop','small','undistributed','sum','vector'}
    assert {s['case'] for s in manifests['boundary']}==boundary_cases
    boundary_elements=boundary_pass=boundary_fail=0
    for case in boundary_cases:
        rows=read('staging-boundary-cpu-'+case)
        assert len(rows)==8
        keys={(r['stage'],r['fuse'],r['reuse']) for r in rows}
        assert keys==set(itertools.product((False,True),repeat=3))
        for r in rows:
            expected_fail=case=='loop' and r['fuse']
            assert (r['status']=='EXPECTED_COMPILE_FAILURE')==expected_fail
            if expected_fail:
                assert r['elements_checked']==0
                boundary_fail+=1
            else:
                assert r['status']=='PASS' and r['elements_checked']>0 and not r['samples_ns']
                expected_elements=3*((10 if case=='sum' else r['n']+7))
                assert r['elements_checked']==expected_elements
                boundary_pass+=1;boundary_elements+=r['elements_checked']
        by_key={(r['stage'],r['fuse'],r['reuse']):r for r in rows}
        spec=next(s for s in manifests['boundary'] if s['case']==case)
        gpu=read(f'staging-boundary-{spec["job"]}')
        for row in gpu:
            cpu=by_key[row['stage'],row['fuse'],row['reuse']]
            assert row['status']==cpu['status']
            if row['status']=='PASS':
                for field in ('source_sha256','stages','collectives','linalg_generics',
                              'local_bytes','elements_checked','grid','block','n','stride'):
                    assert row[field]==cpu[field], (case,field)
        for fuse,reuse in itertools.product((False,True),repeat=2):
            a,b=by_key[False,fuse,reuse],by_key[True,fuse,reuse]
            if a['status']!='PASS':continue
            if case in ('small','volatile','loop','undistributed'):
                assert a['source_sha256']==b['source_sha256']
            else:
                assert a['stages']==0 and b['stages']==1
            assert a['local_bytes']==b['local_bytes'] and a['collectives']==b['collectives']
        if case=='sum':
            assert all(r['collectives']>0 for r in rows)
            assert by_key[False,True,False]['linalg_generics'] < by_key[False,False,False]['linalg_generics']

    reuse_elements=0
    for case in ('sequential','overlap'):
        rows=read('staging-reuse-cpu-'+case)
        assert len(rows)==4 and {(r['stage'],r['reuse']) for r in rows}==set(itertools.product((False,True),repeat=2))
        for r in rows:
            assert r['status']=='PASS' and r['elements_checked']==3093
            assert r['stages']==((1 if case=='sequential' else 2) if r['stage'] else 0)
            assert r['local_bytes_before']==2048
            assert r['local_bytes']==(1024 if case=='sequential' and r['reuse'] else 2048)
            reuse_elements+=r['elements_checked']
        spec=next(s for s in manifests['reuse'] if s['case']==case)
        lookup={(r['stage'],r['reuse']):r for r in rows}
        for row in read(f'staging-reuse-{spec["job"]}'):
            cpu=lookup[row['stage'],row['reuse']]
            for field in ('source_sha256','stages','local_bytes','local_bytes_before','elements_checked'):
                assert row[field]==cpu[field], (case,field)
    ieee={}
    initials={'zero','negative_zero','finite','positive_inf','negative_inf','nan','subnormal','negative_subnormal'}
    for spec in manifests['ieee']:
        dtype=spec['dtype']
        cpu=read('staging-ieee-cpu-'+dtype)
        gpu=read(f'staging-ieee-{spec["job"]}')
        assert len(cpu)==len(gpu)==16 and cpu==gpu
        assert {(r['initial'],r['stage']) for r in cpu}==set(itertools.product(initials,(False,True)))
        for row in cpu:
            assert row['dtype']==dtype and row['status']=='PASS'
            assert row['stages']==(2 if row['stage'] else 0)
            assert row['elements_checked']==1550
        ieee[dtype]=dict(cases_per_device=16,elements_per_device=sum(r['elements_checked'] for r in cpu))
    return dict(status='PASS',jobs=len(ids),contracts=len(contracts),regressions=regressions,layouts=layout_counts,ieee=ieee,
        cpu_boundaries=dict(runtime_pass=boundary_pass,known_compile_failures=boundary_fail,elements_checked=boundary_elements),
        cpu_reuse=dict(runtime_pass=8,elements_checked=reuse_elements),performance=analyze(perf_paths))


def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('directory',type=pathlib.Path)
    p.add_argument('--output',required=True,type=pathlib.Path)
    args=p.parse_args()
    repository=pathlib.Path(__file__).resolve().parents[3]
    result=audit(args.directory,repository)
    args.output.write_text(json.dumps(result,indent=2)+chr(10))
    print(json.dumps({k:v for k,v in result.items() if k!='performance'}))


if __name__=='__main__':main()
