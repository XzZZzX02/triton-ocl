
import triton
import torch

try:
    from triton.backends.sycl import driver as sycl_driver
    print("SYCL driver module imported successfully.")
except ImportError:
    print("Could not import SYCL driver module.")

print(f"Active driver: {triton.runtime.driver.active}")
print(f"Active driver class: {triton.runtime.driver.active.__class__}")
print(f"Active driver module: {triton.runtime.driver.active.__module__}")
