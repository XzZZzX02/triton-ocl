"""Validate a complete barrier experiment, retaining no-ops and regressions."""
import argparse
import hashlib
import itertools
import json
import pathlib
import re
import statistics


def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('archive',type=pathlib.Path)
    p.add_argument('--output',type=pathlib.Path,required=True);args=p.parse_args();root=args.archive
    def read(name):return json.loads((root/name).read_text())
    contracts=read('phase-barrier-contracts.json')
    assert len(contracts)==24 and all(r['status']=='PASS' for r in contracts)
    pipeline=read('phase-barrier-pipeline.json')
    assert len(pipeline)==18 and all(r['status']=='PASS' for r in pipeline)
    sources=read('phase-barrier-sources.json')
    assert len(sources)==144
    optionkeys={(tuple(r['shape']),r['dtype'],r['layout'],r['config']) for r in read('before-options.json')}
    golden={(tuple(r['shape']),r['dtype'],r['layout'],r['config']):r['source_sha256'] for r in read('before-sources.json')}
    assert len(optionkeys)==len(golden)==72
    key=lambda r:(tuple(r['shape']),r['dtype'],r['layout'],r['config'])
    source_lookup={(*key(r),r['enabled']):r for r in sources}
    assert set(source_lookup)=={(*k,enabled) for k in optionkeys for enabled in (False,True)}
    for k in optionkeys:
        a,b=source_lookup[(*k,False)],source_lookup[(*k,True)]
        assert a['status']==b['status']=='PASS' and a['source_sha256']==golden[k]
        assert a['barriers']-b['barriers']==b['removed'] and a['markers']==b['markers']
    suites={}
    for suite,count in [('pass',150),('terminal_store',241),('serial_half_copy',296),('half_store',482),
                        ('accumulator_init',55),('cooperative_staging',66),('ordered_unroll',71),('fusion_destination',16)]:
        rows=read(f'phase-barrier-regression-{suite}.json')
        rows=rows['cases'] if isinstance(rows,dict) else rows
        assert len(rows)==count and all(r['status']=='PASS' for r in rows)
        suites[suite]=count
    states=(root/'phase-barrier-jobs.txt').read_text()
    comparisons=[];totals=dict(gpu_records=0,gpu_elements=0,event_samples=0,cpu_records=0,cpu_elements=0)
    complete=set(range(22810818,22810830))|{22811069,22811070,22811071}
    for job in sorted(complete):
        rows=read(f'phase-barrier-dcu-{job}.json')
        assert re.search(r'^'+str(job)+r'\s+COMPLETED\s+\S+\s+0:0\s*$',states,re.M)
        log=(root/'logs'/f'sycl-phase-barrier-{job}.log').read_text()
        assert 'gfx906' in log and 'python/triton/_C/libtriton.so: OK' in log and 'python/triton/_C/triton-sycl-translate: OK' in log
        plans=['base','all'] if job!=22810829 else ['all','no_staging','no_store','no_reuse','no_fusion','no_accumulator','no_tiling','no_unroll','serial']
        assert len(rows)==6*len(plans),(job,len(rows))
        lookup={}
        for row in rows:
            k=(row['round'],row['plan'],row['enabled'])
            assert k not in lookup and row['status']=='PASS' and not row['compile_only'];lookup[k]=row
            assert row['elements_checked']==6*row['output_elements']>0
            assert len(row['samples_ns'])==31 and all(type(x) is int and x>0 for x in row['samples_ns'])
            assert statistics.median(row['samples_ns'])==row['median_ns']
            totals['gpu_records']+=1;totals['gpu_elements']+=row['elements_checked'];totals['event_samples']+=31
        assert set(lookup)==set(itertools.product(range(3),plans,(False,True)))
        for plan in plans:
            for enabled in (False,True):
                group=[lookup[i,plan,enabled] for i in range(3)]
                assert len({r['source_sha256'] for r in group})==1
                code=(root/f'phase-barrier-{job}-sources'/f'{plan}-enabled{enabled}.sycl').read_bytes()
                assert hashlib.sha256(code).hexdigest()==group[0]['source_sha256']
                assert code.decode().count('item.barrier(sycl::access::fence_space::local_space);')==group[0]['barriers']
            before=[lookup[i,plan,False] for i in range(3)];after=[lookup[i,plan,True] for i in range(3)]
            for a,b in zip(before,after):
                assert a['barriers']-b['barriers']==b['removed'] and a['markers']==b['markers'] and a['removed']==0
                assert (a['source_sha256']==b['source_sha256'])==(b['removed']==0)
            bmed=statistics.median(r['median_ns'] for r in before);amed=statistics.median(r['median_ns'] for r in after)
            first=rows[0]
            comparisons.append(dict(job=job,kind=first['kind'],block=first['block'],n=first['n'],
                shape=first['shape'],layout=first['layout'],dtype=first['dtype'],plan=plan,
                removed=after[0]['removed'],active=after[0]['removed']>0,
                before_ns=bmed,after_ns=amed,before_over_after=bmed/amed,after_cost_percent=100*(amed/bmed-1),
                round_ratios=[a['median_ns']/b['median_ns'] for a,b in zip(before,after)]))
    cpufiles=list(root.glob('phase-barrier-cpu-*.json'))
    assert len(cpufiles)==10
    for path in cpufiles:
        rows=json.loads(path.read_text());assert len(rows)==4
        assert {(r['plan'],r['enabled']) for r in rows}==set(itertools.product(('base','all'),(False,True)))
        for row in rows:
            assert row['status']=='PASS' and row['elements_checked']==5*row['output_elements']>0
            assert not row['compile_only'] and not row['samples_ns']
            totals['cpu_records']+=1;totals['cpu_elements']+=row['elements_checked']
        for plan in ('base','all'):
            a=next(r for r in rows if r['plan']==plan and not r['enabled'])
            b=next(r for r in rows if r['plan']==plan and r['enabled'])
            assert a['markers']==b['markers'] and a['barriers']-b['barriers']==b['removed']
    probe=read('phase-barrier-ir-22811509.json')
    assert len(probe)==2 and all(r['status']=='PASS' and r['elements_checked']==68 for r in probe)
    assert [(r['enabled'],r['source_barriers'],r['llvm_barrier_calls']) for r in probe]==[(False,4,4),(True,3,3)]
    for row in probe:
        data=(root/f"phase-barrier-ir-22811509.enabled{row['enabled']}.ll").read_bytes()
        assert hashlib.sha256(data).hexdigest()==row['ir_sha256']
        assert sum('call ' in l and 'llvm.amdgcn.s.barrier' in l for l in data.decode().splitlines())==row['llvm_barrier_calls']
    assert re.search(r'^22811509\s+COMPLETED\s+\S+\s+0:0\s*$',states,re.M)
    restored=read('phase-barrier-restored-sources.json')
    assert len(restored)==72 and all(r['status']=='PASS' for r in restored)
    expected={(tuple(r['shape']),r['dtype'],r['layout'],r['config']):r['source_sha256'] for r in read('before-sources.json')}
    actual={(tuple(r['shape']),r['dtype'],r['layout'],r['config']):r['source_sha256'] for r in restored}
    assert actual==expected
    halfcontracts=read('phase-barrier-restored-half-contracts.json')
    assert len(halfcontracts)==296 and all(r['status']=='PASS' for r in halfcontracts)
    binary=(root/'phase-barrier-restored-sha256.txt').read_text()
    assert 'b109ccab452f3b7ab9e58fb2d7acdff42a61dd628b54eb2a1ba9f025178c1319' in binary
    assert '77722519f18ef7ab87b0bda0ed360967e294b3d239cfc22c5ce455248fb28f64' in binary
    active=[r for r in comparisons if r['active']]
    result=dict(status='PASS',decision='REJECTED_FOR_PRODUCTION',contracts=len(contracts),pipeline_contracts=len(pipeline),
        source_records=len(sources),regressions=suites,**totals,active_comparisons=len(active),
        aggregate_regressions=[r for r in active if r['before_over_after']<1],
        consistent_regressions=[r for r in active if all(x<1 for x in r['round_ratios'])],
        comparisons=comparisons,backend_probe=probe,restored_source_records=len(restored))
    args.output.write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps({k:v for k,v in result.items() if k not in ('comparisons','aggregate_regressions','consistent_regressions','backend_probe')}))


if __name__=='__main__':main()
