"""Paired dot accumulator tests and timings; no external array dependencies."""
import argparse
import ctypes
import hashlib
import itertools
import json
import math
import os
import pathlib
import statistics
import struct
import time

import triton
import triton.language as tl
from triton.backends.sycl.sycl_utils import run_standalone,profile_standalone


class Tensor:
    def __init__(self,values,half=False):
        self.dtype=tl.float16 if half else tl.float32
        if half: values=[int.from_bytes(struct.pack('<e',v),'little') for v in values]
        self.c_array=((ctypes.c_uint16 if half else ctypes.c_float)*len(values))(*values)
    def data_ptr(self):return ctypes.addressof(self.c_array)


@triton.jit(do_not_specialize=['m','n','k'])
def kernel(x,y,z,m,n,k,M:tl.constexpr,N:tl.constexpr,K:tl.constexpr,
           BATCH:tl.constexpr,TA:tl.constexpr,TB:tl.constexpr):
    r=tl.arange(0,M)
    c=tl.arange(0,N)
    h=tl.arange(0,K)
    p=tl.program_id(0)
    if TA: a=tl.trans(tl.load(x+p*M*K+h[:,None]*M+r[None,:],(h[:,None]<k)&(r[None,:]<m),0.))
    else:a=tl.load(x+p*M*K+r[:,None]*K+h[None,:],(r[:,None]<m)&(h[None,:]<k),0.)
    if TB: b=tl.trans(tl.load(y+p*K*N+c[:,None]*K+h[None,:],(c[:,None]<n)&(h[None,:]<k),0.))
    else:b=tl.load(y+p*K*N+h[:,None]*N+c[None,:],(h[:,None]<k)&(c[None,:]<n),0.)
    result=tl.dot(a,b)
    tl.store(z+p*M*N+r[:,None]*N+c[None,:],result,(r[:,None]<m)&(c[None,:]<n))


