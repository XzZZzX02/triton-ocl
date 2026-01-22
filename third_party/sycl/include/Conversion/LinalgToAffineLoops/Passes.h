#ifndef LINALG_TO_AFFINE_LOOPS_CONVERSION_PASSES_H
#define LINALG_TO_AFFINE_LOOPS_CONVERSION_PASSES_H

#include "mlir/Pass/Pass.h"
#include "mlir/Transforms/DialectConversion.h"

namespace mlir {
class ModuleOp;
template <typename T> class OperationPass;

namespace triton::sycl {

#define GEN_PASS_DECL
#include "sycl/include/Conversion/LinalgToAffineLoops/Passes.h.inc"

std::unique_ptr<OperationPass<ModuleOp>> createLinalgToAffineLoopsPass();

#define GEN_PASS_REGISTRATION
#include "sycl/include/Conversion/LinalgToAffineLoops/Passes.h.inc"

} // namespace triton::sycl
} // namespace mlir

#endif
