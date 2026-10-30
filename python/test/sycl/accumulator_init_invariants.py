"""Recompile measured programs and verify final initializer guard/source invariants."""
import argparse
import hashlib
import json
import pathlib

from register_accumulator import Tensor, kernel


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('inputs', nargs='+')
    p.add_argument('--output', required=True)
    args = p.parse_args()
    before = {}
    for filename in args.inputs:
        for r in json.loads(pathlib.Path(filename).read_text()):
            assert r['status'] == 'PASS', filename
            key = (tuple(r['shape']), r['layout'], r['dtype'], r['special'],
                   r['tiled'], r['unroll'], r['enabled'])
            assert key not in before or before[key] == r['source_sha256'], key
            before[key] = r['source_sha256']
    rows = []
    for key, old in sorted(before.items()):
        shape,layout,dtype,special,tiled,factor,enabled = key
        M,N,K=shape
        half=dtype=='f16'
        ta,tb=(x=='T' for x in layout)
        a,b,z=Tensor([0.]*(3*M*K),half),Tensor([0.]*(3*K*N),half),Tensor([0.]*(3*M*N))
        c=kernel.warmup(a,b,z,M-1,N-3,K-1,M=M,N=N,K=K,BATCH=3,TA=ta,TB=tb,
            grid=(3,),register_accumulator=True,matmul_register_tiling=tiled,
            reduction_unroll=factor,accumulator_init_forwarding=enabled)
        code=c.asm['sycl']
        code=code.decode() if isinstance(code,bytes) else code
        actual=hashlib.sha256(code.encode()).hexdigest()
        reference_tiled = False if half and M*(N//4)<64 else tiled
        reference_enabled = enabled and M*N>=128
        expected=before[key[:4]+(reference_tiled,factor,reference_enabled)]
        assert actual==expected,(key,actual,expected)
        assert ('sycl.accumulator_init_forwarded' in str(c.asm['memir'])) == (enabled and M*N>=128),key
        rows.append(dict(shape=shape,layout=layout,dtype=dtype,special=special,
            tiled=tiled,unroll=factor,enabled=enabled,status='PASS',source_sha256=actual,
            expected_sha256=expected,changed=actual!=old,
            tile_fallback=reference_tiled!=tiled))
        pathlib.Path(args.output).write_text(json.dumps(rows,indent=2)+'\n')
    print(json.dumps(dict(status='PASS',configurations=len(rows),changed=sum(r['changed'] for r in rows))))


if __name__=='__main__': main()
