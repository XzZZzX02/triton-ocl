"""Audit the rejected local-copy forwarding experiment without hiding losses."""
import argparse
import itertools
import hashlib
import json
import pathlib
import re
import statistics


def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('archive',type=pathlib.Path)
    p.add_argument('--output',type=pathlib.Path,required=True);args=p.parse_args();root=args.archive
    def read(name):return json.loads((root/name).read_text())
    contracts=read('local-copy-contracts.json');assert len(contracts)==690 and all(r['status']=='PASS' for r in contracts)
    sources=read('local-copy-source-invariance.json')
    assert len(sources)==144 and all(r['status']=='PASS' for r in sources)
    assert sum(r['selected'] for r in sources)==48
    golden=read('before-dot-sources.json')
    reference={(tuple(r['shape']),r['layout'],r['dtype'],r['config']):r['after_source_sha256'] for r in golden}
    assert len(reference)==72
    seen=set()
    for row in sources:
        key=(tuple(row['shape']),row['layout'],row['dtype'],row['config'])
        assert row['before_source_sha256']==reference[key]
        assert (row['source_sha256']!=reference[key])==row['selected']
        seen.add((*key,row['enabled']))
    assert len(seen)==144
    suites={}
    for suite,count in [('pass',150),('terminal_store',241),('serial_half_copy',294),
                        ('half_store',482),('accumulator_init',55),('cooperative_staging',66),
                        ('ordered_unroll',71),('fusion_destination',16)]:
        records=read(f'local-copy-regression-{suite}.json')
        records=records['cases'] if isinstance(records,dict) else records
        assert len(records)==count and all(r['status']=='PASS' for r in records)
        suites[suite]=count
    totals=dict(dot_records=0,dot_elements=0,event_samples=0,cpu_dot_records=0,cpu_dot_elements=0,
                gpu_bit_records=0,gpu_bit_elements=0,cpu_bit_records=0,cpu_bit_elements=0)
    findings=[];bitgpu={};cpu={}
    base_jobs={22799782,22799783,22799784,22799785,22799786,22799787,22799788,22799790,22799791}
    jobs=base_jobs|{22799793}
    for job in sorted(jobs):
        rows=read(f'local-copy-dcu-{job}.json');configs=['base','all'] if job in base_jobs else [
            'all','no_staging','no_reuse','no_fusion','no_accumulator','no_tiling','no_unroll']
        assert len(rows)==len(configs)*6
        lookup={}
        for row in rows:
            key=(row['round'],row['config'],row['enabled'])
            assert key not in lookup and row['status']=='PASS' and not row['compile_only']
            lookup[key]=row
            assert row['elements_checked']==6*row['output_elements']>0
            assert len(row['samples_ns'])==31 and all(type(x) is int and x>0 for x in row['samples_ns'])
            assert statistics.median(row['samples_ns'])==row['median_ns']
            assert row['copies']==(row['layout'].count('T') if row['enabled'] else 0)
            totals['dot_records']+=1;totals['dot_elements']+=row['elements_checked'];totals['event_samples']+=31
        assert set(lookup)==set(itertools.product(range(3),configs,(False,True)))
        for config in configs:
            for enabled in (False,True):
                assert len({lookup[i,config,enabled]['source_sha256'] for i in range(3)})==1
                path=root/f'local-copy-{job}-sources'/f'{config}-enabled{enabled}.sycl'
                assert hashlib.sha256(path.read_bytes()).hexdigest()==lookup[0,config,enabled]['source_sha256']
            before=[lookup[i,config,False] for i in range(3)]
            after=[lookup[i,config,True] for i in range(3)]
            for a,b in zip(before,after):assert a['markers']==b['markers']
            a,b=before[0],after[0]
            ratio=statistics.median(r['median_ns'] for r in before)/statistics.median(r['median_ns'] for r in after)
            findings.append(dict(job=job,shape=a['shape'],dtype=a['dtype'],layout=a['layout'],config=config,
                active=b['copies']>0,identical_source=a['source_sha256']==b['source_sha256'],
                before_over_after=ratio,after_cost_percent=100*(1/ratio-1),
                round_ratios=[x['median_ns']/y['median_ns'] for x,y in zip(before,after)],
                local_bytes_before=a['local_bytes'],local_bytes_after=b['local_bytes']))
            if a['copies']==b['copies']==0:assert a['source_sha256']==b['source_sha256']
        first=rows[0]
        if job in base_jobs and first['shape']==[16,32,32]:
            cr=read(f"local-copy-cpu-{first['dtype']}-{first['layout']}.json");assert len(cr)==4
            assert {(r['config'],r['enabled']) for r in cr}==set(itertools.product(('base','all'),(False,True)))
            for row in cr:
                assert row['status']=='PASS' and row['elements_checked']==5*row['output_elements']
                gpu=lookup[0,row['config'],row['enabled']]
                for field in ('copies','markers','source_sha256','local_bytes','output_elements'):assert row[field]==gpu[field]
                totals['cpu_dot_records']+=1;totals['cpu_dot_elements']+=row['elements_checked']
    for job in (22799807,22799808,22799809,22799810):
        rows=read(f'local-copy-bits-dcu-{job}.json');assert len(rows)==20
        shape=rows[0]['shape'];cpu=read(f'local-copy-bits-cpu-{shape[0]}-{shape[1]}.json')
        assert cpu==rows
        assert {(r['middle'],r['enabled'],json.dumps(r['block'])) for r in rows}==set(
            itertools.product((False,True),(False,True),('1','3','48','[3, 5]','64')))
        for row in rows:
            assert row['status']=='PASS' and row['elements_checked']==3*shape[0]*shape[1]+7
            for device in ('gpu','cpu'):
                totals[device+'_bit_records']+=1;totals[device+'_bit_elements']+=row['elements_checked']
    status=(root/'local-copy-jobs.txt').read_text()
    for job in jobs|{22799807,22799808,22799809,22799810}:
        assert re.search(r'^'+str(job)+r'\s+COMPLETED\s+\S+\s+0:0\s*$',status,re.M),job
    assert re.search(r'^22799792\s+FAILED\s+',status,re.M)
    failed=(root/'logs/sycl-local-copy-22799792.log').read_text()
    assert 'AssertionError: (160, -5.25, -4.3125)' in failed
    assert (root/'local-copy-22799792-sources/base-enabledFalse.sycl').exists()
    assert not (root/'local-copy-dcu-22799792.json').exists()
    probe=read('local-copy-baseline-dcu-22800150.json')
    assert len(probe)==20 and {(r['variant'],json.dumps(r['block'])) for r in probe}==set(
        itertools.product(('original','A','B','both'),('1','3','48','[3, 5]','64')))
    for row in probe:
        failure=row['variant'] in ('original','B') and row['block']==1
        assert row['status']==('MISMATCH' if failure else 'PASS')
        assert row['mismatch_count']==(53 if failure else 0)
        assert row['elements_checked']==775 and row['error'] is None
        path=root/f"local-copy-baseline-dcu-22800150.{row['variant']}.sycl"
        assert hashlib.sha256(path.read_bytes()).hexdigest()==row['source_sha256']
    active=[r for r in findings if r['active']]
    result=dict(status='PASS',decision='REJECTED_FOR_PRODUCTION',contracts=len(contracts),
        source_checks=len(sources),regressions=suites,**totals,active_comparisons=len(active),
        aggregate_regressions=[r for r in active if r['before_over_after']<1],
        consistent_regressions=[r for r in active if all(x<1 for x in r['round_ratios'])],
        comparisons=findings,failed_baseline_job=22799792,
        baseline_probe_records=len(probe),baseline_probe_mismatches=sum(r['status']=='MISMATCH' for r in probe))
    args.output.write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps({k:v for k,v in result.items() if k not in ('comparisons','aggregate_regressions','consistent_regressions')}))


if __name__=='__main__':main()
