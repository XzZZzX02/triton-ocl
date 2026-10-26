"""Small remote benchmark for the SYCL runtime ABI and local-range knob."""

import ctypes
import json
import os
import statistics

import triton
import triton.language as tl
from triton.backends.sycl.sycl_utils import profile_standalone


class HostTensor:
    dtype = tl.float32

    def __init__(self, size):
        self.c_array = (ctypes.c_float * size)(*[(i % 17) / 8.0 for i in range(size)])

    def data_ptr(self):
        return ctypes.addressof(self.c_array)


@triton.jit(do_not_specialize=["n"])
def benchmark_kernel(x, y, z, n, BLOCK_SIZE: tl.constexpr):
    offsets = tl.program_id(0) * BLOCK_SIZE + tl.arange(0, BLOCK_SIZE)
    mask = offsets < n
    tl.store(z + offsets, tl.load(x + offsets, mask, 0) + tl.load(y + offsets, mask, 0), mask)


def main():
    size = int(os.getenv("TRITON_SYCL_BENCH_SIZE", "98432"))
    repeats = int(os.getenv("TRITON_SYCL_BENCH_REPEATS", "3"))
    warmups = int(os.getenv("TRITON_SYCL_BENCH_WARMUPS", "3"))
    block = int(os.getenv("TRITON_SYCL_LOGICAL_BLOCK", "128"))
    local_blocks = [
        int(value)
        for value in os.getenv("TRITON_SYCL_BLOCK_LIST", os.getenv("TRITON_SYCL_BLOCK_SIZE", "128")).split(",")
        if value.strip()
    ]
    x, y, z = HostTensor(size), HostTensor(size), HostTensor(size)
    grid = (triton.cdiv(size, block),)
    compiled = benchmark_kernel[grid](x, y, z, size, BLOCK_SIZE=block)
    source = compiled.asm["sycl"]
    signature = compiled.src.signature
    metadata = compiled.metadata
    results = []
    for local_block in local_blocks:
        # Warm up enough times to remove one-time device JIT/queue effects.
        for _ in range(warmups):
            profile_standalone(
                grid[0], 1, 1, compiled.name, source, [x, y, z, size, block],
                signature=signature, metadata=metadata, block_size=local_block)
        kernel_times_ns = [profile_standalone(
            grid[0], 1, 1, compiled.name, source, [x, y, z, size, block],
            signature=signature, metadata=metadata, block_size=local_block)
            for _ in range(repeats)]
        error = max(abs(z.c_array[i] - x.c_array[i] - y.c_array[i]) for i in range(size))
        if error > 1e-6:
            raise RuntimeError(f"local block {local_block} produced error {error}")
        median_ns = statistics.median(kernel_times_ns)
        result = {
            "local_block": local_block,
            "logical_block": block,
            "size": size,
            "repeats": repeats,
            "warmups": warmups,
            "kernel_ns": kernel_times_ns,
            "median_kernel_ns": median_ns,
            "median_kernel_ms": median_ns / 1e6,
            "max_abs_error": error,
        }
        results.append(result)
        print(json.dumps(result, sort_keys=True), flush=True)

    baseline = next((result for result in results if result["local_block"] == 128), results[0])
    for result in results:
        result["speedup_vs_128"] = baseline["median_kernel_ns"] / result["median_kernel_ns"]
    print(json.dumps({
        "baseline_local_block": baseline["local_block"],
        "results": sorted(results, key=lambda result: result["median_kernel_ns"]),
    }, sort_keys=True))


if __name__ == "__main__":
    main()
