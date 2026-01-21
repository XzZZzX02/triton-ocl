import ctypes
import math
from triton.backends.sycl.sycl_utils import launch as sycl_launch
from triton.backends.sycl.sycl_utils import run_standalone

class SYCLLauncher:
    def __init__(self, src, metadata):
        pass
    def __call__(self, gridX, gridY, gridZ, kernel, bound_args):
        # Use standalone runner explicitly
        run_standalone(gridX, gridY, gridZ, kernel.name, kernel.kernel, bound_args)

# Mock Kernel Metadata Object
class MockKernel:
    def __init__(self, name, source):
        self.name = name
        self.kernel = source
        
# ... [MockKernel and sycl_src are same] ...
# SYCL Source Code (from add_kernel.sycl)
sycl_src = """
#include <sycl/sycl.hpp>
#include <algorithm>

inline void add_kernel(
  sycl::nd_item<3> item,
  float* var_0,
  float* var_1,
  float* var_2,
  int var_3,
  sycl::local_accessor<float, 1> var_4,
  sycl::local_accessor<float, 1> var_5
) {
  int var_6 = item.get_group(0);
  int var_8 = var_6 * 1024;
  int var_10 = var_8 + 1024;
  int var_12 = std::min(var_10, var_3);
  int var_13 = std::max(var_12, var_8);
  int var_14 = var_13 - var_8;
  for (int i = item.get_local_id(0); i < var_14; i += item.get_local_range(0)) {
    var_4[i] = (var_0 + var_8)[i];
  }
  item.barrier(sycl::access::fence_space::local_space);
  for (int i = item.get_local_id(0); i < var_14; i += item.get_local_range(0)) {
    var_5[i] = (var_1 + var_8)[i];
  }
  item.barrier(sycl::access::fence_space::local_space);
  int var_15 = item.get_local_id(0);
  if (var_15 < 1024) {
    float var_16 = var_4[var_15];
    float var_17 = var_5[var_15];
    float var_18 = var_16 + var_17;
    var_4[var_15] = var_18;
  }
  for (int i = item.get_local_id(0); i < var_14; i += item.get_local_range(0)) {
    (var_2 + var_8)[i] = var_4[i];
  }
  item.barrier(sycl::access::fence_space::local_space);
}

extern "C" void launch_add_kernel(sycl::queue* q, size_t gridX, size_t gridY, size_t gridZ, size_t blockX, size_t blockY, size_t blockZ, float* var_0, float* var_1, float* var_2, int var_3) {
  q->submit([&](sycl::handler &h) {
    sycl::local_accessor<float, 1> var_4(sycl::range<1>(1024), h);
    sycl::local_accessor<float, 1> var_5(sycl::range<1>(1024), h);
    h.parallel_for(sycl::nd_range<3>(sycl::range<3>(gridX, gridY, gridZ) * sycl::range<3>(blockX, blockY, blockZ), sycl::range<3>(blockX, blockY, blockZ)), [=](sycl::nd_item<3> item) {
      add_kernel(item, var_0, var_1, var_2, var_3, var_4, var_5);
    });
  });
}
"""

def test_sycl_jit():
    print("Testing Standalone Execution...")
    
    # 1. Setup Mock Kernel
    kernel = MockKernel("add_kernel", sycl_src)
    
    # 2. Setup Data (Host) using ctypes
    N = 98432
    FloatArray = ctypes.c_float * N
    x = FloatArray(*[float(i) for i in range(N)])
    y = FloatArray(*[float(N - i) for i in range(N)])
    output = FloatArray()
    
    # Wrapper class to mimic PyTorch tensor interface expected by our launcher logic
    class TensorWrapper:
        def __init__(self, c_array):
            self.c_array = c_array
        
        def data_ptr(self):
            return ctypes.addressof(self.c_array)

    x_tensor = TensorWrapper(x)
    y_tensor = TensorWrapper(y)
    out_tensor = TensorWrapper(output)
    
    # 3. Launch Config
    BLOCK_SIZE = 1024
    gridX = (N + BLOCK_SIZE - 1) // BLOCK_SIZE
    
    print(f"Launching kernel with Grid=({gridX},1,1) Block=({BLOCK_SIZE},1,1)")
    
    # 4. Invoke Launcher
    launcher = SYCLLauncher(None, None)
    
    # Args order: x, y, out, N
    launcher(gridX, 1, 1, kernel, [x_tensor, y_tensor, out_tensor, N])
    
    # 5. Verify Results
    print("Kernel execution finished.")
    
    # run_standalone writes back to the ctypes buffer in place via deserialization logic
    
    max_diff = 0.0
    for i in range(N):
        expected = x[i] + y[i]
        diff = abs(output[i] - expected)
        if diff > max_diff:
            max_diff = diff
            
    print(f"Max Difference: {max_diff}")
    
    if max_diff < 1e-5:
        print("PASS")
    else:
        print("FAIL: Max diff too high")

if __name__ == "__main__":
    test_sycl_jit()
