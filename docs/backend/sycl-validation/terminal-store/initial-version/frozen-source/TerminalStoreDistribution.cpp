#include "sycl/include/Conversion/LinalgToAffineLoops/Passes.h"
#include "mlir/Dialect/Affine/IR/AffineOps.h"
#include "mlir/Dialect/Arith/IR/Arith.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/Dialect/GPU/IR/GPUDialect.h"
#include "mlir/Dialect/MemRef/IR/MemRef.h"
#include "mlir/Dialect/SCF/IR/SCF.h"
#include "mlir/Dialect/Utils/StaticValueUtils.h"
#include "mlir/IR/BuiltinOps.h"
#include "mlir/Interfaces/SideEffectInterfaces.h"
#include "llvm/ADT/STLExtras.h"
#include "llvm/ADT/DenseSet.h"
#include <limits>
#include <optional>

using namespace mlir;
namespace {
static bool defaultMemoryAttributes(Operation *op) {
  for (NamedAttribute attr : op->getAttrs()) {
    auto value = dyn_cast<BoolAttr>(attr.getValue());
    if (attr.getName().strref() != "nontemporal" || !value || value.getValue())
      return false;
  }
  return true;
}

static bool groupUniform(Value v, func::FuncOp function, DenseSet<Value> &known) {
  if (known.contains(v)) return true;
  if (auto arg = dyn_cast<BlockArgument>(v))
    return arg.getOwner() == &function.front();
  Operation *op = v.getDefiningOp();
  if (!op) return false;
  // This backend emits gpu.global_id as Triton program/work-group ID.
  if (isa<gpu::GlobalIdOp, arith::ConstantOp>(op)) return true;
  if (op->getNumRegions() || !isMemoryEffectFree(op) ||
      !(isa<affine::AffineApplyOp>(op) ||
        op->getName().getDialectNamespace() == "arith")) return false;
  if (!llvm::all_of(op->getOperands(), [&](Value x) {
        return groupUniform(x, function, known);
      })) return false;
  known.insert(v);
  return true;
}

static bool priorExternalWrite(affine::AffineForOp root) {
  bool unsafe = false;
  for (Operation &phase : *root->getBlock()) {
    if (&phase == root.getOperation()) break;
    phase.walk([&](Operation *op) {
      Value target;
      if (auto s = dyn_cast<memref::StoreOp>(op)) target = s.getMemRef();
      if (auto s = dyn_cast<affine::AffineStoreOp>(op)) target = s.getMemRef();
      if (target) {
        if (!target.getDefiningOp<memref::AllocOp>()) unsafe = true;
      } else if (op->getNumRegions()) {
        if (!isa<affine::AffineForOp, scf::ForOp, scf::IfOp>(op)) unsafe = true;
      } else if (!isa<memref::AllocOp, memref::LoadOp, affine::AffineLoadOp,
                      memref::ReinterpretCastOp, memref::DeallocOp,
                      affine::AffineYieldOp, scf::YieldOp, gpu::BarrierOp>(op) &&
                 !isMemoryEffectFree(op)) unsafe = true;
    });
  }
  return unsafe;
}

// Coefficients are interpreted modulo 2^bits. Add/multiply-by-constant and
// integer casts preserve this congruence at the smallest width along the path,
// even if a uniform base causes signed wrap before widening to index. Proving
// injectivity modulo that width therefore proves actual address injectivity.
struct LinearForm {
  SmallVector<int64_t> coefficients;
  unsigned bits = 64;
};
static unsigned width(Type type) {
  if (type.isIndex()) return 64;
  if (auto integer = dyn_cast<IntegerType>(type)) return integer.getWidth();
  return 0;
}
static bool assignChecked(int64_t &out, __int128 value) {
  if (value < std::numeric_limits<int64_t>::min() ||
      value > std::numeric_limits<int64_t>::max()) return false;
  out = static_cast<int64_t>(value);
  return true;
}
static std::optional<LinearForm> addressForm(
    Value value, affine::AffineForOp root, ArrayRef<affine::AffineForOp> loops,
    func::FuncOp function, DenseSet<Value> &uniform, unsigned depth = 0) {
  if (depth > 64 || width(value.getType()) < 32 || width(value.getType()) > 64)
    return std::nullopt;
  LinearForm result{SmallVector<int64_t>(loops.size(), 0), width(value.getType())};
  for (unsigned i = 0; i < loops.size(); ++i)
    if (value == affine::AffineForOp(loops[i]).getInductionVar()) {
      result.coefficients[i] = 1;
      return result;
    }
  if (root.isDefinedOutsideOfLoop(value)) {
    if (!groupUniform(value, function, uniform)) return std::nullopt;
    return result;
  }
  auto *op = value.getDefiningOp();
  if (!op) return std::nullopt;
  if (isa<arith::ConstantOp>(op)) return result;
  if (isa<arith::IndexCastOp, arith::IndexCastUIOp, arith::ExtSIOp,
          arith::ExtUIOp, arith::TruncIOp>(op)) {
    auto input = addressForm(op->getOperand(0), root, loops, function, uniform, depth+1);
    if (!input) return std::nullopt;
    input->bits = std::min(input->bits, result.bits);
    return input;
  }
  if (isa<arith::AddIOp, arith::SubIOp>(op)) {
    auto a = addressForm(op->getOperand(0), root, loops, function, uniform, depth+1);
    auto b = addressForm(op->getOperand(1), root, loops, function, uniform, depth+1);
    if (!a || !b) return std::nullopt;
    result.bits = std::min({result.bits, a->bits, b->bits});
    for (unsigned i = 0; i < loops.size(); ++i)
      if (!assignChecked(result.coefficients[i], __int128(a->coefficients[i]) +
          (isa<arith::SubIOp>(op) ? -__int128(b->coefficients[i]) : __int128(b->coefficients[i]))))
        return std::nullopt;
    return result;
  }
  if (isa<arith::MulIOp>(op)) {
    for (unsigned side = 0; side < 2; ++side) {
      auto constant = getConstantIntValue(op->getOperand(side));
      if (!constant) continue;
      auto input = addressForm(op->getOperand(1-side), root, loops, function, uniform, depth+1);
      if (!input) return std::nullopt;
      input->bits = std::min(input->bits, result.bits);
      for (int64_t &coefficient : input->coefficients)
        if (!assignChecked(coefficient, __int128(coefficient) * *constant)) return std::nullopt;
      return input;
    }
  }
  // Dynamic stride, division/modulo, select and loaded scatter indices need a
  // stronger proof; do not infer independence from a familiar kernel pattern.
  return std::nullopt;
}
static bool uniqueAddresses(const LinearForm &form,
                            ArrayRef<affine::AffineForOp> loops, unsigned pointerBits) {
  SmallVector<std::pair<__int128, int64_t>> dimensions;
  for (unsigned i = 0; i < loops.size(); ++i) {
    int64_t extent = affine::AffineForOp(loops[i]).getConstantUpperBound();
    if (extent == 1) continue;
    __int128 coefficient = form.coefficients[i];
    if (coefficient < 0) coefficient = -coefficient;
    if (!coefficient) return false;
    dimensions.emplace_back(coefficient, extent);
  }
  llvm::sort(dimensions, [](auto a, auto b) { return a.first < b.first; });
  __int128 span = 0, modulus = __int128(1) << std::min(form.bits, pointerBits);
  for (auto [stride, extent] : dimensions) {
    // Superincreasing strides prevent cancellation of different coordinates.
    if (stride <= span) return false;
    span += stride * (extent-1);
    if (span >= modulus) return false;
  }
  return !dimensions.empty();
}

static bool planStore(affine::AffineForOp root) {
  auto function = dyn_cast<func::FuncOp>(root->getParentOp());
  if (!function || root->hasAttr("sycl.distribute") ||
      root->hasAttr("sycl.terminal_store_distribution") || priorExternalWrite(root)) return false;
  // No later read/write can depend on which work-item performed this store.
  for (Operation *next = root->getNextNode(); next; next = next->getNextNode())
    if (!isa<memref::DeallocOp, func::ReturnOp>(next)) return false;
  SmallVector<affine::AffineForOp> loops;
  auto loop = root;
  uint64_t total = 1;
  while (loop) {
    if (loops.size() == 3 || !loop.hasConstantBounds() || loop.getNumResults() ||
        loop.getConstantLowerBound() != 0 || loop.getConstantUpperBound() <= 0 ||
        loop.getStep() != 1 || loop->hasAttr("sycl.reduction") ||
        total > uint64_t(INT64_MAX) / loop.getConstantUpperBound()) return false;
    total *= loop.getConstantUpperBound();
    loops.push_back(loop);
    auto &ops = loop.getBody()->getOperations();
    if (ops.size() != 2 || !isa<affine::AffineForOp>(ops.front())) break;
    loop = cast<affine::AffineForOp>(&ops.front());
  }
  if (total < 256) return false;
  bool legal = true;
  unsigned reads = 0;
  memref::StoreOp store;
  DenseSet<Value> uniform;
  auto localBuffer = [&](Value buffer) {
    auto alloc = buffer.getDefiningOp<memref::AllocOp>();
    return alloc && alloc->getBlock() == root->getBlock() &&
           alloc->isBeforeInBlock(root) && alloc.getType().hasStaticShape() &&
           alloc.getType().getLayout().isIdentity() &&
           !alloc->hasAttr("sycl.thread_private");
  };
  root.walk([&](Operation *op) {
    for (Value operand : op->getOperands())
      if (root.isDefinedOutsideOfLoop(operand) && !localBuffer(operand) &&
          !groupUniform(operand, function, uniform)) legal = false;
    if (isa<affine::AffineForOp>(op)) {
      if (!llvm::any_of(loops, [&](auto l) { return l.getOperation() == op; })) legal = false;
    } else if (isa<affine::AffineYieldOp, scf::YieldOp>(op)) {
    } else if (auto write = dyn_cast<memref::StoreOp>(op)) {
      if (store || !defaultMemoryAttributes(op)) legal = false;
      store = write;
    } else if (auto read = dyn_cast<memref::LoadOp>(op)) {
      if (!localBuffer(read.getMemRef()) || !defaultMemoryAttributes(op)) legal = false;
      ++reads;
    } else if (auto read = dyn_cast<affine::AffineLoadOp>(op)) {
      if (!localBuffer(read.getMemRef()) || !op->getAttrs().empty()) legal = false;
      ++reads;
    } else if (auto view = dyn_cast<memref::ReinterpretCastOp>(op)) {
      auto arg = dyn_cast<BlockArgument>(view.getSource());
      if (!arg || arg.getOwner() != &function.front() ||
          !isa<UnrankedMemRefType>(arg.getType())) legal = false;
    } else if (auto condition = dyn_cast<scf::IfOp>(op)) {
      if (!llvm::all_of(condition.getResultTypes(), [](Type t) { return t.isIntOrIndexOrFloat(); })) legal = false;
    } else if (op->getNumRegions() || !isMemoryEffectFree(op) ||
               !(isa<affine::AffineApplyOp>(op) ||
                 op->getName().getDialectNamespace() == "arith")) legal = false;
  });
  if (!legal || !store || !reads) return false;
  auto view = store.getMemRef().getDefiningOp<memref::ReinterpretCastOp>();
  if (!view || view.getMixedOffsets().size() != 1 || view.getMixedStrides().size() != 1 ||
      store.getIndices().size() != 1 || getConstantIntValue(store.getIndices()[0]) != std::optional<int64_t>(0) ||
      getConstantIntValue(view.getMixedStrides()[0]) != std::optional<int64_t>(1)) return false;
  Type element = store.getValueToStore().getType();
  if (!(element.isF32() || element.isF64() || element.isInteger(32) || element.isInteger(64))) return false;
  auto offset = dyn_cast<Value>(view.getMixedOffsets()[0]);
  if (!offset) return false;
  auto form = addressForm(offset, root, loops, function, uniform);
  // Account for element-to-byte scaling of the 64-bit target pointer.
  unsigned pointerBits = element.isF64() || element.isInteger(64) ? 61 : 62;
  if (!form || !uniqueAddresses(*form, loops, pointerBits)) return false;
  OpBuilder builder(root);
  builder.create<gpu::BarrierOp>(root.getLoc());
  root->setAttr("sycl.distribute", builder.getUnitAttr());
  root->setAttr("sycl.distribution_depth", builder.getI64IntegerAttr(loops.size()));
  root->setAttr("sycl.terminal_store_distribution", builder.getUnitAttr());
  return true;
}
struct TerminalStoreDistributionPass
    : PassWrapper<TerminalStoreDistributionPass, OperationPass<ModuleOp>> {
  MLIR_DEFINE_EXPLICIT_INTERNAL_INLINE_TYPE_ID(TerminalStoreDistributionPass)
  StringRef getArgument() const final { return "sycl-terminal-store-distribution"; }
  StringRef getDescription() const final { return "Distribute terminal local-to-external stores with proven unique addresses"; }
  void getDependentDialects(DialectRegistry &registry) const override { registry.insert<gpu::GPUDialect>(); }
  void runOnOperation() override {
    SmallVector<affine::AffineForOp> candidates;
    getOperation().walk([&](affine::AffineForOp loop) {
      if (isa<func::FuncOp>(loop->getParentOp())) candidates.push_back(loop);
    });
    for (auto loop : candidates) planStore(loop);
  }
};
} // namespace
namespace mlir::triton::sycl {
std::unique_ptr<OperationPass<ModuleOp>> createTerminalStoreDistributionPass() {
  return std::make_unique<TerminalStoreDistributionPass>();
}
} // namespace mlir::triton::sycl
