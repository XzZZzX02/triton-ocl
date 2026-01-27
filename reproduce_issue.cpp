
#include <algorithm>
#include <cmath>
#include <iostream>
#include <sycl/sycl.hpp>
#include <vector>

inline void matmul_kernel(sycl::nd_item<3> item, float *var_0, float *var_1,
                          float *var_2, int var_3, int var_4, int var_5,
                          int var_6, int var_7, int var_8,
                          sycl::local_accessor<float, 2> var_9,
                          sycl::local_accessor<float, 2> var_10,
                          sycl::local_accessor<float, 2> var_11,
                          sycl::local_accessor<float, 2> var_12,
                          sycl::local_accessor<float, 2> var_13) {
  int var_14 = item.get_local_id(1);
  if (var_14 < 16) {
    int var_15 = item.get_local_id(0);
    if (var_15 < 16) {
      var_10[var_14][var_15] = 0.000000;
    }
  }
  int var_16 = item.get_group(1);
  int var_18 = item.get_group(0);
  int var_20 = var_18 * 16;
  int var_21 = var_16 * 16;
  int var_24 = var_20 * var_6;
  // K Loop
  for (int var_26 = 0; var_26 < var_5; var_26 += 1) {
    int var_28 = var_24 + var_26;
    int var_29 = var_26 * var_7;
    int var_31 = var_29 + var_21;
    // Load A (var_0) -> var_11
    for (int i = 0; i < 16; i += 1) {
      for (int j = item.get_local_id(0); j < 1; j += item.get_local_range(0)) {
        var_11[i][j] = (var_0 + var_28 + i * var_6)[j];
      }
    }
    item.barrier(sycl::access::fence_space::local_space);
    // Load B (var_1) -> var_12
    for (int i = item.get_local_id(0); i < 16; i += item.get_local_range(0)) {
      (&var_12[0][0])[i] = (var_1 + var_31)[i];
    }
    item.barrier(sycl::access::fence_space::local_space);

    // Compute
    int var_32 = item.get_local_id(1);
    // ... Copy var_11 to var_13 (WHY?) - seems like a redundant move or layout
    // change
    if (var_32 < 16) {
      int var_33 = item.get_local_id(0);
      if (var_33 < 16) {
        float var_34 = var_11[var_32][0];
        var_13[var_32][var_33] = var_34;
      }
    }
    int var_35 = item.get_local_id(1);
    if (var_35 < 16) {
      int var_36 = item.get_local_id(0);
      if (var_36 < 16) {
        float var_37 = var_12[0][var_36];
        var_9[var_35][var_36] = var_37;
      }
    }
    int var_38 = item.get_local_id(1);
    if (var_38 < 16) {
      int var_39 = item.get_local_id(0);
      if (var_39 < 16) {
        float var_40 = var_13[var_38][var_39];
        float var_41 = var_9[var_38][var_39];
        float var_42 = var_40 * var_41;
        var_13[var_38][var_39] = var_42;
      }
    }
    int var_43 = item.get_local_id(1);
    if (var_43 < 16) {
      int var_44 = item.get_local_id(0);
      if (var_44 < 16) {
        float var_45 = var_10[var_43][var_44];
        float var_46 = var_13[var_43][var_44];
        float var_47 = var_45 + var_46;
        var_10[var_43][var_44] = var_47;
      }
    }
  }

  // MISSING BARRIER HERE?
  // item.barrier(sycl::access::fence_space::local_space);

  int var_49 = var_20 * var_8;
  int var_50 = var_49 + var_21;
  int var_51 = var_20 + 16;
  int var_53 = std::min(var_51, var_3);
  int var_54 = std::max(var_53, var_20);
  int var_55 = var_54 - var_20;
  int var_56 = var_21 + 16;
  int var_58 = std::min(var_56, var_4);
  int var_59 = std::max(var_58, var_21);
  int var_60 = var_59 - var_21;
  int var_61 = std::min(var_55, 16);
  int var_62 = std::min(var_60, 16);

  // Store Loop
  // With the SIMT fix, the outer loop `i` runs on the thread, but it might
  // still loop if not parallelized. Actually, wait, if `i` is the loop var, and
  // we want parallel store. The parallel transformation should have mapped `i`
  // to `get_local_id`? No, the Original code had nested loops.
  //   for i in 0..16:
  //     for j in 0..16:
  //       store
  // The Inner loop `j` is mapped to `get_local_id(0)`.
  // The Outer loop `i` is SERIAL in the generated code above!
  // `for (int i = 0; i < var_61; i += 1)` << SERIAL
  // So every thread iterates i=0..16.
  // Thread (y,x) at iteration i=0 reads var_10[0][x].
  // If y != 0, it reads thread (0,x)'s data.
  // WITHOUT BARRIER, thread (0,x) might not be done computing.

  for (int i = 0; i < var_61; i += 1) {
    for (int j = item.get_local_id(0); j < var_62;
         j += item.get_local_range(0)) {
      (var_2 + var_50 + i * var_8)[j] = var_10[i][j];
    }
  }
  // item.barrier(sycl::access::fence_space::local_space); // At end
}

