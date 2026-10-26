"""Runtime support for generated SYCL kernels.

The generated launcher has a stable ABI, but the kernel argument ABI must be
derived from Triton's specialized signature.  This module keeps pointer
element types, scalar widths, buffer sizes, and local ranges explicit.
"""

from dataclasses import dataclass
import ctypes
import hashlib
import os
import re
import struct
import subprocess
import tempfile
from pathlib import Path


DEFAULT_ACPP_PATH = "/Users/dxm/codes/AdaptiveCpp/install/bin/acpp"
ACPP_PATH = os.getenv("TRITON_SYCL_ACPP_PATH", os.getenv("ACPP_PATH", DEFAULT_ACPP_PATH))
ACPP_TARGETS = os.getenv("TRITON_SYCL_ACPP_TARGETS", "omp")
DEFAULT_BLOCK_SIZE = (128, 1, 1)
DEFAULT_WARP_SIZE = 32


@dataclass(frozen=True)
class _TypeInfo:
    cxx: str
    ctypes_type: type
    size: int
    is_float: bool = False
    is_bool: bool = False


_TYPE_INFO = {
    "u1": _TypeInfo("bool", ctypes.c_bool, ctypes.sizeof(ctypes.c_bool), is_bool=True),
    "i8": _TypeInfo("int8_t", ctypes.c_int8, 1),
    "u8": _TypeInfo("uint8_t", ctypes.c_uint8, 1),
    "i16": _TypeInfo("int16_t", ctypes.c_int16, 2),
    "u16": _TypeInfo("uint16_t", ctypes.c_uint16, 2),
    "i32": _TypeInfo("int32_t", ctypes.c_int32, 4),
    "u32": _TypeInfo("uint32_t", ctypes.c_uint32, 4),
    "i64": _TypeInfo("int64_t", ctypes.c_int64, 8),
    "u64": _TypeInfo("uint64_t", ctypes.c_uint64, 8),
    "fp16": _TypeInfo("sycl::half", ctypes.c_uint16, 2, is_float=True),
    "bf16": _TypeInfo("sycl::ext::oneapi::bfloat16", ctypes.c_uint16, 2, is_float=True),
    "fp32": _TypeInfo("float", ctypes.c_float, 4, is_float=True),
    "fp64": _TypeInfo("double", ctypes.c_double, 8, is_float=True),
}

_DTYPE_ALIASES = {
    "bool": "u1", "torch.bool": "u1",
    "int8": "i8", "torch.int8": "i8", "int16": "i16", "torch.int16": "i16",
    "int32": "i32", "torch.int32": "i32", "int": "i32", "int64": "i64", "torch.int64": "i64",
    "uint8": "u8", "torch.uint8": "u8", "uint16": "u16", "torch.uint16": "u16",
    "uint32": "u32", "torch.uint32": "u32", "uint64": "u64", "torch.uint64": "u64",
    "half": "fp16", "float16": "fp16", "torch.float16": "fp16",
    "bfloat16": "bf16", "torch.bfloat16": "bf16",
    "float": "fp32", "float32": "fp32", "torch.float32": "fp32",
    "double": "fp64", "float64": "fp64", "torch.float64": "fp64",
}


def _canonical_type(type_repr):
    if type_repr is None:
        return None
    if isinstance(type_repr, tuple):
        raise TypeError("tuple kernel arguments are not supported by the SYCL ABI yet")
    ty = str(type_repr).strip()
    if ty.startswith("*k"):
        return "*" + _canonical_type(ty[2:])
    if ty.startswith("*"):
        return "*" + _canonical_type(ty[1:])
    if ty == "constexpr":
        return ty
    return _DTYPE_ALIASES.get(ty.replace("_t", ""), ty)


def _type_info(type_repr):
    ty = _canonical_type(type_repr)
    if ty not in _TYPE_INFO:
        raise TypeError(f"unsupported SYCL kernel scalar type: {type_repr!r}")
    return _TYPE_INFO[ty]


def _is_pointer_type(type_repr):
    return _canonical_type(type_repr).startswith("*")


