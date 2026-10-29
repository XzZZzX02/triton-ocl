#include "sycl/include/Conversion/LinalgToAffineLoops/Passes.h"
#include "mlir/Dialect/Affine/IR/AffineOps.h"
#include "mlir/Dialect/Arith/IR/Arith.h"
#include "mlir/Dialect/SCF/IR/SCF.h"
#include "mlir/IR/BuiltinOps.h"
#include "llvm/ADT/STLExtras.h"
#include <cstdint>

using namespace mlir;
namespace {
static bool isTotalIntegerCompute(Operation *op) {
  if (op->getNumRegions() != 0 || op->getNumResults() != 1)
    return false;

  Type resultType = op->getResult(0).getType();
  if (!isa<IntegerType, IndexType>(resultType))
    return false;
  for (NamedAttribute attr : op->getAttrs()) {
    auto name = attr.getName().strref();
    if (name == "sycl.loop_invariant_hoisted")
      continue;
    if (name == "overflowFlags" &&
        isa<arith::AddIOp, arith::SubIOp, arith::MulIOp>(op)) {
      auto flags = dyn_cast<arith::IntegerOverflowFlagsAttr>(attr.getValue());
      if (flags && flags.getValue() == arith::IntegerOverflowFlags::none)
        continue;
    }
    if (name == "map" && isa<affine::AffineApplyOp>(op))
      continue;
    if (name == "predicate" && isa<arith::CmpIOp>(op))
      continue;
    return false;
  }
  return isa<affine::AffineApplyOp, arith::CmpIOp, arith::AddIOp,
             arith::SubIOp, arith::MulIOp, arith::AndIOp, arith::OrIOp,
             arith::XOrIOp, arith::IndexCastOp, arith::ExtSIOp,
             arith::ExtUIOp, arith::TruncIOp>(op);
}

static bool hasProfitableStaticTripCount(affine::AffineForOp loop) {
  int64_t step = loop.getStep().getSExtValue();
  if (!loop.hasConstantBounds() || step <= 0)
    return false;
  int64_t lower = loop.getConstantLowerBound();
  int64_t upper = loop.getConstantUpperBound();
  if (upper <= lower)
    return false;
  uint64_t span = static_cast<uint64_t>(upper) - static_cast<uint64_t>(lower);
  return span / static_cast<uint64_t>(step) >= 2;
}

static bool hasProfitableStaticTripCount(scf::ForOp loop) {
  auto lower = loop.getLowerBound().getDefiningOp<arith::ConstantOp>();
  auto upper = loop.getUpperBound().getDefiningOp<arith::ConstantOp>();
  auto step = loop.getStep().getDefiningOp<arith::ConstantOp>();
  if (!lower || !upper || !step)
    return false;
  auto l = dyn_cast<IntegerAttr>(lower.getValue());
  auto u = dyn_cast<IntegerAttr>(upper.getValue());
  auto s = dyn_cast<IntegerAttr>(step.getValue());
  if (!l || !u || !s || s.getInt() <= 0 || u.getInt() <= l.getInt())
    return false;
  uint64_t span = static_cast<uint64_t>(u.getInt()) - static_cast<uint64_t>(l.getInt());
  return span / static_cast<uint64_t>(s.getInt()) >= 2;
}

template <typename LoopOp> static bool hoistCompute(LoopOp loop) {
  if (!hasProfitableStaticTripCount(loop) || loop->hasAttr("sycl.parallel") ||
      loop->hasAttr("sycl.distribute"))
    return false;
  SmallVector<Operation *> body;
  for (Operation &op : loop.getBody()->without_terminator())
    body.push_back(&op);
  bool changed = false;
  for (Operation *op : body) {
    if (!isTotalIntegerCompute(op) ||
        !llvm::all_of(op->getOperands(), [&](Value operand) {
          return loop.isDefinedOutsideOfLoop(operand);
        }))
      continue;
    op->setAttr("sycl.loop_invariant_hoisted", UnitAttr::get(op->getContext()));
    op->moveBefore(loop);
    changed = true;
  }
  return changed;
}

struct LoopInvariantComputeHoistingPass
    : PassWrapper<LoopInvariantComputeHoistingPass, OperationPass<ModuleOp>> {
  MLIR_DEFINE_EXPLICIT_INTERNAL_INLINE_TYPE_ID(LoopInvariantComputeHoistingPass)
  StringRef getArgument() const final {
    return "sycl-loop-invariant-compute-hoisting";
  }
  StringRef getDescription() const final {
    return "Hoist invariant total integer computations from static serial loops";
  }
  void getDependentDialects(DialectRegistry &registry) const override {
    registry.insert<affine::AffineDialect, arith::ArithDialect, scf::SCFDialect>();
  }
  void runOnOperation() override {
    bool changed;
    do {
      changed = false;
      getOperation().walk([&](affine::AffineForOp loop) { changed |= hoistCompute(loop); });
      getOperation().walk([&](scf::ForOp loop) { changed |= hoistCompute(loop); });
    } while (changed);
  }
};
} // namespace

namespace mlir::triton::sycl {
std::unique_ptr<OperationPass<ModuleOp>>
createLoopInvariantComputeHoistingPass() {
  return std::make_unique<LoopInvariantComputeHoistingPass>();
}
} // namespace mlir::triton::sycl
