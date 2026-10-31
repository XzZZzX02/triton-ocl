"""Compare aggregate, member-bit and volatile-bit local transpose copies."""
import argparse
import hashlib
import json
import pathlib
import re
from types import SimpleNamespace
from cooperative_staging_semantics import prepare, fbits
from triton.backends.sycl.sycl_utils import run_standalone


def bitcopy(source, volatile=False):
    pattern = re.compile(r'(?m)^(?P<indent>[ \t]*)triton_sycl_float16 (?P<tmp>var_\d+) = (?P<src>var_\d+\[[^\n;]+\]);[^\n]*\n(?P=indent)(?P<dst>var_\d+\[[^\n;]+\]) = (?P=tmp);(?P<suffix>[^\n]*)$')
    def replace(m):
        a,b=m['dst'],m['src']
        if volatile:
            statement=f'*reinterpret_cast<volatile uint16_t*>(&{a}.bits) = *reinterpret_cast<const volatile uint16_t*>(&{b}.bits);'
        else:
            statement=f'{a}.bits = {b}.bits;'
        return m['indent']+statement+m['suffix']
    out,count=pattern.subn(replace,source)
    assert count==2,(count,source)
    return out


def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--output',required=True);p.add_argument('--dump-dir',required=True)
    args=p.parse_args()
    fixture=SimpleNamespace(kind='dot',shape=[16,32,32],layout='TT',dtype='f16')
    kernel,warm,kw,bound,output,expected,grid=prepare(fixture)
    c=kernel.warmup(*warm,grid=(grid,),**kw,distribute_work=False,
        register_accumulator=True,reduction_unroll=4,fuse_elementwise=True,
        reuse_local_memory=True,matmul_register_tiling=True,group_reduction=True,
        cooperative_load_staging=True,terminal_store_distribution=True,accumulator_init_forwarding=True)
    source=c.asm['sycl'];source=source.decode() if isinstance(source,bytes) else source
    d=pathlib.Path(args.dump_dir);d.mkdir(parents=True,exist_ok=True)
    rows=[]
    for variant,code in (('aggregate',source),('member_bits',bitcopy(source)),('volatile_bits',bitcopy(source,True))):
        (d/(variant+'.sycl')).write_text(code)
        for block in (1,3,48,(3,5)):
            output.c_array[:]=[-999.]*len(expected)
            error=None;diff=[]
            try:
                run_standalone(grid,1,1,c.name,code,bound,signature=c.src.signature,metadata=c.metadata,block_size=block)
                diff=[dict(index=i,got=a,want=b) for i,(a,b) in enumerate(zip(output.c_array,expected)) if fbits(a)!=fbits(b)]
            except Exception as e:error=repr(e)
            row=dict(variant=variant,block=block,status='EXECUTION_ERROR' if error else 'MISMATCH' if diff else 'PASS',
                mismatch_count=len(diff),mismatches=diff[:8],error=error,
                elements_checked=len(expected) if not error else 0,source_sha256=hashlib.sha256(code.encode()).hexdigest())
            rows.append(row);print(json.dumps(row),flush=True)
            pathlib.Path(args.output).write_text(json.dumps(rows,indent=2)+chr(10))


if __name__=='__main__':main()
