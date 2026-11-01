"""Dump final AdaptiveCpp LLVM IR for a fixed guarded barrier-copy pair."""
import argparse
import hashlib
import json
import os
import pathlib
from types import SimpleNamespace
from cooperative_staging_semantics import prepare,check
from triton.backends.sycl.sycl_utils import run_standalone


def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--output',type=pathlib.Path,required=True)
    args=p.parse_args();args.output.parent.mkdir(parents=True,exist_ok=True);rows=[]
    fixture=SimpleNamespace(kind='copy',block=16,n=61,stride=1,special=False)
    kernel,warm,kw,bound,out,expected,grid=prepare(fixture)
    for enabled in (False,True):
        c=kernel.warmup(*warm,grid=(grid,),**kw,phase_barrier_coalescing=enabled)
        code=c.asm['sycl'];code=code.decode() if isinstance(code,bytes) else code
        irfile=args.output.with_suffix(f'.enabled{enabled}.ll')
        os.environ['ACPP_S2_DUMP_IR_FINAL']=str(irfile)
        out.c_array[:]=[-999.]*len(expected)
        run_standalone(grid,1,1,c.name,code,bound,signature=c.src.signature,metadata=c.metadata,block_size=64)
        check(list(out.c_array),expected)
        assert irfile.is_file() and irfile.stat().st_size>0,irfile
        text=irfile.read_text()
        row=dict(enabled=enabled,status='PASS',elements_checked=len(expected),
            source_barriers=code.count('item.barrier('),llvm_barrier_calls=sum(
                'call ' in line and 'llvm.amdgcn.s.barrier' in line for line in text.splitlines()),
            source_sha256=hashlib.sha256(code.encode()).hexdigest(),
            ir_sha256=hashlib.sha256(text.encode()).hexdigest(),ir_bytes=len(text))
        rows.append(row);print(json.dumps(row),flush=True);args.output.write_text(json.dumps(rows,indent=2)+'\n')


if __name__=='__main__':main()
