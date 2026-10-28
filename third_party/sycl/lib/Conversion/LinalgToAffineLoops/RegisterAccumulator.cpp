#include "sycl/include/Conversion/LinalgToAffineLoops/Passes.h"
#include "mlir/Dialect/Affine/IR/AffineOps.h"
#include "mlir/Dialect/Arith/IR/Arith.h"
#include "mlir/Dialect/MemRef/IR/MemRef.h"
#include "mlir/Dialect/SCF/IR/SCF.h"
#include "mlir/IR/BuiltinOps.h"
#include "mlir/IR/IRMapping.h"
#include "mlir/Interfaces/SideEffectInterfaces.h"

using namespace mlir;
namespace {
// Promote a single invariant accumulator through an innermost reduction. This
// is scalar replacement, not reassociation: every update retains its order.
struct RegisterAccumulatorPass
    : PassWrapper<RegisterAccumulatorPass, OperationPass<ModuleOp>> {
  MLIR_DEFINE_EXPLICIT_INTERNAL_INLINE_TYPE_ID(RegisterAccumulatorPass)
  StringRef getArgument() const final { return "sycl-register-accumulator"; }
  StringRef getDescription() const final { return "Promote proven independent nested reduction accumulators into SSA"; }
  void getDependentDialects(DialectRegistry &registry) const override {
    registry.insert<scf::SCFDialect, memref::MemRefDialect, arith::ArithDialect>();
  }
  void runOnOperation() override {
    SmallVector<affine::AffineForOp> loops;
    getOperation().walk([&](affine::AffineForOp loop) {
      if (loop->hasAttr("sycl.reduction") &&
          loop->getParentOfType<affine::AffineForOp>() &&
          loop.getNumResults() == 0 &&
          loop.hasConstantBounds() && loop.getStep()==1 &&
          loop.getConstantUpperBound()>loop.getConstantLowerBound()) loops.push_back(loop);
    });
    for (auto loop : loops) {
      affine::AffineStoreOp store;
      bool legal=true;
      for (Operation &inner : loop.getBody()->without_terminator()) {
        if (auto write=dyn_cast<affine::AffineStoreOp>(&inner)) {
          if (store) legal=false;
          store=write;
        } else if (!isa<affine::AffineLoadOp>(inner) &&
                   (!isMemoryEffectFree(&inner) || inner.getNumRegions())) legal=false;
      }
      if (!legal || !store || !store.getMemRef().getDefiningOp<memref::AllocOp>() ||
          !store.getAffineMap().isIdentity()) continue;
      bool uniqueAccumulatorPerParallelIteration = true;
      for (auto parent = loop->getParentOfType<affine::AffineForOp>(); parent;
           parent = parent->getParentOfType<affine::AffineForOp>())
        if (parent->hasAttr("sycl.parallel") &&
            !llvm::is_contained(store.getMapOperands(), parent.getInductionVar()))
          uniqueAccumulatorPerParallelIteration = false;
      if (!uniqueAccumulatorPerParallelIteration) continue;
      // Values derived from the induction variable are variant as well. The
      // initial/final accesses move outside the loop, so every address operand
      // must be defined outside it, not merely different from the direct IV.
      if (llvm::any_of(store.getMapOperands(), [&](Value index) {
            return !loop.isDefinedOutsideOfLoop(index);
          })) continue;
      affine::AffineLoadOp accumulator;
      for (Operation &inner : loop.getBody()->without_terminator()) {
        auto load=dyn_cast<affine::AffineLoadOp>(&inner);
        if (!load) continue;
        if (!load.getAffineMap().isIdentity() ||
            !load.getMemRef().getDefiningOp<memref::AllocOp>()) { legal=false; break; }
        if (load.getMemRef()==store.getMemRef()) {
          if (accumulator || load.getMapOperands()!=store.getMapOperands()) legal=false;
          accumulator=load;
        }
      }
      if (!legal || !accumulator) continue;
      OpBuilder builder(loop);
      auto loc=loop.getLoc();
      Value initial=builder.create<memref::LoadOp>(loc,store.getMemRef(),store.getMapOperands());
      Value lower=builder.create<arith::ConstantIndexOp>(loc,loop.getConstantLowerBound());
      Value upper=builder.create<arith::ConstantIndexOp>(loc,loop.getConstantUpperBound());
      Value step=builder.create<arith::ConstantIndexOp>(loc,1);
      auto promoted=builder.create<scf::ForOp>(loc,lower,upper,step,ValueRange{initial},
          [&](OpBuilder &nested,Location here,Value index,ValueRange carry) {
            IRMapping mapping;
            mapping.map(loop.getInductionVar(),index);
            mapping.map(accumulator.getResult(),carry[0]);
            for (Operation &inner : loop.getBody()->without_terminator()) {
              if (&inner==accumulator.getOperation() || &inner==store.getOperation()) continue;
              if (auto load=dyn_cast<affine::AffineLoadOp>(&inner)) {
                SmallVector<Value> indices;
                for (Value operand : load.getMapOperands()) indices.push_back(mapping.lookupOrDefault(operand));
                mapping.map(load.getResult(),nested.create<memref::LoadOp>(here,load.getMemRef(),indices));
              } else nested.clone(inner,mapping);
            }
            nested.create<scf::YieldOp>(here,mapping.lookupOrDefault(store.getValueToStore()));
          });
      promoted->setAttr("sycl.thread_private",builder.getUnitAttr());
      promoted->setAttr("sycl.register_accumulator",builder.getUnitAttr());
      builder.create<memref::StoreOp>(loc,promoted.getResult(0),store.getMemRef(),store.getMapOperands());
      // Keep outer loop scheduling visible to the backend's distribution pass.
      loop.erase();
    }
  }
};
}
namespace mlir::triton::sycl {
std::unique_ptr<OperationPass<ModuleOp>> createRegisterAccumulatorPass() {
  return std::make_unique<RegisterAccumulatorPass>();
}
}
