"""Audit conditional half-copy repair, historical sources and paired device costs."""
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
    def read(path):return json.loads(path.read_text())
    contracts=read(root/'single-lane-half-contracts.json')
    assert len(contracts)==296 and all(r['status']=='PASS' for r in contracts)
    sources=read(root/'single-lane-half-sources.json')
    golden=read(root/'before-dot-sources.json')
    reference={(tuple(r['shape']),r['dtype'],r['layout'],r['config']):r['after_source_sha256'] for r in golden}
    assert len(sources)==len(reference)==72
    sourcekeys=set()
    for row in sources:
        key=(tuple(row['shape']),row['dtype'],row['layout'],row['config'])
        assert key not in sourcekeys;sourcekeys.add(key)
        assert row['status']=='PASS' and row['reconstructed_sha256']==row['expected_sha256']==reference[key]
        assert (row['source_sha256']!=reference[key])==bool(row['copies'])
    regressions={}
    for suite,count in [('pass',150),('terminal_store',241),('half_store',482),
                        ('accumulator_init',55),('cooperative_staging',66),
                        ('ordered_unroll',71),('fusion_destination',16)]:
        rows=read(root/f'single-lane-half-regression-{suite}.json')
        rows=rows['cases'] if isinstance(rows,dict) else rows
        assert len(rows)==count and all(r['status']=='PASS' for r in rows)
        regressions[suite]=count
    comparisons=[];identities=set();total=dict(dot_records=0,dot_elements=0,event_samples=0,cpu_dot_records=0,cpu_dot_elements=0,
        gpu_bit_records=0,gpu_bit_elements=0,cpu_bit_records=0,cpu_bit_elements=0)
    states=(root/'single-lane-half-jobs.txt').read_text()
    def jobproof(job,bits=False,mixed=False):
        assert re.search(r'^'+str(job)+r'\s+COMPLETED\s+\S+\s+0:0\s*$',states,re.M),job
        log=(root/'logs'/f'sycl-single-lane-half-{"mixed-" if mixed else "bits-" if bits else ""}{job}.log').read_text()
        assert 'gfx906' in log and 'python/triton/_C/libtriton.so: OK' in log
        assert 'python/triton/_C/triton-sycl-translate: OK' in log
    gpu_refs={}
    for path in root.glob('single-lane-half-dcu-*.json'):
        rows=read(path);assert len(rows)==12,(path,len(rows))
        first=rows[0];identity=(tuple(first['shape']),first['dtype'],first['layout'])
        assert identity not in identities;identities.add(identity)
        job=path.stem.rsplit('-',1)[1];jobproof(job);lookup={}
        for row in rows:
            assert row['status']=='PASS' and (tuple(row['shape']),row['dtype'],row['layout'])==identity
            key=(row['round'],row['plan'],row['variant']);assert key not in lookup;lookup[key]=row
            after=row['variant']=='after'
            assert row['check_blocks']==([1,3,48,[3,5],64] if after else [3,48,[3,5],64])
            assert row['elements_checked']==(6 if after else 5)*row['output_elements']>0
            assert len(row['samples_ns'])==31 and all(type(x) is int and x>0 for x in row['samples_ns'])
            assert statistics.median(row['samples_ns'])==row['median_ns']
            assert row['guarded_copies']==(row['layout'].count('T') if row['dtype']=='f16' else 0)
            total['dot_records']+=1;total['dot_elements']+=row['elements_checked'];total['event_samples']+=31
        assert set(lookup)==set(itertools.product(range(3),('base','all'),('before','after')))
        for plan in ('base','all'):
            for variant in ('before','after'):
                group=[lookup[i,plan,variant] for i in range(3)]
                assert len({r['source_sha256'] for r in group})==1
                filename=f'{plan}.sycl' if variant=='after' else f'{plan}.before.sycl'
                code=(root/f'single-lane-half-{job}-sources'/filename).read_bytes()
                assert hashlib.sha256(code).hexdigest()==group[0]['source_sha256']
            before=[lookup[i,plan,'before'] for i in range(3)]
            after=[lookup[i,plan,'after'] for i in range(3)]
            for a,b in zip(before,after):assert a['source_sha256']==b['reconstructed_baseline_sha256']
            bmed=statistics.median(r['median_ns'] for r in before);amed=statistics.median(r['median_ns'] for r in after)
            comparisons.append(dict(shape=identity[0],dtype=identity[1],layout=identity[2],plan=plan,
                active=after[0]['guarded_copies']>0,before_ns=bmed,after_ns=amed,
                before_over_after=bmed/amed,after_cost_percent=100*(amed/bmed-1),
                round_ratios=[a['median_ns']/b['median_ns'] for a,b in zip(before,after)]))
        gpu_refs[identity]=lookup
    expected={((16,32,32),dtype,layout) for dtype,layout in itertools.product(('f16','f32'),('NN','NT','TN','TT'))}
    expected|={((8,32,16),'f16','TT'),((32,16,64),'f16','TT')}
    assert identities==expected,(identities^expected)
    diagnostic=read(root/'before/local-copy-baseline-dcu-22800150.json')
    assert len(diagnostic)==20
    before_bug=next(r for r in diagnostic if r['variant']=='original' and r['block']==1)
    assert before_bug['status']=='MISMATCH' and before_bug['mismatch_count']==53
    assert gpu_refs[((8,32,16),'f16','TT')][0,'base','before']['source_sha256']==before_bug['source_sha256']
    for path in root.glob('single-lane-half-cpu-*.json'):
        rows=read(path);assert len(rows)==2
        assert {r['plan'] for r in rows}=={'base','all'}
        for row in rows:
            assert row['status']=='PASS' and row['variant']=='after'
            assert row['elements_checked']==5*row['output_elements'] and row['check_blocks']==[1,3,48,[3,5],64]
            gpu=gpu_refs[(tuple(row['shape']),row['dtype'],row['layout'])][0,row['plan'],'after']
            assert row['source_sha256']==gpu['source_sha256'] and row['guarded_copies']==gpu['guarded_copies']
            total['cpu_dot_records']+=1;total['cpu_dot_elements']+=row['elements_checked']
    assert total['cpu_dot_records']==18
    bitshapes=set()
    for path in root.glob('single-lane-half-bits-dcu-*.json'):
        rows=read(path);assert len(rows)==20
        job=path.stem.rsplit('-',1)[1];jobproof(job,True);shape=tuple(rows[0]['shape'])
        assert shape not in bitshapes;bitshapes.add(shape)
        cpu=read(root/f'single-lane-half-bits-cpu-{shape[0]}-{shape[1]}.json');assert rows==cpu
        keys={(r['dialect'],r['distribution_requested'],json.dumps(r['block'])) for r in rows}
        assert keys==set(itertools.product(('affine','memref'),(False,True),('1','3','48','[3, 5]','64')))
        for row in rows:
            distributed=row['distribution_requested'] and row['dialect']=='affine'
            assert row['status']=='PASS' and row['distributed']==distributed
            assert row['single_lane_markers']==(2 if distributed else 0)
            assert row['guard_markers']==(2 if distributed else 4)
            assert row['elements_checked']==3*shape[0]*shape[1]+7
            assert row['special_bits']==[0,0x8000,0x3c00,0xbc00,0x7c00,0xfc00,0x7e00,
                0x7d01,0xfe55,1,0x8001,0x3ff,0x83ff,0x400,0x8400,0x7bff,0xfbff]
            for device in ('gpu','cpu'):
                total[device+'_bit_records']+=1;total[device+'_bit_elements']+=row['elements_checked']
    assert bitshapes=={(8,16),(16,32),(32,16),(8,64),(16,16)}
    mixedpaths=list(root.glob('single-lane-half-mixed-dcu-*.json'))
    assert len(mixedpaths)==1
    mixed=read(mixedpaths[0]);cpu=read(root/'single-lane-half-mixed-cpu.json')
    assert len(mixed)==10 and mixed==cpu
    jobproof(mixedpaths[0].stem.rsplit('-',1)[1],mixed=True)
    assert {(r['load_dialect'],r['store_dialect'],json.dumps(r['block'])) for r in mixed}=={
        (ld,st,block) for (ld,st),block in itertools.product(
            [('memref','affine'),('affine','memref')],('1','3','48','[3, 5]','64'))}
    assert all(r['status']=='PASS' and r['elements_checked']==391 for r in mixed)
    active=[r for r in comparisons if r['active']]
    result=dict(status='PASS',contracts=len(contracts),regressions=regressions,source_checks=len(sources),
        changed_sources=sum(bool(r['copies']) for r in sources),**total,comparisons=comparisons,
        mixed_records_per_device=len(mixed),mixed_elements_per_device=sum(r['elements_checked'] for r in mixed),
        active_comparisons=len(active),cost_percent_min=min(r['after_cost_percent'] for r in active),
        cost_percent_max=max(r['after_cost_percent'] for r in active))
    args.output.write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps({k:v for k,v in result.items() if k!='comparisons'}))


if __name__=='__main__':main()
