"""Full-domain initializer forwarding legality and active pass composition."""
import argparse
import json
import pathlib
import tempfile


def contraction(fill_n=32, compute_n=32, initial='0.0', view=False,
                intermediate=False, extra_read=False, half=False, nested=False):
    dtype = 'f16' if half else 'f32'
    casts = '%xf = arith.extf %x : f16 to f32\n%yf = arith.extf %y : f16 to f32' if half else ''
    x, y = ('%xf', '%yf') if half else ('%x', '%y')
    alias = '%view = memref.cast %c : memref<16x32xf32> to memref<?x?xf32>' if view else ''
    middle = '''affine.for %r = 0 to 16 {
        affine.for %n = 0 to 32 {
          %prior = affine.load %c[%r,%n] : memref<16x32xf32>
          affine.store %prior,%sink[%r,%n] : memref<16x32xf32>
        }
      }''' if intermediate else ''
    extra = '%discard = affine.load %c[%r,%n] : memref<16x32xf32>' if extra_read else ''
    fill = f'''affine.for %r = 0 to 16 {{
        affine.for %n = 0 to {fill_n} {{
          affine.store %initial,%c[%r,%n] : memref<16x32xf32>
        }} {{sycl.parallel}}
      }} {{sycl.parallel}}'''
    compute = f'''affine.for %r = 0 to 16 {{
        affine.for %n = 0 to {compute_n} {{
          {extra}
          affine.for %k = 0 to 32 {{
            %x = affine.load %a[%r,%k] : memref<16x32x{dtype}>
            %y = affine.load %b[%k,%n] : memref<32x32x{dtype}>
            %z = affine.load %c[%r,%n] : memref<16x32xf32>
            {casts}
            %p = arith.mulf {x},{y} : f32
            %q = arith.addf %z,%p : f32
            affine.store %q,%c[%r,%n] : memref<16x32xf32>
          }} {{sycl.reduction}}
        }} {{sycl.parallel}}
      }} {{sycl.parallel}}'''
    if nested:
        compute = 'scf.if %flag {\n' + compute + '\n}'
    return f'''func.func @dot(%flag: i1) {{
      %initial = arith.constant {initial} : f32
      %a = memref.alloc() : memref<16x32x{dtype}>
      %b = memref.alloc() : memref<32x32x{dtype}>
      %c = memref.alloc() : memref<16x32xf32>
      %sink = memref.alloc() : memref<16x32xf32>
      {alias}
      {fill}
      {middle}
      {compute}
      return
    }}'''


