from triton.backends.compiler import BaseBackend, GPUTarget
import functools
import hashlib
import os
import subprocess
import tempfile
from pathlib import Path

from dataclasses import dataclass
from types import ModuleType
from typing import Any, Dict, Optional, Tuple

from triton._C.libtriton import sycl, ir, llvm, passes

from triton.runtime.build import _build



@dataclass(frozen=True)
class SYCLOptions:
    backend_name: str = "sycl"
    source_lang: str = "sycl"
    default_dot_input_precision: str = "ieee"
    allowed_dot_input_precisions: Tuple[str, ...] = ("ieee",)
    num_warps: int = 0
    num_stages: int = 0
    num_ctas: int = 0
    num_threads: int = 0
    cluster_dims: tuple = (1, 1, 1)
    extern_libs: dict = None
    debug: bool = False
    launch_cooperative_grid: bool = False
    max_num_imprecise_acc_default: int = 0
    sanitize_overflow: bool = False

    def __post_init__(self):
        pass

    def hash(self):
        hash_dict = dict(self.__dict__)
        key = "_".join([f"{name}-{val}" for name, val in sorted(hash_dict.items())])
        return hashlib.sha256(key.encode("utf-8")).hexdigest()


@dataclass
class SYCLMetadata:
    name: str = ""
    shared: int = 0
    num_warps: int = 4
    num_ctas: int = 1
    # In SYCL this is the explicitly requested one-dimensional local range.
    num_threads: int = 0


class SYCLBackend(BaseBackend):

    @staticmethod
    def supports_target(target: GPUTarget):
        return target.backend == "sycl"

    def __init__(self, target: tuple) -> None:
        super().__init__(target)
        self.binary_ext = "sycl"

    def parse_options(self, opts) -> Any:
        args = {k: opts[k] for k in SYCLOptions.__dataclass_fields__.keys() if k in opts}
        return SYCLOptions(**args)

    def pack_metadata(self, metadata):
        vals = metadata._asdict()
        args = {k: vals[k] for k in SYCLMetadata.__dataclass_fields__.keys() if k in vals}
        return SYCLMetadata(**args)

    def get_codegen_implementation(self, options):
        # Scalar dot lowering has no frontend hardware tile constraint.
        return {"min_dot_size": lambda lhs_type, rhs_type: (1, 1, 1)}

    def get_module_map(self) -> Dict[str, ModuleType]:
        # TODO: Add SYCL specific libdevice if needed
        return {}

    def load_dialects(self, ctx):
        sycl.load_dialects(ctx)

    @staticmethod
    def make_ttir(mod, metadata, opt):
        pm = ir.pass_manager(mod.context)
        pm.enable_debug()
        passes.common.add_inliner(pm)
        passes.ttir.add_rewrite_tensor_pointer(pm)
        passes.common.add_canonicalizer(pm)
        passes.ttir.add_combine(pm)
        passes.ttir.add_reorder_broadcast(pm)
        passes.common.add_cse(pm)
        passes.common.add_symbol_dce(pm)
        passes.ttir.add_loop_unroll(pm)
        pm.run(mod)
        return mod

    @staticmethod
    def make_lair(mod, metadata, opt):
        pm = ir.pass_manager(mod.context)
        pm.enable_debug()
        sycl.passes.lair.triton_to_linalg(pm)
        pm.run(mod)
        return mod

    @staticmethod
    def make_memir(mod, metadata, opt):
        pm = ir.pass_manager(mod.context)
        pm.enable_debug()
        sycl.passes.memir.one_shot_bufferize(pm)
        sycl.passes.memir.linalg_to_affine_loops(pm)
        passes.common.add_canonicalizer(pm)
        sycl.passes.memir.buffer_loop_hoisting(pm)
        passes.common.add_canonicalizer(pm)
        passes.common.add_cse(pm)
        passes.common.add_symbol_dce(pm)
        pm.run(mod)
        return mod


    @staticmethod
    def emit_sycl(src, metadata, opt):
        import re
        names = re.findall(r"func\.func @([\w.$-]+)\(", str(src))
        if len(names) != 1:
            raise RuntimeError(f"SYCL translation needs exactly one kernel, found {len(names)}")
        metadata["name"] = names[0]
        import triton._C as tc
        translator = Path(tc.__path__[0]) / "triton-sycl-translate"
        timeout = float(os.environ.get("TRITON_SYCL_TRANSLATE_TIMEOUT", "120"))
        with tempfile.TemporaryDirectory(prefix="triton-sycl-translate-") as directory:
            source, output = Path(directory)/"kernel.memir", Path(directory)/"kernel.sycl"
            source.write_text(str(src))
            command = [str(translator), str(source), "-triton-sycl-emit-sycl", "-o", str(output)]
            try:
                result = subprocess.run(command, capture_output=True, text=True, timeout=timeout)
            except subprocess.TimeoutExpired as error:
                raise RuntimeError(f"SYCL translation of {names[0]} timed out after {timeout:g}s") from error
            except OSError as error:
                raise RuntimeError(f"cannot run SYCL translator {translator}: {error}") from error
            if result.returncode:
                diagnostic = (result.stderr or result.stdout)[-12000:]
                raise RuntimeError(f"SYCL translation of {names[0]} failed (exit {result.returncode}):\n{diagnostic}")
            if not output.is_file() or not output.stat().st_size:
                raise RuntimeError(f"SYCL translator produced no source for {names[0]}")
            return output.read_text()

    def add_stages(self, stages, options):
        stages["ttir"] = lambda src, metadata: self.make_ttir(src, metadata, options)
        stages["lair"] = lambda src, metadata: self.make_lair(src, metadata, options)
        stages["memir"] = lambda src, metadata: self.make_memir(src, metadata, options)
        stages["sycl"] = lambda src, metadata: self.emit_sycl(src, metadata, options)


    @functools.lru_cache()
    def hash(self):
        import platform
        return f"{platform.machine()}"
