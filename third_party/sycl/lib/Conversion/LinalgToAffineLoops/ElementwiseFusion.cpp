#include "sycl/include/Conversion/LinalgToAffineLoops/Passes.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/Dialect/Linalg/IR/Linalg.h"
#include "mlir/Dialect/Linalg/Transforms/Transforms.h"
#include "mlir/Interfaces/SideEffectInterfaces.h"
#include "mlir/Transforms/GreedyPatternRewriteDriver.h"

using namespace mlir;
namespace {
// Fuse only single-use, same-domain elementwise producers. Identity maps avoid
// rematerialization through broadcasts/permutations. Upstream Linalg patterns
// retain operation order and indexing; no reassociation or fast math is added.
struct ElementwiseFusionPass
    : PassWrapper<ElementwiseFusionPass, OperationPass<ModuleOp>> {
  MLIR_DEFINE_EXPLICIT_INTERNAL_INLINE_TYPE_ID(ElementwiseFusionPass)
  StringRef getArgument() const final { return "sycl-elementwise-fusion"; }
  StringRef getDescription() const final { return "Fuse single-use elementwise tensor producers without rematerialization"; }
  void runOnOperation() override {
    RewritePatternSet patterns(&getContext());
    linalg::populateElementwiseOpsFusionPatterns(patterns, [](OpOperand *operand) {
      auto consumer = dyn_cast<linalg::GenericOp>(operand->getOwner());
      auto producer = operand->get().getDefiningOp<linalg::GenericOp>();
      if (!producer || !consumer || !operand->get().hasOneUse() ||
          producer->getNumResults() != 1 || !producer.hasPureTensorSemantics() ||
          !consumer.hasPureTensorSemantics() ||
          producer.getNumLoops() != consumer.getNumLoops() ||
          producer.getNumReductionLoops() || consumer.getNumReductionLoops()) return false;
      for (auto op : {producer, consumer}) {
        for (auto map : op.getIndexingMapsArray()) if (!map.isIdentity()) return false;
        for (Operation &inner : op.getRegion().front().without_terminator())
          if (!isMemoryEffectFree(&inner) || inner.getNumRegions()) return false;
      }
      return true;
    });
    if (failed(applyPatternsGreedily(getOperation(), std::move(patterns)))) signalPassFailure();
  }
};
}
namespace mlir::triton::sycl {
std::unique_ptr<OperationPass<ModuleOp>> createElementwiseFusionPass() {
  return std::make_unique<ElementwiseFusionPass>();
}
}
