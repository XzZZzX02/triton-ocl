#ifndef LINALG_TO_AFFINE_LOOPS_CONVERSION_PASSES_H
#define LINALG_TO_AFFINE_LOOPS_CONVERSION_PASSES_H

#include "mlir/Pass/Pass.h"
#include "mlir/Transforms/DialectConversion.h"

namespace mlir {
class ModuleOp;
namespace affine { class AffineForOp; }
template <typename T> class OperationPass;

namespace triton::sycl {

#define GEN_PASS_DECL
#include "sycl/include/Conversion/LinalgToAffineLoops/Passes.h.inc"

std::unique_ptr<OperationPass<ModuleOp>> createLinalgToAffineLoopsPass();
std::unique_ptr<OperationPass<ModuleOp>> createLocalMemoryReusePass();
std::unique_ptr<OperationPass<ModuleOp>> createElementwiseFusionPass();
std::unique_ptr<OperationPass<ModuleOp>> createGroupReductionPass();
std::unique_ptr<OperationPass<ModuleOp>> createRegisterAccumulatorPass();
std::unique_ptr<OperationPass<ModuleOp>> createMatmulRegisterTilingPass();
std::unique_ptr<OperationPass<ModuleOp>> createOrderedReductionUnrollPass(unsigned factor);
std::unique_ptr<OperationPass<ModuleOp>> createAccumulatorInitForwardingPass();
std::unique_ptr<OperationPass<ModuleOp>> createWorkDistributionPass();
std::unique_ptr<OperationPass<ModuleOp>> createCooperativeLoadStagingPass();
std::unique_ptr<OperationPass<ModuleOp>> createVectorMemoryPass();
std::unique_ptr<OperationPass<ModuleOp>> createTerminalStoreDistributionPass();
// Re-prove marked external stores after another pass rebuilds work ownership.
bool planTerminalStoreDistribution(affine::AffineForOp loop);

#define GEN_PASS_REGISTRATION
#include "sycl/include/Conversion/LinalgToAffineLoops/Passes.h.inc"

} // namespace triton::sycl
} // namespace mlir

#endif