int main() {
  constexpr int M = 128, N = 512, K = 256; // Non-Square
  std::vector<float> A(M * K, 1.0f);
  std::vector<float> B(K * N, 0.0f);
  for (int k = 0; k < K; ++k) {
    for (int j = 0; j < N; ++j) {
      B[k * N + j] = (float)j;
    }
  }
  std::vector<float> C(M * N, 0.0f);

  sycl::queue q;
  {
    sycl::buffer<float, 1> bufA(A.data(), A.size());
    sycl::buffer<float, 1> bufB(B.data(), B.size());
    sycl::buffer<float, 1> bufC(C.data(), C.size());

    q.submit([&](sycl::handler &h) {
      auto accA = bufA.get_access<sycl::access::mode::read>(h);
      auto accB = bufB.get_access<sycl::access::mode::read>(h);
      auto accC = bufC.get_access<sycl::access::mode::write>(h);

      // M=128 -> GridX = 8
      // N=512 -> GridY = 32
      // Runtime passes (Rows, Cols) to (GridX, GridY)
      // So Grid0=8, Grid1=32
      // Test Hypothesis: Grid is (Cols, Rows) = (32, 8)
      size_t gridX = 32, gridY = 8, gridZ = 1;
      size_t blockX = 16, blockY = 16, blockZ = 1;

      sycl::local_accessor<float, 2> var_9(sycl::range<2>(16, 16), h);
      sycl::local_accessor<float, 2> var_10(sycl::range<2>(16, 16), h);
      sycl::local_accessor<float, 2> var_11(sycl::range<2>(16, 1), h);
      sycl::local_accessor<float, 2> var_12(sycl::range<2>(1, 16), h);
      sycl::local_accessor<float, 2> var_13(sycl::range<2>(16, 16), h);

      h.parallel_for(
          sycl::nd_range<3>(
              sycl::range<3>(gridX * blockX, gridY * blockY, gridZ * blockZ),
              sycl::range<3>(blockX, blockY, blockZ)),
          [=](sycl::nd_item<3> item) {
            float *ptrA = accA.get_pointer();
            float *ptrB = accB.get_pointer();
            float *ptrC = accC.get_pointer();

            // MANUAL MAPPING from OLD CODE (Group0=X, Group1=Y)
            // But we passed range(GridX, GridY) => Group0=8, Group1=32
            // Expected: Group0=Cols(32), Group1=Rows(8) ?? No
            // TTIR Logic: pid0=Cols.
            // If we use Group0 for pid0.
            // Group0 is 8. Cols need 32.
            // So we treat Range 0..8 as Cols.
            // Group1 is 32. Rows need 8.
            // We treat Range 0..32 as Rows.

            matmul_kernel(item, ptrA, ptrB, ptrC, M, N, K, K, N, N, var_9,
                          var_10, var_11, var_12, var_13);
          });
    });
  }

  // Verify
  bool correct = true;
  for (int i = 0; i < M; ++i) {
    for (int j = 0; j < N; ++j) {
      float expected = (float)K * j;
      float actual = C[i * N + j];
      if (std::abs(actual - expected) > 1e-2) {
        std::cout << "Mismatch at [" << i << ", " << j << "]: " << actual
                  << " != " << expected << std::endl;
        correct = false;
        goto done;
      }
    }
  }
done:
  if (correct)
    std::cout << "SUCCESS" << std::endl;
  else
    std::cout << "FAILURE" << std::endl;

  return 0;
}
