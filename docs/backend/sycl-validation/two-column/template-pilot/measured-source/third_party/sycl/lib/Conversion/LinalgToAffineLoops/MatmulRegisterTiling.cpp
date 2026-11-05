#include "sycl/include/Conversion/LinalgToAffineLoops/Passes.h"
#include "mlir/Dialect/Affine/IR/AffineOps.h"
#include "mlir/Dialect/Arith/IR/Arith.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/Dialect/MemRef/IR/MemRef.h"
#include "mlir/Dialect/SCF/IR/SCF.h"
#include "mlir/IR/BuiltinOps.h"
#include "mlir/IR/IRMapping.h"
#include "mlir/Interfaces/SideEffectInterfaces.h"
#include "llvm/ADT/STLExtras.h"

using namespace mlir;
namespace {
static bool isDirectLaunchEntry(Operation *op) {
  auto function = op->getParentOfType<func::FuncOp>();
  if (!function || function.isPrivate() ||
      function.getFunctionType().getNumResults())
    return false;
  bool called = false;
  auto module = function->getParentOfType<ModuleOp>();
  if (!module)
    return false;
  module.walk([&](func::CallOp call) {
    called |= call.getCallee() == function.getName();
  });
  return !called;
}

static bool hasStaticIdentityBuffer(Value buffer) {
  auto type = dyn_cast<MemRefType>(buffer.getType());
  return type && type.hasStaticShape() && type.getLayout().isIdentity();
}
// Four-column register tiling trades work-items for scalar reuse. Keep at
// least one gfx906 wavefront of independent distributed output points. Count
// batch loops in the same plan, but never Triton grid/program IDs: separate
// work-groups cannot fill one another's wavefronts. Saturate to avoid overflow.
static bool hasEnoughTiledOutputWork(affine::AffineForOp columns,
                                    int64_t tile) {
  constexpr uint64_t minimumWorkItems = 64;
  uint64_t count = 1;
  bool innermost = true;
  auto current = columns;
  while (current) {
    if (!current.hasConstantBounds() || current.getConstantLowerBound() != 0 ||
        current.getStep() != 1 || !current->hasAttr("sycl.parallel"))
      return false;
    int64_t extent = current.getConstantUpperBound();
    if (innermost) {
      if (tile <= 0 || extent % tile) return false;
      extent /= tile;
      innermost = false;
    }
    if (extent <= 0) return false;
    auto size = static_cast<uint64_t>(extent);
    if (count < minimumWorkItems) {
      if (size >= minimumWorkItems ||
          count >= (minimumWorkItems + size - 1) / size)
        count = minimumWorkItems;
      else
        count *= size;
    }
    if (current->hasAttr("sycl.distribute"))
      return count >= minimumWorkItems;
    current = current->getParentOfType<affine::AffineForOp>();
  }
  return false;
}

static bool hasTwoColumnOpportunity(affine::AffineForOp columns) {
  return columns.hasConstantBounds() &&
         columns.getConstantUpperBound() % 4 == 0 &&
         !hasEnoughTiledOutputWork(columns, 4) &&
         hasEnoughTiledOutputWork(columns, 2);
}

static bool hasDistributedOutputNest(affine::AffineForOp rows,
                                     affine::AffineForOp columns) {
  for (Operation *parent = rows; parent; parent = parent->getParentOp())
    if (parent->hasAttr("sycl.two_column_untiled_path"))
      return false;
  auto root = rows;
  while (root && !root->hasAttr("sycl.distribute"))
    root = root->getParentOfType<affine::AffineForOp>();
  if (!root || root == columns || !root->isAncestor(columns))
    return false;
  auto depth = root->getAttrOfType<IntegerAttr>("sycl.distribution_depth");
  int64_t requiredDepth = 1;
  auto current = columns;
  while (current && current != root) {
    ++requiredDepth;
    current = current->getParentOfType<affine::AffineForOp>();
  }
  return current == root && depth && depth.getInt() >= requiredDepth;
}

static bool tilePromotedContraction(affine::AffineForOp columns,
                                    int64_t tile) {
  auto rows = dyn_cast<affine::AffineForOp>(columns->getParentOp());
  if (!rows || !hasDistributedOutputNest(rows, columns) ||
      rows.getBody()->getOperations().size() != 2 ||
      columns.getNumResults() || rows.getNumResults() ||
      !rows.hasConstantBounds() || !columns.hasConstantBounds() ||
      rows.getConstantLowerBound() || columns.getConstantLowerBound() ||
      rows.getStep() != 1 || columns.getStep() != 1 ||
      rows.getConstantUpperBound() < 8 ||
      columns.getConstantUpperBound() < 16 ||
      columns.getConstantUpperBound() % tile)
    return false;
  if (!hasEnoughTiledOutputWork(columns, tile))
    return false;

  memref::LoadOp initial;
  memref::StoreOp store;
  scf::ForOp reduction;
  SmallVector<arith::ConstantIndexOp> boundConstants;
  for (Operation &op : columns.getBody()->without_terminator()) {
    if (auto load = dyn_cast<memref::LoadOp>(&op)) {
      if (initial)
        return false;
      initial = load;
    } else if (auto loop = dyn_cast<scf::ForOp>(&op)) {
      if (reduction)
        return false;
      reduction = loop;
    } else if (auto write = dyn_cast<memref::StoreOp>(&op)) {
      if (store)
        return false;
      store = write;
    } else if (auto constant = dyn_cast<arith::ConstantIndexOp>(&op)) {
      boundConstants.push_back(constant);
    } else {
      return false;
    }
  }
  if (!initial || !store || !reduction ||
      !reduction->hasAttr("sycl.register_accumulator") ||
      reduction.getNumResults() != 1 || reduction.getInitArgs().size() != 1 ||
      reduction.getRegionIterArgs().size() != 1 ||
      initial.getMemRef() != store.getMemRef() ||
      !llvm::equal(initial.getIndices(), store.getIndices()) ||
      reduction.getInitArgs().front() != initial.getResult() ||
      reduction.getResult(0) != store.getValueToStore() ||
      !store.getValueToStore().getType().isF32() ||
      !store.getMemRef().getDefiningOp<memref::AllocOp>() ||
      store.getIndices().size() < 2 || store.getIndices().size() > 3)
    return false;

  auto lower = reduction.getLowerBound().getDefiningOp<arith::ConstantIndexOp>();
  auto upper = reduction.getUpperBound().getDefiningOp<arith::ConstantIndexOp>();
  auto step = reduction.getStep().getDefiningOp<arith::ConstantIndexOp>();
  if (!lower || !upper || !step || boundConstants.size() != 3 ||
      !llvm::is_contained(boundConstants, lower) ||
      !llvm::is_contained(boundConstants, upper) ||
      !llvm::is_contained(boundConstants, step) || lower.value() != 0 ||
      step.value() != 1 || upper.value() < 16)
    return false;

  auto yield = dyn_cast<scf::YieldOp>(reduction.getBody()->getTerminator());
  if (!yield || yield.getNumOperands() != 1)
    return false;

  memref::LoadOp lhs, rhs;
  bool legal = true;
  for (Operation &op : reduction.getBody()->without_terminator()) {
    if (auto load = dyn_cast<memref::LoadOp>(&op)) {
      if (lhs && rhs)
        legal = false;
      else if (!lhs)
        lhs = load;
      else
        rhs = load;
    } else if (op.getNumRegions() || !isMemoryEffectFree(&op)) {
      legal = false;
    }
  }
  auto update = yield.getOperand(0).getDefiningOp<arith::AddFOp>();
  auto product = update ? update.getRhs().getDefiningOp<arith::MulFOp>()
                        : arith::MulFOp();
  auto source = [](Value value) {
    if (auto cast = value.getDefiningOp<arith::ExtFOp>())
      return cast.getIn();
    return value;
  };
  if (!legal || !lhs || !rhs || !update || !product ||
      update.getLhs() != reduction.getRegionIterArgs().front() ||
      source(product.getLhs()) != lhs.getResult() ||
      source(product.getRhs()) != rhs.getResult() ||
      lhs.getMemRef() == rhs.getMemRef() ||
      lhs.getMemRef() == store.getMemRef() ||
      rhs.getMemRef() == store.getMemRef() ||
      !lhs.getMemRef().getDefiningOp<memref::AllocOp>() ||
      !rhs.getMemRef().getDefiningOp<memref::AllocOp>())
    return false;

  // Once scalar replacement has removed accumulator traffic, the four-column
  // schedule regresses for f32 inputs in paired gfx906 measurements. Retain
  // composition only for two f16 inputs whose widening/reuse showed a benefit.
  // Inspect the actual loaded types, independently of the kernel or layout name.
  if (!lhs.getResult().getType().isF16() || !rhs.getResult().getType().isF16())
    return false;
  if (tile == 2 &&
      (!isDirectLaunchEntry(columns) ||
       !hasStaticIdentityBuffer(lhs.getMemRef()) ||
       !hasStaticIdentityBuffer(rhs.getMemRef()) ||
       !hasStaticIdentityBuffer(store.getMemRef())))
    return false;

  auto c = store.getIndices();
  auto a = lhs.getIndices();
  auto b = rhs.getIndices();
  unsigned rank = c.size();
  auto reductionIV = reduction.getInductionVar();
  if (a.size() != rank || b.size() != rank ||
      c[rank - 2] != rows.getInductionVar() ||
      c[rank - 1] != columns.getInductionVar() ||
      a[rank - 2] != rows.getInductionVar() ||
      a[rank - 1] != reductionIV || b[rank - 2] != reductionIV ||
      b[rank - 1] != columns.getInductionVar())
    return false;
  if (rank == 3 &&
      (a[0] != c[0] || b[0] != c[0] ||
       !columns.isDefinedOutsideOfLoop(c[0])))
    return false;

  OpBuilder builder(columns);
  auto loc = columns.getLoc();
  auto tiled = builder.create<affine::AffineForOp>(
      loc, 0, columns.getConstantUpperBound() / tile);
  tiled->setAttr("sycl.parallel", builder.getUnitAttr());
  tiled->setAttr("sycl.register_tile", builder.getI64IntegerAttr(tile));
  if (tile == 2)
    tiled->setAttr("sycl.two_column_candidate", builder.getUnitAttr());
  builder.setInsertionPointToStart(tiled.getBody());

  SmallVector<Value> indices, initialValues;
  for (int64_t lane = 0; lane < tile; ++lane) {
    auto expression = getAffineDimExpr(0, columns.getContext()) +
                      lane * (columns.getConstantUpperBound() / tile);
    indices.push_back(builder.create<affine::AffineApplyOp>(
        loc, AffineMap::get(1, 0, expression), tiled.getInductionVar()));
    SmallVector<Value> address(c.begin(), c.end());
    address.back() = indices.back();
    initialValues.push_back(
        builder.create<memref::LoadOp>(loc, store.getMemRef(), address));
  }

  Value lowerBound = builder.create<arith::ConstantIndexOp>(loc, 0);
  Value upperBound = builder.create<arith::ConstantIndexOp>(loc, upper.value());
  Value loopStep = builder.create<arith::ConstantIndexOp>(loc, 1);
  auto tiledReduction = builder.create<scf::ForOp>(
      loc, lowerBound, upperBound, loopStep, initialValues,
      [&](OpBuilder &nested, Location here, Value k, ValueRange carry) {
        SmallVector<Value> yields;
        for (int64_t lane = 0; lane < tile; ++lane) {
          IRMapping mapping;
          mapping.map(columns.getInductionVar(), indices[lane]);
          mapping.map(reduction.getInductionVar(), k);
          mapping.map(reduction.getRegionIterArgs().front(), carry[lane]);
          for (Operation &op : reduction.getBody()->without_terminator())
            nested.clone(op, mapping);
          yields.push_back(mapping.lookupOrDefault(yield.getOperand(0)));
        }
        nested.create<scf::YieldOp>(here, yields);
      });
  tiledReduction->setAttr("sycl.thread_private", builder.getUnitAttr());
  tiledReduction->setAttr("sycl.register_accumulator", builder.getUnitAttr());
  tiledReduction->setAttr("sycl.register_tile_composed_accumulator",
                          builder.getUnitAttr());
  for (int64_t lane = 0; lane < tile; ++lane) {
    SmallVector<Value> address(c.begin(), c.end());
    address.back() = indices[lane];
    builder.create<memref::StoreOp>(loc, tiledReduction.getResult(lane),
                                    store.getMemRef(), address);
  }
  columns.erase();
  return true;
}

// Four output columns share each f16 left-hand input, widened to f32. This uses
// ordinary scalar arithmetic and LDS reads, including on gfx906; no matrix
// instruction exists in this lowering. Each output retains the K update order.
struct MatmulRegisterTilingPass
    : PassWrapper<MatmulRegisterTilingPass, OperationPass<ModuleOp>> {
  MLIR_DEFINE_EXPLICIT_INTERNAL_INLINE_TYPE_ID(MatmulRegisterTilingPass)
  explicit MatmulRegisterTilingPass(bool twoColumnFallback = false)
      : twoColumnFallback(twoColumnFallback) {}
  StringRef getArgument() const final { return "sycl-matmul-register-tiling"; }
  StringRef getDescription() const final { return "Register-tile independent static contractions without reassociation"; }
  void getDependentDialects(DialectRegistry &registry) const override {
    registry.insert<affine::AffineDialect, arith::ArithDialect, memref::MemRefDialect, scf::SCFDialect>();
  }
  void runOnOperation() override {
    SmallVector<affine::AffineForOp> candidates;
    getOperation().walk([&](affine::AffineForOp loop) {
      if (loop->hasAttr("sycl.reduction")) candidates.push_back(loop);
    });
    for (auto reduction : candidates) {
      auto columns = dyn_cast<affine::AffineForOp>(reduction->getParentOp());
      auto rows = columns ? dyn_cast<affine::AffineForOp>(columns->getParentOp()) : affine::AffineForOp();
      if (!rows || !columns || columns.getBody()->getOperations().size() != 2 ||
          !hasDistributedOutputNest(rows, columns) ||
          rows.getBody()->getOperations().size() != 2 ||
          !reduction.hasConstantBounds() || !columns.hasConstantBounds() || !rows.hasConstantBounds() ||
          reduction.getNumResults() || columns.getNumResults() || rows.getNumResults() ||
          reduction.getConstantLowerBound() || columns.getConstantLowerBound() || rows.getConstantLowerBound() ||
          reduction.getStep()!=1 || columns.getStep()!=1 || rows.getStep()!=1 ||
          reduction.getConstantUpperBound()<16 || columns.getConstantUpperBound()<16 ||
          rows.getConstantUpperBound()<8) continue;
      int64_t tile = 4;
      if (!hasEnoughTiledOutputWork(columns, tile)) {
        if (!twoColumnFallback || !hasTwoColumnOpportunity(columns)) continue;
        tile = 2;
      }
      if (columns.getConstantUpperBound()%tile ||
          !hasEnoughTiledOutputWork(columns, tile)) continue;
      affine::AffineStoreOp store;
      SmallVector<affine::AffineLoadOp> loads;
      bool legal=true;
      for (Operation &inner : reduction.getBody()->without_terminator()) {
        if (auto load=dyn_cast<affine::AffineLoadOp>(&inner)) loads.push_back(load);
        else if (auto write=dyn_cast<affine::AffineStoreOp>(&inner)) {
          if (store) legal=false;
          store=write;
        } else if (!isa<arith::ExtFOp, arith::MulFOp, arith::AddFOp>(inner)) legal=false;
      }
      if (!legal || !store || loads.size()!=3 || !store.getAffineMap().isIdentity() ||
          !store.getValueToStore().getType().isF32()) continue;
      affine::AffineLoadOp accumulator, lhs, rhs;
      for (auto load:loads) {
        if (!load.getAffineMap().isIdentity() || !load.getMemRef().getDefiningOp<memref::AllocOp>()) {legal=false;break;}
        if (load.getMemRef()==store.getMemRef() && load.getMapOperands()==store.getMapOperands()) accumulator=load;
        else if (llvm::is_contained(load.getMapOperands(),columns.getInductionVar())) rhs=load;
        else lhs=load;
      }
      if (!legal || !accumulator || !lhs || !rhs ||
          lhs.getMemRef()==rhs.getMemRef() || lhs.getMemRef()==store.getMemRef() ||
          rhs.getMemRef()==store.getMemRef()) continue;
      // Keep the same measured input-type rule in the standalone schedule.
      // F32-only tiling also has no stable benefit across held-out shapes.
      if (!lhs.getResult().getType().isF16() ||
          !rhs.getResult().getType().isF16()) continue;
      if (tile == 2 &&
          (!isDirectLaunchEntry(columns) ||
           !hasStaticIdentityBuffer(lhs.getMemRef()) ||
           !hasStaticIdentityBuffer(rhs.getMemRef()) ||
           !hasStaticIdentityBuffer(store.getMemRef()))) continue;
      auto c=store.getMapOperands(), a=lhs.getMapOperands(), b=rhs.getMapOperands();
      if (c.size()<2 || a.size()!=c.size() || b.size()!=c.size() || c.size()>3) continue;
      unsigned rank=c.size();
      if (c[rank-2]!=rows.getInductionVar() || c[rank-1]!=columns.getInductionVar() ||
          a[rank-2]!=rows.getInductionVar() || a[rank-1]!=reduction.getInductionVar() ||
          b[rank-2]!=reduction.getInductionVar() || b[rank-1]!=columns.getInductionVar()) continue;
      if (rank==3 && (a[0]!=c[0] || b[0]!=c[0])) continue;
      if (rank==3 && !columns.isDefinedOutsideOfLoop(c[0])) continue;
      auto update=store.getValueToStore().getDefiningOp<arith::AddFOp>();
      if (!update || update.getLhs()!=accumulator.getResult() ||
          !update.getRhs().getDefiningOp<arith::MulFOp>()) continue;
      auto product=update.getRhs().getDefiningOp<arith::MulFOp>();
      auto source=[](Value v) { if (auto cast=v.getDefiningOp<arith::ExtFOp>()) return cast.getIn(); return v; };
      if (source(product.getLhs())!=lhs.getResult() || source(product.getRhs())!=rhs.getResult()) continue;
      OpBuilder builder(columns);
      auto loc=columns.getLoc();
      auto tiled=builder.create<affine::AffineForOp>(loc,0,columns.getConstantUpperBound()/tile);
      tiled->setAttr("sycl.parallel",builder.getUnitAttr());
      tiled->setAttr("sycl.register_tile",builder.getI64IntegerAttr(tile));
      if (tile == 2)
        tiled->setAttr("sycl.two_column_candidate",builder.getUnitAttr());
      builder.setInsertionPointToStart(tiled.getBody());
      SmallVector<Value> indices, initial;
      for (int64_t lane=0;lane<tile;++lane) {
        // Adjacent work-items access adjacent columns in each register lane.
        // A consecutive four-column microtile would stride LDS by four across
        // a wave and lose most of the benefit of left-operand reuse.
        auto expression=getAffineDimExpr(0,&getContext())+lane*(columns.getConstantUpperBound()/tile);
        indices.push_back(builder.create<affine::AffineApplyOp>(loc,AffineMap::get(1,0,expression),tiled.getInductionVar()));
        SmallVector<Value> address(c.begin(),c.end()); address.back()=indices.back();
        initial.push_back(builder.create<memref::LoadOp>(loc,store.getMemRef(),address));
      }
      Value lower=builder.create<arith::ConstantIndexOp>(loc,0);
      Value upper=builder.create<arith::ConstantIndexOp>(loc,reduction.getConstantUpperBound());
      Value step=builder.create<arith::ConstantIndexOp>(loc,1);
      auto inner=builder.create<scf::ForOp>(loc,lower,upper,step,initial,
          [&](OpBuilder &nested,Location here,Value k,ValueRange carry) {
            SmallVector<Value> yields;
            for (int64_t lane=0;lane<tile;++lane) {
              IRMapping mapping;
              mapping.map(columns.getInductionVar(),indices[lane]);
              mapping.map(reduction.getInductionVar(),k);
              mapping.map(accumulator.getResult(),carry[lane]);
              for (Operation &op:reduction.getBody()->without_terminator()) {
                if (&op==accumulator.getOperation() || &op==store.getOperation()) continue;
                if (auto load=dyn_cast<affine::AffineLoadOp>(&op)) {
                  SmallVector<Value> address;
                  for (Value v:load.getMapOperands()) address.push_back(mapping.lookupOrDefault(v));
                  mapping.map(load.getResult(),nested.create<memref::LoadOp>(here,load.getMemRef(),address));
                } else nested.clone(op,mapping);
              }
              yields.push_back(mapping.lookupOrDefault(store.getValueToStore()));
            }
            nested.create<scf::YieldOp>(here,yields);
          });
      inner->setAttr("sycl.thread_private",builder.getUnitAttr());
      inner->setAttr("sycl.register_accumulator",builder.getUnitAttr());
      for (int64_t lane=0;lane<tile;++lane) {
        SmallVector<Value> address(c.begin(),c.end()); address.back()=indices[lane];
        builder.create<memref::StoreOp>(loc,inner.getResult(lane),store.getMemRef(),address);
      }
      columns.erase();
    }

    SmallVector<affine::AffineForOp> promotedColumns;
    getOperation().walk([&](affine::AffineForOp columns) {
      for (Operation &op : columns.getBody()->without_terminator())
        if (auto reduction = dyn_cast<scf::ForOp>(&op))
          if (reduction->hasAttr("sycl.register_accumulator"))
            promotedColumns.push_back(columns);
    });
    for (auto columns : promotedColumns) {
      // Keep every existing four-column decision and source unchanged. The
      // narrower candidate is only an opportunity when four columns cannot
      // preserve one complete wavefront of distributed output work.
      if (twoColumnFallback && hasTwoColumnOpportunity(columns))
        tilePromotedContraction(columns, 2);
      else
        tilePromotedContraction(columns, 4);
    }
  }
  bool twoColumnFallback;
};
}
namespace mlir::triton::sycl {
std::unique_ptr<OperationPass<ModuleOp>>
createMatmulRegisterTilingPass(bool twoColumnFallback) {
  return std::make_unique<MatmulRegisterTilingPass>(twoColumnFallback);
}
}
