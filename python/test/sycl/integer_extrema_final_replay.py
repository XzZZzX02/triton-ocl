"""Replay every timed program under the final opportunity gate and identity proof."""
import argparse
import hashlib
import json
import pathlib
from integer_extrema import extrema,prepare


def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('records',type=pathlib.Path)
    p.add_argument('--minimum',type=int,required=True);p.add_argument('--output',type=pathlib.Path,required=True)
    a=p.parse_args();rows=[]
    for path in sorted(a.records.glob('integer-extrema-dcu-*.json')):
        prior=json.loads(path.read_text());assert len(prior)==24,(path,len(prior))
        first=prior[0];dtype,kind,B,grid=(first[k] for k in ('dtype','kind','block','grid'))
        x,y,n,expected,neutral=prepare(dtype,kind,B,grid,'ordinary')
        for old in [r for r in prior if r['round']==0]:
            stack,reg,group=(old[k] for k in ('stack','reg','group'))
            c=extrema.warmup(x,y,n,1,B=B,MAX=kind=='max',OTHER=neutral,CONDITIONAL=False,grid=(grid,),
                register_accumulator=reg,group_reduction=group,reduction_unroll=4 if stack else 1,
                cooperative_load_staging=stack,fuse_elementwise=stack,reuse_local_memory=True,
                terminal_store_distribution=stack,accumulator_init_forwarding=stack,matmul_register_tiling=stack)
            code=c.asm['sycl'];code=code.decode() if isinstance(code,bytes) else code
            digest=hashlib.sha256(code.encode()).hexdigest()
            enabled=group and B>=a.minimum
            reference=old if B>=a.minimum else next(r for r in prior if r['round']==0 and r['stack']==stack and r['reg']==reg and not r['group'])
            assert digest==reference['source_sha256'],(path.name,stack,reg,group,digest,reference['source_sha256'])
            count=code.count('sycl::reduce_over_group');assert count==int(enabled)
            rows.append(dict(job=int(path.stem.rsplit('-',1)[1]),dtype=dtype,kind=kind,block=B,grid=grid,
                stack=stack,reg=reg,group=group,collectives=count,status='PASS',source_sha256=digest,
                measured_reference_sha256=reference['source_sha256']))
            a.output.write_text(json.dumps(rows,indent=2)+'\n')
    print(json.dumps(dict(status='PASS',count=len(rows))))


if __name__=='__main__':main()