def _pointer_element_type(type_repr, arg):
    ty = _canonical_type(type_repr)
    if ty.startswith("*") and ty[1:] in _TYPE_INFO:
        return ty[1:]
    if hasattr(arg, "c_array") and hasattr(arg.c_array, "_type_"):
        for name, info in _TYPE_INFO.items():
            if info.ctypes_type is arg.c_array._type_:
                return name
    dtype = getattr(arg, "dtype", None)
    if dtype is not None:
        name = _DTYPE_ALIASES.get(str(dtype), _DTYPE_ALIASES.get(str(dtype).split(".")[-1]))
        if name in _TYPE_INFO:
            return name
    raise TypeError("cannot determine the element dtype of a pointer argument")


def _actual_element_type(arg):
    if hasattr(arg, "c_array") and hasattr(arg.c_array, "_type_"):
        for name, info in _TYPE_INFO.items():
            if info.ctypes_type is arg.c_array._type_:
                return name
    dtype = getattr(arg, "dtype", None)
    if dtype is not None:
        name = _DTYPE_ALIASES.get(str(dtype), _DTYPE_ALIASES.get(str(dtype).split(".")[-1]))
        if name in _TYPE_INFO:
            return name
    return None


def _buffer_nbytes(arg, element_type):
    actual_type = _actual_element_type(arg)
    if actual_type is not None and actual_type != element_type:
        raise ValueError(
            f"pointer ABI says {element_type}, but the supplied buffer has dtype {actual_type}"
        )
    if hasattr(arg, "c_array"):
        size = ctypes.sizeof(arg.c_array)
    elif hasattr(arg, "numel") and hasattr(arg, "element_size"):
        size = int(arg.numel()) * int(arg.element_size())
    elif hasattr(arg, "nbytes"):
        size = int(arg.nbytes)
    else:
        raise TypeError("pointer arguments need numel()/element_size(), nbytes, or c_array")
    itemsize = _type_info(element_type).size
    if size % itemsize:
        raise ValueError(f"buffer size {size} is not a multiple of {element_type} ({itemsize} bytes)")
    if hasattr(arg, "is_contiguous") and not bool(arg.is_contiguous()):
        raise ValueError("SYCL backend currently requires contiguous pointer arguments")
    return size


def _buffer_bytes(arg, size):
    if hasattr(arg, "c_array"):
        return ctypes.string_at(arg.data_ptr(), size)
    if hasattr(arg, "numpy"):
        return arg.numpy().tobytes()
    return ctypes.string_at(arg.data_ptr(), size)


def _split_cpp_params(params):
    result, start, angle_depth, paren_depth = [], 0, 0, 0
    for index, char in enumerate(params):
        if char == "<":
            angle_depth += 1
        elif char == ">":
            angle_depth = max(0, angle_depth - 1)
        elif char == "(":
            paren_depth += 1
        elif char == ")":
            paren_depth = max(0, paren_depth - 1)
        elif char == "," and angle_depth == 0 and paren_depth == 0:
            result.append(params[start:index].strip())
            start = index + 1
    if params[start:].strip():
        result.append(params[start:].strip())
    return result


def _source_signature(kernel_name, source_code):
    match = re.search(
        rf'extern\s+"C"\s+void\s+launch_{re.escape(kernel_name)}\((.*?)\)\s*\{{',
        source_code,
        re.DOTALL,
    )
    if not match:
        raise RuntimeError(f"could not find launch_{kernel_name} signature")
    params = _split_cpp_params(match.group(1))
    if len(params) < 7:
        raise RuntimeError(f"invalid launch_{kernel_name} ABI")
    cxx_to_triton = {
        "bool": "u1", "int8_t": "i8", "uint8_t": "u8", "int16_t": "i16", "uint16_t": "u16",
        "int32_t": "i32", "uint32_t": "u32", "int64_t": "i64", "uint64_t": "u64",
        "int": "i32", "long": "i64", "unsigned": "u32", "float": "fp32", "double": "fp64",
    }
    result = []
    for param in params[7:]:
        declared_type = param.rsplit(" ", 1)[0].replace("const ", "").strip()
        is_pointer = declared_type.endswith("*")
        declared_type = declared_type.rstrip("*").strip()
        result.append(("*" if is_pointer else "") + cxx_to_triton.get(declared_type, declared_type))
    return result


