"""Explicit repeated pass orders over dot IR, preserving scheduling markers."""
import argparse
import json
import pathlib
import re
import tempfile
from types import SimpleNamespace
from cooperative_staging_semantics import prepare


def main():
    from triton._C.libtriton import ir,sycl
    from triton.backends.sycl.compiler import SYCLBackend
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--output',type=pathlib.Path,required=True)
    args=p.parse_args();rows=[];ctx=ir.context();ir.load_dialects(ctx);sycl.load_dialects(ctx)
    stage='phase_barrier_coalescing'
    for dtype in ('f16','f32'):
        kernel,warm,kw,_,_,_,grid=prepare(SimpleNamespace(kind='dot',shape=[16,32,32],layout='TT',dtype=dtype))
        c=kernel.warmup(*warm,grid=(grid,),**kw,distribute_work=False,register_accumulator=False,
            matmul_register_tiling=False,group_reduction=False,accumulator_init_forwarding=False,
            reduction_unroll=1,reuse_local_memory=False,cooperative_load_staging=False,
            terminal_store_distribution=False,phase_barrier_coalescing=False)
        text=str(c.asm['memir'])
        def run(order):
            with tempfile.NamedTemporaryFile(mode='w',suffix='.mlir') as f:
                f.write(text);f.flush();mod=ir.parse_mlir_module(f.name,ctx)
            pm=ir.pass_manager(ctx)
            for name in order:getattr(sycl.passes.memir,name)(pm)
            pm.run(mod);return str(mod).replace(f.name,'pipeline.mlir'),SYCLBackend.emit_sycl(mod,{},None)
        for schedule in ([],['cooperative_load_staging','work_distribution'],
            ['cooperative_load_staging','work_distribution','register_accumulator','matmul_register_tiling',
             'accumulator_init_forwarding','local_memory_reuse','terminal_store_distribution']):
            base,basecode=run(schedule+['serial_half_copy_guard'])
            for order in [schedule+['serial_half_copy_guard',stage],
                [stage]+schedule+['serial_half_copy_guard',stage],
                schedule+[stage,'local_memory_reuse','serial_half_copy_guard',stage]]:
                result,code=run(order)
                assert (result,code)==run(order+[stage])
                m=re.search(r'sycl.phase_barriers_coalesced = (\d+)',result);removed=int(m[1]) if m else 0
                assert basecode.count('item.barrier(')-code.count('item.barrier(')==removed
                for token in ('sycl.register_accumulator','sycl.register_tile =','sycl.distribution_depth',
                              'sycl.accumulator_init_forwarded','sycl.cooperative_load_staging',
                              'sycl.terminal_store_distribution','sycl.single_lane_half_bits','sycl.scalar_half_bits'):
                    assert base.count(token)==result.count(token),(dtype,order,token)
                rows.append(dict(dtype=dtype,pipeline=order,removed=removed,status='PASS'))
    args.output.write_text(json.dumps(rows,indent=2)+'\n')
    print(json.dumps(dict(status='PASS',count=len(rows))))


if __name__=='__main__':main()
