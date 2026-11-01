"""Verify exact nonselected source identity and reconstruct the old hot path."""
import argparse
import hashlib
import json
import pathlib
import re
from types import SimpleNamespace
from cooperative_staging_semantics import prepare
from single_lane_half_dot import unguard
from full_stack_ablation import expected_markers


def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('before',type=pathlib.Path)
    p.add_argument('--output',type=pathlib.Path,required=True);args=p.parse_args();rows=[]
    for old in json.loads(args.before.read_text()):
        fixture=SimpleNamespace(kind='dot',shape=old['shape'],layout=old['layout'],dtype=old['dtype'])
        kernel,warm,kw,_,_,_,grid=prepare(fixture)
        c=kernel.warmup(*warm,grid=(grid,),**kw,**old['options'])
        code=c.asm['sycl'];code=code.decode() if isinstance(code,bytes) else code
        memir=str(c.asm['memir']);expected_markers(fixture,old['options'],memir)
        copies=old['layout'].count('T') if old['dtype']=='f16' and old['options']['distribute_work'] else 0
        assert memir.count('sycl.single_lane_half_bits')==2*copies
        actual=hashlib.sha256(code.encode()).hexdigest();before=hashlib.sha256(unguard(code).encode()).hexdigest()
        assert before==old['after_source_sha256'],(old['shape'],old['layout'],old['config'],before,old['after_source_sha256'])
        assert (actual!=before)==bool(copies)
        rows.append(dict(shape=old['shape'],layout=old['layout'],dtype=old['dtype'],config=old['config'],
            status='PASS',copies=copies,source_sha256=actual,reconstructed_sha256=before,
            expected_sha256=old['after_source_sha256']))
        args.output.write_text(json.dumps(rows,indent=2)+'\n')
    print(json.dumps(dict(status='PASS',count=len(rows),changed=sum(bool(r['copies']) for r in rows))))


if __name__=='__main__':main()
