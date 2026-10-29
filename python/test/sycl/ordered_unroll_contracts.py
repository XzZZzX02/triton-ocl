"""IR legality, update-order, option, and composition contracts for unrolling."""
import argparse
import json
import pathlib
import re
import tempfile


def recurrence(upper=32, lower=0, step=1, carries=1, tags=True,
               dynamic=False, store=False, external=False, nested=False,
               extra=0):
    constants = f"%lo = arith.constant {lower} : index\n%hi = arith.constant {upper} : index\n%step = arith.constant {step} : index"
    args = ', '.join(f'%a{i} = %zero' for i in range(carries))
    types = ', '.join(['f32'] * carries)
    updates = '\n'.join(f'%v{i} = arith.addf %a{i}, %x : f32' for i in range(carries))
    yields = ', '.join(f'%v{i}' for i in range(carries))
    copies = '\n'.join(f'%unused{i} = arith.addf %zero, %zero : f32' for i in range(extra))
    access = '%external' if external else '%input'
    body = f'%x = memref.load {access}[%i] : memref<128xf32>\n{updates}\n{copies}'
    if store:
        body += '\nmemref.store %x, %input[%i] : memref<128xf32>'
    if nested:
        body += '\nscf.if %flag { }'
    annotation = '{sycl.thread_private, sycl.register_accumulator}' if tags else ''
    return f'''func.func @recurrence(%dynamic: index, %flag: i1, %external: memref<128xf32>) {{
      %input = memref.alloc() : memref<128xf32>
      %zero = arith.constant 0.0 : f32
      {constants}
      %r:{carries} = scf.for %i = %lo to {'%dynamic' if dynamic else '%hi'} step %step iter_args({args}) -> ({types}) {{
        {body}
        scf.yield {yields} : {types}
      }} {annotation}
      return
    }}'''


