#ifndef TRITON_SYCL_CONVERSION_TRITONTOLINALG_PASSES_H
#define TRITON_SYCL_CONVERSION_TRITONTOLINALG_PASSES_H

#include "mlir/Pass/Pass.h"
#include "mlir/Transforms/DialectConversion.h"

namespace mlir {
class ModuleOp;
template <typename T> class OperationPass;

namespace triton::sycl {

#define GEN_PASS_DECL
#include "sycl/include/Conversion/TritonToLinalg/Passes.h.inc"

std::unique_ptr<OperationPass<ModuleOp>> createTritonToLinalgPass();

#define GEN_PASS_REGISTRATION
#include "sycl/include/Conversion/TritonToLinalg/Passes.h.inc"

} // namespace triton::sycl
} // namespace mlir

#endif
