"""One cold Triton-to-SYCL compile, excluding imports and native compilation."""
import argparse
import hashlib
import json
import os
import pathlib
import tempfile
import time
from types import SimpleNamespace


def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--shape',nargs=3,type=int,required=True)
    p.add_argument('--plan',choices=('raw','full'),required=True)
    p.add_argument('--enabled',type=int,choices=(0,1),required=True)
    p.add_argument('--round',type=int,required=True)
    p.add_argument('--output',type=pathlib.Path,required=True)
    args=p.parse_args()
    with tempfile.TemporaryDirectory(prefix='lds-cold-') as cache:
        os.environ['TRITON_CACHE_DIR']=cache
        from cooperative_staging_semantics import prepare
        from full_stack_ablation import ALL
        from triton._C import libtriton
        from triton.backends.sycl import compiler
        kernel,warm,kw,*_=prepare(SimpleNamespace(
            kind='dot',shape=args.shape,layout='NN',dtype='f16'))
        options=dict(ALL) if args.plan=='full' else dict(
            distribute_work=True,reuse_local_memory=True)
        started=time.perf_counter()
        c=kernel.warmup(*warm,grid=(3,),**kw,**options,lds_bank_padding=bool(args.enabled))
        seconds=time.perf_counter()-started
        code=c.asm['sycl'];code=code.decode() if isinstance(code,bytes) else code
        row=dict(status='PASS',stage='cold Triton-to-SYCL, excluding imports and C++ compilation',
            shape=args.shape,layout='NN',dtype='f16',plan=args.plan,
            enabled=bool(args.enabled),round=args.round,seconds=seconds,
            padded=str(c.asm['memir']).count('sycl.lds_bank_padding'),
            source_bytes=len(code),source_sha256=hashlib.sha256(code.encode()).hexdigest(),
            libtriton_sha256=hashlib.sha256(pathlib.Path(libtriton.__file__).read_bytes()).hexdigest(),
            compiler_sha256=hashlib.sha256(pathlib.Path(compiler.__file__).read_bytes()).hexdigest())
        assert args.enabled or row['padded']==0
        args.output.write_text(json.dumps(row,indent=2)+'\n')
        print(json.dumps(row))


if __name__=='__main__':main()
