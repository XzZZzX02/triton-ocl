"""Diagnostic only: isolate the pre-existing short TT dot copy failure."""
import argparse
import hashlib
import json
import pathlib
import re
from types import SimpleNamespace
from cooperative_staging_semantics import prepare,fbits
from triton.backends.sycl.sycl_utils import run_standalone


def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--output',type=pathlib.Path,required=True)
    args=p.parse_args();rows=[]
    k,w,kw,bound,out,expected,grid=prepare(SimpleNamespace(kind='dot',shape=[8,32,16],layout='TT',dtype='f16'))
    c=k.warmup(*w,grid=(grid,),**kw,local_copy_forwarding=False,
        distribute_work=True,register_accumulator=False,matmul_register_tiling=False,
        reduction_unroll=1,accumulator_init_forwarding=False,cooperative_load_staging=False,
        terminal_store_distribution=False,half_store_distribution=False,
        reuse_local_memory=True,fuse_elementwise=False,group_reduction=False)
    source=c.asm['sycl'];source=source.decode() if isinstance(source,bytes) else source
    matches=list(re.finditer(r'(?m)^([ \t]*)triton_sycl_float16 (var_\d+) = (var_\d+\[[^\n;]+\]);[^\n]*\n\1(var_\d+\[[^\n;]+\]) = \2;',source))
    assert len(matches)==2,len(matches)
    for variant,selected in [('original',()),('A',(0,)),('B',(1,)),('both',(0,1))]:
        code=source
        for index in reversed(selected):
            m=matches[index];pad,tmp,src,dst=m.groups()
            replacement=f'{pad}triton_sycl_float16 {tmp};\n{pad}{tmp}.bits = *reinterpret_cast<const volatile uint16_t*>(&{src}.bits);\n{pad}*reinterpret_cast<volatile uint16_t*>(&{dst}.bits) = {tmp}.bits;'
            code=code[:m.start()]+replacement+code[m.end():]
        args.output.with_suffix('.'+variant+'.sycl').write_text(code)
        for block in (1,3,48,(3,5),64):
            out.c_array[:]=[-999.]*len(expected);error=None
            try:
                run_standalone(grid,1,1,c.name,code,bound,signature=c.src.signature,metadata=c.metadata,block_size=block)
                diff=[dict(index=i,got=a,want=b) for i,(a,b) in enumerate(zip(out.c_array,expected)) if fbits(a)!=fbits(b)]
            except Exception as e:error=repr(e);diff=[]
            row=dict(variant=variant,block=block,status='EXECUTION_ERROR' if error else 'MISMATCH' if diff else 'PASS',
                mismatches=diff[:8],mismatch_count=len(diff),error=error,elements_checked=len(expected) if not error else 0,
                source_sha256=hashlib.sha256(code.encode()).hexdigest())
            rows.append(row);print(json.dumps(row),flush=True);args.output.write_text(json.dumps(rows,indent=2)+'\n')


if __name__=='__main__':main()