def main():
    from triton._C.libtriton import ir, sycl
    from triton.backends.sycl.compiler import SYCLOptions
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--output', required=True)
    args = parser.parse_args()
    ctx = ir.context()
    ir.load_dialects(ctx)
    sycl.load_dialects(ctx)
    rows = []

    def transform(source, pipeline):
        with tempfile.NamedTemporaryFile(mode='w', suffix='.mlir') as f:
            f.write('module {\n' + source + '\n}')
            f.flush()
            module = ir.parse_mlir_module(f.name, ctx)
        pm = ir.pass_manager(ctx)
        for p in pipeline:
            if isinstance(p, int):
                sycl.passes.memir.ordered_reduction_unroll(pm, p)
            else:
                getattr(sycl.passes.memir, p)(pm)
        pm.run(module)
        return str(module).replace(f.name, 'contract.mlir')

    forwarding = 'accumulator_init_forwarding'
    base = ['work_distribution', 'register_accumulator']
    cases = [('zero', {}, True), ('negative_zero', {'initial': '-0.0'}, True),
             ('nonzero', {'initial': '2.5'}, True),
             ('negative_inf', {'initial': '0xFF800000'}, True),
             ('nan', {'initial': '0x7FC00000'}, True),
             ('partial_fill', {'fill_n': 31}, False),
             ('partial_output', {'compute_n': 31}, False),
             ('view_escape', {'view': True}, False),
             ('prior_reader', {'intermediate': True}, False),
             ('extra_reader', {'extra_read': True}, False),
             ('conditional', {'nested': True}, False)]
    for name, kwargs, eligible in cases:
        source = contraction(**kwargs)
        for suffix in ([], ['local_memory_reuse'], [4]):
            out = transform(source, base + [forwarding] + suffix)
            assert out.count('sycl.accumulator_init_forwarded') == int(eligible), (name, out)
            assert out.count('sycl.register_accumulator') == 1, (name, out)
            assert out == transform(source, base + [forwarding, forwarding] + suffix), (name, out)
            if eligible:
                assert 'affine.store' not in out, out
                assert out.count('memref.load') == 2 * (4 if suffix == [4] else 1), out
            rows.append(dict(case=f'{name}_{suffix}', status='PASS', transformed=eligible))

    for half in (False, True):
        for factor in (1, 4):
            source = contraction(half=half)
            order = base + ['matmul_register_tiling', forwarding] + ([factor] if factor != 1 else [])
            out = transform(source, order)
            assert out.count('sycl.accumulator_init_forwarded') == 1, out
            assert out.count('sycl.register_tile =') == int(half), out
            assert out.count('sycl.register_tile_composed_accumulator') == int(half), out
            assert out.count('sycl.ordered_reduction_unroll') == int(factor != 1), out
            assert out.count('memref.load') == (8 if half else 2) * factor, out
            rows.append(dict(case=f'active_tiling_{half}_unroll_{factor}', status='PASS'))
    for pipeline in ([forwarding], ['work_distribution', forwarding], base + [forwarding]):
        out = transform(contraction(), pipeline)
        assert out.count('sycl.accumulator_init_forwarded') == int(pipeline == base + [forwarding]), out
        rows.append(dict(case=f'prerequisites_{pipeline}', status='PASS'))

    # Physical rank3 storage is distinct from launching a rank2 dot on grid=3.
    # Both the fill and consumer must cover every batch slice.
    def batched(source):
        source = source.replace('memref<16x32x', 'memref<2x16x32x')
        source = source.replace('memref<32x32x', 'memref<2x32x32x')
        source = source.replace('affine.for %r = 0 to 16 {',
                                'affine.for %batch = 0 to 2 {\n' +
                                'affine.for %r = 0 to 16 {')
        source = source.replace('} {sycl.parallel}\n      } {sycl.parallel}',
                                '} {sycl.parallel}\n      } {sycl.parallel}\n      } {sycl.parallel}')
        source = source.replace('[%r,%n]', '[%batch,%r,%n]')
        source = source.replace('[%r,%k]', '[%batch,%r,%k]')
        source = source.replace('[%k,%n]', '[%batch,%k,%n]')
        return source

    for half in (False, True):
        for tiled in (False, True):
            source = batched(contraction(half=half))
            pipeline = base + (['matmul_register_tiling'] if tiled else []) + [forwarding]
            out = transform(source, pipeline)
            assert out.count('sycl.accumulator_init_forwarded') == 1, out
            assert out.count('sycl.register_accumulator') == 1, out
            assert out.count('sycl.register_tile =') == int(half and tiled), out
            rows.append(dict(case=f'rank3_{half}_{tiled}', status='PASS'))

    one = '''func.func @row_sum() {
      %zero = arith.constant -0.0 : f32
      %a = memref.alloc() : memref<128x32xf32>
      %c = memref.alloc() : memref<128xf32>
      affine.for %r = 0 to 128 {
        affine.store %zero,%c[%r] : memref<128xf32>
      } {sycl.parallel}
      affine.for %r = 0 to 128 {
        affine.for %k = 0 to 32 {
          %x = affine.load %a[%r,%k] : memref<128x32xf32>
          %v = affine.load %c[%r] : memref<128xf32>
          %s = arith.addf %v,%x : f32
          affine.store %s,%c[%r] : memref<128xf32>
        } {sycl.reduction}
      } {sycl.parallel}
      return
    }'''
    out = transform(one, base + [forwarding])
    assert out.count('sycl.accumulator_init_forwarded') == 1, out
    assert out.count('memref.load') == 1, out
    rows.append(dict(case='rank1_row_reduction', status='PASS'))

    for count in (1, 32, 64, 127, 128, 256):
        source = one.replace('128', str(count))
        out = transform(source, base + [forwarding])
        assert out.count('sycl.accumulator_init_forwarded') == int(count >= 128), out
        rows.append(dict(case=f'work_gate_{count}', status='PASS', transformed=count >= 128))

    # Do not retain an SSA constant whose defining op is erased with the fill.
    local_constant = contraction().replace('%initial = arith.constant 0.0 : f32', '')
    local_constant = local_constant.replace('affine.store %initial,%c',
                    '%initial = arith.constant 0.0 : f32\n          affine.store %initial,%c', 1)
    out = transform(local_constant, base + [forwarding])
    assert 'sycl.accumulator_init_forwarded' not in out, out
    rows.append(dict(case='fill_local_constant_must_not_escape', status='PASS'))

    # Test order after unrolling as well as the canonical earlier position.
    for half in (False, True):
        pipeline = base + ['matmul_register_tiling', 4, forwarding]
        out = transform(contraction(half=half), pipeline)
        assert out.count('sycl.accumulator_init_forwarded') == 1, out
        assert out.count('sycl.ordered_reduction_unroll') == 1, out
        rows.append(dict(case=f'after_unroll_{half}', status='PASS'))
    assert not SYCLOptions().accumulator_init_forwarding
    assert SYCLOptions(accumulator_init_forwarding=True).hash() != SYCLOptions().hash()
    rows.append(dict(case='cache_key_and_default', status='PASS'))
    pathlib.Path(args.output).write_text(json.dumps(rows, indent=2) + '\n')
    print(json.dumps(dict(status='PASS', count=len(rows))))


if __name__ == '__main__':
    main()
