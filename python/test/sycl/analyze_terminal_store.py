"""Validate complete paired terminal-store timing matrices and actual pass effects."""
import argparse
import itertools
import json
import pathlib
import statistics


def analyze(paths):
    comparisons=[]
    elements=0
    for path in paths:
        rows=json.loads(path.read_text())
        assert len(rows)==24,path
        bykey={}
        for row in rows:
            key=(row['round'],row['enabled'],row['staging'],row['stack'])
            assert key not in bykey and row['status']=='PASS', (path,key)
            bykey[key]=row
            samples=row['samples_ns']
            assert len(samples)==31 and all(type(x) is int and x>0 for x in samples)
            assert statistics.median(samples)==row['median_ns']
            assert row['elements_checked']>0
            elements+=row['elements_checked']
        assert set(bykey)==set(itertools.product(range(3),(False,True),(False,True),(False,True))),path
        for staging,stack in itertools.product((False,True),repeat=2):
            before=[bykey[r,False,staging,stack] for r in range(3)]
            after=[bykey[r,True,staging,stack] for r in range(3)]
            active=after[0]['stores']==1
            for side in (before,after):
                assert len({r['source_sha256'] for r in side})==1,path
            for a,b in zip(before,after):
                assert a['stores']==0 and b['stores']==int(active)
                for field in ('markers','stages','local_bytes','elements_checked','grid'):
                    assert a[field]==b[field],(path,field)
                if not active:assert a['source_sha256']==b['source_sha256'],path
            ratios=[a['median_ns']/b['median_ns'] for a,b in zip(before,after)]
            comparisons.append(dict(file=path.name,kind=rows[0]['kind'],shape=rows[0]['shape'],
                layout=rows[0]['layout'],dtype=rows[0]['dtype'],staging=staging,stack=stack,
                active=active,ratio=statistics.median(r['median_ns'] for r in before)/statistics.median(r['median_ns'] for r in after),
                round_ratios=ratios))
    active=[r for r in comparisons if r['active']]
    return dict(status='PASS',rows=24*len(paths),elements_checked=elements,
        comparisons=comparisons,active_comparisons=len(active),
        active_improved=sum(r['ratio']>1 for r in active),
        active_improved_rounds=sum(v>1 for r in active for v in r['round_ratios']),
        active_ratio_range=[min(r['ratio'] for r in active),max(r['ratio'] for r in active)] if active else [])


def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('files',nargs='+',type=pathlib.Path)
    p.add_argument('--output',type=pathlib.Path,required=True)
    args=p.parse_args();result=analyze(args.files)
    args.output.write_text(json.dumps(result,indent=2)+chr(10))
    print(json.dumps({k:v for k,v in result.items() if k!='comparisons'}))


if __name__=='__main__':main()
