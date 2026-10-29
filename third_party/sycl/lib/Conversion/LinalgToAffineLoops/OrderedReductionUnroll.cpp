#include "sycl/include/Conversion/LinalgToAffineLoops/Passes.h"
#include "mlir/Dialect/Arith/IR/Arith.h"
#include "mlir/Dialect/MemRef/IR/MemRef.h"
#include "mlir/Dialect/SCF/IR/SCF.h"
#include "mlir/IR/BuiltinOps.h"
#include "mlir/IR/IRMapping.h"
#include "mlir/Interfaces/SideEffectInterfaces.h"
#include "llvm/ADT/STLExtras.h"

using namespace mlir;
namespace {
// Expand consecutive iterations of a proven private recurrence. The second
// copy consumes the first copy's yield, including for tuple accumulators.
// There are no partial sums, speculative iterations, or fast-math flags.
struct OrderedReductionUnrollPass
    : PassWrapper<OrderedReductionUnrollPass, OperationPass<ModuleOp>> {
  MLIR_DEFINE_EXPLICIT_INTERNAL_INLINE_TYPE_ID(OrderedReductionUnrollPass)
  explicit OrderedReductionUnrollPass(unsigned factor) : factor(factor) {}
  StringRef getArgument() const final { return "sycl-ordered-reduction-unroll"; }
  StringRef getDescription() const final {
    return "Partially unroll private reductions while retaining SSA update order";
  }
  void getDependentDialects(DialectRegistry &registry) const override {
    registry.insert<arith::ArithDialect, scf::SCFDialect>();
  }
  void runOnOperation() override {
    // This is an explicit schedule parameter, not a workload-name heuristic.
    // Bound expansion and register pressure; no automatic profitability claim.
    if (factor == 1)
      return;
    if (factor != 2 && factor != 4 && factor != 8) {
      getOperation().emitError("SYCL ordered reduction unroll factor must be 1, 2, 4, or 8");
      signalPassFailure();
      return;
    }
    SmallVector<scf::ForOp> candidates;
    getOperation().walk([&](scf::ForOp loop) {
      if (loop->hasAttr("sycl.thread_private") &&
          loop->hasAttr("sycl.register_accumulator") &&
          !loop->hasAttr("sycl.ordered_reduction_unroll"))
        candidates.push_back(loop);
    });
    for (auto loop : candidates) {
      auto lower = loop.getLowerBound().getDefiningOp<arith::ConstantIndexOp>();
      auto upper = loop.getUpperBound().getDefiningOp<arith::ConstantIndexOp>();
      auto step = loop.getStep().getDefiningOp<arith::ConstantIndexOp>();
      auto yield = dyn_cast<scf::YieldOp>(loop.getBody()->getTerminator());
      if (!lower || !upper || !step || !yield || lower.value() < 0 ||
          upper.value() <= lower.value() || step.value() != 1 ||
          (upper.value() - lower.value()) % factor ||
          (upper.value() - lower.value()) / factor < 2 ||
          loop.getInitArgs().empty() || loop.getInitArgs().size() > 8)
        continue;
      bool legal = true;
      unsigned bodySize = 0;
      for (Operation &op : loop.getBody()->without_terminator()) {
        ++bodySize;
        if (auto load = dyn_cast<memref::LoadOp>(&op)) {
          if (!load.getMemRef().getDefiningOp<memref::AllocOp>())
            legal = false;
        } else if (op.getNumRegions() || !isMemoryEffectFree(&op) ||
                   op.getName().getDialectNamespace() != "arith") {
          legal = false;
        }
      }
      if (!legal || !bodySize || bodySize * factor > 256)
        continue;

      OpBuilder builder(loop);
      auto loc = loop.getLoc();
      Value newStep = builder.create<arith::ConstantIndexOp>(loc, factor);
      auto expanded = builder.create<scf::ForOp>(
          loc, loop.getLowerBound(), loop.getUpperBound(), newStep,
          loop.getInitArgs(),
          [&](OpBuilder &nested, Location here, Value iv, ValueRange initial) {
            SmallVector<Value> carry(initial.begin(), initial.end());
            for (unsigned lane = 0; lane < factor; ++lane) {
              IRMapping mapping;
              Value index = iv;
              if (lane) {
                Value offset = nested.create<arith::ConstantIndexOp>(here, lane);
                index = nested.create<arith::AddIOp>(here, iv, offset);
              }
              mapping.map(loop.getInductionVar(), index);
              mapping.map(loop.getRegionIterArgs(), ValueRange(carry));
              for (Operation &op : loop.getBody()->without_terminator())
                nested.clone(op, mapping);
              carry.clear();
              for (Value value : yield.getOperands())
                carry.push_back(mapping.lookupOrDefault(value));
            }
            nested.create<scf::YieldOp>(here, carry);
          });
      expanded->setAttrs(loop->getAttrs());
      expanded->setAttr("sycl.ordered_reduction_unroll",
                        builder.getI64IntegerAttr(factor));
      loop.replaceAllUsesWith(expanded.getResults());
      loop.erase();
    }
  }
  unsigned factor;
};
} // namespace
namespace mlir::triton::sycl {
std::unique_ptr<OperationPass<ModuleOp>>
createOrderedReductionUnrollPass(unsigned factor) {
  return std::make_unique<OrderedReductionUnrollPass>(factor);
}
} // namespace mlir::triton::sycl
