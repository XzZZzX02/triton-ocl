#include "sycl/include/Conversion/LinalgToAffineLoops/Passes.h"
#include "mlir/Dialect/Affine/IR/AffineOps.h"
#include "mlir/Dialect/Arith/IR/Arith.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/Dialect/MemRef/IR/MemRef.h"
#include "mlir/Dialect/SCF/IR/SCF.h"
#include "mlir/IR/BuiltinOps.h"
#include "llvm/ADT/SmallPtrSet.h"
#include "llvm/ADT/STLExtras.h"

using namespace mlir;
namespace {
static Operation *phaseOf(Operation *op, Block *block) {
  while (op && op->getBlock() != block)
    op = op->getParentOp();
  return op;
}

// A fill smaller than two gfx906 wavefronts showed no stable benefit. Count
// elements with saturation: no shape-product overflow or benchmark-name gate.
static bool hasUsefulFillWork(MemRefType type) {
  constexpr uint64_t minimumElements = 128;
  uint64_t count = 1;
  for (int64_t extent : type.getShape()) {
    if (extent <= 0) return false;
    auto size = static_cast<uint64_t>(extent);
    if (count == minimumElements) continue;
    if (size >= minimumElements || count >= (minimumElements + size - 1) / size)
      count = minimumElements;
    else
      count *= size;
  }
  return count >= minimumElements;
}

// Both nests are complete, static, normalized output domains. The only
// permitted difference is the proven disjoint last-dimension register lanes.
static bool outputNest(affine::AffineForOp root, MemRefType type,
                       SmallVectorImpl<affine::AffineForOp> &loops) {
  auto current = root;
  for (int64_t dimension = 0; dimension < type.getRank(); ++dimension) {
    if (!current || !current.hasConstantBounds() || current.getNumResults() ||
        current.getConstantLowerBound() != 0 || current.getStep() != 1 ||
        !current->hasAttr("sycl.parallel"))
      return false;
    loops.push_back(current);
    if (dimension + 1 != type.getRank()) {
      if (current.getConstantUpperBound() != type.getDimSize(dimension) ||
          current.getBody()->getOperations().size() != 2)
        return false;
      current = dyn_cast<affine::AffineForOp>(&current.getBody()->front());
    }
  }
  return true;
}

static Value constantFill(affine::AffineForOp root, Value buffer, MemRefType type) {
  SmallVector<affine::AffineForOp> loops;
  if (!outputNest(root, type, loops) ||
      loops.back().getConstantUpperBound() != type.getShape().back() ||
      loops.back().getBody()->getOperations().size() != 2)
    return {};
  auto store = dyn_cast<affine::AffineStoreOp>(&loops.back().getBody()->front());
  if (!store || store.getMemRef() != buffer || !store.getAffineMap().isIdentity() ||
      store.getMapOperands().size() != loops.size() ||
      !store.getValueToStore().getDefiningOp<arith::ConstantOp>() ||
      !root.isDefinedOutsideOfLoop(store.getValueToStore()) ||
      store.getValueToStore().getType() != type.getElementType())
    return {};
  for (unsigned i = 0; i < loops.size(); ++i)
    if (store.getMapOperands()[i] != loops[i].getInductionVar())
      return {};
  return store.getValueToStore();
}

static bool laneAddress(ValueRange address, ArrayRef<affine::AffineForOp> loops,
                        int64_t lane, int64_t columns, int64_t lanes) {
  if (address.size() != loops.size())
    return false;
  for (unsigned i = 0; i + 1 < loops.size(); ++i) {
    auto loop = loops[i];
    if (address[i] != loop.getInductionVar())
      return false;
  }
  Value last = address.back();
  auto innermost = loops.back();
  Value column = innermost.getInductionVar();
  if (lanes == 1)
    return last == column;
  auto apply = last.getDefiningOp<affine::AffineApplyOp>();
  if (!apply || apply.getMapOperands().size() != 1 ||
      apply.getMapOperands()[0] != column)
    return false;
  auto expected = AffineMap::get(1, 0,
      getAffineDimExpr(0, column.getContext()) + lane * (columns / lanes));
  return apply.getAffineMap() == expected;
}

static bool initialLoads(affine::AffineForOp root, Value buffer, MemRefType type,
                         SmallVectorImpl<memref::LoadOp> &loads) {
  SmallVector<affine::AffineForOp> loops;
  if (!outputNest(root, type, loops))
    return false;
  auto depth = root->getAttrOfType<IntegerAttr>("sycl.distribution_depth");
  if (!root->hasAttr("sycl.distribute") || !depth ||
      depth.getInt() != type.getRank())
    return false;
  int64_t lanes = 1;
  if (auto tile = loops.back()->getAttrOfType<IntegerAttr>("sycl.register_tile"))
    lanes = tile.getInt();
  int64_t columns = type.getShape().back();
  if (lanes < 1 || lanes > 8 || columns % lanes ||
      loops.back().getConstantUpperBound() != columns / lanes)
    return false;

  scf::ForOp reduction;
  SmallVector<memref::StoreOp> stores;
  for (Operation &op : loops.back().getBody()->without_terminator()) {
    if (auto load = dyn_cast<memref::LoadOp>(&op)) {
      if (load.getMemRef() != buffer) return false;
      loads.push_back(load);
    } else if (auto store = dyn_cast<memref::StoreOp>(&op)) {
      if (store.getMemRef() != buffer) return false;
      stores.push_back(store);
    } else if (auto loop = dyn_cast<scf::ForOp>(&op)) {
      if (reduction) return false;
      reduction = loop;
    } else if (!isa<arith::ConstantIndexOp, affine::AffineApplyOp>(&op)) {
      return false;
    }
  }
  if (!reduction || !reduction->hasAttr("sycl.register_accumulator") ||
      !reduction->hasAttr("sycl.thread_private") ||
      loads.size() != static_cast<unsigned>(lanes) || stores.size() != loads.size() ||
      reduction.getInitArgs().size() != loads.size() ||
      reduction.getNumResults() != loads.size())
    return false;
  for (unsigned lane = 0; lane < loads.size(); ++lane) {
    auto load = loads[lane];
    auto store = stores[lane];
    if (!load.getResult().hasOneUse() ||
        reduction.getInitArgs()[lane] != load.getResult() ||
        store.getValueToStore() != reduction.getResult(lane) ||
        !llvm::equal(load.getIndices(), store.getIndices()) ||
        !laneAddress(load.getIndices(), loops, lane, columns, lanes))
      return false;
  }
  llvm::SmallPtrSet<Operation *, 16> permitted;
  for (auto load : loads) permitted.insert(load);
  for (auto store : stores) permitted.insert(store);
  for (Operation *user : buffer.getUsers())
    if (root->isAncestor(user) && !permitted.contains(user))
      return false;
  return true;
}

struct AccumulatorInitForwardingPass
    : PassWrapper<AccumulatorInitForwardingPass, OperationPass<ModuleOp>> {
  MLIR_DEFINE_EXPLICIT_INTERNAL_INLINE_TYPE_ID(AccumulatorInitForwardingPass)
  StringRef getArgument() const final { return "sycl-accumulator-init-forwarding"; }
  StringRef getDescription() const final {
    return "Forward complete constant fills into proven private accumulators";
  }
  void runOnOperation() override {
    for (auto function : getOperation().getOps<func::FuncOp>()) {
      if (function.empty()) continue;
      Block *block = &function.front();
      SmallVector<memref::AllocOp> allocations;
      for (auto alloc : block->getOps<memref::AllocOp>()) allocations.push_back(alloc);
      for (auto alloc : allocations) {
        auto type = alloc.getType();
        if (!type.hasStaticShape() || !type.getLayout().isIdentity() ||
            type.getRank() < 1 || type.getRank() > 3 ||
            !hasUsefulFillWork(type))
          continue;
        bool legal = true;
        SmallVector<Operation *> phases;
        for (Operation *user : alloc.getResult().getUsers()) {
          if (!isa<affine::AffineLoadOp, affine::AffineStoreOp, memref::LoadOp,
                   memref::StoreOp>(user)) { legal = false; break; }
          auto *phase = phaseOf(user, block);
          if (!phase || !isa<affine::AffineForOp>(phase)) { legal = false; break; }
          if (!llvm::is_contained(phases, phase)) phases.push_back(phase);
        }
        if (!legal || phases.size() < 2) continue;
        llvm::sort(phases, [](Operation *a, Operation *b) { return a->isBeforeInBlock(b); });
        auto fill = cast<affine::AffineForOp>(phases[0]);
        auto compute = cast<affine::AffineForOp>(phases[1]);
        Value initial = constantFill(fill, alloc.getResult(), type);
        SmallVector<memref::LoadOp> loads;
        if (!initial || !initialLoads(compute, alloc.getResult(), type, loads)) continue;
        for (auto load : loads) {
          load.getResult().replaceAllUsesWith(initial);
          load.erase();
        }
        compute->setAttr("sycl.accumulator_init_forwarded", UnitAttr::get(&getContext()));
        fill.erase();
      }
    }
  }
};
} // namespace
namespace mlir::triton::sycl {
std::unique_ptr<OperationPass<ModuleOp>> createAccumulatorInitForwardingPass() {
  return std::make_unique<AccumulatorInitForwardingPass>();
}
} // namespace mlir::triton::sycl
