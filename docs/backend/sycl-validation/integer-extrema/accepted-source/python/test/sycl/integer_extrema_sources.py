"""Before/after source contracts, preserving old reducers and dot pipelines."""
import argparse
import hashlib
import json
import pathlib
import re
from types import SimpleNamespace
from integer_extrema import extrema,prepare
from cooperative_staging_semantics import prepare as dot_prepare
from full_stack_ablation import expected_markers


def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--before',type=pathlib.Path,required=True)
    p.add_argument('--dot-options',type=pathlib.Path,required=True);p.add_argument('--dot-reference',type=pathlib.Path,required=True)
    p.add_argument('--output',type=pathlib.Path,required=True);a=p.parse_args();rows=[]
    for dtype in ('i32','u32','i64','u64'):
        for kind in ('min','max'):
            prior=json.loads((a.before/f'integer-extrema-before-{dtype}-{kind}.json').read_text());assert len(prior)==8
            x,y,n,expected,neutral=prepare(dtype,kind,1024,3,'ordinary')
            controls={}
            for old in prior:
                stack,reg,group=old['stack'],old['reg'],old['group']
                c=extrema.warmup(x,y,n,1,B=1024,MAX=kind=='max',OTHER=neutral,CONDITIONAL=False,grid=(3,),
                    register_accumulator=reg,group_reduction=group,reduction_unroll=4 if stack else 1,
                    cooperative_load_staging=stack,fuse_elementwise=stack,reuse_local_memory=True,
                    terminal_store_distribution=stack,accumulator_init_forwarding=stack,matmul_register_tiling=stack)
                code=c.asm['sycl'];code=code.decode() if isinstance(code,bytes) else code
                digest=hashlib.sha256(code.encode()).hexdigest()
                assert old['collectives']==0
                assert (digest!=old['source_sha256'])==group
                controls[stack,reg,group]=digest
                if (stack,not reg,group) in controls:assert digest==controls[stack,not reg,group]
                rows.append(dict(case='integer_extrema',dtype=dtype,kind=kind,stack=stack,reg=reg,group=group,status='PASS',
                    before_source_sha256=old['source_sha256'],after_source_sha256=digest,changed=group))
    golden={ (tuple(r['shape']),r['layout'],r['dtype'],r['config']):r['source_sha256']
        for r in json.loads(a.dot_reference.read_text())}
    for old in json.loads(a.dot_options.read_text()):
        fixture=SimpleNamespace(kind='dot',shape=old['shape'],layout=old['layout'],dtype=old['dtype'])
        kernel,warm,kw,_,_,_,grid=dot_prepare(fixture)
        c=kernel.warmup(*warm,grid=(grid,),**kw,**old['options'])
        code=c.asm['sycl'];code=code.decode() if isinstance(code,bytes) else code
        digest=hashlib.sha256(code.encode()).hexdigest()
        expected_markers(fixture,old['options'],str(c.asm['memir']))
        assert digest==golden[tuple(old['shape']),old['layout'],old['dtype'],old['config']]
        rows.append(dict(case='dot',shape=old['shape'],layout=old['layout'],dtype=old['dtype'],config=old['config'],
            status='PASS',source_sha256=digest))
    a.output.write_text(json.dumps(rows,indent=2)+'\n')
    print(json.dumps(dict(status='PASS',count=len(rows))))


if __name__=='__main__':main()
