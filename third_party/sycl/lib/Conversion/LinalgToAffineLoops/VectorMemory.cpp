#include "sycl/include/Conversion/LinalgToAffineLoops/Passes.h"
#include "mlir/Dialect/Affine/IR/AffineOps.h"
#include "mlir/Dialect/Arith/IR/Arith.h"
#include "mlir/Dialect/MemRef/IR/MemRef.h"
#include "mlir/IR/BuiltinOps.h"
#include "mlir/Interfaces/ViewLikeInterface.h"
#include "mlir/Dialect/Utils/StaticValueUtils.h"
using namespace mlir;
namespace {
struct VectorMemoryPass : PassWrapper<VectorMemoryPass, OperationPass<ModuleOp>> {
  MLIR_DEFINE_EXPLICIT_INTERNAL_INLINE_TYPE_ID(VectorMemoryPass)
  StringRef getArgument() const final { return "sycl-vector-memory"; }
  StringRef getDescription() const final { return "Plan experimental unit-stride four-element copies"; }
  void runOnOperation() override {
    getOperation().walk([&](affine::AffineForOp loop) {
      loop->removeAttr("sycl.vector_copy");
  if (loop->getParentOfType<affine::AffineForOp>() || !loop.hasConstantBounds() ||
      loop.getConstantLowerBound() != 0 || loop.getStep() != 1 ||
      loop.getConstantUpperBound() % 4 != 0) return;
  if (!loop->hasAttr("sycl.distribute")) return;
  memref::LoadOp load;
  memref::StoreOp store;
  for (Operation &inner : loop.getBody()->without_terminator()) {
    if (auto read = dyn_cast<memref::LoadOp>(inner)) {
      if (load) return;
      load = read;
    } else if (auto write = dyn_cast<memref::StoreOp>(inner)) {
      if (store) return;
      store = write;
    } else if (!isa<memref::ReinterpretCastOp>(inner) &&
               inner.getName().getDialectNamespace() != "arith") return;
  }
  if (!load || !store || store.getValueToStore() != load.getResult() ||
      !(load.getType().isF32() || load.getType().isInteger(32))) return;
  auto source = load.getMemRef().getDefiningOp<memref::ReinterpretCastOp>();
  auto target = store.getMemRef().getDefiningOp<memref::ReinterpretCastOp>();
  if (bool(source) == bool(target)) return;
  auto external = source ? source : target;
  Value local = source ? store.getMemRef() : load.getMemRef();
  auto localType = dyn_cast<MemRefType>(local.getType());
  auto localIndices = source ? store.getIndices() : load.getIndices();
  auto externalIndices = source ? load.getIndices() : store.getIndices();
  if (!isa<UnrankedMemRefType>(external.getSource().getType()) ||
      !localType || localType.getRank() != 1 || !local.getDefiningOp<memref::AllocOp>() ||
      localIndices.size() != 1 || localIndices[0] != loop.getInductionVar() ||
      externalIndices.size() != 1 ||
      getConstantIntValue(externalIndices[0]) != std::optional<int64_t>(0) ||
      getConstantIntValue(external.getMixedStrides()[0]) != std::optional<int64_t>(1)) return;
  auto offset = dyn_cast<Value>(external.getMixedOffsets()[0]);
  if (!offset) return;
  std::function<std::optional<int64_t>(Value)> coefficient = [&](Value value) -> std::optional<int64_t> {
    if (value == loop.getInductionVar()) return 1;
    Operation *def = value.getDefiningOp();
    if (!def || !loop->isProperAncestor(def)) return 0;
    if (auto cast = dyn_cast<arith::IndexCastOp>(def)) return coefficient(cast.getIn());
    if (isa<arith::ConstantOp>(def)) return 0;
    if (isa<arith::AddIOp, arith::SubIOp>(def)) {
      auto lhs = coefficient(def->getOperand(0)), rhs = coefficient(def->getOperand(1));
      if (lhs && rhs) return *lhs + (isa<arith::AddIOp>(def) ? *rhs : -*rhs);
    }
    return std::nullopt;
  };
  if (coefficient(offset) != std::optional<int64_t>(1)) return;
  for (Operation &inner : loop.getBody()->without_terminator())
    if (&inner != store.getOperation() && &inner != load.getOperation())
      for (Value operand : inner.getOperands()) if (operand == load.getResult()) return;

      loop->setAttr("sycl.vector_copy", UnitAttr::get(&getContext()));
    });
  }
};
}
namespace mlir::triton::sycl {
std::unique_ptr<OperationPass<ModuleOp>> createVectorMemoryPass() { return std::make_unique<VectorMemoryPass>(); }
}
