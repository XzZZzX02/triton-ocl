"""Default source preservation and transformed schedule checks against archives."""
import argparse
import hashlib
import json
import pathlib
import re
from types import SimpleNamespace
from cooperative_staging_semantics import prepare
from full_stack_ablation import expected_markers


def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('before',type=pathlib.Path)
    p.add_argument('--output',required=True,type=pathlib.Path);args=p.parse_args();rows=[]
    for old in json.loads(args.before.read_text()):
        fixture=SimpleNamespace(kind='dot',shape=old['shape'],layout=old['layout'],dtype=old['dtype'])
        kernel,warm,kw,_,_,_,grid=prepare(fixture);markers=None
        for enabled in (False,True):
            c=kernel.warmup(*warm,grid=(grid,),**kw,**old['options'],local_copy_forwarding=enabled)
            code=c.asm['sycl'];code=code.decode() if isinstance(code,bytes) else code
            memir=str(c.asm['memir']);expected_markers(fixture,old['options'],memir)
            digest=hashlib.sha256(code.encode()).hexdigest()
            selected=enabled and old['layout']!='NN'
            assert (digest!=old['after_source_sha256'])==selected,(old,enabled,digest)
            copied=re.search(r'sycl.local_copies_forwarded = (\d+)',memir)
            assert (int(copied[1]) if copied else 0)==(old['layout'].count('T') if selected else 0)
            row=dict(shape=old['shape'],layout=old['layout'],dtype=old['dtype'],config=old['config'],
                enabled=enabled,selected=selected,status='PASS',source_sha256=digest,
                before_source_sha256=old['after_source_sha256'])
            rows.append(row);args.output.write_text(json.dumps(rows,indent=2)+'\n')
    print(json.dumps(dict(status='PASS',count=len(rows),transformed=sum(r['selected'] for r in rows))))


if __name__=='__main__':main()
