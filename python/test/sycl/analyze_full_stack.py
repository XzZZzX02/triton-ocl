"""Check complete, within-job full-stack ablations without hiding regressions."""
import argparse
import itertools
import json
import pathlib
import statistics

ALL = dict(distribute_work=True, register_accumulator=True,
    matmul_register_tiling=True, reduction_unroll=4,
    accumulator_init_forwarding=True, cooperative_load_staging=True,
    terminal_store_distribution=True, reuse_local_memory=True,
    fuse_elementwise=True, group_reduction=True, vectorize_memory=False)
DISABLE = dict(accumulator=('register_accumulator', False),
    tiling=('matmul_register_tiling', False), unroll=('reduction_unroll', 1),
    initializer=('accumulator_init_forwarding', False),
    staging=('cooperative_load_staging', False),
    store=('terminal_store_distribution', False), reuse=('reuse_local_memory', False),
    fusion=('fuse_elementwise', False), group=('group_reduction', False),
    distribution=('distribute_work', False))
CONFIGS = ('baseline','all') + tuple('without_'+name for name in DISABLE)


def analyze(paths):
    findings=[]; totals=dict(files=0,configurations=0,elements_checked=0,event_samples=0)
    for path in paths:
        rows=json.loads(path.read_text()); assert len(rows)==36,(path,len(rows))
        keys={}; shape=tuple(rows[0]['shape']); layout=rows[0]['layout']; dtype=rows[0]['dtype']
        for row in rows:
            key=(row['round'],row['config'])
            assert key not in keys and row['status']=='PASS',(path,key)
            keys[key]=row
            assert (tuple(row['shape']),row['layout'],row['dtype'])==(shape,layout,dtype)
            assert row['check_blocks']==[3,48,[3,5]]
            assert row['elements_checked']==3*(3*shape[0]*shape[1]+7)
            samples=row['samples_ns']
            assert len(samples)==31 and all(type(x) is int and x>0 for x in samples)
            assert statistics.median(samples)==row['median_ns']
            options=dict(ALL)
            if row['config']=='baseline':
                options.update({k:False for k in options if k not in ('distribute_work','reuse_local_memory','reduction_unroll')})
                options['reduction_unroll']=1
            elif row['config'].startswith('without_'):
                k,v=DISABLE[row['config'].removeprefix('without_')]; options[k]=v
            assert row['options']==options,(path,key,'option mismatch')
            totals['elements_checked']+=row['elements_checked'];totals['event_samples']+=31
        assert set(keys)==set(itertools.product(range(3),CONFIGS))
        for config in CONFIGS:
            group=[keys[r,config] for r in range(3)]
            assert len({r['source_sha256'] for r in group})==1,(path,config,'unstable source')
            assert all(r['markers']==group[0]['markers'] for r in group)
        enabled=[keys[r,'all'] for r in range(3)]
        for config in ('baseline',)+tuple('without_'+x for x in DISABLE):
            disabled=[keys[r,config] for r in range(3)]
            ratios=[a['median_ns']/b['median_ns'] for a,b in zip(disabled,enabled)]
            ratio=statistics.median(r['median_ns'] for r in disabled)/statistics.median(r['median_ns'] for r in enabled)
            marker_changes={name:[disabled[0]['markers'][name],enabled[0]['markers'][name]]
                for name in enabled[0]['markers'] if disabled[0]['markers'][name]!=enabled[0]['markers'][name]}
            same_source=disabled[0]['source_sha256']==enabled[0]['source_sha256']
            changes={k:[disabled[0]['options'][k],enabled[0]['options'][k]]
                for k in ALL if disabled[0]['options'][k]!=enabled[0]['options'][k]}
            if config!='baseline': assert len(changes)==1,(path,config,changes)
            findings.append(dict(file=path.name,shape=shape,layout=layout,dtype=dtype,
                ablation=config,changed_options=changes,marker_changes=marker_changes,
                identical_source=same_source,without_over_all=ratio,round_ratios=ratios,
                all_median_ns=statistics.median(r['median_ns'] for r in enabled),
                without_median_ns=statistics.median(r['median_ns'] for r in disabled),
                source_bytes_without=disabled[0]['source_bytes'],source_bytes_all=enabled[0]['source_bytes'],
                local_bytes_without=disabled[0]['local_bytes'],local_bytes_all=enabled[0]['local_bytes'],
                interpretation=('identical_source' if same_source else
                    'all_rounds_faster' if all(x>1 for x in ratios) else
                    'all_rounds_slower' if all(x<1 for x in ratios) else 'mixed_rounds')))
        totals['files']+=1;totals['configurations']+=len(rows)
    changed=[r for r in findings if not r['identical_source'] and r['ablation']!='baseline']
    return dict(status='PASS',**totals,comparisons=findings,
        changed_source_comparisons=len(changed),
        aggregate_regressions=[r for r in changed if r['without_over_all']<1],
        consistent_regressions=[r for r in changed if r['interpretation']=='all_rounds_slower'])


def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('files',nargs='+',type=pathlib.Path)
    p.add_argument('--output',required=True,type=pathlib.Path)
    args=p.parse_args(); result=analyze(args.files)
    args.output.write_text(json.dumps(result,indent=2)+chr(10))
    print(json.dumps({k:v for k,v in result.items() if k not in ('comparisons','aggregate_regressions','consistent_regressions')}))
    for row in result['aggregate_regressions']:
        print(json.dumps(dict(shape=row['shape'],layout=row['layout'],dtype=row['dtype'],ablation=row['ablation'],ratio=row['without_over_all'],rounds=row['round_ratios'],interpretation=row['interpretation'])))


if __name__=='__main__':main()
