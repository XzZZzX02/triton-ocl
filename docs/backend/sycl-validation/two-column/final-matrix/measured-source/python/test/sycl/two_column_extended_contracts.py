"""Exhaust the IR opportunity boundary and supported tiling compositions.

Non-power-of-two domains here are IR proofs, not Triton frontend/device tests.
"""
import argparse
import itertools
import json
import pathlib
import tempfile

from two_column_contracts import source


def main():
    from triton._C.libtriton import ir, sycl
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--output', type=pathlib.Path, required=True)
    args = parser.parse_args()
    context = ir.context()
    ir.load_dialects(context)
    sycl.load_dialects(context)
    rows = []

    def run(text, order):
        with tempfile.NamedTemporaryFile(mode='w', suffix='.mlir') as f:
            f.write(text)
            f.flush()
            mod = ir.parse_mlir_module(f.name, context)
        pm = ir.pass_manager(context)
        for item in order:
            if isinstance(item, bool):
                sycl.passes.memir.matmul_register_tiling(pm, item)
            elif item == 'unroll':
                sycl.passes.memir.ordered_reduction_unroll(pm, 4)
            else:
                getattr(sycl.passes.memir, item)(pm)
        pm.run(mod)
        return str(mod).replace(f.name, 'two-column-extended.mlir')

    shapes = [(8,16), (9,16), (12,16), (15,16), (8,20), (8,28),
              (8,30), (16,16), (4,32), (16,8), (8,8)]
    for (m,n), k, promote, init in itertools.product(shapes, (16,24,31,32,64), (False,True), (False,True)):
        prefix = ['work_distribution'] + (['register_accumulator'] if promote else [])
        tail = (['accumulator_init_forwarding'] if init else []) + ['unroll', 'local_memory_reuse']
        results = {}
        for enabled in (False, True):
            eligible = m >= 8 and n >= 16 and k >= 16 and n % 4 == 0
            tile = (4 if m*(n//4) >= 64 else 2 if enabled and m*(n//2) >= 64 else 0) if eligible else 0
            order = prefix + [enabled] + tail
            result = run(source(m,n,k), order)
            assert result.count('sycl.register_tile =') == int(tile > 0), (m,n,k,result)
            if tile:
                assert f'sycl.register_tile = {tile} : i64' in result, (m,n,k,result)
            private = promote or tile > 0
            assert result.count('sycl.register_accumulator') == int(private), result
            assert result.count('sycl.accumulator_init_forwarded') == int(init and private and m*n >= 128), result
            unrolled = private and k % 4 == 0 and k//4 >= 2 and (tile == 0 or k >= 32)
            assert result.count('sycl.ordered_reduction_unroll') == int(unrolled), result
            assert result == run(source(m,n,k), order + [enabled, enabled]), 'repeated tiling changed an existing decision'
            if tile:
                assert result == run(source(m,n,k), order + [True, False]), 'an existing tile was lost'
            results[enabled] = result
            rows.append(dict(shape=[m,n,k], promoted=promote, init=init, enabled=enabled,
                             tile=tile, unrolled=unrolled, status='PASS'))
        if not eligible or m*(n//4) >= 64 or m*(n//2) < 64:
            assert results[False] == results[True], (m,n,k,'fallback changed IR')

    # These passes may precede or follow tiling without losing its schedule.
    # Initializer forwarding and unroll use their documented pipeline position.
    for before in itertools.permutations(('register_accumulator','group_reduction','local_memory_reuse')):
        for split in range(4):
            order = ['work_distribution', *before[:split], True, *before[split:],
                     'accumulator_init_forwarding', 'unroll']
            result = run(source(), order)
            for marker in ('sycl.register_tile = 2 : i64', 'sycl.accumulator_init_forwarded',
                           'sycl.ordered_reduction_unroll'):
                assert result.count(marker) == 1, (order, result)
            rows.append(dict(case='order', order=order, status='PASS'))

    text = source()
    negatives = {
        'column_lower': text.replace('affine.for %n = 0 to 16', 'affine.for %n = 1 to 16'),
        'column_step': text.replace('affine.for %n = 0 to 16 {', 'affine.for %n = 0 to 16 step 2 {'),
        'row_lower': text.replace('affine.for %r = 0 to 8', 'affine.for %r = 1 to 8'),
        'reduction_lower': text.replace('affine.for %k = 0 to 32', 'affine.for %k = 1 to 32'),
        'reduction_step': text.replace('affine.for %k = 0 to 32 {', 'affine.for %k = 0 to 32 step 2 {'),
        'dynamic_column': text.replace('func.func @matmul()', 'func.func @matmul(%limit: index)').replace(
            'affine.for %n = 0 to 16', 'affine.for %n = 0 to %limit'),
        'missing_parallel': text.replace('{sycl.parallel}', '{}'),
    }
    for name, text in negatives.items():
        for promote in (False, True):
            order = ['work_distribution'] + (['register_accumulator'] if promote else []) + [True]
            result = run(text, order)
            assert 'sycl.register_tile =' not in result, (name, promote, result)
            rows.append(dict(case=name, promoted=promote, status='PASS'))
    for promote in (False, True):
        order = (['register_accumulator'] if promote else []) + [True]
        assert 'sycl.register_tile =' not in run(source(), order)
        rows.append(dict(case='undistributed', promoted=promote, status='PASS'))
    args.output.write_text(json.dumps(rows, indent=2) + chr(10))
    print(json.dumps(dict(status='PASS', count=len(rows))))


if __name__ == '__main__':
    main()
