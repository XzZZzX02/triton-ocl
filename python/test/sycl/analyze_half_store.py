"""Audit exact coverage, source stability, bit checks and all paired timings."""
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
    p.add_argument('--output',type=pathlib.Path,required=True);args=p.parse_args();root=args.archive
    def read(path):return json.loads(path.read_text())
    contracts=read(root/'half-store-contracts.json')
    assert len(contracts)==482 and all(r['status']=='PASS' for r in contracts)
    invariants=read(root/'half-store-final-source-invariance.json')
    assert len(invariants)==146 and all(r['status']=='PASS' for r in invariants)
    golden=read(root/'before-dot-sources.json')
    assert len(golden)==72
    reference={(tuple(r['shape']),r['layout'],r['dtype'],r['config']):r['after_source_sha256'] for r in golden}
    seen=set()
    for row in invariants:
        if row['config']=='distribution_disabled':continue
        key=(tuple(row['shape']),row['layout'],row['dtype'],row['config'])
        assert row['source_sha256']==reference[key]
        assert (*key,row['enabled']) not in seen
        seen.add((*key,row['enabled']))
    assert seen=={(*key,enabled) for key in reference for enabled in (False,True)}
    controls=[r for r in invariants if r['config']=='distribution_disabled']
    assert len(controls)==2 and controls[0]['source_sha256']==controls[1]['source_sha256']
    regressions={}
    for suite,count in [('terminal_store',241),('serial_half_copy',294),('pass',150),
                        ('accumulator_init',55),('cooperative_staging',66),('ordered_unroll',71),
                        ('fusion_destination',16)]:
        rows=read(root/f'half-store-regression-{suite}.json')
        rows=rows['cases'] if isinstance(rows,dict) else rows
        assert len(rows)==count and all(r['status']=='PASS' for r in rows),(suite,len(rows))
        regressions[suite]=count
    perf={};findings=[];total_checks=total_samples=total_configs=0;source_pairs=set()
    for folder in [root/'v1',root/'final']:
        for path in sorted(folder.glob('half-store-dcu-*.json')):
            rows=read(path);assert len(rows)==12,(path,len(rows))
            job=path.stem.rsplit('-',1)[1]
            states=(root/'v1'/'half-store-v1-jobs.txt' if folder.name=='v1'
                    else root/'half-store-final-jobs.txt').read_text()
            assert re.search(r'^'+job+r'\s+COMPLETED\s+\S+\s+0:0\s*$',states,re.M),job
            log=(folder/'logs'/f'sycl-half-store-{job}.log').read_text()
            assert 'gfx906' in log and 'python/triton/_C/libtriton.so: OK' in log,job
            assert 'python/triton/_C/triton-sycl-translate: OK' in log,job
            first=rows[0];case=first['case'];shape=tuple(first['shape'] or ())
            identity=(case,first['grid'],shape,first['middle'])
            assert identity not in perf,identity
            lookup={}
            for row in rows:
                key=(row['round'],row['stack'],row['enabled'])
                assert key not in lookup and row['status']=='PASS' and not row['compile_only']
                lookup[key]=row
                assert (row['case'],row['grid'],tuple(row['shape'] or ()),row['middle'])==identity
                assert row['elements_checked']==6*row['output_elements']>0
                assert len(row['samples_ns'])==31 and all(type(x) is int and x>0 for x in row['samples_ns'])
                assert statistics.median(row['samples_ns'])==row['median_ns']
                eligible=case not in ('small','dynamic','collision','scatter')
                assert row['selected']==(row['enabled'] and eligible)
                if row['selected']:assert row['half_guards']>=2
                total_configs+=1;total_samples+=31;total_checks+=row['elements_checked']
            assert set(lookup)==set(itertools.product(range(3),(False,True),(False,True)))
            for stack,enabled in itertools.product((False,True),repeat=2):
                group=[lookup[i,stack,enabled] for i in range(3)]
                assert len({(r['source_sha256'],r['half_guards'],r['staging']) for r in group})==1
                source=folder/f"half-store-{path.stem.rsplit('-',1)[1]}-sources"/f'stack{stack}-enabled{enabled}.sycl'
                assert hashlib.sha256(source.read_bytes()).hexdigest()==group[0]['source_sha256'],source
            for stack in (False,True):
                before=[lookup[i,stack,False] for i in range(3)]
                after=[lookup[i,stack,True] for i in range(3)]
                same=before[0]['source_sha256']==after[0]['source_sha256']
                assert same==(not after[0]['selected']),(identity,stack,same)
                if after[0]['selected']:
                    source_pairs.add((before[0]['source_sha256'],after[0]['source_sha256']))
                ratio=statistics.median(r['median_ns'] for r in before)/statistics.median(r['median_ns'] for r in after)
                findings.append(dict(case=case,grid=identity[1],shape=shape,middle=identity[3],
                    stack=stack,selected=after[0]['selected'],identical_source=same,before_over_after=ratio,
                    round_ratios=[a['median_ns']/b['median_ns'] for a,b in zip(before,after)]))
            perf[identity]=lookup
            if case!='raw':
                replay=read(root/f"half-store-final-replay-{'grid1' if first['grid']==1 else case}.json")
                assert len(replay)==4
                for row in replay:
                    measured=lookup[0,row['stack'],row['enabled']]
                    assert row['compile_only'] and row['elements_checked']==0
                    for field in ('source_sha256','selected','half_guards','staging','output_elements'):
                        assert row[field]==measured[field],(case,field)
    layouts=['dense','transpose','padded','negative','stride2','reverse_cols','rank3',
             'small','dynamic','collision','scatter','empty']
    expected={(case,3,(),False) for case in layouts}|{('dense',1,(),False)}
    expected|={('raw',3,shape,middle) for shape,middle in itertools.product(
        ((16,32),(32,16),(8,64),(16,16)),(False,True))}
    assert set(perf)==expected,(set(perf)^expected)
    cpu_checks=cpu_configs=0
    for case in layouts:
        rows=read(root/f'half-store-final-cpu-{case}.json')
        assert len(rows)==4
        assert {(r['stack'],r['enabled']) for r in rows}==set(itertools.product((False,True),repeat=2))
        for row in rows:
            assert row['status']=='PASS' and not row['compile_only']
            assert row['elements_checked']==5*row['output_elements']>0 and not row['samples_ns']
            gpu=perf[(case,3,(),False)][0,row['stack'],row['enabled']]
            for field in ('source_sha256','selected','half_guards','staging','output_elements','special_bits'):
                assert row[field]==gpu[field],(case,field)
            cpu_configs+=1;cpu_checks+=row['elements_checked']
    active=[r for r in findings if r['selected']]
    result=dict(status='PASS',contracts=len(contracts),regressions=regressions,
        preserved_dot_sources=len(invariants),gpu_configurations=total_configs,
        gpu_elements=total_checks,event_samples=total_samples,cpu_configurations=cpu_configs,
        cpu_elements=cpu_checks,active_comparisons=len(active),
        unique_active_source_pairs=len(source_pairs),
        active_ratio_min=min(r['before_over_after'] for r in active),
        active_ratio_max=max(r['before_over_after'] for r in active),
        regressions_or_ties=[r for r in active if r['before_over_after']<=1],
        comparisons=findings)
    args.output.write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps({k:v for k,v in result.items() if k!='comparisons'}))


if __name__=='__main__':main()
