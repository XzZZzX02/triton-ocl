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
    supported_fp8_dtypes: Tuple[str, ...] = ("fp8e5", "fp8e5b16", "fp8e4nv", "fp8e4b8", "fp8e4b15")
    deprecated_fp8_dtypes: Tuple[str, ...] = ()
    promote_legacy_fp8_arithmetic: bool = True
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
    vectorize_memory: bool = False
    reuse_local_memory: bool = True
    fuse_elementwise: bool = False
    group_reduction: bool = False
    register_accumulator: bool = False
    matmul_register_tiling: bool = False
    matmul_register_tiling_2col: bool = False
    lds_bank_padding: bool = False
    reduction_unroll: int = 1
    accumulator_init_forwarding: bool = False
    distribute_work: bool = True
    cooperative_load_staging: bool = False
    terminal_store_distribution: bool = False
    half_store_distribution: bool = False

    def __post_init__(self):
        if type(self.reduction_unroll) is not int or self.reduction_unroll not in (1, 2, 4, 8):
            raise ValueError("SYCL reduction_unroll must be 1, 2, 4, or 8")

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
        from .numeric import convert_custom_float8
        return {"min_dot_size": lambda lhs_type, rhs_type: (1, 1, 1),
                "convert_custom_types": convert_custom_float8}

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
        if opt.fuse_elementwise:
            sycl.passes.lair.elementwise_fusion(pm)
            passes.common.add_canonicalizer(pm)
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
        if opt.distribute_work:
            if opt.cooperative_load_staging:
                sycl.passes.memir.cooperative_load_staging(pm)
            sycl.passes.memir.work_distribution(pm)
        if opt.register_accumulator:
            sycl.passes.memir.register_accumulator(pm)
        if opt.matmul_register_tiling:
            sycl.passes.memir.matmul_register_tiling(pm, opt.matmul_register_tiling_2col)
            passes.common.add_cse(pm)
        if opt.group_reduction:
            sycl.passes.memir.group_reduction(pm)
        if opt.accumulator_init_forwarding:
            sycl.passes.memir.accumulator_init_forwarding(pm)
        if opt.reduction_unroll != 1:
            sycl.passes.memir.ordered_reduction_unroll(pm, opt.reduction_unroll)
            passes.common.add_cse(pm)
        if opt.reuse_local_memory:
            sycl.passes.memir.local_memory_reuse(pm)
        if opt.lds_bank_padding:
            # Preserve the slots already selected by equal-type coloring;
            # padding updates their physical storage accounting in place.
            sycl.passes.memir.lds_bank_padding(pm)
        if opt.vectorize_memory:
            sycl.passes.memir.vector_memory(pm)
        if opt.distribute_work and opt.terminal_store_distribution:
            sycl.passes.memir.terminal_store_distribution(pm)
        if opt.distribute_work and opt.half_store_distribution:
            sycl.passes.memir.half_store_distribution(pm)
        if opt.matmul_register_tiling and opt.matmul_register_tiling_2col:
            sycl.passes.memir.two_column_launch_guard(pm)
            if opt.reduction_unroll != 1:
                # The untiled launch alternative retains the original unroll
                # opportunity, including a K=16 reduction.
                sycl.passes.memir.ordered_reduction_unroll(pm, opt.reduction_unroll)
                passes.common.add_cse(pm)
        sycl.passes.memir.serial_half_copy_guard(pm)
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
