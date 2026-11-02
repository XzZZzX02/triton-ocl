"""Audit complete signed/unsigned extrema runs, controls and final gate replay."""
import argparse
import collections
import hashlib
import itertools
import json
import pathlib
import re
import statistics


def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('archive',type=pathlib.Path)
    p.add_argument('--output',type=pathlib.Path,required=True);a=p.parse_args();root=a.archive
    def read(name):return json.loads((root/name).read_text())
    contracts=read('integer-extrema-final-contracts.json')
    assert len(contracts)==620 and all(r['status']=='PASS' for r in contracts)
    suites={}
    for suite,count in [('pass',150),('terminal_store',241),('serial_half_copy',312),('half_store',482),
        ('accumulator_init',55),('cooperative_staging',66),('ordered_unroll',71),('fusion_destination',16)]:
        rows=read(f'integer-extrema-final-regression-{suite}.json')
        rows=rows['cases'] if isinstance(rows,dict) else rows
        assert len(rows)==count and all(r['status']=='PASS' for r in rows)
        suites[suite]=count
    sources=read('integer-extrema-final-sources.json');assert len(sources)==136
    assert all(r['status']=='PASS' for r in sources)
    assert sum(r.get('changed',False) for r in sources)==32
    golden={(tuple(r['shape']),r['dtype'],r['layout'],r['config']):r['source_sha256']
        for r in read('accepted-dot-sources.json')}
    assert len(golden)==72
    sourcekeys=set()
    for row in sources:
        if row['case']=='dot':
            key=(tuple(row['shape']),row['dtype'],row['layout'],row['config'])
            assert row['source_sha256']==golden[key];sourcekeys.add(key)
        else:
            old=read(f"integer-extrema-before-{row['dtype']}-{row['kind']}.json")
            ref=next(x for x in old if all(x[k]==row[k] for k in ('stack','reg','group')))
            assert ref['source_sha256']==row['before_source_sha256']
            assert row['changed']==row['group']
    assert sourcekeys==set(golden)
    integer_sources=[r for r in sources if r['case']=='integer_extrema']
    assert {(r['dtype'],r['kind'],r['stack'],r['reg'],r['group']) for r in integer_sources}==set(
        itertools.product(('i32','u32','i64','u64'),('min','max'),(False,True),(False,True),(False,True)))
    composition_cases=['sum','product','max','min','tuple','conditional','sum_nan','sum_zero','product_zero','and','or','xor']
    composition_count=0
    for case in composition_cases:
        before=read(f'reduction-comp-before-{case}.json');after=read(f'reduction-comp-after-{case}.json')
        assert len(before)==len(after)==8
        assert {(r['stack'],r['reg'],r['group']) for r in before}==set(itertools.product((False,True),repeat=3))
        for x,y in zip(before,after):
            assert x['epoch']=='before' and y['epoch']=='after'
            assert {k:v for k,v in x.items() if k!='epoch'}=={k:v for k,v in y.items() if k!='epoch'}
            assert x['status']=='PASS' and x['compile_only'] and x['elements_checked']==0
            composition_count+=1
    expected={
        **{job:(dtype,kind,1024,3) for job,(dtype,kind) in zip(
            [22828102,22828103,22828104,22828105,22828106,22828107,22828108,22829148],
            itertools.product(('i32','u32','i64','u64'),('min','max')))},
        22828110:('i32','max',256,3),22828111:('u64','min',4096,3),22828112:('i64','max',64,3),
        22828291:('i32','min',512,3),22828292:('u64','max',2048,3),22828293:('i64','min',1024,1),
        22828517:('u64','max',512,3),22828518:('i64','max',512,3),22828519:('u32','max',512,3)}
    states=(root/'integer-extrema-jobs.txt').read_text()
    totals=dict(gpu_records=0,gpu_elements=0,event_samples=0,cpu_records=0,cpu_elements=0,
        gpu_special_records=0,gpu_special_elements=0,cpu_special_records=0,cpu_special_elements=0,
        final_gpu_records=0,final_gpu_elements=0,final_cpu_records=0,final_cpu_elements=0)
    comparisons=[];gpu={};active_sources=set()
    def jobproof(job,special=False,final=False):
        assert re.search(r'^'+str(job)+r'\s+COMPLETED\s+\S+\s+0:0\s*$',states,re.M),job
        log=(root/'logs'/f'sycl-integer-extrema-{"final-" if final else "special-" if special else ""}{job}.log').read_text()
        assert 'gfx906' in log and 'python/triton/_C/libtriton.so: OK' in log
        assert 'python/triton/_C/triton-sycl-translate: OK' in log
    def neutral(dtype,kind):
        bits=int(dtype[1:]);signed=dtype[0]=='i'
        lo=-(1<<(bits-1)) if signed else 0
        hi=(1<<(bits-1))-1 if signed else (1<<bits)-1
        return lo if kind=='max' else hi
    def valid_row(row,timed):
        assert row['status']=='PASS' and not row['compile_only'] and row['epoch']=='after'
        assert row['neutral']==neutral(row['dtype'],row['kind'])
        assert row['output_elements']==row['grid']+7
        assert row['reference'][-7:]==[123]*7
        assert row['elements_checked']==(12 if row['conditional'] else 6)*row['output_elements']+int(timed)*row['output_elements']
        assert row['promoted']==0
        assert row['collectives']==int(row['group'] and row['eligible'])
        if timed:
            assert len(row['samples_ns'])==31 and all(type(x) is int and x>0 for x in row['samples_ns'])
            assert row['median_ns']==statistics.median(row['samples_ns'])
        else:assert not row['samples_ns'] and row['median_ns'] is None
    for job,identity in expected.items():
        jobproof(job);rows=read(f'integer-extrema-dcu-{job}.json');assert len(rows)==24
        d={}
        for row in rows:
            valid_row(row,True)
            assert (row['dtype'],row['kind'],row['block'],row['grid'])==identity
            assert row['data']=='ordinary' and not row['conditional']
            assert row['eligible']==(row['block']>=256) # measured broad candidate
            key=(row['round'],row['stack'],row['reg'],row['group']);assert key not in d;d[key]=row
            totals['gpu_records']+=1;totals['gpu_elements']+=row['elements_checked'];totals['event_samples']+=31
        assert set(d)==set(itertools.product(range(3),(False,True),(False,True),(False,True)))
        for stack,reg,group in itertools.product((False,True),repeat=3):
            allrows=[d[i,stack,reg,group] for i in range(3)]
            assert len({r['source_sha256'] for r in allrows})==1
            assert allrows[0]['source_sha256']==d[0,stack,not reg,group]['source_sha256']
            code=(root/f'integer-extrema-{job}-sources'/f'stack{stack}-reg{reg}-group{group}.sycl').read_bytes()
            assert hashlib.sha256(code).hexdigest()==allrows[0]['source_sha256']
        for stack,reg in itertools.product((False,True),repeat=2):
            before=[d[i,stack,reg,False] for i in range(3)]
            after=[d[i,stack,reg,True] for i in range(3)]
            eligible=identity[2]>=1024
            if eligible:active_sources.add((before[0]['source_sha256'],after[0]['source_sha256']))
            b=statistics.median(r['median_ns'] for r in before);c=statistics.median(r['median_ns'] for r in after)
            comparisons.append(dict(job=job,dtype=identity[0],kind=identity[1],block=identity[2],grid=identity[3],
                stack=stack,reg=reg,accepted_active=eligible,measured_collective=after[0]['eligible'],
                before_ns=b,after_ns=c,before_over_after=b/c,
                round_ratios=[x['median_ns']/y['median_ns'] for x,y in zip(before,after)]))
        gpu[identity]=d
    for dtype,kind in itertools.product(('i32','u32','i64','u64'),('min','max')):
        rows=read(f'integer-extrema-cpu-{dtype}-{kind}.json');assert len(rows)==8
        assert {(r['stack'],r['reg'],r['group']) for r in rows}==set(itertools.product((False,True),repeat=3))
        for row in rows:
            valid_row(row,False);ref=gpu[dtype,kind,1024,3][0,row['stack'],row['reg'],row['group']]
            for field in ('source_sha256','neutral','reference','collectives','staging'):assert row[field]==ref[field]
            totals['cpu_records']+=1;totals['cpu_elements']+=row['elements_checked']
    special_jobs={job:(dtype,kind) for job,(dtype,kind) in zip(
        [22828266,22828267,22828268,22828270,22828271,22828272,22828274,22828275],
        itertools.product(('i32','u32','i64','u64'),('min','max')))}
    for job,(dtype,kind) in special_jobs.items():
        if job in (22828270,22828275):
            assert re.search(r'^'+str(job)+r'\s+FAILED\s+',states,re.M)
            log=(root/'logs'/f'sycl-integer-extrema-special-{job}.log').read_text()
            assert 'Mismatched type for r between then block' in log
            assert 'gfx906' in log and 'python/triton/_C/libtriton.so: OK' in log
            assert 'python/triton/_C/triton-sycl-translate: OK' in log
        else:jobproof(job,True)
        for data in ('boundary','identity','high','empty','one'):
            rows=read(f'integer-extrema-special-dcu-{job}-{data}.json');assert len(rows)==4
            assert {(r['reg'],r['group']) for r in rows}==set(itertools.product((False,True),repeat=2))
            for row in rows:
                valid_row(row,False)
                assert row['dtype']==dtype and row['kind']==kind and row['stack'] and row['block']==1024
                assert not row['conditional'] and row['grid']==3 and row['eligible']
                if data in ('identity','empty'):assert row['reference'][:3]==[neutral(dtype,kind)]*3
                if data=='boundary':
                    bits=int(dtype[1:])
                    value=(1<<(bits-1))-1 if dtype[0]=='i' else (1<<bits)-1
                    if kind=='min':value=-(1<<(bits-1)) if dtype[0]=='i' else 0
                    assert row['reference'][:3]==[value]*3
                totals['gpu_special_records']+=1;totals['gpu_special_elements']+=row['elements_checked']
            cpu=read(f'integer-extrema-special-cpu-{dtype}-{kind}-{data}.json')
            assert rows==cpu # source, oracle and coverage must all match
            totals['cpu_special_records']+=len(cpu);totals['cpu_special_elements']+=sum(r['elements_checked'] for r in cpu)
    for job,dtype in [(22829149,'i32'),(22829151,'u32'),(22829152,'i64'),(22829153,'u64')]:
        jobproof(job,final=True)
        for kind in ('min','max'):
            rows=read(f'integer-extrema-final-dcu-{job}-{kind}-conditional.json')
            cpu=read(f'integer-extrema-final-cpu-{dtype}-{kind}-conditional.json')
            assert len(rows)==4 and rows==cpu
            assert {(r['reg'],r['group']) for r in rows}==set(itertools.product((False,True),repeat=2))
            for row in rows:
                valid_row(row,False)
                assert row['dtype']==dtype and row['kind']==kind and row['stack'] and row['conditional']
                assert row['block']==1024 and row['grid']==1 and not row['eligible'] and row['collectives']==0
                totals['final_gpu_records']+=1;totals['final_gpu_elements']+=row['elements_checked']
                totals['final_cpu_records']+=1;totals['final_cpu_elements']+=row['elements_checked']
        for case,B in [('boundary',1024),('short',512)]:
            rows=read(f'integer-extrema-final-dcu-{job}-{case}.json');assert len(rows)==4
            assert {(r['reg'],r['group']) for r in rows}==set(itertools.product((False,True),repeat=2))
            for row in rows:
                valid_row(row,False);assert row['dtype']==dtype and row['kind']=='max' and row['stack'] and not row['conditional']
                assert row['block']==B and row['grid']==3 and row['eligible']==(B>=1024)
                totals['final_gpu_records']+=1;totals['final_gpu_elements']+=row['elements_checked']
    assert re.search(r'^22828109\s+TIMEOUT\s+',states,re.M)
    replay=read('integer-extrema-final-replay.json')
    assert len(replay)==136 and all(r['status']=='PASS' for r in replay)
    assert {(r['job'],r['stack'],r['reg'],r['group']) for r in replay}=={
        (job,stack,reg,group) for job,stack,reg,group in itertools.product(expected,(False,True),(False,True),(False,True))}
    for row in replay:
        ref=gpu[expected[row['job']]][0,row['stack'],row['reg'],row['group'] if expected[row['job']][2]>=1024 else False]
        assert row['source_sha256']==row['measured_reference_sha256']==ref['source_sha256']
        assert row['collectives']==int(row['group'] and expected[row['job']][2]>=1024)
    accepted_provenance=read('integer-extrema-final-provenance.json')
    assert accepted_provenance['third_party/sycl/backend/compiler.py']=='0981d01e8ef63992ad9e5253119bbff95c4e5ea55600f90f92e7d2e39ef84736'
    active=[r for r in comparisons if r['accepted_active']]
    result=dict(status='PASS',contracts=len(contracts),regressions=suites,source_checks=len(sources),
        old_composition_records=composition_count,**totals,accepted_comparisons=len(active),
        unique_active_source_pairs=len(active_sources),
        ratio_min=min(r['before_over_after'] for r in active),ratio_max=max(r['before_over_after'] for r in active),
        accepted_regressions_or_ties=[r for r in active if r['before_over_after']<=1],
        comparisons=comparisons,final_source_replays=len(replay))
    a.output.write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps({k:v for k,v in result.items() if k!='comparisons'}))


if __name__=='__main__':main()
