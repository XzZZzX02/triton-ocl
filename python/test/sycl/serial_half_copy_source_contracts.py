"""Check that the half-copy guard changes only the selected serial copies."""
import argparse
import hashlib
import json
import pathlib
from types import SimpleNamespace

from cooperative_staging_semantics import prepare
from full_stack_ablation import expected_markers


def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('before',type=pathlib.Path)
    p.add_argument('--output',required=True,type=pathlib.Path)
    args=p.parse_args();rows=[]
    records=json.loads(args.before.read_text())
    for record in records:
        fixture=SimpleNamespace(kind='dot',shape=record['shape'],layout=record['layout'],dtype=record['dtype'])
        kernel,warm,kw,_,_,_,grid=prepare(fixture)
        compiled=kernel.warmup(*warm,grid=(grid,),**kw,**record['options'])
        code=compiled.asm['sycl'];code=code.decode() if isinstance(code,bytes) else code
        memir=str(compiled.asm['memir']);expected_markers(fixture,record['options'],memir)
        copies=record['layout'].count('T') if record['dtype']=='f16' and not record['options']['distribute_work'] else 0
        assert memir.count('sycl.scalar_half_bits')==2*copies,(record,memir)
        after=hashlib.sha256(code.encode()).hexdigest()
        changed=after!=record['source_sha256']
        assert changed==bool(copies),(record,after,copies)
        rows.append(dict(**record,after_source_sha256=after,guarded_copies=copies,
                         changed=changed,status='PASS'))
        args.output.write_text(json.dumps(rows,indent=2)+'\n')
    print(json.dumps(dict(status='PASS',count=len(rows),changed=sum(r['changed'] for r in rows))))


if __name__=='__main__':
    main()
