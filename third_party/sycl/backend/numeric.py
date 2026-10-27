"""Portable conversion for Triton's legacy byte-encoded fp8e4b15."""
from triton.language import core, semantic
from triton.language.math import abs as abs_value


@core.builtin
def convert_custom_float8(arg, dst_ty, fp_downcast_rounding=None, _builder=None):
    b = _builder
    def binary(fn, lhs, rhs):
        return fn(lhs, semantic.to_tensor(rhs, b), b)
    def cast(value, dtype):
        return semantic.cast(value, dtype, b)
    if arg.dtype.is_fp8e4b15():
        bits = cast(semantic.bitcast(arg, core.uint8, b), core.uint16)
        magnitude = binary(semantic.shl, binary(semantic.and_, bits, 0x7f), 7)
        sign = binary(semantic.shl, binary(semantic.and_, bits, 0x80), 8)
        half_bits = binary(semantic.or_, magnitude, sign)
        value = semantic.bitcast(cast(half_bits, core.uint16), core.float16, b)
        return semantic.cast(value, dst_ty, b)
    value = cast(arg, core.float32)
    magnitude = abs_value(value, _builder=b)
    magnitude = semantic.minimum(magnitude, semantic.to_tensor(1.75, b), core.PropagateNan.NONE, b)
    half = semantic.cast(magnitude, core.float16, b, 'rtz')
    bits = cast(semantic.bitcast(half, core.uint16, b), core.uint32)
    doubled = semantic.mul(bits, semantic.to_tensor(2, b), False, b)
    rounded = binary(semantic.lshr, semantic.add(doubled, semantic.to_tensor(0x80, b), False, b), 8)
    sign = binary(semantic.and_, binary(semantic.lshr, semantic.bitcast(value, core.uint32, b), 24), 0x80)
    result = cast(binary(semantic.or_, rounded, sign), core.uint8)
    return semantic.bitcast(result, dst_ty, b)
