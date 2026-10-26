import ctypes

try:
    from triton.backends.sycl.sycl_utils import generate_standalone_wrapper
    from triton.backends.sycl.sycl_utils import resolve_block_size
except ModuleNotFoundError:
    # The source tree keeps the backend under third_party/sycl until setup.py
    # installs it into triton.backends.
    from backend.sycl_utils import generate_standalone_wrapper
    from backend.sycl_utils import resolve_block_size


class _Tensor:
    def __init__(self, array):
        self.c_array = array

    def data_ptr(self):
        return ctypes.addressof(self.c_array)


_SOURCE = r'''
#include <sycl/sycl.hpp>
extern "C" void launch_abi_kernel(
    sycl::queue* q, size_t gridX, size_t gridY, size_t gridZ,
    size_t blockX, size_t blockY, size_t blockZ,
    float* input, int64_t count, uint32_t flags) {
  q->submit([&](sycl::handler&) {});
}
'''


def test_block_size_uses_kernel_guard_as_default_safety_floor():
    source = "int lid = item.get_local_id(0); if (lid < 1024) {}"
    assert resolve_block_size(source_code=source).as_tuple == (1024, 1, 1)


def test_block_size_rejects_a_known_incompatible_override():
    source = "int lid = item.get_local_id(0); if (lid < 1024) {}"
    try:
        resolve_block_size(block_size=128, source_code=source)
    except ValueError as error:
        assert "required local-id floor" in str(error)
    else:
        raise AssertionError("an unsafe local range was accepted")


def test_wrapper_preserves_pointer_and_scalar_abi_widths():
    data = _Tensor((ctypes.c_float * 4)(1.0, 2.0, 3.0, 4.0))
    wrapper = generate_standalone_wrapper(
        "abi_kernel",
        _SOURCE,
        [data, 2**40, 7],
        signature={"input": "*fp32", "count": "i64", "flags": "u32"},
        block_size=128,
    )
    assert "malloc_shared<float>" in wrapper
    assert "int64_t arg_1" in wrapper
    assert "uint32_t arg_2" in wrapper
    assert "float* arg_0" in wrapper
