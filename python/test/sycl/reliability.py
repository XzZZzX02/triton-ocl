"""Host-only failure contracts; run directly with python, no device required."""
import importlib.util
import pathlib
import subprocess
import tempfile
import unittest
from unittest import mock
import ctypes

ROOT = pathlib.Path(__file__).resolve().parents[3]
spec=importlib.util.spec_from_file_location('sycl_runtime_under_test',ROOT/'third_party/sycl/backend/sycl_utils.py')
runtime=importlib.util.module_from_spec(spec)
import sys
sys.modules[spec.name]=runtime
spec.loader.exec_module(runtime)


class RuntimeFailureTests(unittest.TestCase):
    def test_no_automatic_inprocess_fallback(self):
        with mock.patch.dict('os.environ',{},clear=True), mock.patch.object(runtime,'run_standalone',side_effect=RuntimeError('device failed')), mock.patch.object(runtime,'_launch_in_process') as fallback:
            with self.assertRaisesRegex(RuntimeError,'device failed'):
                runtime.launch(1,1,1,'kernel','source',[])
            fallback.assert_not_called()

    def test_explicit_legacy_fallback(self):
        with mock.patch.dict('os.environ',{'TRITON_SYCL_ENABLE_INPROCESS_FALLBACK':'1'},clear=True), mock.patch.object(runtime,'run_standalone',side_effect=RuntimeError('device failed')), mock.patch.object(runtime,'_launch_in_process') as fallback:
            runtime.launch(1,1,1,'kernel','source',[])
            fallback.assert_called_once()

    def test_bad_grid(self):
        for grid in ((0,1,1),(-1,2,3)):
            with self.assertRaisesRegex(ValueError,'grid dimensions'):
                runtime.launch(*grid,'kernel','source',[])

    def test_child_signal_diagnostic(self):
        with mock.patch.object(runtime.subprocess,'run',return_value=subprocess.CompletedProcess([], -11, '', 'fault detail')):
            with self.assertRaisesRegex(RuntimeError,'exit -11.*'):
                runtime._run_executable('exe','in','out')

    def test_child_timeout(self):
        with mock.patch.object(runtime.subprocess,'run',side_effect=subprocess.TimeoutExpired([],1)):
            with self.assertRaisesRegex(RuntimeError,'timed out'):
                runtime._run_executable('exe','in','out')

    def test_compiler_failure(self):
        with mock.patch.object(runtime.subprocess,'run',return_value=subprocess.CompletedProcess([],1,'','invalid sycl')), mock.patch.object(runtime.tempfile,'gettempdir',return_value=tempfile.mkdtemp()):
            with self.assertRaisesRegex(RuntimeError,'invalid sycl'):
                runtime._standalone_executable('unique deliberately invalid source')

    def test_block_sizes(self):
        for block in ((0,1,1),(-1,1,1),(1,2,3,4)):
            with self.assertRaises((ValueError,TypeError)):
                runtime.resolve_block_size(block_size=block)

    def test_zero_length_backing_buffer(self):
        class Empty:
            c_array = (ctypes.c_float*0)()
            dtype = "float32"
            def data_ptr(self): return ctypes.addressof(self.c_array)
        source = 'extern "C" void launch_kernel(sycl::queue* q, size_t gx, size_t gy, size_t gz, size_t bx, size_t by, size_t bz, float* x) {}'
        wrapper = runtime.generate_standalone_wrapper('kernel',source,[Empty()],signature={0:'*fp32'})
        self.assertIn('std::max<size_t>(1,',wrapper)
        self.assertNotIn('size_0 == 0',wrapper)
        self.assertIn('catch (const std::exception&',wrapper)

    def test_unsupported_dtype(self):
        with self.assertRaisesRegex(TypeError,'unsupported'):
            runtime._type_info('fp8e4nv')


if __name__=='__main__':unittest.main(verbosity=2)
