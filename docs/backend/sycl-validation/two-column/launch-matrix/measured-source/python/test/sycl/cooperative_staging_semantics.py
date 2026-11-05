"""Paired cooperative staging tests with independent references and raw device events."""
import argparse
import ctypes
import hashlib
import itertools
import json
import math
import pathlib
import re
import statistics
import struct

import triton
import triton.language as tl
from register_accumulator import Tensor, kernel as dot
from triton.backends.sycl.sycl_utils import run_standalone, profile_standalone


@triton.jit(do_not_specialize=['n', 'stride'])
def memory(x, y, n, stride, B: tl.constexpr, KIND: tl.constexpr):
    lane = tl.program_id(0) * B + tl.arange(0, B)
    valid = lane < n
    if KIND == 'holes':
        valid = valid & (lane % 3 != 1)
    elif KIND == 'or':
        valid = valid & ((lane % 11 < 3) | (lane % 11 >= 7))
    elif KIND == 'empty':
        valid = valid & (lane < 0)
    if KIND == 'negative':
        address = (n - 1 - lane) * stride
    elif KIND == 'gather':
        address = (lane * 7 + 3) % n
    elif KIND == 'broadcast':
        address = lane * 0
    else:
        address = lane * stride
    value = tl.load(x + address, valid, -7.)
    tl.store(y + lane, value, lane < n)


def fbits(value):
    return struct.pack('<f', value)


def check(actual, expected):
    assert len(actual) == len(expected)
    for index, (a, b) in enumerate(zip(actual, expected)):
        assert (math.isnan(a) if math.isnan(b) else fbits(a) == fbits(b)), (index, a, b)


