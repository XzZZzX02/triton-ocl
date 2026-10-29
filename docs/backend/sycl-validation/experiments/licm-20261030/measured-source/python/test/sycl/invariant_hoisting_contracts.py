"""Legality, profitability, and cache-key contracts for integer LICM."""
import argparse
import json
import pathlib
import tempfile


def program(trip="8", body="""%sum = arith.addi %x, %y : index
        %product = arith.muli %sum, %z : index
        %variant = arith.addi %product, %i : index
        memref.store %zero, %out[%variant] : memref<128xi32>"""):
    return f"""func.func @compute(%x: index, %y: index, %z: index,
                       %bound: index, %out: memref<128xi32>) {{
      %zero = arith.constant 0 : i32
      affine.for %i = 0 to {trip} {{
        {body}
      }}
      return
    }}"""


def transform(source, context, sycl, ir, passes=1, pipeline=None):
    with tempfile.NamedTemporaryFile(mode="w", suffix=".mlir") as file:
        file.write("module {\n" + source + "\n}")
        file.flush()
        module = ir.parse_mlir_module(file.name, context)
    manager = ir.pass_manager(context)
    for name in pipeline or ['loop_invariant_compute_hoisting'] * passes:
        if isinstance(name, int):
            sycl.passes.memir.ordered_reduction_unroll(manager, name)
        else:
            getattr(sycl.passes.memir, name)(manager)
    manager.run(module)
    return str(module).replace(file.name, "contract.mlir")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", required=True)
    args = parser.parse_args()
    from triton._C.libtriton import ir, sycl
    from triton.backends.sycl.compiler import SYCLOptions

    context = ir.context()
    ir.load_dialects(context)
    sycl.load_dialects(context)
    rows = []

    positive = transform(program(), context, sycl, ir)
    assert positive.count("sycl.loop_invariant_hoisted") == 2, positive
    assert positive.index("sycl.loop_invariant_hoisted") < positive.index("affine.for"), positive
    loop = positive.index("affine.for")
    assert positive[:loop].count("arith.addi") == 1, positive
    assert positive[:loop].count("arith.muli") == 1, positive
    assert positive[loop:].count("arith.addi") == 1, positive
    assert transform(program(), context, sycl, ir, passes=2) == positive
    rows.append(dict(case="static_integer_chain_and_idempotence", status="PASS"))

    affine_apply = program(body="""%scaled = affine.apply affine_map<(d0) -> (d0 * 3)>(%x)
        memref.store %zero, %out[%scaled] : memref<128xi32>""")
    result = transform(affine_apply, context, sycl, ir)
    assert result.count("sycl.loop_invariant_hoisted") == 1, result
    rows.append(dict(case="affine_apply", status="PASS"))

    for name, trip in (("one_trip", "1"), ("zero_trip", "0"),
                       ("dynamic_bound", "%bound")):
        result = transform(program(trip=trip), context, sycl, ir)
        assert "sycl.loop_invariant_hoisted" not in result, (name, result)
        rows.append(dict(case=name, status="PASS", transformed=False))

    division = """func.func @division(%x: i32, %y: i32, %out: memref<128xi32>) {
      %zero = arith.constant 0 : i32
      affine.for %i = 0 to 8 {
        %quotient = arith.divsi %x, %y : i32
        memref.store %quotient, %out[%i] : memref<128xi32>
      }
      return
    }"""
    result = transform(division, context, sycl, ir)
    assert "sycl.loop_invariant_hoisted" not in result, result
    rows.append(dict(case="potentially_undefined_division", status="PASS",
                     transformed=False))

    floating = """func.func @float(%a: f32, %b: f32, %out: memref<8xf32>) {
      %zero = arith.constant 0.0 : f32
      affine.for %i = 0 to 8 {
        %sum = arith.addf %a, %b : f32
        memref.store %sum, %out[%i] : memref<8xf32>
      }
      return
    }"""
    result = transform(floating, context, sycl, ir)
    assert "sycl.loop_invariant_hoisted" not in result, result
    rows.append(dict(case="floating_point_unchanged", status="PASS",
                     transformed=False))

    serial = """func.func @serial(%x: i32, %y: i32, %bound: i32,
                  %out: memref<128xi32>) {
      %lo = arith.constant 0 : i32
      %hi = arith.constant 8 : i32
      %step = arith.constant 1 : i32
      scf.for %i = %lo to %hi step %step : i32 {
        %v = arith.addi %x, %y : i32
        %idx = arith.index_cast %i : i32 to index
        memref.store %v, %out[%idx] : memref<128xi32>
      }
      return
    }"""
    for name, text, count in (
        ('scf_static', serial, 1),
        ('scf_dynamic', serial.replace('to %hi', 'to %bound'), 0),
        ('scf_one_trip', serial.replace('8 : i32', '1 : i32'), 0),
        ('scf_zero_trip', serial.replace('8 : i32', '0 : i32'), 0),
        ('scf_nsw', serial.replace('arith.addi %x, %y :',
                                  'arith.addi %x, %y overflow<nsw> :'), 0),
        ('scf_unknown_attribute', serial.replace('arith.addi %x, %y :',
                    'arith.addi %x, %y {custom.flag} :'), 0),
    ):
        result = transform(text, context, sycl, ir)
        assert result.count('sycl.loop_invariant_hoisted') == count, (name, result)
        assert result == transform(text, context, sycl, ir, passes=2), (name, result)
        rows.append(dict(case=name, status='PASS', transformed=bool(count)))

    nested = program(body='''affine.for %j = 0 to 4 {
        %v = arith.addi %x, %y : index
        memref.store %zero, %out[%v] : memref<128xi32>
      }''')
    result = transform(nested, context, sycl, ir)
    assert result.count('sycl.loop_invariant_hoisted') == 1, result
    assert result.index('sycl.loop_invariant_hoisted') < result.index('affine.for'), result
    assert result == transform(nested, context, sycl, ir, passes=2), result
    rows.append(dict(case='nested_fixed_point', status='PASS'))

    parallel = program().replace('''      }
      return''', '''      } {sycl.parallel}
      return''')
    result = transform(parallel, context, sycl, ir)
    assert 'sycl.loop_invariant_hoisted' not in result, result
    rows.append(dict(case='preserve_parallel_nest', status='PASS'))

    loads = program(body='''%v = memref.load %out[%x] : memref<128xi32>
        memref.store %v, %out[%i] : memref<128xi32>''')
    result = transform(loads, context, sycl, ir)
    assert 'sycl.loop_invariant_hoisted' not in result, result
    rows.append(dict(case='never_move_memory_access', status='PASS'))

    # Both promotion and hoisting must change this loop. The row-dependent
    # address becomes invariant only with respect to the serial reduction.
    composed = '''func.func @composed(%offset: index) {
      %input = memref.alloc() : memref<64x64xf32>
      %acc = memref.alloc() : memref<64xf32>
      affine.for %r = 0 to 32 {
        affine.for %k = 0 to 32 {
          %row = affine.apply affine_map<(d0)[s0] -> (d0+s0)>(%r)[%offset]
          %a = affine.load %input[%row,%k] : memref<64x64xf32>
          %b = affine.load %acc[%r] : memref<64xf32>
          %v = arith.addf %a, %b : f32
          affine.store %v, %acc[%r] : memref<64xf32>
        } {sycl.reduction}
      } {sycl.parallel}
      return
    }'''
    hoist = 'loop_invariant_compute_hoisting'
    prefix = ['work_distribution', 'register_accumulator']
    for middle in ([], ['local_memory_reuse'], [4]):
        result = transform(composed, context, sycl, ir, pipeline=prefix + middle + [hoist])
        assert result.count('sycl.loop_invariant_hoisted') >= 1, result
        assert result.count('sycl.register_accumulator') == 1, result
        assert result.count('sycl.distribution_depth') == 1, result
        # Unroll rejects affine.apply until hoisting removes it. Explicitly
        # document this order dependency instead of treating toggles as proof.
        assert result.count('sycl.ordered_reduction_unroll') == 0, result
        for order in (prefix + [hoist] + middle, [hoist] + prefix + middle):
            other = transform(composed, context, sycl, ir, pipeline=order)
            assert other.count('sycl.loop_invariant_hoisted') >= 1, other
            assert other.count('sycl.register_accumulator') == 1, other
            assert other.count('sycl.distribution_depth') == 1, other
            assert other.count('sycl.ordered_reduction_unroll') == int(middle == [4]), other
        rows.append(dict(case=f'active_promotion_distribution_{middle}', status='PASS'))

    assert SYCLOptions().loop_invariant_compute_hoisting is False
    assert SYCLOptions(loop_invariant_compute_hoisting=False).hash() != \
        SYCLOptions(loop_invariant_compute_hoisting=True).hash()
    rows.append(dict(case="default_off_and_cache_key", status="PASS"))

    pathlib.Path(args.output).write_text(json.dumps(rows, indent=2) + "\n")
    print(json.dumps(dict(status="PASS", count=len(rows))))


if __name__ == "__main__":
    main()
