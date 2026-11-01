"""Audit linear-affine store proof, exact source replay and paired IEEE timings."""
import argparse
import hashlib
import itertools
import json
import pathlib
import re
import statistics
from affine_store_cases import F16,F32,SHAPES,fixture


def unguard(code):
    # Audit-only reconstruction, verified against the historical source hash.
    # Keep this read-only auditor independent of the device runtime package.
    begin=code.find('\ninline triton_sycl_float16 triton_sycl_single_lane_half_load(')
    if begin<0:return code
    last=code.index('\n}\n',code.index('inline void triton_sycl_single_lane_half_store(',begin))+3
    code=code[:begin]+code[last:]
    code=re.sub(r'triton_sycl_single_lane_half_load\(&([^\n]+?), item\.get_local_range\(\)\.size\(\)\)',r'\1',code)
    return re.sub(r'triton_sycl_single_lane_half_store\(&([^\n]+?), (var_\d+), item\.get_local_range\(\)\.size\(\)\)',r'\1 = \2',code)


def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('archive',type=pathlib.Path)
    p.add_argument('--output',type=pathlib.Path,required=True);args=p.parse_args();root=args.archive
    def read(name):return json.loads((root/name).read_text())
    contracts=read('affine-store-contracts.json')
    assert len(contracts)==872 and all(r['status']=='PASS' for r in contracts)
    regressions={}
    for suite,count in [('pass',150),('terminal_store',241),('serial_half_copy',312),('half_store',482),
                        ('accumulator_init',55),('cooperative_staging',66),('ordered_unroll',71),('fusion_destination',16)]:
        rows=read(f'affine-store-regression-{suite}.json');rows=rows['cases'] if isinstance(rows,dict) else rows
        assert len(rows)==count and all(r['status']=='PASS' for r in rows);regressions[suite]=count
    sources=read('affine-store-source-invariance.json')
    assert len(sources)==136 and all(r['status']=='PASS' for r in sources)
    dots=[r for r in sources if r['case']=='dot_preservation'];replays=[r for r in sources if r['case']=='legacy_replay']
    assert len(dots)==72 and len(replays)==64
    golden=read('accepted-dot-sources.json')
    reference={(tuple(r['shape']),r['layout'],r['dtype'],r['config']):r['source_sha256'] for r in golden}
    for row in dots:assert row['source_sha256']==reference[tuple(row['shape']),row['layout'],row['dtype'],row['config']]
    for row in replays:
        old=read(f"affine-store-legacy-{row['dtype']}-{row['form']}-{row['reader']}.json")
        previous=next(x for x in old if x['stack']==row['stack'] and x['enabled']==row['enabled'])
        assert previous['compile_only'] and previous['elements_checked']==0
        assert previous['source_sha256']==row['before_source_sha256']
        assert (row['without_input_guard_sha256']!=row['before_source_sha256'])==row['newly_selected']
    states=(root/'affine-store-jobs.txt').read_text();totals=dict(gpu_records=0,gpu_elements=0,event_samples=0,cpu_records=0,cpu_elements=0)
    expected={(case,dtype,'affine','affine',3) for case,dtype in itertools.product(SHAPES,('f16','f32'))}
    expected|={('rank3','f32','nested','affine',3),('negative','f32','mixed','affine',3),
        ('dense','f32','arith','affine',3),('dense','f32','affine','memref',3),('dense','f16','affine','affine',1)}
    seen=set();findings=[];gpu_refs={};active_sources=set()
    for path in sorted(root.glob('affine-store-dcu-*.json')):
        rows=json.loads(path.read_text());assert len(rows)==12,(path,len(rows));first=rows[0]
        ident=(first['case'],first['dtype'],first['form'],first['reader'],first['grid'])
        assert ident not in seen;seen.add(ident);job=path.stem.rsplit('-',1)[1]
        assert re.search(r'^'+job+r'\s+COMPLETED\s+\S+\s+0:0\s*$',states,re.M),job
        log=(root/'logs'/f'sycl-affine-store-{job}.log').read_text()
        assert 'gfx906' in log and 'python/triton/_C/libtriton.so: OK' in log and 'python/triton/_C/triton-sycl-translate: OK' in log
        table={}
        for row in rows:
            k=(row['round'],row['stack'],row['enabled'])
            assert k not in table and row['status']=='PASS' and not row['compile_only'];table[k]=row
            assert (row['case'],row['dtype'],row['form'],row['reader'],row['grid'])==ident
            assert row['elements_checked']==6*row['output_elements']>0
            assert row['output_elements']==len(fixture(row['case'],row['dtype'],row['grid'])[5])
            assert row['special_bits']==(F16 if row['dtype']=='f16' else F32)
            eligible=row['case'] not in ('small','dynamic','collision','modulo')
            assert row['selected']==(row['enabled'] and eligible)
            assert row['guarded_copies']==(2 if row['dtype']=='f16' else 0)
            assert row['single_lane_markers']==(2 if row['dtype']=='f16' and row['stack'] else 0)
            assert len(row['samples_ns'])==31 and all(type(x) is int and x>0 for x in row['samples_ns'])
            assert statistics.median(row['samples_ns'])==row['median_ns']
            totals['gpu_records']+=1;totals['gpu_elements']+=row['elements_checked'];totals['event_samples']+=31
        assert set(table)==set(itertools.product(range(3),(False,True),(False,True)))
        for stack in (False,True):
            for enabled in (False,True):
                group=[table[i,stack,enabled] for i in range(3)]
                assert len({r['source_sha256'] for r in group})==1
                code=(root/f'affine-store-{job}-sources'/f'stack{stack}-enabled{enabled}.sycl').read_bytes()
                assert hashlib.sha256(code).hexdigest()==group[0]['source_sha256']
            before=[table[i,stack,False] for i in range(3)];after=[table[i,stack,True] for i in range(3)]
            assert (before[0]['source_sha256']==after[0]['source_sha256'])==(not after[0]['selected'])
            b=statistics.median(r['median_ns'] for r in before);a=statistics.median(r['median_ns'] for r in after)
            if after[0]['selected']:
                active_sources.add((before[0]['source_sha256'],after[0]['source_sha256']))
            findings.append(dict(case=ident[0],dtype=ident[1],form=ident[2],reader=ident[3],grid=ident[4],stack=stack,
                active=after[0]['selected'],before_ns=b,after_ns=a,before_over_after=b/a,
                round_ratios=[x['median_ns']/y['median_ns'] for x,y in zip(before,after)]))
        gpu_refs[ident]=table
    assert seen==expected,(seen^expected)
    probe=read('before-input-guard/affine-store-rank3-probe-22813870.json')
    assert len(probe)==10
    for row in probe:
        failed=row['variant']=='original' and row['block']==1
        assert row['status']==('MISMATCH' if failed else 'PASS') and row['error'] is None
        assert row['mismatch_count']==(504 if failed else 0)
    prior=next(r for r in probe if r['variant']=='original' and r['block']==1)
    rank3=gpu_refs['rank3','f16','affine','affine',3][0,True,False]
    # Locate and reconstruct the specific historical failing fallback. This
    # is audit-only; the runtime measurements use the repaired baseline.
    rank3path=next(path for path in root.glob('affine-store-dcu-*.json')
        if (lambda r:r['case']=='rank3' and r['dtype']=='f16' and r['form']=='affine')(json.loads(path.read_text())[0]))
    code=(root/f"affine-store-{rank3path.stem.rsplit('-',1)[1]}-sources"/'stackTrue-enabledFalse.sycl').read_text()
    assert hashlib.sha256(unguard(code).encode()).hexdigest()==prior['source_sha256']
    cpufiles=list(root.glob('affine-store-cpu-*.json'));assert len(cpufiles)==24
    for path in cpufiles:
        rows=json.loads(path.read_text());assert len(rows)==4
        assert {(r['stack'],r['enabled']) for r in rows}==set(itertools.product((False,True),repeat=2))
        for row in rows:
            assert row['status']=='PASS' and not row['compile_only'] and not row['samples_ns']
            assert row['elements_checked']==5*row['output_elements']>0
            ident=(row['case'],row['dtype'],row['form'],row['reader'],row['grid'])
            gpu=gpu_refs[ident][0,row['stack'],row['enabled']]
            for field in ('selected','source_sha256','special_bits','guarded_copies','single_lane_markers','output_elements'):
                assert row[field]==gpu[field],(path,field)
            totals['cpu_records']+=1;totals['cpu_elements']+=row['elements_checked']
    active=[r for r in findings if r['active']]
    accepted_contracts=read('affine-store-accepted-contracts.json')
    assert len(accepted_contracts)==874 and all(r['status']=='PASS' for r in accepted_contracts)
    replay=read('affine-store-accepted-replay.json')
    assert len(replay)==116
    assert {(r['file'],r['stack'],r['enabled']) for r in replay}=={
        (f'affine-store-dcu-{path.stem.rsplit("-",1)[1]}.json',stack,enabled)
        for path in root.glob('affine-store-dcu-*.json') for stack,enabled in itertools.product((False,True),repeat=2)}
    for row in replay:
        measured=read(row['file'])
        target=next(r for r in measured if r['round']==0 and r['stack']==row['stack']
            and r['enabled']==(row['enabled'] if row['dtype']=='f16' else False))
        assert row['status']=='PASS' and row['source_sha256']==target['source_sha256']==row['measured_reference_sha256']
        assert row['selected']==(target['selected'] and row['dtype']=='f16')
    accepted_sources=read('affine-store-accepted-source-invariance.json')
    assert len(accepted_sources)==136 and all(r['status']=='PASS' for r in accepted_sources)
    accepted_half=[r for r in active if r['dtype']=='f16']
    assert len(accepted_half)==18 and all(r['before_over_after']>1 and all(x>1 for x in r['round_ratios']) for r in accepted_half)
    stride_findings=[];stride_samples=stride_elements=0;stride_keys=set()
    stride_states=(root/'affine-stride-jobs.txt').read_text()
    for path in root.glob('affine-stride-dcu-*.json'):
        records=json.loads(path.read_text());assert len(records)==12
        job=path.stem.rsplit('-',1)[1]
        assert re.search(r'^'+job+r'\s+COMPLETED\s+\S+\s+0:0\s*$',stride_states,re.M)
        log=(root/'logs'/f'sycl-affine-stride-{job}.log').read_text()
        assert 'gfx906' in log and 'python/triton/_C/libtriton.so: OK' in log
        first=records[0];ident=(first['shape'][0],first['coefficients'][0]);assert ident not in stride_keys;stride_keys.add(ident)
        d={(r['round'],r['stack'],r['enabled']):r for r in records}
        assert set(d)==set(itertools.product(range(3),(False,True),(False,True)))
        for row in records:
            assert row['status']=='PASS' and row['dtype']=='f32' and row['elements_checked']==6*row['output_elements']
            assert len(row['samples_ns'])==31 and all(type(x) is int and x>0 for x in row['samples_ns'])
            assert row['median_ns']==statistics.median(row['samples_ns'])
            assert row['selected']==row['enabled']
            stride_samples+=31;stride_elements+=row['elements_checked']
        for stack in (False,True):
            for enabled in (False,True):
                group=[d[i,stack,enabled] for i in range(3)]
                assert len({r['source_sha256'] for r in group})==1
                data=(root/f'affine-stride-{job}-sources'/f'stack{stack}-enabled{enabled}.sycl').read_bytes()
                assert hashlib.sha256(data).hexdigest()==group[0]['source_sha256']
            b=statistics.median(d[i,stack,False]['median_ns'] for i in range(3))
            a=statistics.median(d[i,stack,True]['median_ns'] for i in range(3))
            stride_findings.append(dict(length=ident[0],stride=ident[1],stack=stack,
                before_over_after=b/a,round_ratios=[d[i,stack,False]['median_ns']/d[i,stack,True]['median_ns'] for i in range(3)]))
    assert stride_keys=={(256,1),(256,2),(256,4),(512,1),(512,-2),(1024,1),(1024,2),(1024,3)}
    smokes=list(root.glob('affine-store-accepted-dcu-*.json'));assert len(smokes)==2
    smoke_elements=0
    final_states=(root/'affine-store-accepted-jobs.txt').read_text()
    for path in smokes:
        job=path.stem.rsplit('-',1)[1]
        assert re.search(r'^'+job+r'\s+COMPLETED\s+\S+\s+0:0\s*$',final_states,re.M)
        log=(root/'logs'/f'sycl-affine-store-accepted-{job}.log').read_text()
        assert 'gfx906' in log and 'python/triton/_C/libtriton.so: OK' in log
        assert 'python/triton/_C/triton-sycl-translate: OK' in log
        rows=json.loads(path.read_text());assert len(rows)==4
        assert {(r['stack'],r['enabled']) for r in rows}==set(itertools.product((False,True),repeat=2))
        for row in rows:
            assert row['status']=='PASS' and not row['compile_only'] and not row['samples_ns']
            assert row['elements_checked']==5*row['output_elements'];smoke_elements+=row['elements_checked']
            assert row['selected']==(row['dtype']=='f16' and row['enabled'])
            checked=next(r for r in replay if all(r[k]==row[k] for k in
                ('case','dtype','form','reader','grid','stack','enabled')))
            assert row['source_sha256']==checked['source_sha256']
    result=dict(status='PASS',contracts=len(contracts),regressions=regressions,source_checks=len(sources),
        new_source_cases=sum(r['newly_selected'] for r in replays),**totals,comparisons=findings,
        broad_candidate_active_comparisons=len(active),
        broad_candidate_ratio_min=min(r['before_over_after'] for r in active),
        broad_candidate_ratio_max=max(r['before_over_after'] for r in active),unique_active_source_pairs=len(active_sources),
        input_guard_baseline_fixed_elements=504,
        regressions_or_ties=[r for r in active if r['before_over_after']<=1],
        decision='ACCEPT_HALF_AFFINE_AND_INPUT_GUARD_REJECT_WIDE_EXTENSION',
        accepted_contracts=len(accepted_contracts),accepted_source_replays=len(replay),
        accepted_preservation_checks=len(accepted_sources),accepted_half_comparisons=len(accepted_half),
        accepted_half_ratio_min=min(r['before_over_after'] for r in accepted_half),
        accepted_half_ratio_max=max(r['before_over_after'] for r in accepted_half),
        stride_probe_records=96,stride_probe_elements=stride_elements,stride_probe_samples=stride_samples,
        stride_probe_comparisons=stride_findings,final_smoke_records=8,final_smoke_elements=smoke_elements)
    args.output.write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps({k:v for k,v in result.items() if k!='comparisons'}))


if __name__=='__main__':main()
