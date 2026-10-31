"""Diagnose serial f16 dot composition; mismatches are evidence, not passes."""
import argparse
import hashlib
import json
import pathlib
import re
from types import SimpleNamespace

from cooperative_staging_semantics import prepare, fbits
from triton.backends.sycl.sycl_utils import run_standalone


def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--output',required=True)
    p.add_argument('--dump-dir',required=True)
    p.add_argument('--blocks',nargs='+',default=['1','3','48','3x5','64'])
    args=p.parse_args()
    fixture=SimpleNamespace(kind='dot',shape=[16,32,32],layout='TT',dtype='f16')
    kernel,warm,kw,bound,output,expected,grid=prepare(fixture)
    d=pathlib.Path(args.dump_dir);d.mkdir(exist_ok=True,parents=True)
    rows=[]
    for accumulator,unroll in ((False,1),(True,1),(True,4)):
        c=kernel.warmup(*warm,grid=(grid,),**kw,distribute_work=False,
            register_accumulator=accumulator,reduction_unroll=unroll,
            matmul_register_tiling=True,accumulator_init_forwarding=True,
            cooperative_load_staging=True,terminal_store_distribution=True,
            reuse_local_memory=True,fuse_elementwise=True,group_reduction=True)
        source=c.asm['sycl'];source=source.decode() if isinstance(source,bytes) else source
        begin=source.index('inline void '+c.name+'(')
        end=source.index('extern "C" void launch_',begin)
        body=source[begin:end]
        # Replace existing directives before adding the control, so every loop
        # has exactly one pragma rather than invalid duplicate directives.
        body=re.sub(r'(?m)^[ \t]*#pragma clang loop[^\n]*\n', '', body)
        scalarized=re.sub(r'(?m)^(\s*)for \(',r'\1#pragma clang loop vectorize(disable) interleave(disable)\n\1for (',body)
        for variant,code in (('original',source),('disable_kernel_loop_vectorization',source[:begin]+scalarized+source[end:])):
            label=f'acc{accumulator}-unroll{unroll}-{variant}'
            (d/(label+'.sycl')).write_text(code)
            (d/(label+'.memir')).write_text(str(c.asm['memir']))
            for token in args.blocks:
                block=tuple(map(int,token.split('x'))) if 'x' in token else int(token)
                output.c_array[:]=[-999.]*len(expected)
                error=None
                try:
                    run_standalone(grid,1,1,c.name,code,bound,
                        signature=c.src.signature,metadata=c.metadata,block_size=block)
                    differences=[dict(index=i,got=a,want=b) for i,(a,b) in enumerate(zip(output.c_array,expected)) if fbits(a)!=fbits(b)]
                except Exception as e:
                    differences=[];error=repr(e)
                row=dict(accumulator=accumulator,unroll=unroll,variant=variant,block=block,
                    status='EXECUTION_ERROR' if error else 'MISMATCH' if differences else 'PASS',
                    error=error,mismatch_count=len(differences),mismatches=differences[:8],
                    elements_checked=0 if error else len(expected),
                    source_sha256=hashlib.sha256(code.encode()).hexdigest())
                rows.append(row);print(json.dumps(row),flush=True)
                pathlib.Path(args.output).write_text(json.dumps(rows,indent=2)+chr(10))


if __name__=='__main__':main()
