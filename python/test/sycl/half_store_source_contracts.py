"""Preserve measured f32-output dot sources with the half-output pass off/on."""
import argparse
import hashlib
import json
import pathlib
from types import SimpleNamespace
from cooperative_staging_semantics import prepare
from full_stack_ablation import expected_markers
from terminal_store_layouts import copy_layout
from serial_half_copy_bits import Bits


def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('before',type=pathlib.Path);p.add_argument('--output',required=True,type=pathlib.Path)
    args=p.parse_args();rows=[]
    for record in json.loads(args.before.read_text()):
        fixture=SimpleNamespace(kind='dot',shape=record['shape'],layout=record['layout'],dtype=record['dtype'])
        kernel,warm,kw,_,_,_,grid=prepare(fixture)
        for enabled in (False,True):
            c=kernel.warmup(*warm,grid=(grid,),**kw,**record['options'],half_store_distribution=enabled)
            code=c.asm['sycl'];code=code.decode() if isinstance(code,bytes) else code
            memir=str(c.asm['memir']);expected_markers(fixture,record['options'],memir)
            assert 'sycl.half_store_distribution' not in memir
            actual=hashlib.sha256(code.encode()).hexdigest()
            assert actual==record['after_source_sha256'],(record,enabled,actual)
            rows.append(dict(shape=record['shape'],layout=record['layout'],dtype=record['dtype'],
                config=record['config'],enabled=enabled,status='PASS',source_sha256=actual))
    x,y=Bits([0]*768),Bits([0]*768)
    hashes=[]
    for enabled in (False,True):
        c=copy_layout.warmup(x,y,765,0,16,R=16,C=16,SR=16,SC=1,BS=256,
            KIND='dense',grid=(3,),distribute_work=False,half_store_distribution=enabled)
        code=c.asm['sycl'];code=code.decode() if isinstance(code,bytes) else code
        assert 'sycl.half_store_distribution' not in str(c.asm['memir'])
        hashes.append(hashlib.sha256(code.encode()).hexdigest())
        rows.append(dict(config='distribution_disabled',enabled=enabled,status='PASS',source_sha256=hashes[-1]))
    assert hashes[0]==hashes[1]
    args.output.write_text(json.dumps(rows,indent=2)+'\n')
    print(json.dumps(dict(status='PASS',count=len(rows))))


if __name__=='__main__':main()