def main():
    from triton._C.libtriton import ir, sycl
    from triton.backends.sycl.compiler import SYCLOptions
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--output', required=True)
    args = p.parse_args()
    context = ir.context()
    ir.load_dialects(context)
    sycl.load_dialects(context)
    rows = []

    def transform(source, factors):
        with tempfile.NamedTemporaryFile(mode='w', suffix='.mlir') as f:
            f.write('module {\n' + source + '\n}')
            f.flush()
            module = ir.parse_mlir_module(f.name, context)
        pm = ir.pass_manager(context)
        for factor in factors:
            if isinstance(factor, str):
                getattr(sycl.passes.memir, factor)(pm)
            else:
                sycl.passes.memir.ordered_reduction_unroll(pm, factor)
        pm.run(module)
        return str(module).replace(f.name, "contract.mlir")

    cases = [('scalar', {}, True), ('tuple', dict(carries=4), True),
             ('offset', dict(lower=4, upper=36), True),
             ('not_divisible', dict(upper=31), False),
             ('one_chunk', dict(upper=2), False),
             ('zero_trip', dict(upper=0), False),
             ('negative_lower', dict(lower=-4, upper=28), False),
             ('dynamic', dict(dynamic=True), False),
             ('step', dict(step=2), False),
             ('store', dict(store=True), False),
             ('external', dict(external=True), False),
             ('nested', dict(nested=True), False),
             ('untagged', dict(tags=False), False),
             ('too_many_carries', dict(carries=9), False),
             ('code_budget', dict(extra=128), False)]
    for name, kw, eligible in cases:
        for factor in (2, 4, 8):
            source = recurrence(**kw)
            result = transform(source, [factor])
            expected = eligible and (kw.get('upper', 32) - kw.get('lower', 0)) // factor >= 2
            assert result.count('sycl.ordered_reduction_unroll =') == int(expected), (name, factor, result)
            carries = kw.get('carries', 1)
            assert result.count('arith.addf') == (carries + kw.get('extra', 0)) * (factor if expected else 1), result
            if expected:
                assert f'sycl.ordered_reduction_unroll = {factor}' in result, result
                # Each yield stays serially dependent: no additional loop carries.
                assert result.count('scf.for') == 1 and result.count('scf.yield') == 1, result
                assert result.count('memref.load') == factor, result
                assert 'fastmath' not in result, result
                initial = re.search(r'iter_args\((.*?)\) ->', result).group(1)
                carry = [part.split('=')[0].strip() for part in initial.split(',')]
                updates = re.findall(r'(%[\w]+) = arith.addf (%[\w]+), (%[\w]+) : f32', result)
                assert len(carry) == carries and len(updates) == carries * factor, result
                for offset in range(0, len(updates), carries):
                    next_carry = []
                    for index, (value, left, right) in enumerate(updates[offset:offset + carries]):
                        assert left == carry[index], (name, factor, left, carry, result)
                        next_carry.append(value)
                    carry = next_carry
                returned = re.search(r'scf.yield (.*?) :', result).group(1)
                assert [value.strip() for value in returned.split(',')] == carry, result
            again = transform(source, [factor, factor])
            assert result == again, (name, factor, result, again)
            rows.append(dict(case=f'{name}_{factor}', status='PASS', transformed=expected))
    source = recurrence()
    assert transform(source, [1]) == transform(source, []), 'factor one must be a no-op'
    def contraction(k=32):
        source = """func.func @dot() {
      %a = memref.alloc() : memref<32x32xf16>
      %b = memref.alloc() : memref<32x32xf16>
      %c = memref.alloc() : memref<32x32xf32>
      affine.for %r = 0 to 32 {
        affine.for %n = 0 to 32 {
          affine.for %k = 0 to 32 {
            %xh = affine.load %a[%r,%k] : memref<32x32xf16>
            %yh = affine.load %b[%k,%n] : memref<32x32xf16>
            %x = arith.extf %xh : f16 to f32
            %y = arith.extf %yh : f16 to f32
            %z = affine.load %c[%r,%n] : memref<32x32xf32>
            %p = arith.mulf %x,%y : f32
            %q = arith.addf %z,%p : f32
            affine.store %q,%c[%r,%n] : memref<32x32xf32>
          } {sycl.reduction}
        } {sycl.parallel}
      } {sycl.parallel}
      return
    }"""
        return source.replace('affine.for %k = 0 to 32 {',
                              f'affine.for %k = 0 to {k} {{')
    prefix = ['work_distribution', 'register_accumulator', 'matmul_register_tiling']
    for factor in (2, 4, 8):
        for middle in ([], ['group_reduction'], ['local_memory_reuse']):
            result = transform(contraction(), prefix + middle + [factor])
            assert result.count('sycl.register_tile =') == 1, result
            assert result.count('sycl.register_tile_composed_accumulator') == 1, result
            assert result.count('sycl.ordered_reduction_unroll =') == 1, result
            assert result.count('arith.addf') == 4 * factor, result
            assert result.count('memref.store') == 4, result
            after = transform(contraction(), prefix + [factor] + middle)
            assert result == after, (middle, result, after)
            assert result == transform(contraction(), prefix + middle + [factor, factor]), result
            rows.append(dict(case=f'tiling_composition_{factor}_{middle}', status='PASS'))
        short = transform(contraction(16), prefix + [factor])
        assert short.count('sycl.register_tile =') == 1, short
        assert short.count('sycl.ordered_reduction_unroll =') == 0, short
        assert short.count('arith.addf') == 4, short
        rows.append(dict(case=f'short_tiled_reduction_{factor}', status='PASS',
                         transformed=False))
        untiled = transform(contraction(16), prefix[:-1] + [factor])
        assert untiled.count('sycl.register_tile =') == 0, untiled
        assert untiled.count('sycl.ordered_reduction_unroll =') == 1, untiled
        rows.append(dict(case=f'short_untiled_reduction_{factor}', status='PASS',
                         transformed=True))
    for factor in (0, 3, 16):
        try:
            transform(source, [factor])
        except RuntimeError:
            rows.append(dict(case=f'pass_reject_{factor}', status='PASS'))
        else:
            raise AssertionError(('invalid pass factor accepted', factor))
    for value in (0, 3, 16, -1, True, 2.0, '4'):
        try:
            SYCLOptions(reduction_unroll=value)
        except ValueError:
            rows.append(dict(case=f'option_reject_{value!r}', status='PASS'))
        else:
            raise AssertionError(('invalid option accepted', value))
    hashes = {SYCLOptions(reduction_unroll=v).hash() for v in (1, 2, 4, 8)}
    assert len(hashes) == 4, 'schedule parameter missing from cache key'
    rows.append(dict(case='cache_keys_and_noop', status='PASS'))
    pathlib.Path(args.output).write_text(json.dumps(rows, indent=2) + '\n')
    print(json.dumps(dict(status='PASS', count=len(rows))))


if __name__ == '__main__':
    main()
