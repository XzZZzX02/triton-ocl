#include "sycl/include/Conversion/LinalgToAffineLoops/Passes.h"
#include "mlir/Dialect/Affine/IR/AffineOps.h"
#include "mlir/Dialect/Arith/IR/Arith.h"
#include "mlir/Dialect/GPU/IR/GPUDialect.h"
#include "mlir/Dialect/MemRef/IR/MemRef.h"
#include "mlir/Dialect/SCF/IR/SCF.h"
#include "mlir/IR/BuiltinOps.h"
#include "mlir/IR/IRMapping.h"
#include "mlir/Interfaces/SideEffectInterfaces.h"
#include "llvm/ADT/DenseMap.h"
#include "llvm/ADT/SmallPtrSet.h"
#include "llvm/ADT/STLExtras.h"
#include <cstdint>
#include <functional>

using namespace mlir;
namespace {

static bool validDistributedRoot(affine::AffineForOp root,
                                 affine::AffineForOp columns) {
  auto depth = root->getAttrOfType<IntegerAttr>("sycl.distribution_depth");
  if (!depth || depth.getInt() < 2 || depth.getInt() > 3)
    return false;
  auto loop = root;
  uint64_t points = 1;
  for (int64_t i = 0; i < depth.getInt(); ++i) {
    if (!loop || !loop.hasConstantBounds() || loop.getNumResults() ||
        loop.getConstantLowerBound() != 0 || loop.getStep() != 1 ||
        !loop->hasAttr("sycl.parallel"))
      return false;
    int64_t extent = loop.getConstantUpperBound();
    if (extent <= 0 || extent >= 128 ||
        points > 127 / static_cast<uint64_t>(extent))
      return false;
    points *= extent;
    if (i + 1 == depth.getInt())
      return loop == columns && points >= 64;
    if (loop.getBody()->getOperations().size() != 2)
      return false;
    loop = dyn_cast<affine::AffineForOp>(&loop.getBody()->front());
  }
  return false;
}

// Recover the first independent output recurrence after promotion, initializer
// forwarding and ordered unroll. Expanding its column domain recovers the
// untiled schedule; no arithmetic is reassociated or reconstructed by formula.
static LogicalResult untileColumns(affine::AffineForOp columns) {
  auto tile = columns->getAttrOfType<IntegerAttr>("sycl.register_tile");
  if (!tile || tile.getInt() != 2 || !columns.hasConstantBounds() ||
      columns.getConstantLowerBound() != 0 || columns.getStep() != 1 ||
      columns.getNumResults() || columns.getConstantUpperBound() <= 0 ||
      columns.getConstantUpperBound() > INT64_MAX / 2)
    return failure();

  scf::ForOp reduction;
  SmallVector<memref::StoreOp> stores;
  for (Operation &op : columns.getBody()->without_terminator()) {
    if (auto loop = dyn_cast<scf::ForOp>(&op)) {
      if (reduction)
        return failure();
      reduction = loop;
    } else if (auto store = dyn_cast<memref::StoreOp>(&op)) {
      stores.push_back(store);
    } else if (auto load = dyn_cast<memref::LoadOp>(&op)) {
      if (!load.getMemRef().getDefiningOp<memref::AllocOp>())
        return failure();
    } else if (op.getNumRegions() || !isMemoryEffectFree(&op)) {
      return failure();
    }
  }
  if (!reduction || reduction.getNumResults() != 2 ||
      reduction.getInitArgs().size() != 2 ||
      !reduction.getResult(0).getType().isF32() ||
      !reduction.getResult(1).getType().isF32() ||
      !reduction->hasAttr("sycl.thread_private") ||
      !reduction->hasAttr("sycl.register_accumulator") || stores.size() != 2 ||
      !reduction.getResult(0).hasOneUse() ||
      !reduction.getResult(1).hasOneUse())
    return failure();
  memref::StoreOp first, second;
  for (auto store : stores) {
    if (store.getValueToStore() == reduction.getResult(0))
      first = store;
    else if (store.getValueToStore() == reduction.getResult(1))
      second = store;
  }
  if (!first || !second || first.getMemRef() != second.getMemRef() ||
      !first.getMemRef().getDefiningOp<memref::AllocOp>() ||
      first.getIndices().size() < 2 ||
      first.getIndices().size() != second.getIndices().size())
    return failure();
  for (unsigned i = 0; i + 1 < first.getIndices().size(); ++i)
    if (first.getIndices()[i] != second.getIndices()[i])
      return failure();
  auto laneIndex = [&](Value value, int64_t offset) {
    Value iv = columns.getInductionVar();
    if (!offset && value == iv)
      return true;
    auto apply = value.getDefiningOp<affine::AffineApplyOp>();
    return apply && apply.getMapOperands().size() == 1 &&
           apply.getMapOperands()[0] == iv &&
           apply.getAffineMap() ==
               AffineMap::get(1, 0, getAffineDimExpr(0, columns.getContext()) +
                                       offset);
  };
  if (!laneIndex(first.getIndices().back(), 0) ||
      !laneIndex(second.getIndices().back(),
                 columns.getConstantUpperBound()))
    return failure();
  for (unsigned lane = 0; lane < 2; ++lane) {
    Value initial = reduction.getInitArgs()[lane];
    auto store = lane ? second : first;
    if (auto load = initial.getDefiningOp<memref::LoadOp>()) {
      if (load.getMemRef() != store.getMemRef() ||
          !llvm::equal(load.getIndices(), store.getIndices()))
        return failure();
    } else if (!initial.getDefiningOp<arith::ConstantOp>()) {
      return failure();
    }
  }
  auto initial0 =
      reduction.getInitArgs()[0].getDefiningOp<arith::ConstantOp>();
  auto initial1 =
      reduction.getInitArgs()[1].getDefiningOp<arith::ConstantOp>();
  if (bool(initial0) != bool(initial1) ||
      (initial0 && initial0.getValue() != initial1.getValue()))
    return failure();
  auto yield = dyn_cast<scf::YieldOp>(reduction.getBody()->getTerminator());
  if (!yield || yield.getNumOperands() != 2)
    return failure();

  // All removed operations must be pure or ordinary reads of owned scratch.
  // A live dependence on the other accumulator invalidates independent tiling.
  for (Operation &op : reduction.getBody()->without_terminator()) {
    if (auto load = dyn_cast<memref::LoadOp>(&op)) {
      if (!load.getMemRef().getDefiningOp<memref::AllocOp>())
        return failure();
    } else if (op.getNumRegions() || !isMemoryEffectFree(&op)) {
      return failure();
    }
  }
  // Prove the two yielded functions are the same recurrence after substituting
  // the column index and carry. Merely having two independent carries is not
  // enough: an asymmetric or stale tile marker must not invent a fallback.
  llvm::DenseMap<Value, bool> dependence;
  std::function<bool(Value)> dependsOnColumn = [&](Value value) {
    if (value == columns.getInductionVar() ||
        llvm::is_contained(reduction.getRegionIterArgs(), value))
      return true;
    if (value == reduction.getInductionVar() ||
        columns.isDefinedOutsideOfLoop(value))
      return false;
    auto found = dependence.find(value);
    if (found != dependence.end())
      return found->second;
    Operation *def = value.getDefiningOp();
    bool result =
        !def || llvm::any_of(def->getOperands(), dependsOnColumn);
    dependence[value] = result;
    return result;
  };
  llvm::DenseMap<std::pair<Value, Value>, bool> equivalents;
  std::function<bool(Value, Value)> equivalent = [&](Value a, Value b) {
    if (a == reduction.getRegionIterArgs()[0] ||
        b == reduction.getRegionIterArgs()[1])
      return a == reduction.getRegionIterArgs()[0] &&
             b == reduction.getRegionIterArgs()[1];
    if (a == first.getIndices().back() || b == second.getIndices().back())
      return a == first.getIndices().back() &&
             b == second.getIndices().back();
    if (a == b)
      return !dependsOnColumn(a);
    auto key = std::make_pair(a, b);
    auto found = equivalents.find(key);
    if (found != equivalents.end())
      return found->second;
    Operation *left = a.getDefiningOp();
    Operation *right = b.getDefiningOp();
    if (!left || !right || a.getType() != b.getType() ||
        cast<OpResult>(a).getResultNumber() !=
            cast<OpResult>(b).getResultNumber() ||
        left->getName() != right->getName() ||
        left->getAttrs() != right->getAttrs() ||
        left->getNumOperands() != right->getNumOperands() ||
        left->getNumRegions() || right->getNumRegions())
      return false;
    bool result = llvm::all_of(
        llvm::zip(left->getOperands(), right->getOperands()),
        [&](auto pair) {
          return equivalent(std::get<0>(pair), std::get<1>(pair));
        });
    equivalents[key] = result;
    return result;
  };
  if (!equivalent(yield.getOperand(0), yield.getOperand(1)))
    return failure();
  llvm::SmallPtrSet<Operation *, 32> live;
  std::function<bool(Value)> independentOutside = [&](Value value) {
    if (value == second.getIndices().back())
      return false;
    if (value == columns.getInductionVar() ||
        columns.isDefinedOutsideOfLoop(value))
      return true;
    Operation *def = value.getDefiningOp();
    if (!def || def->getBlock() != columns.getBody() || def->getNumRegions() ||
        (!isMemoryEffectFree(def) && !isa<memref::LoadOp>(def)))
      return false;
    return llvm::all_of(def->getOperands(), independentOutside);
  };
  std::function<bool(Value)> visit = [&](Value value) {
    if (value == reduction.getRegionIterArgs()[1])
      return false;
    if (value == reduction.getInductionVar() ||
        value == reduction.getRegionIterArgs()[0])
      return true;
    if (reduction.isDefinedOutsideOfLoop(value))
      return independentOutside(value);
    Operation *def = value.getDefiningOp();
    if (!def || def->getBlock() != reduction.getBody())
      return false;
    if (!live.insert(def).second)
      return true;
    return llvm::all_of(def->getOperands(), visit);
  };
  if (!visit(yield.getOperand(0)))
    return failure();

  OpBuilder builder(reduction);
  auto scalar = builder.create<scf::ForOp>(
      reduction.getLoc(), reduction.getLowerBound(), reduction.getUpperBound(),
      reduction.getStep(), ValueRange{reduction.getInitArgs()[0]},
      [&](OpBuilder &nested, Location loc, Value index, ValueRange carry) {
        IRMapping mapping;
        mapping.map(reduction.getInductionVar(), index);
        mapping.map(reduction.getRegionIterArgs()[0], carry[0]);
        for (Operation &op : reduction.getBody()->without_terminator())
          if (live.contains(&op))
            nested.clone(op, mapping);
        nested.create<scf::YieldOp>(
            loc, mapping.lookupOrDefault(yield.getOperand(0)));
      });
  scalar->setAttrs(reduction->getAttrs());
  scalar->removeAttr("sycl.register_tile_composed_accumulator");
  first.getValueToStore().replaceAllUsesWith(scalar.getResult(0));
  second.erase();
  reduction.erase();
  columns.setConstantUpperBound(columns.getConstantUpperBound() * 2);
  columns->removeAttr("sycl.register_tile");
  columns->removeAttr("sycl.two_column_candidate");

  // Do not leave a dead lane-one initial load outside its old valid domain.
  // In particular, C[col + old_extent] is out of bounds after expansion.
  SmallVector<Operation *> cleanup;
  for (Operation &op : columns.getBody()->without_terminator())
    cleanup.push_back(&op);
  for (Operation *op : llvm::reverse(cleanup))
    if (op->use_empty() && !op->getNumRegions() &&
        (isMemoryEffectFree(op) || isa<memref::LoadOp>(op)))
      op->erase();
  return success();
}

struct TwoColumnLaunchGuardPass
    : PassWrapper<TwoColumnLaunchGuardPass, OperationPass<ModuleOp>> {
  MLIR_DEFINE_EXPLICIT_INTERNAL_INLINE_TYPE_ID(TwoColumnLaunchGuardPass)
  StringRef getArgument() const final { return "sycl-two-column-launch-guard"; }
  StringRef getDescription() const final {
    return "Select a two-column or untiled schedule using the actual local size";
  }
  void getDependentDialects(DialectRegistry &registry) const override {
    registry.insert<affine::AffineDialect, arith::ArithDialect, gpu::GPUDialect,
                    memref::MemRefDialect, scf::SCFDialect>();
  }
  void runOnOperation() override {
    SmallVector<affine::AffineForOp> candidates;
    getOperation().walk([&](affine::AffineForOp loop) {
      if (loop->hasAttr("sycl.two_column_candidate"))
        candidates.push_back(loop);
    });
    for (auto columns : candidates) {
      auto root = columns;
      while (root && !root->hasAttr("sycl.distribute"))
        root = root->getParentOfType<affine::AffineForOp>();
      if (!root || !validDistributedRoot(root, columns)) {
        columns.emitError("two-column launch guard needs a distributed root");
        signalPassFailure();
        return;
      }
      bool guarded = false;
      for (Operation *parent = root->getParentOp(); parent;
           parent = parent->getParentOp())
        guarded |= parent->hasAttr("sycl.two_column_launch_guard");
      if (guarded)
        continue;

      OpBuilder builder(root);
      auto fallback =
          cast<affine::AffineForOp>(builder.clone(*root.getOperation()));
      SmallVector<affine::AffineForOp> clonedColumns;
      fallback.walk([&](affine::AffineForOp loop) {
        if (loop->hasAttr("sycl.two_column_candidate"))
          clonedColumns.push_back(loop);
      });
      if (clonedColumns.size() != 1 ||
          failed(untileColumns(clonedColumns.front()))) {
        fallback.erase();
        columns.emitError("cannot recover the independent untiled recurrence");
        signalPassFailure();
        return;
      }

      auto loc = root.getLoc();
      Value x = builder.create<gpu::BlockDimOp>(loc, gpu::Dimension::x);
      Value y = builder.create<gpu::BlockDimOp>(loc, gpu::Dimension::y);
      Value z = builder.create<gpu::BlockDimOp>(loc, gpu::Dimension::z);
      Value xy = builder.create<arith::MulIOp>(loc, x, y);
      Value size = builder.create<arith::MulIOp>(loc, xy, z);
      Value wave = builder.create<arith::ConstantIndexOp>(loc, 64);
      // One complete wavefront keeps every remaining tiled output available
      // without changing partial-wave scheduling. Local=48 regressed despite
      // being below 64; larger groups lose useful output parallelism.
      Value useTile = builder.create<arith::CmpIOp>(
          loc, arith::CmpIPredicate::eq, size, wave);
      auto guard =
          builder.create<scf::IfOp>(loc, TypeRange{}, useTile, true);
      guard->setAttr("sycl.two_column_launch_guard",
                     builder.getI64IntegerAttr(64));
      auto &thenBlock = guard.getThenRegion().front();
      auto &elseBlock = guard.getElseRegion().front();
      if (thenBlock.empty())
        OpBuilder::atBlockEnd(&thenBlock).create<scf::YieldOp>(loc);
      if (elseBlock.empty())
        OpBuilder::atBlockEnd(&elseBlock).create<scf::YieldOp>(loc);
      root->setAttr("sycl.two_column_tiled_path", builder.getUnitAttr());
      fallback->setAttr("sycl.two_column_untiled_path", builder.getUnitAttr());
      columns->removeAttr("sycl.two_column_candidate");
      root->moveBefore(thenBlock.getTerminator());
      fallback->moveBefore(elseBlock.getTerminator());
    }
  }
};
} // namespace

namespace mlir::triton::sycl {
std::unique_ptr<OperationPass<ModuleOp>> createTwoColumnLaunchGuardPass() {
  return std::make_unique<TwoColumnLaunchGuardPass>();
}
} // namespace mlir::triton::sycl
