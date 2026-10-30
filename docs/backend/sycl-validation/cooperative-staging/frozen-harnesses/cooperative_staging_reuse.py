"""Actual lifetime-reuse and staging interactions, including prior-write fallback."""
import argparse
import hashlib
import itertools
import json
import pathlib
import re
import statistics

from optimization_semantics import copies, Tensor
from cooperative_staging_semantics import check
from triton.backends.sycl.sycl_utils import run_standalone, profile_standalone


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--case', choices=('sequential', 'overlap'), required=True)
    p.add_argument('--output', required=True)
    p.add_argument('--rounds', type=int, default=1)
    p.add_argument('--repeats', type=int, default=0)
    args = p.parse_args()
    av = [(i % 17 - 8) / 4 for i in range(512)]
    bv = [(i % 13 - 6) / 2 for i in range(512)]
    x, z, y = Tensor(av), Tensor(bv), Tensor([-999.] * 1031)
    expected = [-999.] * 1031
    for i in range(512):
        if args.case == 'sequential':
            expected[i], expected[512+i] = av[i]*2+1, bv[i]*3-1
        else:
            expected[i] = av[i]*2+bv[i]
    rows = []
    configs = list(itertools.product((False, True), repeat=2))
    for round_ in range(args.rounds):
        for stage, reuse in (configs if round_%2 == 0 else reversed(configs)):
            compiled = copies.warmup(x, z, y, MODE=args.case, grid=(2,),
                cooperative_load_staging=stage, reuse_local_memory=reuse)
            code = compiled.asm['sycl']
            code = code.decode() if isinstance(code, bytes) else code
            memir = str(compiled.asm['memir'])
            stages = memir.count('sycl.cooperative_load_staging')
            # A second load after an external write stays serial: no global fence
            # or source/destination noalias proof is supplied by this kernel.
            assert stages == ((1 if args.case == 'sequential' else 2) if stage else 0)
            storage = re.search(r'local storage: ([0-9]+) -> ([0-9]+) bytes', code)
            assert storage
            before, after = map(int, storage.groups())
            assert before == 2048
            assert after == (1024 if reuse and args.case == 'sequential' else 2048)
            checks = 0
            for local in (3, 48, (3, 5)):
                y.c_array[:] = [-999.] * len(expected)
                run_standalone(2, 1, 1, compiled.name, code, [x,z,y,args.case],
                    signature=compiled.src.signature, metadata=compiled.metadata, block_size=local)
                check(list(y.c_array), expected)
                checks += len(expected)
            samples = []
            if args.repeats:
                samples = profile_standalone(2,1,1,compiled.name,code,[x,z,y,args.case],
                    signature=compiled.src.signature,metadata=compiled.metadata,
                    block_size=64,warmup=10,repeats=args.repeats)
                if isinstance(samples,int): samples=[samples]
            row = dict(case=args.case,status='PASS',stage=stage,reuse=reuse,round=round_,
                stages=stages,local_bytes_before=before,local_bytes=after,
                elements_checked=checks,source_sha256=hashlib.sha256(code.encode()).hexdigest(),
                samples_ns=samples,median_ns=statistics.median(samples) if samples else None)
            rows.append(row)
            pathlib.Path(args.output).write_text(json.dumps(rows,indent=2)+chr(10))
            print(json.dumps(row),flush=True)


if __name__ == '__main__': main()
