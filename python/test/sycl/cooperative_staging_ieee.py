"""IEEE dot initializers with staging toggled and ordered accumulator stack fixed."""
import argparse
import hashlib
import itertools
import json
import math
import pathlib
import struct

from accumulator_init_ieee import initialized_dot, bits
from register_accumulator import Tensor
from cooperative_staging_semantics import check
from triton.backends.sycl.sycl_utils import run_standalone


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--dtype', choices=('f32','f16'), required=True)
    p.add_argument('--output', required=True)
    args = p.parse_args()
    half = args.dtype == 'f16'
    M,N,K,grid = 16,16,32,3
    av = [(0.25 if batch==0 else -0. if batch==1 else 0.)
          for batch in range(grid) for _ in range(M*K)]
    bv = [(0.5 if batch==0 else 1.) for batch in range(grid) for _ in range(K*N)]
    a,b = Tensor(av,half),Tensor(bv,half)
    z = Tensor([-999.]*(grid*M*N+7))
    fixtures = dict(zero=0.,negative_zero=-0.,finite=2.5,positive_inf=math.inf,
        negative_inf=-math.inf,nan=math.nan,subnormal=2**-149,negative_subnormal=-(2**-149))
    rows=[]
    for label,initial in fixtures.items():
        expected=[]
        for term in (0.125,-0.,0.):
            acc=initial
            for _ in range(K): acc=struct.unpack('<f',struct.pack('<f',acc+term))[0]
            expected += [acc]*(M*N)
        expected += [-999.]*7
        baseline=None
        for stage in (False,True):
            compiled=initialized_dot.warmup(a,b,z,initial,M,N,K,grid=(grid,),
                register_accumulator=True,matmul_register_tiling=half,reduction_unroll=4,
                accumulator_init_forwarding=True,cooperative_load_staging=stage)
            code=compiled.asm['sycl'];code=code.decode() if isinstance(code,bytes) else code
            memir=str(compiled.asm['memir'])
            assert memir.count('sycl.cooperative_load_staging')==(2 if stage else 0)
            assert 'sycl.accumulator_init_forwarded' in memir
            assert ('sycl.register_tile =' in memir)==half
            assert 'sycl.ordered_reduction_unroll' in memir
            for local in (48,(3,5)):
                z.c_array[:]=[-999.]*len(z.c_array)
                run_standalone(grid,1,1,compiled.name,code,[a,b,z,initial,M,N,K],
                    signature=compiled.src.signature,metadata=compiled.metadata,block_size=local)
                actual=list(z.c_array)
                check(actual,expected)
                if baseline is None: baseline=actual
                check(actual,baseline)
            row=dict(initial=label,initial_bits=bits(initial),dtype=args.dtype,stage=stage,
                status='PASS',stages=2 if stage else 0,elements_checked=2*len(expected),
                source_sha256=hashlib.sha256(code.encode()).hexdigest())
            rows.append(row);print(json.dumps(row),flush=True)
            pathlib.Path(args.output).write_text(json.dumps(rows,indent=2)+chr(10))


if __name__=='__main__':main()
