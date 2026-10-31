"""Bit-exact IEEE binary16 transpose copies, without floating conversion."""
import argparse
import ctypes
import hashlib
import json
import pathlib
import tempfile

import triton.language as tl
from triton.backends.sycl.sycl_utils import run_standalone


class Bits:
    dtype = tl.float16

    def __init__(self, values):
        self.c_array = (ctypes.c_uint16 * len(values))(*values)

    def data_ptr(self):
        return ctypes.addressof(self.c_array)


def source(R, C, dialect):
    a, b = f'memref<{C}x{R}xf16>', f'memref<{R}x{C}xf16>'
    view = 'memref<1xf16, strided<[1], offset: ?>>'
    return f'''module {{ func.func @half_copy(%x:memref<*xf16>,%y:memref<*xf16>) {{
      %zero = arith.constant 0 : index
      %group = gpu.global_id x
      %base = affine.apply affine_map<(d0)->(d0*{R*C})>(%group)
      %a = memref.alloc() : {a}
      %b = memref.alloc() : {b}
      affine.for %c = 0 to {C} {{
        affine.for %r = 0 to {R} {{
          %at = affine.apply affine_map<(d0,d1,d2)->(d0+d1*{R}+d2)>(%base,%c,%r)
          %in = memref.reinterpret_cast %x to offset:[%at], sizes:[1], strides:[1] : memref<*xf16> to {view}
          %v = memref.load %in[%zero] : {view}
          affine.store %v,%a[%c,%r] : {a}
        }}
      }}
      affine.for %r = 0 to {R} {{
        affine.for %c = 0 to {C} {{
          %v = {dialect}.load %a[%c,%r] : {a}
          {dialect}.store %v,%b[%r,%c] : {b}
        }} {{sycl.parallel}}
      }} {{sycl.parallel}}
      affine.for %r = 0 to {R} {{
        affine.for %c = 0 to {C} {{
          %at = affine.apply affine_map<(d0,d1,d2)->(d0+d1*{C}+d2)>(%base,%r,%c)
          %out = memref.reinterpret_cast %y to offset:[%at], sizes:[1], strides:[1] : memref<*xf16> to {view}
          %v = affine.load %b[%r,%c] : {b}
          memref.store %v,%out[%zero] : {view}
        }}
      }}
      return
    }} }}'''


def main():
    from triton._C.libtriton import ir, sycl
    from triton.backends.sycl.compiler import SYCLBackend
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--output', required=True)
    p.add_argument('--shape',type=int,nargs=2)
    p.add_argument('--dump-dir',type=pathlib.Path)
    args = p.parse_args()
    ctx=ir.context();ir.load_dialects(ctx);sycl.load_dialects(ctx)
    # Includes signed zero, infinities, quiet/signaling NaN payloads, minimum
    # and maximum subnormals, minimum normals and maximum finite values.
    special = [0, 0x8000, 0x3c00, 0xbc00, 0x7c00, 0xfc00, 0x7e00,
               0x7d01, 0xfe55, 1, 0x8001, 0x3ff, 0x83ff, 0x400,
               0x8400, 0x7bff, 0xfbff]
    rows = []
    for R, C in ([tuple(args.shape)] if args.shape else ((16,32), (32,16), (8,64), (16,16))):
        grid, sentinel = 3, 0x3555
        raw = [special[i % len(special)] for i in range(grid*R*C)]
        expected = [sentinel] * (grid*R*C+7)
        for batch in range(grid):
            for r in range(R):
                for c in range(C):
                    expected[batch*R*C+r*C+c] = raw[batch*R*C+c*R+r]
        x, y = Bits(raw), Bits(expected)
        for dialect, distributed in ((d,w) for d in ('affine','memref') for w in (False,True)):
            # Generic ownership proves affine accesses only. The memref variant
            # deliberately retains serial emission even when planning is asked.
            with tempfile.NamedTemporaryFile(mode='w',suffix='.mlir') as f:
                f.write(source(R,C,dialect));f.flush();mod=ir.parse_mlir_module(f.name,ctx)
            pm=ir.pass_manager(ctx)
            if distributed:sycl.passes.memir.work_distribution(pm)
            sycl.passes.memir.serial_half_copy_guard(pm);pm.run(mod)
            code=SYCLBackend.emit_sycl(mod,{},None)
            if args.dump_dir:
                args.dump_dir.mkdir(parents=True,exist_ok=True)
                stem=f'{R}x{C}-{dialect}-dist{distributed}'
                (args.dump_dir/(stem+'.sycl')).write_text(code)
                (args.dump_dir/(stem+'.memir')).write_text(str(mod))
            guards = str(mod).count('sycl.scalar_half_bits')
            selected = distributed and dialect=='affine'
            assert guards == (2 if selected else 4), (R,C,dialect,distributed,guards)
            for block in (1,3,48,(3,5)):
                y.c_array[:] = [sentinel] * len(expected)
                run_standalone(grid,1,1,'half_copy',code,[x,y],block_size=block)
                actual = list(y.c_array)
                assert actual == expected, [(i,a,b) for i,(a,b) in enumerate(zip(actual,expected)) if a!=b][:8]
                row = dict(shape=[R,C],dialect=dialect,distribution_requested=distributed,
                    distributed=selected,block=block,
                    status='PASS',elements_checked=len(expected),special_bits=special,
                    guard_markers=guards,source_sha256=hashlib.sha256(code.encode()).hexdigest())
                rows.append(row);print(json.dumps(row),flush=True)
                pathlib.Path(args.output).write_text(json.dumps(rows,indent=2)+'\n')


if __name__ == '__main__':
    main()
