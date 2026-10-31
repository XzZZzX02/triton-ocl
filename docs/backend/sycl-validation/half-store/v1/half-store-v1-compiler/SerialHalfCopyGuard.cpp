#include "sycl/include/Conversion/LinalgToAffineLoops/Passes.h"
#include "mlir/Dialect/Affine/IR/AffineOps.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/Dialect/MemRef/IR/MemRef.h"
#include "mlir/IR/BuiltinOps.h"

using namespace mlir;
namespace {
constexpr StringLiteral guard = "sycl.scalar_half_bits";

static bool isLocalHalf(Value value) {
  auto alloc = value.getDefiningOp<memref::AllocOp>();
  return alloc && alloc.getType().getElementType().isF16() &&
         alloc.getType().hasStaticShape() &&
         alloc.getType().getLayout().isIdentity();
}

static bool isExternalHalfOutput(Value value) {
  auto view = value.getDefiningOp<memref::ReinterpretCastOp>();
  if (!view || !view.getType().getElementType().isF16() ||
      view.getType().getRank() != 1 || view.getType().getDimSize(0) != 1)
    return false;
  auto argument = dyn_cast<BlockArgument>(view.getSource());
  if (!argument || !isa<UnrankedMemRefType>(argument.getType()))
    return false;
  auto function = dyn_cast<func::FuncOp>(argument.getOwner()->getParentOp());
  return function && argument.getOwner() == &function.front();
}

static bool isSerialCopy(Operation *load, Operation *store, Value from,
                         Value to, Value value) {
  if (!isLocalHalf(from) ||
      !(isLocalHalf(to) || isExternalHalfOutput(to)) ||
      !value.hasOneUse() ||
      !store->getParentOfType<affine::AffineForOp>())
    return false;
  bool protectedOutput = false;
  for (Operation *parent = store->getParentOp(); parent;
       parent = parent->getParentOp())
    if (parent->hasAttr("sycl.distribute")) {
      if (!parent->hasAttr("sycl.half_store_distribution") ||
          !isExternalHalfOutput(to))
        return false;
      protectedOutput = true;
    }
  if (!protectedOutput && load->getBlock() != store->getBlock())
    return false;
  return true;
}

// AdaptiveCpp 25.10 SSCP on gfx906 corrupts some serial local binary16
// transposes and serial local-to-external copies even when loop vectorization
// and interleaving are disabled.
// Volatile accesses to the actual uint16_t storage member preserve the copy.
// This is a code-generation correctness guard, not a floating-point conversion
// or a scheduling optimization. Run after scheduling so proven distributed
// copies retain their normal emission. Replanning makes the pass idempotent
// and removes stale guards when a caller has changed work ownership.
struct SerialHalfCopyGuardPass
    : PassWrapper<SerialHalfCopyGuardPass, OperationPass<ModuleOp>> {
  MLIR_DEFINE_EXPLICIT_INTERNAL_INLINE_TYPE_ID(SerialHalfCopyGuardPass)
  StringRef getArgument() const final { return "sycl-serial-half-copy-guard"; }
  StringRef getDescription() const final {
    return "Preserve serial local IEEE binary16 copies in SYCL emission";
  }
  void runOnOperation() override {
    auto module = getOperation();
    module.walk([](Operation *op) { op->removeAttr(guard); });
    module.walk([&](Operation *op) {
      Value value, to;
      if (auto store = dyn_cast<affine::AffineStoreOp>(op)) {
        value = store.getValueToStore();
        to = store.getMemRef();
      } else if (auto store = dyn_cast<memref::StoreOp>(op)) {
        value = store.getValueToStore();
        to = store.getMemRef();
      } else return;
      Value from;
      auto *load = value.getDefiningOp();
      if (auto read = dyn_cast_or_null<affine::AffineLoadOp>(load))
        from = read.getMemRef();
      else if (auto read = dyn_cast_or_null<memref::LoadOp>(load))
        from = read.getMemRef();
      else return;
      if (!isSerialCopy(load, op, from, to, value)) return;
      auto attr = UnitAttr::get(&getContext());
      load->setAttr(guard, attr);
      op->setAttr(guard, attr);
    });
  }
};
} // namespace

std::unique_ptr<OperationPass<ModuleOp>>
mlir::triton::sycl::createSerialHalfCopyGuardPass() {
  return std::make_unique<SerialHalfCopyGuardPass>();
}