def _runtime_arguments(kernel_name, source_code, bound_args, signature):
    if signature is None:
        types = _source_signature(kernel_name, source_code)
        if len(bound_args) < len(types):
            raise ValueError(f"launch_{kernel_name} expects {len(types)} arguments, got {len(bound_args)}")
        bound_args = bound_args[:len(types)]
    else:
        types = list(signature.values()) if isinstance(signature, dict) else list(signature)
        if len(types) != len(bound_args):
            raise ValueError(f"kernel signature has {len(types)} entries but launch has {len(bound_args)} values")
    result = []
    for index, (type_repr, arg) in enumerate(zip(types, bound_args)):
        ty = _canonical_type(type_repr)
        if ty == "constexpr":
            continue
        if _is_pointer_type(ty):
            element_type = _pointer_element_type(ty, arg)
            result.append((index, ty, element_type, arg, _buffer_nbytes(arg, element_type)))
        else:
            _type_info(ty)
            result.append((index, ty, None, arg, None))
    return result


@dataclass(frozen=True)
class BlockSize:
    x: int
    y: int
    z: int

    @property
    def as_tuple(self):
        return self.x, self.y, self.z


def _parse_block_size(value):
    if value is None:
        return None
    if isinstance(value, int):
        value = (value, 1, 1)
    elif isinstance(value, str):
        parts = [part.strip() for part in value.replace("x", ",").split(",") if part.strip()]
        return _parse_block_size(tuple(int(part) for part in parts))
    elif isinstance(value, (tuple, list)):
        if len(value) == 1:
            value = (value[0], 1, 1)
        elif len(value) == 2:
            value = (value[0], value[1], 1)
        elif len(value) != 3:
            raise ValueError("block size must have one, two, or three dimensions")
    else:
        raise TypeError(f"unsupported block size value: {value!r}")
    values = tuple(int(part) for part in value)
    if any(part <= 0 for part in values):
        raise ValueError(f"block dimensions must be positive, got {values}")
    return BlockSize(*values)


def _required_block_size(source_code):
    required = [1, 1, 1]
    assignment = re.compile(r"(?:int|size_t|auto)\s+(\w+)\s*=\s*item\.get_local_id\((\d)\)")
    for match in assignment.finditer(source_code):
        variable, dimension = match.group(1), int(match.group(2))
        tail = source_code[match.end():match.end() + 4096]
        guard = re.search(rf"if\s*\(\s*{re.escape(variable)}\s*<\s*(\d+)\s*\)", tail)
        if guard:
            required[dimension] = max(required[dimension], int(guard.group(1)))
    for dimension, bound in re.findall(r"if\s*\(\s*item\.get_local_id\((\d)\)\s*<\s*(\d+)\s*\)", source_code):
        required[int(dimension)] = max(required[int(dimension)], int(bound))
    return BlockSize(*required)


def resolve_block_size(metadata=None, block_size=None, source_code=""):
    explicit = block_size is not None
    if block_size is None:
        env_value = os.getenv("TRITON_SYCL_BLOCK_SIZE")
        if env_value:
            block_size, explicit = env_value, True
        elif any(os.getenv(name) for name in ("TRITON_SYCL_BLOCK_X", "TRITON_SYCL_BLOCK_Y", "TRITON_SYCL_BLOCK_Z")):
            block_size, explicit = (
                int(os.getenv("TRITON_SYCL_BLOCK_X", str(DEFAULT_BLOCK_SIZE[0]))),
                int(os.getenv("TRITON_SYCL_BLOCK_Y", str(DEFAULT_BLOCK_SIZE[1]))),
                int(os.getenv("TRITON_SYCL_BLOCK_Z", str(DEFAULT_BLOCK_SIZE[2]))),
            ), True
    if block_size is None and metadata is not None:
        num_threads = int(getattr(metadata, "num_threads", 0) or 0)
        if num_threads > 0:
            block_size, explicit = num_threads, True
    if block_size is None and metadata is not None:
        num_warps = int(getattr(metadata, "num_warps", 0) or 0)
        if num_warps > 0:
            target = getattr(metadata, "target", None)
            warp_size = int(getattr(target, "warp_size", DEFAULT_WARP_SIZE) or DEFAULT_WARP_SIZE)
            block_size = num_warps * warp_size
    resolved = _parse_block_size(block_size) or _parse_block_size(DEFAULT_BLOCK_SIZE)
    required = _required_block_size(source_code) if source_code else _parse_block_size((1, 1, 1))
    if explicit and any(a < b for a, b in zip(resolved.as_tuple, required.as_tuple)):
        raise ValueError(
            f"requested SYCL block {resolved.as_tuple} is smaller than the kernel's "
            f"required local-id floor {required.as_tuple}"
        )
    if not explicit:
        resolved = BlockSize(max(resolved.x, required.x), max(resolved.y, required.y), max(resolved.z, required.z))
    return resolved


