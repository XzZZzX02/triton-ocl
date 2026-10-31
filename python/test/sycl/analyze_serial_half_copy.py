"""Audit serial-half-copy evidence without counting diagnostics as successes."""
import argparse
import collections
import itertools
import json
import pathlib
import statistics


def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('archive',type=pathlib.Path)
    p.add_argument('--gpu-job',required=True)
    p.add_argument('--bits-job',required=True,nargs='+')
    p.add_argument('--cost-job',required=True)
    p.add_argument('--output-cost-job',nargs='+')
    p.add_argument('--output',required=True,type=pathlib.Path)
    args=p.parse_args();root=args.archive;summary={}

    def read(name):
        return json.loads((root/name).read_text())

    contracts=read('half-copy-contracts-extended.json')
    assert len(contracts)==294 and all(r['status']=='PASS' for r in contracts)
    invariants=read('half-copy-final-source-invariance.json')
    assert len(invariants)==72 and sum(r['changed'] for r in invariants)==4
    assert all(r['status']=='PASS' and r['changed']==bool(r['guarded_copies']) for r in invariants)
    summary.update(contracts=len(contracts),source_invariants=len(invariants),changed_sources=4)
    regressions={}
    for suite,count in [('pass',150),('accumulator_init',55),('cooperative_staging',66),
                        ('terminal_store',241),('fusion_destination',16),('ordered_unroll',71)]:
        rows=read(f'half-final-regression-{suite}.json')
        rows=rows['cases'] if isinstance(rows,dict) else rows
        assert len(rows)==count and all(r['status']=='PASS' for r in rows),(suite,len(rows))
        regressions[suite]=len(rows)
    summary['regressions']=regressions
    devices={}
    expected_configs=set(itertools.product((False,True),((False,1),(True,1),(True,4)),
                                           ('1','3','48','[3, 5]')))
    for device,prefix in [('cpu','cpu'),('gfx906',args.gpu_job)]:
        all_rows=[]
        for layout in ('NN','NT','TN','TT'):
            rows=read(f'half-copy-{prefix}-{layout}.json')
            assert len(rows)==24 and all(r['status']=='PASS' and not r['compile_only'] for r in rows)
            keys={(r['distributed'],(r['accumulator'],r['unroll']),json.dumps(r['block'])) for r in rows}
            assert keys==expected_configs,(device,layout,keys)
            assert all(r['elements_checked']==1543 and r['shape']==[16,32,32]
                       and r['layout']==layout and r['guarded_copies']==(0 if r['distributed'] else layout.count('T')) for r in rows)
            all_rows.extend(rows)
        bits=read('half-copy-bits-cpu-final.json') if device=='cpu' else [
            row for job in args.bits_job for row in read(f'half-final-bits-{job}.json')]
        assert len(bits)==64
        keys={(tuple(r['shape']),r['dialect'],r['distribution_requested'],json.dumps(r['block'])) for r in bits}
        assert keys==set(itertools.product(((16,32),(32,16),(8,64),(16,16)),
                ('affine','memref'),(False,True),('1','3','48','[3, 5]')))
        for row in bits:
            selected=row['distribution_requested'] and row['dialect']=='affine'
            assert row['status']=='PASS' and row['distributed']==selected
            assert row['elements_checked']==3*row['shape'][0]*row['shape'][1]+7
            assert row['guard_markers']==(2 if selected else 4)
            assert row['special_bits']==[0,0x8000,0x3c00,0xbc00,0x7c00,0xfc00,0x7e00,
                0x7d01,0xfe55,1,0x8001,0x3ff,0x83ff,0x400,0x8400,0x7bff,0xfbff]
        devices[device]=dict(dot_configurations=len(all_rows),dot_elements=sum(r['elements_checked'] for r in all_rows),
            bit_configurations=len(bits),bit_elements=sum(r['elements_checked'] for r in bits))
        if device=='cpu':cpu=(all_rows,bits)
        else:
            # Ordering and all compiler/coverage fields must match. Device
            # execution is independent, while compiler output is identical.
            assert all_rows==cpu[0]
            def bitkey(row):
                return (tuple(row['shape']),row['dialect'],row['distribution_requested'],json.dumps(row['block']))
            assert sorted(bits,key=bitkey)==sorted(cpu[1],key=bitkey)
    summary['devices']=devices
    costs=read(f'half-copy-cost-dcu-{args.cost_job}.json')
    assert len(costs)==30
    grouped=collections.defaultdict(list)
    for row in costs:
        assert row['status']=='PASS' and row['elements_checked']==5*(3*row['shape'][0]*row['shape'][1]+7)
        assert len(row['samples_ns'])==31 and all(type(x) is int and x>0 for x in row['samples_ns'])
        assert statistics.median(row['samples_ns'])==row['median_ns']
        grouped[(tuple(row['shape']),row['layout'],row['dtype'])].append(row)
    comparisons=[]
    for key,rows in grouped.items():
        assert {(r['round'],r['variant']) for r in rows}==set(itertools.product(range(3),('before','after')))
        lookup={(r['round'],r['variant']):r for r in rows}
        ratios=[lookup[i,'before']['median_ns']/lookup[i,'after']['median_ns'] for i in range(3)]
        before=statistics.median(lookup[i,'before']['median_ns'] for i in range(3))
        after=statistics.median(lookup[i,'after']['median_ns'] for i in range(3))
        comparisons.append(dict(shape=key[0],layout=key[1],dtype=key[2],before_ns=before,after_ns=after,
            before_over_after=before/after,round_ratios=ratios,identical_sources=rows[0]['identical_sources']))
    summary['cost']=dict(configurations=len(costs),event_samples=31*len(costs),
        elements=sum(r['elements_checked'] for r in costs),comparisons=comparisons)
    if args.output_cost_job:
        output_costs=[row for job in args.output_cost_job for row in read(f'half-output-cost-{job}.json')]
        assert len(output_costs)==12
        grouped=collections.defaultdict(list)
        for row in output_costs:
            assert row['status']=='PASS'
            assert row['elements_checked']==6*(3*row['shape'][0]*row['shape'][1]+7)
            assert len(row['samples_ns'])==31 and all(type(x) is int and x>0 for x in row['samples_ns'])
            assert statistics.median(row['samples_ns'])==row['median_ns']
            grouped[tuple(row['shape'])].append(row)
        assert set(grouped)=={(16,32),(16,16)}
        comparisons=[]
        for shape,rows in grouped.items():
            assert {(r['round'],r['variant']) for r in rows}==set(itertools.product(range(3),('before','after')))
            lookup={(r['round'],r['variant']):r for r in rows}
            for variant in ('before','after'):
                assert len({r['source_sha256'] for r in rows if r['variant']==variant})==1
            before=statistics.median(lookup[i,'before']['median_ns'] for i in range(3))
            after=statistics.median(lookup[i,'after']['median_ns'] for i in range(3))
            comparisons.append(dict(shape=shape,before_ns=before,after_ns=after,
                before_over_after=before/after,after_cost_percent=100*(after/before-1),
                round_ratios=[lookup[i,'before']['median_ns']/lookup[i,'after']['median_ns'] for i in range(3)]))
        summary['output_cost']=dict(configurations=len(output_costs),event_samples=31*len(output_costs),
            elements=sum(r['elements_checked'] for r in output_costs),comparisons=comparisons)
    summary['status']='PASS'
    args.output.write_text(json.dumps(summary,indent=2)+'\n')
    print(json.dumps(summary))


if __name__=='__main__':
    main()