def prepare(args):
    if args.kind == 'dot':
        M, N, K = args.shape
        m, n, k, grid = M-1, N-3, K-1, 3
        half = args.dtype == 'f16'
        ta, tb = (c == 'T' for c in args.layout)
        av = [(i % 11 - 5) / 4 for i in range(grid*M*K)]
        bv = [(i % 13 - 6) / 4 for i in range(grid*K*N)]
        x, y, z = Tensor(av, half), Tensor(bv, half), Tensor([-999.]*(grid*M*N+7))
        expected = [-999.]*(grid*M*N+7)
        for batch in range(grid):
            for r in range(m):
                for c in range(n):
                    expected[batch*M*N+r*N+c] = sum(
                        av[batch*M*K+(h*M+r if ta else r*K+h)] *
                        bv[batch*K*N+(c*K+h if tb else h*N+c)] for h in range(k))
        kwargs = dict(M=M,N=N,K=K,BATCH=grid,TA=ta,TB=tb)
        bound = [x,y,z,m,n,k,M,N,K,grid,ta,tb]
        return dot, [x,y,z,m,n,k], kwargs, bound, z, expected, grid
    B, n, stride = args.block, args.n, args.stride
    size = max(1, n * stride + 7)
    values = [(i % 31 - 15) / 4 for i in range(size)]
    if args.special:
        special = [math.nan, math.inf, -math.inf, -0., 0., 2**-149, -2**-149,
                   2**-126, -2**-126, struct.unpack('<f', bytes.fromhex('ffff7f7f'))[0]]
        values = [special[i % len(special)] for i in range(size)]
    x, z = Tensor(values), Tensor([-999.] * (n + 7))
    expected = [-999.] * (n+7)
    for i in range(n):
        valid = args.kind != 'empty'
        if args.kind == 'holes': valid = i % 3 != 1
        if args.kind == 'or': valid = i % 11 < 3 or i % 11 >= 7
        address = ((n-1-i)*stride if args.kind=='negative' else
                   (i*7+3) % n if args.kind=='gather' else
                   0 if args.kind=='broadcast' else i*stride)
        expected[i] = values[address] if valid else -7.
    kwargs = dict(B=B,KIND=args.kind)
    bound = [x,z,n,stride,B,args.kind]
    return memory, [x,z,n,stride], kwargs, bound, z, expected, max(1,triton.cdiv(n,B))


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--output', required=True)
    p.add_argument('--kind', choices=['copy','holes','or','negative','gather','broadcast','empty','dot'], default='copy')
    p.add_argument('--block', type=int, default=256)
    p.add_argument('--n', type=int, default=1021)
    p.add_argument('--stride', type=int, default=1)
    p.add_argument('--shape', type=int, nargs=3, default=[16,32,32])
    p.add_argument('--layout', choices=['NN','NT','TN','TT'], default='NN')
    p.add_argument('--dtype', choices=['f32','f16'], default='f32')
    p.add_argument('--rounds', type=int, default=1)
    p.add_argument('--repeats', type=int, default=0)
    p.add_argument('--stack', choices=['base','optimized','both'], default='both')
    p.add_argument('--undistributed', action='store_true')
    p.add_argument('--compile-only', action='store_true')
    p.add_argument('--special', action='store_true')
    p.add_argument('--dump-dir')
    args = p.parse_args()
    assert args.n >= 0 and args.stride > 0 and args.rounds > 0 and args.repeats >= 0
    kernel, warm, kwargs, bound, output, expected, grid = prepare(args)
    stacks = [False,True] if args.stack=='both' else [args.stack=='optimized']
    schedules = list(itertools.product(stacks,(False,True)))
    rows = []
    for round_ in range(args.rounds):
        for stack, enabled in (schedules if round_%2==0 else reversed(schedules)):
            compiled = kernel.warmup(*warm, grid=(grid,), **kwargs,
                cooperative_load_staging=enabled,distribute_work=not args.undistributed,
                register_accumulator=stack,matmul_register_tiling=stack,
                reduction_unroll=4 if stack else 1,accumulator_init_forwarding=stack,
                fuse_elementwise=stack,group_reduction=stack,reuse_local_memory=True)
            code = compiled.asm['sycl']
            code = code.decode() if isinstance(code,bytes) else code
            memir = str(compiled.asm['memir'])
            stages = memir.count('sycl.cooperative_load_staging')
            if args.kind=='dot':
                M,N,K=args.shape
                eligible=sum(x>=256 for x in (M*K,K*N))
            else: eligible=int(args.block>=256)
            assert stages == (eligible if enabled and not args.undistributed else 0), (args.kind,enabled,stages,memir)
            if args.dump_dir:
                d=pathlib.Path(args.dump_dir);d.mkdir(parents=True,exist_ok=True)
                for ext,data in [('memir',memir),('sycl',code)]:
                    (d/f'{args.kind}-stack{stack}-stage{enabled}.{ext}').write_text(data)
            checks=0
            if not args.compile_only:
                for block in (3,48,(3,5)):
                    output.c_array[:]=[-999.]*len(output.c_array)
                    run_standalone(grid,1,1,compiled.name,code,bound,
                        signature=compiled.src.signature,metadata=compiled.metadata,block_size=block)
                    check(list(output.c_array),expected)
                    checks+=len(expected)
            samples=[]
            if args.repeats and not args.compile_only:
                samples=profile_standalone(grid,1,1,compiled.name,code,bound,
                    signature=compiled.src.signature,metadata=compiled.metadata,
                    block_size=64,repeats=args.repeats,warmup=10)
                if isinstance(samples,int):samples=[samples]
            storage=re.search(r'local storage: (\d+) -> (\d+) bytes',code)
            record=dict(kind=args.kind,n=args.n,block=args.block,stride=args.stride,
                shape=args.shape,layout=args.layout,dtype=args.dtype,grid=grid,
                stack=stack,enabled=enabled,distributed=not args.undistributed,
                round=round_,special=args.special,status='PASS',stages=stages,
                markers={name:memir.count(name) for name in ('sycl.register_accumulator',
                    'sycl.register_tile =','sycl.ordered_reduction_unroll',
                    'sycl.accumulator_init_forwarded','sycl.distribution_depth')},
                elements_checked=checks,source_bytes=len(code),
                source_sha256=hashlib.sha256(code.encode()).hexdigest(),
                local_bytes=int(storage[2]) if storage else None,
                samples_ns=samples,median_ns=statistics.median(samples) if samples else None)
            rows.append(record);print(json.dumps(record),flush=True)
            pathlib.Path(args.output).write_text(json.dumps(rows,indent=2)+'\n')


if __name__=='__main__':main()