class SYCLContext:
    _instance = None

    def __new__(cls):
        if cls._instance is None:
            cls._instance = super(SYCLContext, cls).__new__(cls)
            cls._instance.init_context()
        return cls._instance

    def init_context(self):
        self.helper_lib = self._compile_helper()
        self.helper_lib.create_queue.restype = ctypes.c_void_p
        self.helper_lib.destroy_queue.argtypes = [ctypes.c_void_p]
        self.helper_lib.wait_queue.argtypes = [ctypes.c_void_p]
        self.queue = self.helper_lib.create_queue()
        if not self.queue:
            raise RuntimeError("failed to create a SYCL queue")

    def _compile_helper(self):
        src = """
        #include <sycl/sycl.hpp>
        #include <iostream>
        extern "C" {
          void* create_queue() { try { return new sycl::queue(sycl::default_selector_v,
            sycl::property::queue::enable_profiling{}); }
            catch (sycl::exception const& e) { std::cerr << e.what() << std::endl; return nullptr; } }
          void destroy_queue(void* q) { if (q) delete static_cast<sycl::queue*>(q); }
          void wait_queue(void* q) { if (q) static_cast<sycl::queue*>(q)->wait(); }
        }
        """
        with tempfile.NamedTemporaryFile(suffix=".cpp", mode="w", delete=False) as f:
            f.write(src)
            src_path = f.name
        lib_path = src_path.replace(".cpp", ".so")
        cmd = [ACPP_PATH, f"--acpp-targets={ACPP_TARGETS}", "-shared", "-fPIC", "-O2", src_path, "-o", lib_path]
        subprocess.check_call(cmd, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
        return ctypes.CDLL(lib_path)

    def get_queue(self):
        return self.queue

    def wait(self):
        self.helper_lib.wait_queue(self.queue)


_ver_cache = {}
_standalone_cache = {}


def compile_and_load(kernel_name, source_code):
    source_code = source_code.decode("utf-8") if isinstance(source_code, bytes) else source_code
    source_hash = hashlib.sha256(source_code.encode()).hexdigest()
    if source_hash in _ver_cache:
        return _ver_cache[source_hash]
    with tempfile.NamedTemporaryFile(suffix=".sycl", mode="w", delete=False) as f:
        f.write(source_code)
        src_path = f.name
    lib_path = src_path + ".so"
    cmd = [ACPP_PATH, f"--acpp-targets={ACPP_TARGETS}", "-shared", "-fPIC", "-O2", "-x", "c++", src_path, "-o", lib_path]
    try:
        subprocess.check_call(cmd)
    except subprocess.CalledProcessError as error:
        raise RuntimeError(f"failed to compile SYCL kernel {kernel_name}") from error
    lib = ctypes.CDLL(lib_path)
    _ver_cache[source_hash] = lib
    return lib


def _ctypes_scalar(type_repr, value):
    info = _type_info(type_repr)
    if info.is_bool:
        return info.ctypes_type(bool(value))
    if info.is_float and _canonical_type(type_repr) in ("fp32", "fp64"):
        return info.ctypes_type(float(value))
    if _canonical_type(type_repr) == "fp16":
        return ctypes.c_uint16(struct.unpack("<H", struct.pack("<e", float(value)))[0])
    if _canonical_type(type_repr) == "bf16":
        bits = struct.unpack("<I", struct.pack("<f", float(value)))[0]
        # Round to nearest even before truncating the low 16 bits.
        rounding = ((bits >> 16) & 1) + 0x7FFF
        return ctypes.c_uint16((bits + rounding) >> 16)
    return info.ctypes_type(int(value))


def _ctypes_launch_args(queue, grid, block, runtime_args):
    values = [ctypes.c_void_p(queue), *(ctypes.c_size_t(v) for v in grid), *(ctypes.c_size_t(v) for v in block.as_tuple)]
    argtypes = [ctypes.c_void_p] + [ctypes.c_size_t] * 6
    for _, type_repr, _, arg, _ in runtime_args:
        if _is_pointer_type(type_repr):
            values.append(ctypes.c_void_p(arg.data_ptr()))
            argtypes.append(ctypes.c_void_p)
        else:
            values.append(_ctypes_scalar(type_repr, arg))
            argtypes.append(_type_info(type_repr).ctypes_type)
    return values, argtypes


def _launch_in_process(gridX, gridY, gridZ, kernel_name, source_code, bound_args, signature=None, metadata=None, block_size=None):
    ctx = SYCLContext()
    source_code = source_code.decode("utf-8") if isinstance(source_code, bytes) else source_code
    runtime_args = _runtime_arguments(kernel_name, source_code, list(bound_args), signature)
    block = resolve_block_size(metadata, block_size, source_code)
    launch_fn = getattr(compile_and_load(kernel_name, source_code), f"launch_{kernel_name}")
    values, argtypes = _ctypes_launch_args(ctx.get_queue(), (gridX, gridY, gridZ), block, runtime_args)
    launch_fn.argtypes, launch_fn.restype = argtypes, None
    launch_fn(*values)
    ctx.wait()


def profile_in_process(gridX, gridY, gridZ, kernel_name, source_code, bound_args,
                       signature=None, metadata=None, block_size=None):
    """Return device event duration in nanoseconds for one kernel launch.

    The caller must compile and warm up before starting its benchmark timer.
    This function only returns the SYCL event's command-end minus command-start
    interval; Python, process, and compilation time are outside that value.
    """
    ctx = SYCLContext()
    source_code = source_code.decode("utf-8") if isinstance(source_code, bytes) else source_code
    runtime_args = _runtime_arguments(kernel_name, source_code, list(bound_args), signature)
    block = resolve_block_size(metadata, block_size, source_code)
    profile_fn = getattr(compile_and_load(kernel_name, source_code), f"profile_{kernel_name}")
    values, argtypes = _ctypes_launch_args(ctx.get_queue(), (gridX, gridY, gridZ), block, runtime_args)
    elapsed_ns = ctypes.c_uint64(0)
    values.append(ctypes.byref(elapsed_ns))
    argtypes.append(ctypes.POINTER(ctypes.c_uint64))
    profile_fn.argtypes, profile_fn.restype = argtypes, None
    profile_fn(*values)
    ctx.wait()
    return int(elapsed_ns.value)


def launch(gridX, gridY, gridZ, kernel_name, source_code, bound_args, *, signature=None, metadata=None, block_size=None):
    source_code = source_code.decode("utf-8") if isinstance(source_code, bytes) else source_code
    grid = tuple(int(value) for value in (gridX, gridY, gridZ))
    if any(value <= 0 for value in grid):
        raise ValueError(f"SYCL grid dimensions must be positive, got {grid}")
    try:
        run_standalone(*grid, kernel_name, source_code, bound_args, signature=signature, metadata=metadata, block_size=block_size)
    except Exception as standalone_error:
        if os.getenv("TRITON_SYCL_DISABLE_INPROCESS_FALLBACK", "0") == "1":
            raise
        print(f"SYCL standalone launch failed ({standalone_error}); falling back to ctypes")
        _launch_in_process(*grid, kernel_name, source_code, bound_args, signature=signature, metadata=metadata, block_size=block_size)


def _cpp_scalar_declaration(index, type_repr, value):
    ty = _canonical_type(type_repr)
    info = _type_info(ty)
    if info.is_bool:
        literal = "true" if bool(value) else "false"
    elif info.is_float:
        literal = repr(float(value)) + ("f" if ty == "fp32" else "")
    else:
        literal = str(int(value))
    return f"        {info.cxx} arg_{index} = static_cast<{info.cxx}>({literal});\n"


def generate_standalone_wrapper(kernel_name, source_code, bound_args, *, signature=None,
                                metadata=None, block_size=None, profile=False):
    source_code = source_code.decode("utf-8") if isinstance(source_code, bytes) else source_code
    runtime_args = _runtime_arguments(kernel_name, source_code, list(bound_args), signature)
    block = resolve_block_size(metadata, block_size, source_code)
    call_args = ["&q", "gridX", "gridY", "gridZ", "blockX", "blockY", "blockZ"]
    declarations, output_writes, cleanup = [], [], []
    for index, type_repr, element_type, arg, _ in runtime_args:
        if _is_pointer_type(type_repr):
            info = _type_info(element_type)
            declarations.append(
                f"        size_t size_{index} = 0;\n"
                f"        infile.read(reinterpret_cast<char*>(&size_{index}), sizeof(size_{index}));\n"
                f"        if (!infile || size_{index} == 0 || size_{index} % sizeof({info.cxx}) != 0) return 2;\n"
                f"        {info.cxx}* arg_{index} = sycl::malloc_shared<{info.cxx}>(size_{index} / sizeof({info.cxx}), q);\n"
                f"        if (!arg_{index}) return 3;\n"
                f"        infile.read(reinterpret_cast<char*>(arg_{index}), size_{index});\n"
                f"        if (!infile) return 4;\n"
            )
            call_args.append(f"arg_{index}")
            output_writes.append(f"        outfile.write(reinterpret_cast<const char*>(arg_{index}), size_{index});\n")
            cleanup.append(f"        sycl::free(arg_{index}, q);\n")
        else:
            declarations.append(_cpp_scalar_declaration(index, type_repr, arg))
            call_args.append(f"arg_{index}")
    queue_decl = (
        "sycl::queue q(sycl::default_selector_v, sycl::property::queue::enable_profiling{});"
        if profile else "sycl::queue q(sycl::default_selector_v);"
    )
    timing_decl = "        uint64_t elapsed_ns = 0;\n" if profile else ""
    if profile:
        call_args.append("&elapsed_ns")
    timing_write = (
        "        outfile.write(reinterpret_cast<const char*>(&elapsed_ns), sizeof(elapsed_ns));\n"
        if profile else ""
    )
    launch_call = f"profile_{kernel_name}" if profile else f"launch_{kernel_name}"
    return f"""
    #include <sycl/sycl.hpp>
    #include <cstdint>
    #include <fstream>
    {source_code}
    int main(int argc, char** argv) {{
        if (argc != 3) return 1;
        std::ifstream infile(argv[1], std::ios::binary);
        if (!infile) return 1;
        {queue_decl}
        size_t gridX = 0, gridY = 0, gridZ = 0;
        infile.read(reinterpret_cast<char*>(&gridX), sizeof(gridX));
        infile.read(reinterpret_cast<char*>(&gridY), sizeof(gridY));
        infile.read(reinterpret_cast<char*>(&gridZ), sizeof(gridZ));
        if (!infile || gridX == 0 || gridY == 0 || gridZ == 0) return 1;
        size_t blockX = {block.x}, blockY = {block.y}, blockZ = {block.z};
{''.join(declarations)}
{timing_decl}        {launch_call}({', '.join(call_args)});
        q.wait();
        std::ofstream outfile(argv[2], std::ios::binary);
        if (!outfile) return 5;
{''.join(output_writes)}
{timing_write}
        outfile.close();
{''.join(cleanup)}
        return outfile ? 0 : 6;
    }}
    """


def _standalone_executable(main_src):
    source_hash = hashlib.sha256(main_src.encode()).hexdigest()
    cached = _standalone_cache.get(source_hash)
    if cached and os.path.exists(cached):
        return cached
    cache_dir = os.path.join(tempfile.gettempdir(), "triton-sycl-cache")
    os.makedirs(cache_dir, exist_ok=True)
    src_path, exe_path = os.path.join(cache_dir, source_hash + ".cpp"), os.path.join(cache_dir, source_hash)
    if not os.path.exists(exe_path):
        Path(src_path).write_text(main_src)
        cmd = [ACPP_PATH, f"--acpp-targets={ACPP_TARGETS}", "-O2", "-std=c++17", src_path, "-o", exe_path]
        result = subprocess.run(cmd, capture_output=True, text=True)
        if result.returncode:
            raise RuntimeError("standalone SYCL compilation failed:\n" + "\n".join(result.stderr.splitlines()[:80]))
    _standalone_cache[source_hash] = exe_path
    return exe_path


def run_standalone(gridX, gridY, gridZ, kernel_name, source_code, bound_args, *, signature=None, metadata=None, block_size=None):
    source_code = source_code.decode("utf-8") if isinstance(source_code, bytes) else source_code
    main_src = generate_standalone_wrapper(kernel_name, source_code, bound_args, signature=signature, metadata=metadata, block_size=block_size)
    executable = _standalone_executable(main_src)
    runtime_args = _runtime_arguments(kernel_name, source_code, list(bound_args), signature)
    with tempfile.TemporaryDirectory(prefix="triton_sycl_run_") as run_dir:
        input_bin, output_bin = os.path.join(run_dir, "input.bin"), os.path.join(run_dir, "output.bin")
        with open(input_bin, "wb") as stream:
            for value in (gridX, gridY, gridZ):
                stream.write(ctypes.c_size_t(int(value)))
            for _, type_repr, _, arg, size in runtime_args:
                if _is_pointer_type(type_repr):
                    stream.write(ctypes.c_size_t(size))
                    stream.write(_buffer_bytes(arg, size))
        subprocess.check_call([executable, input_bin, output_bin])
        with open(output_bin, "rb") as stream:
            for _, type_repr, _, arg, size in runtime_args:
                if _is_pointer_type(type_repr):
                    data = stream.read(size)
                    if len(data) != size:
                        raise RuntimeError("standalone SYCL output is shorter than a pointer argument")
                    ctypes.memmove(arg.data_ptr(), data, size)


def profile_standalone(gridX, gridY, gridZ, kernel_name, source_code, bound_args,
                       signature=None, metadata=None, block_size=None):
    """Run the profiling wrapper and return only the device event duration."""
    source_code = source_code.decode("utf-8") if isinstance(source_code, bytes) else source_code
    main_src = generate_standalone_wrapper(
        kernel_name, source_code, bound_args,
        signature=signature, metadata=metadata, block_size=block_size, profile=True)
    executable = _standalone_executable(main_src)
    runtime_args = _runtime_arguments(kernel_name, source_code, list(bound_args), signature)
    with tempfile.TemporaryDirectory(prefix="triton_sycl_profile_") as run_dir:
        input_bin, output_bin = os.path.join(run_dir, "input.bin"), os.path.join(run_dir, "output.bin")
        with open(input_bin, "wb") as stream:
            for value in (gridX, gridY, gridZ):
                stream.write(ctypes.c_size_t(int(value)))
            for _, type_repr, _, arg, size in runtime_args:
                if _is_pointer_type(type_repr):
                    stream.write(ctypes.c_size_t(size))
                    stream.write(_buffer_bytes(arg, size))
        subprocess.check_call([executable, input_bin, output_bin])
        with open(output_bin, "rb") as stream:
            for _, type_repr, _, arg, size in runtime_args:
                if _is_pointer_type(type_repr):
                    data = stream.read(size)
                    if len(data) != size:
                        raise RuntimeError("profiling SYCL output is shorter than a pointer argument")
                    ctypes.memmove(arg.data_ptr(), data, size)
            timing = stream.read(ctypes.sizeof(ctypes.c_uint64))
            if len(timing) != ctypes.sizeof(ctypes.c_uint64):
                raise RuntimeError("profiling SYCL output did not contain an event duration")
            return int(struct.unpack("<Q", timing)[0])
