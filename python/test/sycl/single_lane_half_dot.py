"""Strict regression and correct-baseline paired cost for conditional half copies."""
import argparse
import hashlib
import itertools
import json
import pathlib
import re
import statistics
from types import SimpleNamespace
from cooperative_staging_semantics import prepare,check
from full_stack_ablation import ALL
from triton.backends.sycl.sycl_utils import run_standalone,profile_standalone


def unguard(code):
    # Test-only reconstruction. Never expose an unsafe production bypass.
    begin=code.find('\ninline triton_sycl_float16 triton_sycl_single_lane_half_load(')
    if begin<0:return code
    last=code.index('\n}\n',code.index('inline void triton_sycl_single_lane_half_store(',begin))+3
    code=code[:begin]+code[last:]
    code=re.sub(r'triton_sycl_single_lane_half_load\(&([^\n]+?), item\.get_local_range\(\)\.size\(\)\)',r'\1',code)
    code=re.sub(r'triton_sycl_single_lane_half_store\(&([^\n]+?), (var_\d+), item\.get_local_range\(\)\.size\(\)\)',r'\1 = \2',code)
    return code


def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--output',type=pathlib.Path,required=True)
    p.add_argument('--shape',type=int,nargs=3,default=[8,32,16])
    p.add_argument('--layout',choices=('NN','NT','TN','TT'),default='TT')
    p.add_argument('--dtype',choices=('f16','f32'),default='f16')
    p.add_argument('--rounds',type=int,default=1);p.add_argument('--repeats',type=int,default=0)
    p.add_argument('--dump-dir',type=pathlib.Path)
    p.add_argument('--paired',action='store_true')
    args=p.parse_args();rows=[];fixture=SimpleNamespace(kind='dot',shape=args.shape,layout=args.layout,dtype=args.dtype)
    kernel,warm,kw,bound,out,expected,grid=prepare(fixture)
    for round_ in range(args.rounds):
        plans=['base','all'] if round_%2==0 else ['all','base']
        for plan in plans:
            opts=dict(ALL)
            if plan=='base':
                opts.update({k:False for k in opts if k not in ('distribute_work','reuse_local_memory','reduction_unroll')})
                opts['reduction_unroll']=1
            c=kernel.warmup(*warm,grid=(grid,),**kw,**opts)
            code=c.asm['sycl'];code=code.decode() if isinstance(code,bytes) else code
            memir=str(c.asm['memir']);copies=args.layout.count('T') if args.dtype=='f16' else 0
            assert memir.count('sycl.single_lane_half_bits')==2*copies,memir
            assert code.count('triton_sycl_single_lane_half_load(')==(copies+1 if copies else 0),code
            before=unguard(code)
            if args.dump_dir:
                args.dump_dir.mkdir(parents=True,exist_ok=True)
                for ext,data in [('sycl',code),('memir',memir),('before.sycl',before)]:
                    (args.dump_dir/f'{plan}.{ext}').write_text(data)
            variants=['after','before'] if args.paired else ['after']
            if round_%2:variants.reverse()
            for variant in variants:
                src=code if variant=='after' else before
                # The known-broken baseline is never executed/timed at local=1.
                # Paired timings are allowed only after all selected launches
                # and the final profiled output pass independent references.
                blocks=(1,3,48,(3,5),64) if variant=='after' else (3,48,(3,5),64)
                for block in blocks:
                    out.c_array[:]=[-999.]*len(expected)
                    run_standalone(grid,1,1,c.name,src,bound,signature=c.src.signature,metadata=c.metadata,block_size=block)
                    check(list(out.c_array),expected)
                samples=[]
                if args.repeats:
                    samples=profile_standalone(grid,1,1,c.name,src,bound,signature=c.src.signature,
                        metadata=c.metadata,block_size=64,warmup=10,repeats=args.repeats)
                    check(list(out.c_array),expected)
                row=dict(shape=args.shape,layout=args.layout,dtype=args.dtype,plan=plan,variant=variant,round=round_,
                    status='PASS',guarded_copies=copies,check_blocks=blocks,
                    elements_checked=(len(blocks)+bool(samples))*len(expected),output_elements=len(expected),
                    source_sha256=hashlib.sha256(src.encode()).hexdigest(),
                    reconstructed_baseline_sha256=hashlib.sha256(before.encode()).hexdigest(),
                    samples_ns=samples,median_ns=statistics.median(samples) if samples else None)
                rows.append(row);print(json.dumps(row),flush=True);args.output.write_text(json.dumps(rows,indent=2)+'\n')


if __name__=='__main__':main()
