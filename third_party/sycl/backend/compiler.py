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


print(f"SYCL COMPILER LOADED FROM: {__file__}")

@dataclass(frozen=True)
class SYCLOptions:
    backend_name: str = "sycl"
    source_lang: str = "sycl"
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
        pass

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
        # passes.common.add_canonicalizer(pm)
        passes.ttir.add_combine(pm)
        passes.ttir.add_reorder_broadcast(pm)
        # passes.common.add_cse(pm)
        # passes.common.add_symbol_dce(pm)
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
        # passes.common.add_canonicalizer(pm)
        sycl.passes.memir.buffer_loop_hoisting(pm)
        # passes.common.add_canonicalizer(pm)
        # passes.common.add_cse(pm)
        # passes.common.add_symbol_dce(pm)
        pm.run(mod)
        return mod

    @staticmethod
    def make_llvmspvir(mod, metadata, opt):
        pm = ir.pass_manager(mod.context)
        pm.enable_debug()
        sycl.passes.llvmspvir.affine_to_llvmspv(pm)
        pm.run(mod)
        return mod

    @staticmethod
    def emit_sycl(src, metadata, opt):
        print("DEBUG: Executing emit_sycl")
        import re
        names = re.findall(r"func\.func @(\w+)\(", str(src))
        assert len(names) == 1
        metadata["name"] = names[0]
        if "shared" not in metadata:
            metadata["shared"] = 0
        if "num_warps" not in metadata:
            metadata["num_warps"] = 4
        if "num_ctas" not in metadata:
            metadata["num_ctas"] = 1
        import triton._C as tc
        # Use triton-sycl-translate
        sycl_translate = os.path.join(tc.__path__[0], 'triton-sycl-translate')
        with tempfile.NamedTemporaryFile(delete=False, mode='w', suffix='.memir') as fsrc:
            fsrc.write(str(src))
            fsrc.flush()
            sycl_file = fsrc.name + '.sycl'
            emit_sycl_cmd = [
                sycl_translate,
                fsrc.name,
                '-triton-sycl-emit-sycl',
                '-o',
                sycl_file
            ]
            subprocess.run(emit_sycl_cmd, check=True, close_fds=False)
            with open(sycl_file, 'rb') as f:
                sycl_src = f.read().decode("utf-8")
            if os.path.exists(sycl_file):
                os.remove(sycl_file)
        return sycl_src

    def add_stages(self, stages, options):
        print("DEBUG: add_stages called")
        stages["ttir"] = lambda src, metadata: self.make_ttir(src, metadata, options)
        stages["lair"] = lambda src, metadata: self.make_lair(src, metadata, options)
        stages["memir"] = lambda src, metadata: self.make_memir(src, metadata, options)
        stages["sycl"] = lambda src, metadata: self.emit_sycl(src, metadata, options)



    def get_codegen_implementation(self, options):
        pass

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
        names = re.findall(r"func\.func @(\w+)\(", str(src))
        assert len(names) == 1
        metadata["name"] = names[0]
        import triton._C as tc
        # Use triton-sycl-translate
        sycl_translate = os.path.join(tc.__path__[0], 'triton-sycl-translate')
        with tempfile.NamedTemporaryFile(delete=False, mode='w', suffix='.memir') as fsrc:
            fsrc.write(str(src))
            fsrc.flush()
            sycl_file = fsrc.name + '.sycl'
            emit_sycl_cmd = [
                sycl_translate,
                fsrc.name,
                '-triton-sycl-emit-sycl',
                '-o',
                sycl_file
            ]
            subprocess.run(emit_sycl_cmd, check=True, close_fds=False)
            with open(sycl_file, 'rb') as f:
                sycl_src = f.read().decode("utf-8")
            if os.path.exists(sycl_file):
                os.remove(sycl_file)
        return sycl_src

    def add_stages(self, stages, options):
        stages["ttir"] = lambda src, metadata: self.make_ttir(src, metadata, options)
        stages["lair"] = lambda src, metadata: self.make_lair(src, metadata, options)
        stages["memir"] = lambda src, metadata: self.make_memir(src, metadata, options)
        stages["sycl"] = lambda src, metadata: self.emit_sycl(src, metadata, options)


    @functools.lru_cache()
    def hash(self):
        import platform
        return f"{platform.machine()}"
