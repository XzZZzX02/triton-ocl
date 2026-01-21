import os
import hashlib
import importlib
import importlib.resources
import tempfile
import time

import triton
import triton._C
from triton.runtime.build import _build
from triton.runtime.cache import get_cache_manager
from triton.backends.driver import DriverBase
from triton.backends.compiler import GPUTarget

from pathlib import Path


# ------------------------
# Utils
# ------------------------


class SYCLUtils(object):

    def __new__(cls):
        if not hasattr(cls, "instance"):
            cls.instance = super(SYCLUtils, cls).__new__(cls)
        return cls.instance

    def __init__(self):
        pass

    def load_binary(self, name, kernel, shared_mem, device):
        # module, function, n_regs, n_spills, n_max_threads
        return (None, kernel, 0, 0, 1024)

    def get_device_properties(self, *args):
        return {"max_shared_mem": 64 * 1024}


# ------------------------
# Launcher
# ------------------------

def make_launcher(constants, signature, ids):
    # Record the end of regular arguments;
    # subsequent arguments are architecture-specific descriptors.

    # generate glue code
    src = f""""""
    return src


class SYCLLauncher(object):

    def __init__(self, src, metadata):
        pass

    def __call__(self, gridX, gridY, gridZ, stream, function, packed_metadata, launch_metadata, enter_hook, exit_hook, *args):
        try:
            from triton.backends.sycl.sycl_utils import launch
        except ImportError:
            # Fallback for development/testing if package structure isn't fully set
            try:
                from .sycl_utils import launch
            except ImportError:
                # Last resort: try looking relative to the current file
                import sys
                from pathlib import Path
                sys.path.append(str(Path(__file__).parent))
                from sycl_utils import launch
        
        launch(gridX, gridY, gridZ, packed_metadata.name, function, args)


class SYCLDriver(DriverBase):

    def __init__(self):
        self.utils = SYCLUtils()
        self.launcher_cls = SYCLLauncher
        super().__init__()

    def get_current_device(self):
        return 0

    def get_active_torch_device(self):
        import torch
        return torch.device("cpu", self.get_current_device())

    def get_current_stream(self, device):
        return 0

    def get_current_target(self):
        # Capability and warp size are zeros for SYCL.
        # Arch "sycl"
        return GPUTarget("sycl", "sycl", 32)

    def get_device_interface(self):
        import torch
        return torch.cuda

    @staticmethod
    def is_active():
        return True

    def get_benchmarker(self):
        from triton.testing import do_bench
        return do_bench

    def get_empty_cache_for_benchmark(self):
        pass

    def clear_cache(self, cache):
        cache.zero_()

