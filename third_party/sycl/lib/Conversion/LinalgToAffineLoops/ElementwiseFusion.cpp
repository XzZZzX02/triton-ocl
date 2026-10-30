#include "sycl/include/Conversion/LinalgToAffineLoops/Passes.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/Dialect/Linalg/IR/Linalg.h"
#include "mlir/Dialect/Linalg/Transforms/Transforms.h"
#include "mlir/Interfaces/SideEffectInterfaces.h"
#include "mlir/Interfaces/LoopLikeInterface.h"
#include "mlir/Transforms/GreedyPatternRewriteDriver.h"
#include "llvm/ADT/STLExtras.h"

using namespace mlir;
namespace {
// A tensor-carrying loop must yield a buffer equivalent to its iter_arg under
// this backend's one-shot bufferization policy. Do not sever destination ties
// within that loop, including under nested conditionals/loops. Outside it the
// original upstream cleanup remains available, enabling existing fusion wins.
struct GuardLoopDestinations : OpRewritePattern<linalg::GenericOp> {
  GuardLoopDestinations(MLIRContext *context,
                        std::unique_ptr<RewritePattern> original)
      : OpRewritePattern(context, original->getBenefit()),
        original(std::move(original)) {}

  LogicalResult matchAndRewrite(linalg::GenericOp op,
                                PatternRewriter &rewriter) const override {
    for (Operation *parent = op->getParentOp(); parent;
         parent = parent->getParentOp())
      if (isa<LoopLikeOpInterface>(parent) &&
          llvm::any_of(parent->getResultTypes(),
                       [](Type type) { return isa<TensorType>(type); }))
        return failure();
    return original->matchAndRewrite(op.getOperation(), rewriter);
  }

private:
  std::unique_ptr<RewritePattern> original;
};

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
    // The helper installs this cleanup independently of the fusion callback.
    // Guard only its loop case; preserve every other upstream pattern and all
    // standalone behavior. This matches a pinned compiler pattern, not user IR.
    unsigned guarded = 0;
    for (auto &pattern : patterns.getNativePatterns()) {
      if (!pattern->getDebugName().ends_with("RemoveOutsDependency")) continue;
      pattern = RewritePattern::create<GuardLoopDestinations>(
          &getContext(), std::move(pattern));
      ++guarded;
    }
    if (guarded != 1) {
      getOperation().emitError("SYCL fusion expected one upstream "
                               "RemoveOutsDependency pattern; revalidate the "
                               "destination-preservation guard after LLVM changes");
      signalPassFailure();
      return;
    }
    if (failed(applyPatternsGreedily(getOperation(), std::move(patterns)))) signalPassFailure();
  }
};
}
namespace mlir::triton::sycl {
std::unique_ptr<OperationPass<ModuleOp>> createElementwiseFusionPass() {
  return std::make_unique<ElementwiseFusionPass>();
}
}
