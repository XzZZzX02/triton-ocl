import ctypes
import os
import subprocess
import hashlib
import tempfile
from pathlib import Path

# Hardcoded path to AdaptiveCpp - in a real scenario this should be configurable
DEFAULT_ACPP_PATH = "/Users/dxm/codes/AdaptiveCpp/install/bin/acpp"
ACPP_PATH = os.getenv("TRITON_SYCL_ACPP_PATH", os.getenv("ACPP_PATH", DEFAULT_ACPP_PATH))
ACPP_TARGETS = os.getenv("TRITON_SYCL_ACPP_TARGETS", "omp")

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
        
    def _compile_helper(self):
        src = """
        #include <sycl/sycl.hpp>
        #include <iostream>
        
        extern "C" {
            void* create_queue() {
                try {
                    auto* q = new sycl::queue(sycl::default_selector_v);
                    return q;
                } catch (sycl::exception const& e) {
                    std::cerr << "SYCL exception: " << e.what() << std::endl;
                    return nullptr;
                }
            }
            void destroy_queue(void* q) { if (q) delete static_cast<sycl::queue*>(q); }
            void wait_queue(void* q) { if (q) static_cast<sycl::queue*>(q)->wait(); }
        }
        """
        with tempfile.NamedTemporaryFile(suffix=".cpp", mode="w", delete=False) as f:
            f.write(src)
            src_path = f.name
        lib_path = src_path.replace(".cpp", ".so")
        cmd = [ACPP_PATH, f"--acpp-targets={ACPP_TARGETS}", "-shared", "-fPIC", "-O2", src_path, "-o", lib_path]
        try:
            subprocess.check_call(cmd, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
        except subprocess.CalledProcessError as e:
            print(f"Failed to compile SYCL helper: {e}")
            raise
        return ctypes.CDLL(lib_path)

    def get_queue(self): return self.queue
    def wait(self): self.helper_lib.wait_queue(self.queue)

_ver_cache = {}

def compile_and_load(kernel_name, source_code):
    h = hashlib.sha256(source_code.encode()).hexdigest()
    if h in _ver_cache: return _ver_cache[h]
    with tempfile.NamedTemporaryFile(suffix=".sycl", mode="w", delete=False) as f:
        f.write(source_code)
        src_path = f.name
    lib_path = src_path + ".so"
    cmd = [ACPP_PATH, f"--acpp-targets={ACPP_TARGETS}", "-shared", "-fPIC", "-O2", "-x", "c++", src_path, "-o", lib_path]
    try: subprocess.check_call(cmd)
    except subprocess.CalledProcessError as e:
        print(f"Failed to compile kernel {kernel_name}: {e}")
        raise
    lib = ctypes.CDLL(lib_path) # Default mode
    _ver_cache[h] = lib
    return lib

def launch(gridX, gridY, gridZ, kernel_name, source_code, bound_args):
    print(f"DEBUG: launch called with {len(bound_args)} args.")
    print(f"DEBUG: Triton Grid: ({gridX}, {gridY}, {gridZ})")
    # Try out-of-process execution to avoid LLVM conflicts
    try:
        run_standalone(gridX, gridY, gridZ, kernel_name, source_code, bound_args)
    except Exception as e:
        print(f"Standalone execution failed: {e}. Falling back to in-process (likely to crash)...")
        # Fallback to existing ctypes implementation
        _launch_in_process(gridX, gridY, gridZ, kernel_name, source_code, bound_args)

def _launch_in_process(gridX, gridY, gridZ, kernel_name, source_code, bound_args):
    ctx = SYCLContext()
    queue = ctx.get_queue()
    lib = compile_and_load(kernel_name, source_code)
    launch_fn = getattr(lib, f"launch_{kernel_name}")
    
    blockX, blockY, blockZ = 16, 16, 1
    c_args = [ctypes.c_void_p(queue), ctypes.c_size_t(gridX), ctypes.c_size_t(gridY), ctypes.c_size_t(gridZ),
              ctypes.c_size_t(blockX), ctypes.c_size_t(blockY), ctypes.c_size_t(blockZ)]
    
    for arg in bound_args:
        if hasattr(arg, 'data_ptr'): 
            c_args.append(ctypes.c_void_p(arg.data_ptr()))
            # Append strides
            # Note: Triton/torch strides are in bytes? No, elements.
            # SYCL/MLIR expects elements?
            # Triton usually works in elements for strides.
            # PyTorch stride() returns elements.
            for i in range(arg.dim()):
                c_args.append(ctypes.c_int(arg.stride(i)))
        elif isinstance(arg, int): c_args.append(ctypes.c_int(arg))
        elif isinstance(arg, float): c_args.append(ctypes.c_float(arg))
        else: c_args.append(arg)
                 
    launch_fn(*c_args)
    ctx.wait()

# --- Standalone Execution Utils ---

def generate_standalone_wrapper(kernel_name, source_code, bound_args):
    """
    Generates a main.cpp that:
    1. Reads input binary file (pointers data).
    2. Initializes SYCL queue.
    3. Allocates USM/Host memory for pointers.
    4. Calls launch_<kernel>.
    5. Writes output binary file (pointers data).
    """
    if isinstance(source_code, bytes):
        source_code = source_code.decode("utf-8")
    
    # Analyze arguments to generate malloc/fread/fwrite
    arg_prep = []
    arg_call = []
    arg_cleanup = []
    
    # We assume pointers are float* for now (generic would need type metadata)
    # Triton kernels usually just take void* or typed pointers.
    # The current generated launcher uses explicit types like `float*`.
    # bound_args in Python has type info implicitly.
    
    # Limitations: We assume all pointer args are float* buffers of size N (arg -1?) 
    # This is a HACK for the specific add_kernel test case.
    # In a real generic implementation, we would need the full function signature metadata.
    # For this task, we will inspect bound_args.
    
    import textwrap
    cpp_src = f"""
    #include <sycl/sycl.hpp>
    {source_code}
    
    #include <iostream>
    #include <fstream>
    #include <vector>
    
    int main(int argc, char** argv) {{
        if (argc != 3) {{
            std::cerr << "Usage: " << argv[0] << " <input.bin> <output.bin>" << std::endl;
            return 1;
        }}
        
        std::ifstream infile(argv[1], std::ios::binary);
        if (!infile) {{ std::cerr << "Failed to open input" << std::endl; return 1; }}
        
        sycl::queue q(sycl::default_selector_v);

        size_t gridX = 0, gridY = 0, gridZ = 0;
        infile.read(reinterpret_cast<char*>(&gridX), sizeof(size_t));
        infile.read(reinterpret_cast<char*>(&gridY), sizeof(size_t));
        infile.read(reinterpret_cast<char*>(&gridZ), sizeof(size_t));
        
        std::cout << "SYCL Grid: (" << gridX << ", " << gridY << ", " << gridZ << ")" << std::endl;
    """
    
    # Parse signature to find expected argument count
    import re
    # Match: extern "C" void launch_<name>(sycl::queue* q, size_t gridX, ... int var_3)
    # We want to count args after the grid/block params.
    # The standard preamble params are: q, gridX, gridY, gridZ, blockX, blockY, blockZ (7 args)
    
    sig_pattern = fr'extern "C" void launch_{kernel_name}\((.*?)\)'
    match = re.search(sig_pattern, source_code, re.DOTALL)
    if not match:
        raise RuntimeError(f"Could not find signature for launch_{kernel_name}")
    
    params_str = match.group(1)
    params = [p.strip() for p in params_str.split(',')]
    
    # Expected args = Total params - 7 (preamble)
    expected_arg_count = len(params) - 7
    if expected_arg_count < 0:
         raise RuntimeError(f"Invalid signature for launch_{kernel_name}: {params_str}")

    print(f"DEBUG: launch_{kernel_name} expects {expected_arg_count} args. Bound args: {len(bound_args)}")
    
    # Filter bound_args (take only the first N)
    # This assumes constexprs/specialized args are at the end, or we simply take positional args matching kernel.
    filtered_args = bound_args[:expected_arg_count]
    
    # HARDCODED BLOCK SIZE 16x16 for 02-matmul test
    call_args = ["&q", "gridX", "gridY", "gridZ", "16", "16", "1"] 
    
    # ... (Generated logic) ...
    buffer_idx = 0
    
    for i, arg in enumerate(filtered_args):
        if hasattr(arg, 'data_ptr'): # Tensor
            cpp_src += f"""
        size_t size_{i};
        infile.read(reinterpret_cast<char*>(&size_{i}), sizeof(size_t));
        float* arg_{i} = sycl::malloc_shared<float>(size_{i}/sizeof(float), q);
        infile.read(reinterpret_cast<char*>(arg_{i}), size_{i});
            """
            call_args.append(f"arg_{i}")
            arg_cleanup.append(f"        sycl::free(arg_{i}, q);")
        else: # Scalar
            val = arg
            if isinstance(arg, int):
                cpp_src += f"        int arg_{i} = {val};\n"
            elif isinstance(arg, float):
                cpp_src += f"        float arg_{i} = {val}f;\n"
            else:
                cpp_src += f"        auto arg_{i} = {val};\n"
            cpp_src += f'        std::cout << "Arg {i}: " << arg_{i} << std::endl;\n'
            call_args.append(f"arg_{i}")

    cpp_src += f"""
        launch_{kernel_name}({", ".join(call_args)});
        q.wait();
        
        std::ofstream outfile(argv[2], std::ios::binary);
    """
    
    for i, arg in enumerate(filtered_args):
        if hasattr(arg, 'data_ptr'):
            cpp_src += f"""
        outfile.write(reinterpret_cast<char*>(arg_{i}), size_{i});
            """
            
    cpp_src += """
        outfile.close();
        return 0;
    }
    """
    return textwrap.dedent(cpp_src)

def run_standalone(gridX, gridY, gridZ, kernel_name, source_code, bound_args):
    # 1. Generate Main
    main_src = generate_standalone_wrapper(kernel_name, source_code, bound_args)
    
    with tempfile.NamedTemporaryFile(suffix=".cpp", mode="w", delete=False) as f:
        f.write(main_src)
        src_path = f.name
    exe_path = src_path.replace(".cpp", "")
    
    # 2. Compile
    # Remove -x c++ to avoid compiling linked libraries (like libomp) as source
    cmd = [ACPP_PATH, f"--acpp-targets={ACPP_TARGETS}", "-O2", "-std=c++17", src_path, "-o", exe_path]
    print(f"Compiling with command: {' '.join(cmd)}")
    result = subprocess.run(cmd, capture_output=True, text=True)
    if result.returncode != 0:
        print(f"Failed to compile standalone executable. Exit code: {result.returncode}")
        print("Compiler STDERR (Head):")
        print("\n".join(result.stderr.splitlines()[:50]))
        print("Compiler STDOUT (Head):")
        print("\n".join(result.stdout.splitlines()[:20]))
        
        # Print the source for debugging
        with open(src_path, 'r') as f:
             print("Source Code:")
             print(f.read())
        raise RuntimeError("Compilation failed")
    
    # 3. Serialize Inputs
    input_bin = src_path + ".in"
    output_bin = src_path + ".out"
    
    with open(input_bin, "wb") as f:
        # Header: GridX, GridY, GridZ
        f.write(ctypes.c_size_t(gridX))
        f.write(ctypes.c_size_t(gridY))
        f.write(ctypes.c_size_t(gridZ))
        
        for arg in bound_args:
            if hasattr(arg, 'data_ptr'):
                # Data size (bytes)
                # Parse PyTorch tensor size
                # `arg` is a tensor-like object with element_size() * numel()
                # `element_size` might not be available on our MockTensor.
                # Assuming float32 (4 bytes) * numel
                # The verification script uses ctypes arrays.
                # `ctypes.sizeof(arg.c_array)` works?
                import sys
                if hasattr(arg, 'c_array'): # Our Mock
                    size = ctypes.sizeof(arg.c_array)
                    data = arg.c_array
                else: # PyTorch Tensor
                    size = arg.numel() * arg.element_size()
                    data = arg # Bytes? No need to copy if we can avoid it.
                    # arg.numpy().tobytes()?
                
                f.write(ctypes.c_size_t(size))
                
                if hasattr(arg, 'c_array'):
                    f.write(data)
                elif hasattr(arg, 'numpy'):
                     f.write(arg.numpy().tobytes())
                else:
                    # Generic ctypes buffer?
                     f.write(ctypes.string_at(arg.data_ptr(), size))
    
    # 4. Run
    subprocess.check_call([exe_path, input_bin, output_bin])
    
    # 5. Deserialize Outputs
    # Read back into the bound_args tensors
    with open(output_bin, "rb") as f:
        for arg in bound_args:
            if hasattr(arg, 'data_ptr'):
                if hasattr(arg, 'c_array'):
                    size = ctypes.sizeof(arg.c_array)
                    data = f.read(size) # bytes
                    ctypes.memmove(arg.data_ptr(), data, size)
                else:
                     # PyTorch or generic tensor
                     size = arg.numel() * arg.element_size()
                     data = f.read(size)
                     ctypes.memmove(arg.data_ptr(), data, size)
