#include "mlir/Dialect/Linalg/IR/Linalg.h"
#include "mlir/Dialect/Linalg/Transforms/Transforms.h"
#include "mlir/Pass/PassManager.h"
#include "mlir/Transforms/Passes.h"
#include "sycl/include/Conversion/LinalgToAffineLoops/Passes.h"
#include "llvm/ADT/SmallVector.h"
#include "llvm/Support/Debug.h"

#define DEBUG_TYPE "linalg-to-affine-loops"

namespace mlir::triton::sycl {
#define GEN_PASS_DEF_LINALGTOAFFINELOOPS
#include "sycl/include/Conversion/LinalgToAffineLoops/Passes.h.inc"
} // namespace mlir::triton::sycl

using namespace mlir;
using namespace mlir::triton;
using namespace mlir::triton::sycl;

namespace {

struct LinalgToAffineLoops
    : public mlir::triton::sycl::impl::LinalgToAffineLoopsBase<
          LinalgToAffineLoops> {

  void runOnOperation() override {
    auto moduleOp = getOperation();
    SmallVector<linalg::LinalgOp> linalgOps;
    moduleOp.walk(
        [&](linalg::GenericOp genericOp) { linalgOps.push_back(genericOp); });
    moduleOp.walk([&](linalg::FillOp fillOp) { linalgOps.push_back(fillOp); });
    PatternRewriter rewriter(&getContext());
    for (auto linalgOp : linalgOps) {
      rewriter.setInsertionPoint(linalgOp);
      auto loops = linalg::linalgOpToAffineLoops(rewriter, linalgOp);
      if (failed(loops)) {
        linalgOp.emitError("failed to lower to affine loops");
        signalPassFailure();
        return;
      }
      if (auto axis = linalgOp->getAttrOfType<IntegerAttr>("sycl.reduction_axis"))
        (*loops)[axis.getInt()]->setAttr("sycl.reduction", rewriter.getUnitAttr());
      for (auto [index, iterator] : llvm::enumerate(linalgOp.getIteratorTypesArray()))
        if (iterator == utils::IteratorType::parallel)
          (*loops)[index]->setAttr("sycl.parallel", rewriter.getUnitAttr());
      rewriter.eraseOp(linalgOp);
    }
  }
};

} // namespace

namespace mlir::triton::sycl {

std::unique_ptr<OperationPass<ModuleOp>> createLinalgToAffineLoopsPass() {
  return std::make_unique<LinalgToAffineLoops>();
}

} // namespace mlir::triton::sycl
