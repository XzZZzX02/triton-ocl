"""Recompile recorded layout schedules and require exact pre-fix generated source."""
import argparse
import hashlib
import json
import pathlib

from model_layout_semantics import execute, SCRIPT_SHA256


def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--evidence',required=True,type=pathlib.Path)
    p.add_argument('--output',required=True,type=pathlib.Path)
    args=p.parse_args()
    results=[]
    for size in ('small','wide'):
        reference=json.loads((args.evidence/f'staging-layout-cpu-{size}.json').read_text())
        assert len(reference)==44
        for row in reference:
            assert row['status']=='PASS' and row['harness_sha256']==SCRIPT_SHA256
            actual=execute(row['case'],'compile','staging-pair',size)
            byschedule={s['schedule']:s for s in row['schedules']}
            for schedule in actual['schedules']:
                old=byschedule[schedule['schedule']]
                for field in ('source_sha256','source_bytes','markers','cooperative_stages'):
                    assert schedule[field]==old[field],(size,row['case'],schedule['schedule'],field)
                result=dict(case=row['case'],tile_shape=size,schedule=schedule['schedule'],
                    status='PASS',source_sha256=schedule['source_sha256'],expected_sha256=old['source_sha256'])
                results.append(result)
            args.output.write_text(json.dumps(results,indent=2)+chr(10))
            print(json.dumps(dict(case=row['case'],size=size,status='PASS')),flush=True)
    assert len(results)==176
    print(json.dumps(dict(status='PASS',count=len(results))))


if __name__=='__main__':main()
