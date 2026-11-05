"""One cold-cache Triton-to-SYCL compilation; no GPU or device timing."""
import argparse
import hashlib
import json
import os
import pathlib
import tempfile
import time
from types import SimpleNamespace


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--enabled', type=int, choices=(0,1), required=True)
    p.add_argument('--plan', choices=('base','full'), required=True)
    p.add_argument('--k', type=int, required=True)
    p.add_argument('--round', type=int, required=True)
    p.add_argument('--output', type=pathlib.Path, required=True)
    a = p.parse_args()
    with tempfile.TemporaryDirectory(prefix='two-column-cold-') as cache:
        os.environ['TRITON_CACHE_DIR'] = cache
        from cooperative_staging_semantics import prepare
        from full_stack_ablation import ALL
        kernel,warm,kw,*_ = prepare(SimpleNamespace(kind='dot',shape=[8,16,a.k],layout='TT',dtype='f16'))
        options = dict(ALL)
        if a.plan == 'base':
            options.update({k:False for k in options if k not in (
                'register_accumulator','matmul_register_tiling','distribute_work',
                'reuse_local_memory','reduction_unroll')})
            options['reduction_unroll'] = 1
        started = time.perf_counter()
        c = kernel.warmup(*warm,grid=(3,),**kw,**options,matmul_register_tiling_2col=bool(a.enabled))
        seconds = time.perf_counter()-started
        code = c.asm['sycl']
        code = code.decode() if isinstance(code,bytes) else code
        assert ('sycl.register_tile = 2 : i64' in str(c.asm['memir'])) == bool(a.enabled)
        row = dict(status='PASS',stage='cold Triton-to-SYCL, excluding imports and C++ compilation',
                   shape=[8,16,a.k],layout='TT',plan=a.plan,enabled=bool(a.enabled),
                   round=a.round,seconds=seconds,source_bytes=len(code),
                   source_sha256=hashlib.sha256(code.encode()).hexdigest())
        a.output.write_text(json.dumps(row,indent=2)+chr(10))
        print(json.dumps(row))


if __name__ == '__main__':
    main()
