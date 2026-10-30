#include "sycl/include/Conversion/LinalgToAffineLoops/Passes.h"
#include "mlir/Dialect/Affine/IR/AffineOps.h"
#include "mlir/Dialect/Arith/IR/Arith.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/Dialect/GPU/IR/GPUDialect.h"
#include "mlir/Dialect/MemRef/IR/MemRef.h"
#include "mlir/Dialect/SCF/IR/SCF.h"
#include "mlir/IR/BuiltinOps.h"
#include "mlir/Interfaces/SideEffectInterfaces.h"
#include "llvm/ADT/STLExtras.h"
#include "llvm/ADT/DenseSet.h"

using namespace mlir;
namespace {
static bool hasDefaultMemoryAttributes(Operation *op) {
  for (NamedAttribute attr : op->getAttrs()) {
    auto value = dyn_cast<BoolAttr>(attr.getValue());
    if (attr.getName().strref() != "nontemporal" || !value || value.getValue())
      return false;
  }
  return true;
}

// The emitter's phase barrier fences local storage. A prior external store
// might alias the source argument and be visible only to its original owner.
// Do not move subsequent reads to other lanes without proving a global fence.
static bool hasPriorExternalWrite(affine::AffineForOp root) {
  bool unsafe = false;
  for (Operation &phase : *root->getBlock()) {
    if (&phase == root.getOperation()) break;
    phase.walk([&](Operation *op) {
      Value target;
      if (auto write = dyn_cast<memref::StoreOp>(op)) target = write.getMemRef();
      if (auto write = dyn_cast<affine::AffineStoreOp>(op)) target = write.getMemRef();
      if (target) {
        if (!target.getDefiningOp<memref::AllocOp>()) unsafe = true;
      } else if (op->getNumRegions()) {
        if (!isa<affine::AffineForOp, scf::ForOp, scf::IfOp>(op)) unsafe = true;
      } else if (!isa<memref::AllocOp, memref::LoadOp, affine::AffineLoadOp,
                      memref::ReinterpretCastOp, memref::DeallocOp,
                      affine::AffineYieldOp, scf::YieldOp>(op) &&
                 !isMemoryEffectFree(op)) {
        unsafe = true;
      }
    });
  }
  return unsafe;
}

static bool isGroupUniform(Value value, func::FuncOp function,
                           DenseSet<Value> &uniform) {
  if (uniform.contains(value)) return true;
  if (auto argument = dyn_cast<BlockArgument>(value))
    return argument.getOwner() == &function.front();
  auto *op = value.getDefiningOp();
  if (!op) return false;
  // In this backend gpu.global_id represents Triton's program/work-group ID.
  if (isa<gpu::GlobalIdOp, arith::ConstantOp>(op)) {
    uniform.insert(value);
    return true;
  }
  if (op->getNumRegions() || !isMemoryEffectFree(op) ||
      !(isa<affine::AffineApplyOp>(op) ||
        op->getName().getDialectNamespace() == "arith"))
    return false;
  if (!llvm::all_of(op->getOperands(), [&](Value operand) {
        return isGroupUniform(operand, function, uniform);
      })) return false;
  uniform.insert(value);
  return true;
}

// Fresh local output, unique element writes, external reads only: no other
// iteration can change the value loaded or the destination of this iteration.
// The original predicate and all address arithmetic stay in place. Only the
// local store dialect and proven parallel iterator annotations change; the
// existing work-distribution pass and emitter own thread assignment/barriers.
static bool planStage(affine::AffineForOp root) {
  auto function = dyn_cast<func::FuncOp>(root->getParentOp());
  if (!function || root->hasAttr("sycl.distribute") ||
      root->hasAttr("sycl.scalar_memory_volatile") ||
      root->hasAttr("sycl.cooperative_load_staging") || hasPriorExternalWrite(root))
    return false;
  SmallVector<affine::AffineForOp> loops;
  auto loop = root;
  while (loop) {
    if (loops.size() == 3 || !loop.hasConstantBounds() || loop.getNumResults() ||
        loop.getConstantLowerBound() != 0 || loop.getConstantUpperBound() <= 0 ||
        loop.getStep() != 1 || loop->hasAttr("sycl.reduction"))
      return false;
    loops.push_back(loop);
    auto &operations = loop.getBody()->getOperations();
    if (operations.size() != 2 || !isa<affine::AffineForOp>(operations.front()))
      break;
    loop = cast<affine::AffineForOp>(&operations.front());
  }
  memref::StoreOp store;
  for (Operation &op : loops.back().getBody()->without_terminator()) {
    if (auto write = dyn_cast<memref::StoreOp>(&op)) {
      if (store) return false;
      store = write;
    }
  }
  if (!store || !hasDefaultMemoryAttributes(store)) return false;
  auto alloc = store.getMemRef().getDefiningOp<memref::AllocOp>();
  if (!alloc || alloc->getBlock() != root->getBlock() ||
      !alloc->isBeforeInBlock(root) || !alloc.getType().hasStaticShape() ||
      !alloc.getType().getLayout().isIdentity() ||
      alloc.getType().getRank() != static_cast<int64_t>(loops.size()) ||
      store.getIndices().size() != loops.size())
    return false;
  uint64_t count = 1;
  for (unsigned dim = 0; dim < loops.size(); ++dim) {
    int64_t extent = loops[dim].getConstantUpperBound();
    if (extent != alloc.getType().getDimSize(dim) ||
        store.getIndices()[dim] != loops[dim].getInductionVar())
      return false;
    if (count < 256) {
      auto size = static_cast<uint64_t>(extent);
      count = size >= 256 || count >= (256 + size - 1) / size ? 256 : count * size;
    }
  }
  // More work than a few lanes is necessary, not a profitability proof.
  if (count < 256) return false;
  for (Operation *user : alloc.getResult().getUsers())
    if (!isa<memref::LoadOp, memref::StoreOp, affine::AffineLoadOp,
             affine::AffineStoreOp, memref::DeallocOp>(user))
      return false;

  bool legal = true;
  unsigned reads = 0;
  DenseSet<Value> uniform;
  root.walk([&](Operation *op) {
    for (Value operand : op->getOperands())
      if (root.isDefinedOutsideOfLoop(operand) && operand != alloc.getResult() &&
          !isGroupUniform(operand, function, uniform)) legal = false;
    if (isa<affine::AffineForOp>(op)) {
      if (!llvm::any_of(loops, [&](auto l) { return l.getOperation() == op; })) legal = false;
    } else if (isa<affine::AffineYieldOp, scf::YieldOp>(op)) {
      // Only the accepted loop/if terminators can occur in this tree.
    } else if (auto write = dyn_cast<memref::StoreOp>(op)) {
      if (write != store) legal = false;
    } else if (auto read = dyn_cast<memref::LoadOp>(op)) {
      auto view = read.getMemRef().getDefiningOp<memref::ReinterpretCastOp>();
      auto argument = view ? dyn_cast<BlockArgument>(view.getSource()) : BlockArgument();
      if (!view || !argument || argument.getOwner() != &function.front() ||
          !isa<UnrankedMemRefType>(argument.getType()) || !hasDefaultMemoryAttributes(op))
        legal = false;
      ++reads;
    } else if (auto view = dyn_cast<memref::ReinterpretCastOp>(op)) {
      auto arg = dyn_cast<BlockArgument>(view.getSource());
      if (!arg || arg.getOwner() != &function.front() ||
          !isa<UnrankedMemRefType>(arg.getType())) legal = false;
    } else if (auto condition = dyn_cast<scf::IfOp>(op)) {
      if (condition.getNumResults() == 0 ||
          !llvm::all_of(condition.getResultTypes(), [](Type t) { return t.isIntOrIndexOrFloat(); }))
        legal = false;
    } else if (op->getNumRegions() || !isMemoryEffectFree(op) ||
               !(isa<affine::AffineApplyOp>(op) ||
                 op->getName().getDialectNamespace() == "arith")) {
      legal = false;
    }
  });
  if (!legal || !reads) return false;
  OpBuilder builder(store);
  builder.create<affine::AffineStoreOp>(store.getLoc(), store.getValueToStore(),
                                      store.getMemRef(), store.getIndices());
  store.erase();
  for (auto parallel : loops) parallel->setAttr("sycl.parallel", builder.getUnitAttr());
  root->setAttr("sycl.cooperative_load_staging", builder.getUnitAttr());
  return true;
}

struct CooperativeLoadStagingPass
    : PassWrapper<CooperativeLoadStagingPass, OperationPass<ModuleOp>> {
  MLIR_DEFINE_EXPLICIT_INTERNAL_INLINE_TYPE_ID(CooperativeLoadStagingPass)
  StringRef getArgument() const final { return "sycl-cooperative-load-staging"; }
  StringRef getDescription() const final {
    return "Prove independent scalarized external-to-local load stages for distribution";
  }
  void getDependentDialects(DialectRegistry &registry) const override {
    registry.insert<affine::AffineDialect>();
  }
  void runOnOperation() override {
    SmallVector<affine::AffineForOp> candidates;
    getOperation().walk([&](affine::AffineForOp loop) {
      if (isa<func::FuncOp>(loop->getParentOp())) candidates.push_back(loop);
    });
    for (auto root : candidates) planStage(root);
  }
};
} // namespace
namespace mlir::triton::sycl {
std::unique_ptr<OperationPass<ModuleOp>> createCooperativeLoadStagingPass() {
  return std::make_unique<CooperativeLoadStagingPass>();
}
} // namespace mlir::triton::sycl
