#include "mlir/Pass/Pass.h"
#include "mlir/Pass/PassManager.h"
#include "mlir/Transforms/Passes.h"
#include "llvm/Support/TargetSelect.h"

#include "mlir/Dialect/Affine/IR/AffineOps.h"
#include "mlir/Dialect/Arith/Transforms/BufferizableOpInterfaceImpl.h"
#include "mlir/Dialect/Bufferization/IR/Bufferization.h"
#include "mlir/Dialect/Bufferization/Transforms/FuncBufferizableOpInterfaceImpl.h"
#include "mlir/Dialect/Bufferization/Transforms/Passes.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/Dialect/Func/Extensions/InlinerExtension.h"
#include "mlir/Dialect/GPU/IR/GPUDialect.h"
#include "mlir/Dialect/Linalg/IR/Linalg.h"
#include "mlir/Dialect/Linalg/Transforms/BufferizableOpInterfaceImpl.h"
#include "mlir/Dialect/MemRef/Transforms/AllocationOpInterfaceImpl.h"
#include "mlir/Dialect/MemRef/IR/MemRef.h"
#include "mlir/Dialect/SCF/IR/SCF.h"
#include "mlir/Dialect/SCF/Transforms/BufferizableOpInterfaceImpl.h"
#include "mlir/Dialect/Tensor/Transforms/BufferizableOpInterfaceImpl.h"
#include "mlir/Dialect/Tensor/IR/Tensor.h"
#include "sycl/include/Conversion/LinalgToAffineLoops/Passes.h"
#include "sycl/include/Conversion/TritonToLinalg/Passes.h"
#include <pybind11/pybind11.h>
#include <pybind11/stl.h>
#include <pybind11/stl_bind.h>

namespace py = pybind11;

void init_triton_sycl_passes_lair(py::module &&m) {
  m.def("elementwise_fusion", [](mlir::PassManager &pm) {
    pm.addPass(mlir::triton::sycl::createElementwiseFusionPass());
  });
  m.def("triton_to_linalg", [](mlir::PassManager &pm) {
    pm.addPass(mlir::triton::sycl::createTritonToLinalgPass());
  });
}

void init_triton_sycl_passes_memir(py::module &&m) {
  m.def("terminal_store_distribution", [](mlir::PassManager &pm) {
    pm.addPass(mlir::triton::sycl::createTerminalStoreDistributionPass());
  });
  m.def("cooperative_load_staging", [](mlir::PassManager &pm) {
    pm.addPass(mlir::triton::sycl::createCooperativeLoadStagingPass());
  });
  m.def("accumulator_init_forwarding", [](mlir::PassManager &pm) {
    pm.addPass(mlir::triton::sycl::createAccumulatorInitForwardingPass());
  });
  m.def("ordered_reduction_unroll", [](mlir::PassManager &pm, unsigned factor) {
    pm.addPass(mlir::triton::sycl::createOrderedReductionUnrollPass(factor));
  }, py::arg("pm"), py::arg("factor") = 4);
  m.def("vector_memory", [](mlir::PassManager &pm) {
    pm.addPass(mlir::triton::sycl::createVectorMemoryPass());
  });
  m.def("work_distribution", [](mlir::PassManager &pm) {
    pm.addPass(mlir::triton::sycl::createWorkDistributionPass());
  });
  m.def("matmul_register_tiling", [](mlir::PassManager &pm) {
    pm.addPass(mlir::triton::sycl::createMatmulRegisterTilingPass());
  });
  m.def("register_accumulator", [](mlir::PassManager &pm) {
    pm.addPass(mlir::triton::sycl::createRegisterAccumulatorPass());
  });
  m.def("group_reduction", [](mlir::PassManager &pm) {
    pm.addPass(mlir::triton::sycl::createGroupReductionPass());
  });
  m.def("one_shot_bufferize", [](mlir::PassManager &pm) {
    pm.addPass(mlir::bufferization::createOneShotBufferizePass());
  });
  m.def("linalg_to_affine_loops", [](mlir::PassManager &pm) {
    pm.addPass(mlir::triton::sycl::createLinalgToAffineLoopsPass());
  });
  m.def("local_memory_reuse", [](mlir::PassManager &pm) {
    pm.addPass(mlir::triton::sycl::createLocalMemoryReusePass());
  });
  m.def("buffer_loop_hoisting", [](mlir::PassManager &pm) {
    mlir::OpPassManager &funcPM = pm.nest<mlir::func::FuncOp>();
    funcPM.addPass(mlir::bufferization::createBufferLoopHoistingPass());
  });
}

void init_triton_sycl(py::module &&m) {
  auto passes = m.def_submodule("passes");
  init_triton_sycl_passes_lair(passes.def_submodule("lair"));

  // load dialects
  m.def("load_dialects", [](mlir::MLIRContext &context) {
    mlir::DialectRegistry registry;
    registry.insert<mlir::affine::AffineDialect, mlir::arith::ArithDialect,
                    mlir::bufferization::BufferizationDialect,
                    mlir::func::FuncDialect, mlir::gpu::GPUDialect,
                    mlir::linalg::LinalgDialect, mlir::memref::MemRefDialect,
                    mlir::scf::SCFDialect, mlir::tensor::TensorDialect>();
    mlir::func::registerInlinerExtension(registry);
    mlir::bufferization::func_ext::
        registerBufferizableOpInterfaceExternalModels(registry);
    mlir::arith::registerBufferizableOpInterfaceExternalModels(registry);
    mlir::linalg::registerBufferizableOpInterfaceExternalModels(registry);
    mlir::tensor::registerBufferizableOpInterfaceExternalModels(registry);
    mlir::scf::registerBufferizableOpInterfaceExternalModels(registry);
    mlir::memref::registerAllocationOpInterfaceExternalModels(registry);
    context.appendDialectRegistry(registry);
    context.loadAllAvailableDialects();
  });

  init_triton_sycl_passes_memir(passes.def_submodule("memir"));
}