def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--output',required=True)
    p.add_argument('--repeats',type=int,default=0)
    p.add_argument('--quick',action='store_true')
    p.add_argument('--rounds',type=int,default=1)
    p.add_argument('--tiling',action='store_true')
    p.add_argument('--shape',nargs=3,type=int)
    p.add_argument('--layout',choices=('NN','TN','NT','TT'))
    p.add_argument('--dtype',choices=('f32','f16'))
    p.add_argument('--block',type=int,default=64)
    p.add_argument('--ablate',action='store_true')
    p.add_argument('--config-index',type=int)
    p.add_argument('--check-block',choices=('all','48','3x5'),default='all')
    p.add_argument('--special',action='store_true')
    p.add_argument('--undistributed',action='store_true')
    args=p.parse_args()
    specs=[(4,8,8),(16,32,32),(32,64,64),(64,16,32)]
    if args.quick: specs=specs[:1]
    if args.shape: specs=[tuple(args.shape)]
    rows=[]
    for M,N,K in specs:
        m,n,k=M-1,N-3,K-1
        batches=3
        for ta,tb,half in itertools.product((False,True),repeat=3):
            if args.layout and args.layout != ('T' if ta else 'N')+('T' if tb else 'N'): continue
            if args.dtype and (args.dtype=='f16') != half: continue
            av=[float(i%11-5)/4 for i in range(batches*M*K)]
            bv=[float(i%13-6)/4 for i in range(batches*K*N)]
            if args.special:
                av=[(-0. if i%2 else 0.) for i in range(batches*M*K)]
                av[0]=math.nan
                av[M*K+1]=math.inf
                av[2*M*K+2]=-math.inf
            x,y,z=Tensor(av,half),Tensor(bv,half),Tensor([-99.]*(batches*M*N))
            expected=[-99.]*(batches*M*N)
            for batch in range(batches):
                for r in range(m):
                    for c in range(n):
                        expected[batch*M*N+r*N+c]=sum(av[batch*M*K+(h*M+r if ta else r*K+h)]*bv[batch*K*N+(c*K+h if tb else h*N+c)] for h in range(k))
            for round_index in range(args.rounds):
                configs=list(itertools.product((False,True),repeat=2)) if args.tiling else [(False,False),(True,False)]
                configs=[(a,t,False,True,False,True) for a,t in configs]
                if args.ablate:
                    all_on=(True,True,True,True,True,True)
                    configs=[(False,)*6,all_on]+[all_on[:i]+(False,)+all_on[i+1:] for i in range(6)]
                    configs += [tuple(index == enabled_index for index in range(5)) + (True,)
                                for enabled_index in range(5)]
                    configs.append((False, False, False, False, False, True))
                if args.undistributed:
                    configs=[config[:5]+(False,) for config in configs]
                ordered_configs=configs if round_index%2==0 else list(reversed(configs))
                indexed_configs=list(enumerate(ordered_configs))
                if args.config_index is not None:
                    if args.config_index < 0 or args.config_index >= len(indexed_configs):
                        p.error(f'--config-index must be in [0, {len(indexed_configs)-1}]')
                    indexed_configs=[indexed_configs[args.config_index]]
                for config_index,(enabled,tiled,fused,reuse,group,distributed) in indexed_configs:
                    started=time.perf_counter()
                    phase='compile'
                    code_hash=None
                    try:
                        z.c_array[:] = [-99.] * len(z.c_array)
                        c=kernel.warmup(x,y,z,m,n,k,M=M,N=N,K=K,BATCH=batches,TA=ta,TB=tb,
                            grid=(batches,),register_accumulator=enabled,matmul_register_tiling=tiled,
                            fuse_elementwise=fused,reuse_local_memory=reuse,group_reduction=group,distribute_work=distributed)
                        compile_seconds=time.perf_counter()-started
                        code=c.asm['sycl']; code=code.decode() if isinstance(code,bytes) else code
                        code_hash=hashlib.sha256(code.encode()).hexdigest()
                        if os.environ.get('SYCL_DOT_DUMP'):
                            path=pathlib.Path(os.environ['SYCL_DOT_DUMP']);path.mkdir(parents=True,exist_ok=True)
                            for stage,data in c.asm.items():
                                if isinstance(data,bytes): data=data.decode()
                                if isinstance(data,str): (path/(str(enabled)+'-'+str(tiled)+'.'+stage)).write_text(data)
                        blocks={'all':(48,(3,5)),'48':(48,),'3x5':((3,5),)}[args.check_block]
                        for block in blocks:
                            phase=f'run block={block}'
                            bound=[x,y,z,m,n,k,M,N,K,batches,ta,tb]
                            run_standalone(batches,1,1,c.name,code,bound,signature=c.src.signature,metadata=c.metadata,block_size=block)
                            for index,(actual,want) in enumerate(zip(z.c_array,expected)):
                                assert math.isnan(actual) if math.isnan(want) else actual==want,(M,N,K,ta,tb,half,enabled,tiled,distributed,block,index,actual,want)
                                if want==0.: assert math.copysign(1.,actual)==math.copysign(1.,want)
                        phase='profile'
                        samples=profile_standalone(batches,1,1,c.name,code,bound,signature=c.src.signature,
                            metadata=c.metadata,block_size=args.block,repeats=args.repeats,warmup=10) if args.repeats else []
                        row=dict(M=M,N=N,K=K,ta=ta,tb=tb,half=half,enabled=enabled,config_index=config_index,round=round_index,
                            tiled=tiled,fused=fused,reuse=reuse,group=group,distributed=distributed,block=args.block,
                            special=args.special,status='PASS',compile_seconds=compile_seconds,source_bytes=len(code),
                            source_sha256=code_hash,
                            samples_ns=samples,median_ns=statistics.median(samples) if samples else None,
                            private_loops=str(c.asm['memir']).count('sycl.thread_private'))
                        should_tile=tiled and distributed and M>=8 and N>=16 and K>=16
                        assert ('sycl.register_tile' in str(c.asm['memir'])) == should_tile,row
                        assert row['private_loops']>0 if enabled or should_tile else row['private_loops']==0,row
                    except Exception as error:
                        row=dict(M=M,N=N,K=K,ta=ta,tb=tb,half=half,enabled=enabled,config_index=config_index,round=round_index,
                            tiled=tiled,fused=fused,reuse=reuse,group=group,distributed=distributed,
                            status='FAIL',phase=phase,source_sha256=code_hash,error=repr(error))
                    rows.append(row); print(json.dumps(row),flush=True)
                    pathlib.Path(args.output).write_text(json.dumps(rows,indent=2)+'\n')
    raise SystemExit(any(row['status'] != 'PASS' for row in rows))


if __name__=='__main__':main()
