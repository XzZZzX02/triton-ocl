"""Paired accumulator initializer forwarding tests; device time excludes builds."""
import argparse
import hashlib
import itertools
import json
import math
import pathlib
import re
import statistics
import struct

from register_accumulator import Tensor, kernel
from triton.backends.sycl.sycl_utils import profile_standalone, run_standalone


def same(actual, expected):
    for index, (a, b) in enumerate(zip(actual, expected)):
        if math.isnan(b):
            assert math.isnan(a), (index, a, b)
        else:
            assert struct.pack('<f', a) == struct.pack('<f', b), (index, a, b)
    assert len(actual) == len(expected)


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--output', required=True)
    p.add_argument('--shape', type=int, nargs=3, default=[16, 32, 32])
    p.add_argument('--layout', choices=['NN','NT','TN','TT'], default='NN')
    p.add_argument('--dtype', choices=['f32','f16'], default='f32')
    p.add_argument('--rounds', type=int, default=1)
    p.add_argument('--repeats', type=int, default=0)
    p.add_argument('--special', action='store_true')
    p.add_argument('--compile-only', action='store_true')
    p.add_argument('--dump-dir')
    p.add_argument('--unroll', type=int, nargs='+', choices=[1,2,4,8], default=[1,4])
    p.add_argument('--tiling', choices=['off','on','both'], default='both')
    args = p.parse_args()
    M,N,K = args.shape
    assert M > 1 and N > 3 and K > 1
    m,n,k,batches = M-1,N-3,K-1,3
    half = args.dtype == 'f16'
    ta,tb = (v == 'T' for v in args.layout)
    av = [(i%11-5)/4 for i in range(batches*M*K)]
    bv = [(i%13-6)/4 for i in range(batches*K*N)]
    if args.special:
        av = [(-0. if i%2 else 0.) for i in range(batches*M*K)]
        av[0],av[M*K+1],av[2*M*K+2] = math.nan,math.inf,-math.inf
    x,y,z = Tensor(av,half),Tensor(bv,half),Tensor([-99.]*(batches*M*N))
    reference = [-99.]*(batches*M*N)
    for batch in range(batches):
        for r in range(m):
            for c in range(n):
                reference[batch*M*N+r*N+c] = sum(
                    av[batch*M*K+(h*M+r if ta else r*K+h)] *
                    bv[batch*K*N+(c*K+h if tb else h*N+c)] for h in range(k))
    tilings = {'off':[False], 'on':[True], 'both':[False,True]}[args.tiling]
    configs = list(itertools.product(tilings,args.unroll,(False,True)))
    rows = []
    for round_ in range(args.rounds):
        for tiled,factor,enabled in (configs if round_%2==0 else reversed(configs)):
            compiled = kernel.warmup(x,y,z,m,n,k,M=M,N=N,K=K,BATCH=batches,
                TA=ta,TB=tb,grid=(batches,),register_accumulator=True,
                matmul_register_tiling=tiled,reduction_unroll=factor,
                accumulator_init_forwarding=enabled)
            code=compiled.asm['sycl']
            code=code.decode() if isinstance(code,bytes) else code
            memir=str(compiled.asm['memir'])
            should_forward = enabled and M * N >= 128
            assert memir.count('sycl.accumulator_init_forwarded') == int(should_forward), memir
            assert memir.count('sycl.register_accumulator') == 1, memir
            expected_tile=(tiled and half and M>=8 and N>=16 and K>=16 and
                           N%4==0 and M*(N//4)>=64)
            assert ('sycl.register_tile =' in memir) == expected_tile, memir
            expected_unroll=factor>1 and K%factor==0 and K//factor>=2 and (not expected_tile or K>=32)
            assert ('sycl.ordered_reduction_unroll' in memir) == expected_unroll, memir
            if args.dump_dir:
                d=pathlib.Path(args.dump_dir);d.mkdir(parents=True,exist_ok=True)
                prefix=f'{args.dtype}-{args.layout}-tile{tiled}-u{factor}-init{enabled}'
                (d/(prefix+'.memir')).write_text(memir)
                (d/(prefix+'.sycl')).write_text(code)
            checks=0
            if not args.compile_only:
                for block in (48,(3,5)):
                    z.c_array[:] = [-99.] * len(z.c_array)
                    run_standalone(batches,1,1,compiled.name,code,
                        [x,y,z,m,n,k,M,N,K,batches,ta,tb],signature=compiled.src.signature,
                        metadata=compiled.metadata,block_size=block)
                    same(list(z.c_array),reference)
                    checks+=len(z.c_array)
            samples=[]
            if args.repeats and not args.compile_only:
                samples=profile_standalone(batches,1,1,compiled.name,code,
                    [x,y,z,m,n,k,M,N,K,batches,ta,tb],signature=compiled.src.signature,
                    metadata=compiled.metadata,block_size=64,repeats=args.repeats,warmup=10)
                if isinstance(samples,int):samples=[samples]
            storage=re.search(r'local storage: (\d+) -> (\d+) bytes',code)
            row=dict(shape=[M,N,K],layout=args.layout,dtype=args.dtype,tiled=tiled,
                unroll=factor,enabled=enabled,round=round_,special=args.special,status='PASS',
                marker=should_forward,elements_checked=checks,source_bytes=len(code),
                source_sha256=hashlib.sha256(code.encode()).hexdigest(),
                local_bytes=int(storage[2]) if storage else None,
                barriers=code.count('item.barrier'),samples_ns=samples,
                median_ns=statistics.median(samples) if samples else None)
            rows.append(row);print(json.dumps(row),flush=True)
            pathlib.Path(args.output).write_text(json.dumps(rows,indent=2)+'\n')


if __name__ == '__main__':main()
