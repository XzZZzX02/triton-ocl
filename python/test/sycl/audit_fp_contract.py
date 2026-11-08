"""Audit exact-rounding repair separately from incorrect-baseline timing."""
import argparse
import ast
import hashlib
import itertools
import json
import math
import pathlib
import re
import statistics


def read(path):
    return json.loads(path.read_text())


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()

def dtype_dependency(path):
    # The remote pre-existing dtype test driver is an older revision. Only
    # these three imported definitions participate in the new numerical
    # runner. Prove their exact AST identity; never relabel the full old file
    # as byte-identical to the current driver's additional tests.
    selected={}
    for node in ast.parse(path.read_text()).body:
        if isinstance(node,ast.FunctionDef) and node.name in ('pack_value','unpack_value'):
            selected[node.name]=ast.dump(node,include_attributes=False)
        elif isinstance(node,ast.Assign) and any(
                isinstance(t,ast.Name) and t.id=='DTYPES' for t in node.targets):
            selected['DTYPES']=ast.dump(node,include_attributes=False)
    assert set(selected)=={'DTYPES','pack_value','unpack_value'}
    return selected

def audit(directory,repo=None):
    main = {}
    for line in (directory/'fp-frontend-sha256.txt').read_text().splitlines():
        sha,name=line.split()
        assert name not in main and re.fullmatch('[0-9a-f]{64}',sha)
        main[name]=sha
        if not name.startswith('python/triton/_C/'):
            assert digest(directory/'measured-source'/name)==sha,name
            if repo:
                if name=='python/test/sycl/dtype_semantics.py':
                    assert dtype_dependency(repo/name)==dtype_dependency(directory/'measured-source'/name)
                else:assert digest(repo/name)==sha,('source changed after measurement',name)
    assert len(main)==15
    base={}
    for line in (directory/'fp-device-sha256.txt').read_text().splitlines():
        sha,name=line.split();assert name not in base;base[name]=sha
    assert len(base)==11 and all(main[k]==v for k,v in base.items())
    assert 'LDSBankPadding.cpp' not in (directory/'measured-source/third_party/sycl/lib/Conversion/LinalgToAffineLoops/CMakeLists.txt').read_text()
    assert 'lds_bank_padding' not in (directory/'measured-source/third_party/sycl/backend/compiler.py').read_text()
    jobs=read(directory/'fp-device-jobs.json');front=read(directory/'fp-frontend-jobs.json')
    assert {r['case'] for r in jobs}=={'f32','f64','bf16','half','widened_f32'} and len(jobs)==5
    assert len(front)==2 and sorted(v for j in front for v in j['layouts'])==['NN','NT','TN','TT']
    all_jobs=jobs+front
    states={}
    for line in (directory/'fp-all-jobs.txt').read_text().splitlines():
        fields=line.split('|')
        assert len(fields)>=5 and fields[0] not in states
        assert fields[1]=='COMPLETED' and fields[3]=='0:0',fields
        states[fields[0]]=fields
    assert set(states)=={j['jobid'] for j in all_jobs} and len(states)==7
    for job in all_jobs:
        prefix='sycl-fp-contract-' if job in jobs else 'sycl-fp-frontend-'
        log=(directory/'logs'/f'{prefix}{job["jobid"]}.log').read_text()
        assert 'gfx906' in log and 'Traceback' not in log
        fingerprints=base if job in jobs else main
        assert all(name+': OK' in log for name in fingerprints)

    totals=dict(completed_device_jobs=7,device_records=0,device_pass_records=0,
                reproduced_bad_baseline_records=0,device_exact_comparisons=0,
                reproduced_baseline_attempted_comparisons=0,device_event_samples=0,
                cpu_records=0,cpu_exact_comparisons=0,cpu_baseline_mismatch_records=0)
    timing=[]

    def direct(rows,case,rounds,blocks,device,sources):
        unsafe=case in ('f32','f64','bf16')
        key=lambda r:(r['round'],r['enabled'],r['block'],bool(r['samples_ns']))
        d={key(r):r for r in rows}
        expected=set(itertools.product(range(rounds),(0,1),blocks,(False,)))
        if device:expected|=set(itertools.product(range(rounds),(0,1),('64',),(True,)))
        assert len(d)==len(rows) and set(d)==expected,(case,len(d))
        hashes={}
        for row in rows:
            enabled=row['enabled']
            expected_status='REPRODUCED_BASELINE_MISMATCH' if unsafe and not enabled else 'PASS'
            assert row['case']==case and row['status']==expected_status
            assert row['mismatch_count']>0 if expected_status!='PASS' else row['mismatch_count']==0
            assert row['count']==64 and row['grid']==3 and row['elements_checked']==199
            samples=row['samples_ns']
            assert len(samples)==(31 if row['median_ns'] is not None else 0)
            assert row['median_ns']==(statistics.median(samples) if samples else None)
            assert all(isinstance(x,(int,float)) and math.isfinite(x) and x>0 for x in samples)
            source=sources/f'enabled{enabled}.sycl'
            assert digest(source)==row['source_sha256']
            text=source.read_text()
            assert text.count('#pragma clang fp contract(off)')==int(bool(enabled) and unsafe)
            hashes[enabled]=row['source_sha256']
            if device:
                totals['device_records']+=1
                totals['device_event_samples']+=len(samples)
                if expected_status=='PASS':
                    totals['device_pass_records']+=1
                    totals['device_exact_comparisons']+=199
                else:
                    totals['reproduced_bad_baseline_records']+=1
                    totals['reproduced_baseline_attempted_comparisons']+=199
            else:
                totals['cpu_records']+=1
                if expected_status=='PASS':totals['cpu_exact_comparisons']+=199
                else:totals['cpu_baseline_mismatch_records']+=1
        if not unsafe:assert hashes[0]==hashes[1]
        if device:
            off=[d[r,0,'64',True]['median_ns'] for r in range(3)]
            on=[d[r,1,'64',True]['median_ns'] for r in range(3)]
            timing.append(dict(case=case,baseline_correct=not unsafe,identical_source=not unsafe,
                ratios=[a/b for a,b in zip(off,on)],
                baseline_ns=statistics.median(off),guarded_ns=statistics.median(on),
                speed_ratio=statistics.median(off)/statistics.median(on),
                interpretation='identical-code timing control' if not unsafe else
                    'correctness repair cost; incorrect baseline is not an optimization comparator'))

    for job in jobs:
        jobid=job['jobid']
        direct(read(directory/f'fp-device-{jobid}.json'),job['case'],3,
               ('1','3','48','64','3x5'),True,directory/f'fp-device-{jobid}-sources')
        direct(read(directory/f'fp-production-cpu-{job["case"]}.json'),job['case'],1,
               ('1','48','64','3x5'),False,directory/f'fp-production-cpu-{job["case"]}-sources')
    for job in front:
        for layout,data in itertools.product(job['layouts'],('rounding','special')):
            stem=f'fp-frontend-{job["jobid"]}-{layout}-{data}'
            rows=read(directory/(stem+'.json'))
            assert len(rows)==2 and {r['plan'] for r in rows}=={'raw','full'}
            for row in rows:
                assert row['status']=='PASS' and row['shape']==[8,16,32]
                assert row['layout']==layout and row['dtype']=='f32' and row['data']==data
                assert row['bounds']=='full' and row['blocks']==['1','64','3x5']
                assert row['elements_checked']==1173
                guards=1 if row['plan']=='raw' else 4
                assert row['fp_guards']==guards
                source=directory/(stem+'-sources')/(row['plan']+'.sycl')
                assert digest(source)==row['source_sha256']
                assert source.read_text().count('#pragma clang fp contract(off)')==guards
                totals['device_records']+=1;totals['device_pass_records']+=1
                totals['device_exact_comparisons']+=1173
    assert totals['device_records']==196 and totals['device_pass_records']==142
    assert totals['reproduced_bad_baseline_records']==54
    assert totals['device_event_samples']==930 and totals['device_exact_comparisons']==43842
    assert totals['cpu_records']==40 and totals['cpu_baseline_mismatch_records']==12
    assert totals['cpu_exact_comparisons']==5572
    counts={'fp_contract_contracts':409,'two_column_contracts':123,'two_column_extended_contracts':480,
            'two_column_guard_contracts':218,'two_column_template_contracts':33,'pass_contracts':150,
            'ordered_unroll_contracts':71,'accumulator_init_contracts':55,
            'cooperative_staging_contracts':66,'fusion_destination_contracts':16,
            'terminal_store_contracts':241,'half_store_contracts':482,'integer_extrema_contracts':620}
    for name,count in counts.items():
        rows=read(directory/f'fp-regression-{name}.json')
        assert len(rows)==count and all(r['status']=='PASS' for r in rows)
    contract_source=directory/'measured-source/python/test/sycl/fp_contract_contracts.py'
    if repo:
        assert digest(contract_source)==digest(repo/'python/test/sycl/fp_contract_contracts.py')
    totals['structural_contracts']=sum(counts.values())
    preserve=read(directory/'fp-preservation.json')
    assert len(preserve)==15 and all(r['status']=='PASS' and r['source_sha256']==r['expected_sha256'] for r in preserve)
    layout=read(directory/'fp-layout-preservation.json')
    assert len(layout)==44 and len({r['case'] for r in layout})==22
    assert all(r['status']=='PASS' and r['source_sha256']==r['expected_sha256'] for r in layout)
    compiled=read(directory/'fp-layout-compile.json')
    assert len(compiled)==44 and all(r['status']=='PASS' and not r['elements_checked'] for r in compiled)
    llvm=read(directory/'fp-cpu-llvm-analysis.json')
    assert len(llvm)==2
    for row in llvm:
        enabled=row['enabled']
        assert row['contract_count']==(0 if enabled else row['multiply_count']) and row['multiply_count']>0
        text=(directory/f'fp-cpu-enabled{enabled}.ll').read_text()
        multiplication=[line for line in text.splitlines() if re.search(r'\bfmul\b',line)]
        assert len(multiplication)==row['multiply_count']
        assert sum('contract' in line for line in multiplication)==row['contract_count']
    return dict(status='PASS',scope='separate rounded products, explicit contraction authorization and '
                'exact widening; no performance gain claimed over incorrect arithmetic',
                totals=totals,device_timing=timing,historical_f16_hashes=len(preserve),
                f16_layout_schedule_hashes=len(layout),compiled_layout_cases=len(compiled),
                cpu_llvm=llvm,production_fingerprints=base,
                contract_source_sha256=digest(contract_source),
                dtype_helper=dict(measured_sha256=main['python/test/sycl/dtype_semantics.py'],
                    file_identity_claimed=False,
                    imported_definitions_sha256={k:hashlib.sha256(v.encode()).hexdigest() for k,v in
                        dtype_dependency(directory/'measured-source/python/test/sycl/dtype_semantics.py').items()}))


def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('directory',type=pathlib.Path)
    p.add_argument('--repo',type=pathlib.Path)
    p.add_argument('--output',type=pathlib.Path,required=True)
    a=p.parse_args()
    result=audit(a.directory,a.repo)
    a.output.write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps(result))


if __name__=='__main__':main()
