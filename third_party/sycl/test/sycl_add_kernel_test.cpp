//===------------------------------------------------------------*- C++ -*-===//
//
// SYCL Vector Addition Test with local_accessor
// Host-side code that includes and calls the generated kernel
//
//===----------------------------------------------------------------------===//

#include <cmath>
#include <iostream>
#include <vector>

// Include the generated SYCL kernel
// Function signature:
// inline void add_kernel(
//   sycl::nd_item<3> item,
//   float* var_0, float* var_1, float* var_2, int var_3,
//   sycl::local_accessor<float, 1> var_4,
//   sycl::local_accessor<float, 1> var_5
// )
#include "add_kernel.sycl"

//===----------------------------------------------------------------------===//
// Host-side test code
//===----------------------------------------------------------------------===//

int main() {
  // Problem size
  constexpr int N = 98432; // Same as Triton tutorial
  constexpr int BLOCK_SIZE = 1024;

  // Calculate grid dimensions
  int num_blocks = (N + BLOCK_SIZE - 1) / BLOCK_SIZE;

  std::cout << "Vector Addition Test with local_accessor (N=" << N << ")"
            << std::endl;
  std::cout << "Blocks: " << num_blocks << ", Block Size: " << BLOCK_SIZE
            << std::endl;

  try {
    // Create SYCL queue
    sycl::queue q{sycl::default_selector_v};
    std::cout << "Running on: "
              << q.get_device().get_info<sycl::info::device::name>()
              << std::endl;

    // Allocate host memory
    std::vector<float> h_x(N), h_y(N), h_output(N), h_expected(N);

    // Initialize input data
    for (int i = 0; i < N; i++) {
      h_x[i] = static_cast<float>(i) / N;
      h_y[i] = static_cast<float>(N - i) / N;
      h_expected[i] = h_x[i] + h_y[i]; // Expected result
    }

    // Allocate device memory using USM
    float *d_x = sycl::malloc_device<float>(N, q);
    float *d_y = sycl::malloc_device<float>(N, q);
    float *d_output = sycl::malloc_device<float>(N, q);

    // Copy input to device
    q.memcpy(d_x, h_x.data(), N * sizeof(float)).wait();
    q.memcpy(d_y, h_y.data(), N * sizeof(float)).wait();

    // Launch kernel using generated wrapper
    launch_add_kernel(&q, num_blocks, 1, 1, BLOCK_SIZE, 1, 1, d_x, d_y,
                      d_output, N);
    q.wait();

    // Copy result back
    q.memcpy(h_output.data(), d_output, N * sizeof(float)).wait();

    // Verify result
    float max_diff = 0.0f;
    int errors = 0;
    for (int i = 0; i < N; i++) {
      float diff = std::abs(h_output[i] - h_expected[i]);
      max_diff = std::max(max_diff, diff);
      if (diff > 1e-5f) {
        if (errors < 5) {
          std::cout << "Mismatch at " << i << ": got " << h_output[i]
                    << ", expected " << h_expected[i] << std::endl;
        }
        errors++;
      }
    }

    std::cout << "Max difference: " << max_diff << std::endl;
    std::cout << "Errors: " << errors << " / " << N << std::endl;

    if (errors == 0) {
      std::cout << "✓ Test PASSED!" << std::endl;
    } else {
      std::cout << "✗ Test FAILED!" << std::endl;
    }

    // Free device memory
    sycl::free(d_x, q);
    sycl::free(d_y, q);
    sycl::free(d_output, q);

    return errors == 0 ? 0 : 1;

  } catch (sycl::exception &e) {
    std::cerr << "SYCL exception: " << e.what() << std::endl;
    return 1;
  }
}
