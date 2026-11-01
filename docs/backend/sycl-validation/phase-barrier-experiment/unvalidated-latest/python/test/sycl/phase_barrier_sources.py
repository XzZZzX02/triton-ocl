"""Exact default preservation and bounded scheduling composition over archived dots."""
import argparse
import hashlib
import json
import pathlib
import re
from types import SimpleNamespace
from cooperative_staging_semantics import prepare
from full_stack_ablation import expected_markers


def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('options',type=pathlib.Path)
    p.add_argument('reference',type=pathlib.Path);p.add_argument('--output',type=pathlib.Path,required=True)
    args=p.parse_args();rows=[];key=lambda r:(tuple(r['shape']),r['layout'],r['dtype'],r['config'])
    golden={key(r):r['source_sha256'] for r in json.loads(args.reference.read_text())}
    for old in json.loads(args.options.read_text()):
        fixture=SimpleNamespace(kind='dot',shape=old['shape'],layout=old['layout'],dtype=old['dtype'])
        kernel,warm,kw,_,_,_,grid=prepare(fixture);before=None
        for enabled in (False,True):
            c=kernel.warmup(*warm,grid=(grid,),**kw,**old['options'],phase_barrier_coalescing=enabled)
            code=c.asm['sycl'];code=code.decode() if isinstance(code,bytes) else code;memir=str(c.asm['memir'])
            expected_markers(fixture,old['options'],memir)
            digest=hashlib.sha256(code.encode()).hexdigest()
            m=re.search(r'sycl.phase_barriers_coalesced = (\d+)',memir);removed=int(m[1]) if m else 0
            barriers=code.count('item.barrier(sycl::access::fence_space::local_space);')
            markers={k:memir.count(k) for k in ('sycl.register_accumulator','sycl.register_tile =',
                'sycl.ordered_reduction_unroll','sycl.accumulator_init_forwarded','sycl.cooperative_load_staging',
                'sycl.terminal_store_distribution','sycl.distribution_depth','sycl.single_lane_half_bits')}
            if not enabled:
                assert digest==golden[key(old)],(key(old),digest,golden[key(old)])
                before=(barriers,markers,digest)
            else:
                assert before[0]-barriers==removed and before[1]==markers
                assert (digest!=before[2])==bool(removed)
            rows.append(dict(shape=old['shape'],layout=old['layout'],dtype=old['dtype'],config=old['config'],
                enabled=enabled,status='PASS',source_sha256=digest,removed=removed,barriers=barriers,markers=markers))
            args.output.write_text(json.dumps(rows,indent=2)+'\n')
    print(json.dumps(dict(status='PASS',count=len(rows),active=sum(bool(r['removed']) for r in rows))))


if __name__=='__main__':main()
