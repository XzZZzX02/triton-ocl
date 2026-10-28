#include "sycl/include/Conversion/LinalgToAffineLoops/Passes.h"
#include "llvm/ADT/DenseSet.h"
#include "llvm/ADT/STLExtras.h"
#include "mlir/Dialect/Affine/IR/AffineOps.h"
#include "mlir/Dialect/MemRef/IR/MemRef.h"
#include "mlir/IR/BuiltinOps.h"

using namespace mlir;
namespace {
// A parallel iterator is necessary but not sufficient: prove that every
// distributed induction variable occupies its own identity-map store index.
// Restrict stores to distinct allocations so captured pointer aliasing cannot
// introduce cross-work-item write conflicts.
static bool hasUniqueStores(affine::AffineForOp root,
                            ArrayRef<affine::AffineForOp> distributed) {
  SmallVector<Value> parallelIVs;
  for (auto loop : distributed)
    parallelIVs.push_back(loop.getInductionVar());

  SmallVector<Value> storedBuffers;
  SmallVector<affine::AffineStoreOp> stores;
  bool foundStore = false;
  bool legal = true;
  root.walk([&](affine::AffineStoreOp store) {
    foundStore = true;
    Value buffer = store.getMemRef();
    if (!buffer.getDefiningOp<memref::AllocOp>()) {
      legal = false;
      return;
    }
    if (!root.isDefinedOutsideOfLoop(buffer)) {
      legal = false;
      return;
    }
    if (llvm::is_contained(storedBuffers, buffer) ||
        !store.getAffineMap().isIdentity()) {
      legal = false;
      return;
    }
    storedBuffers.push_back(buffer);
    stores.push_back(store);

    DenseSet<Value> represented;
    for (Value index : store.getMapOperands()) {
      if (llvm::is_contained(parallelIVs, index)) {
        if (!represented.insert(index).second)
          legal = false;
      }
    }
    if (represented.size() != parallelIVs.size())
      legal = false;
  });

  // Same-cell read/modify/write is independent once each work-item owns a
  // unique output index. Neighbor reads and alias-producing uses are not.
  for (auto store : stores) {
    for (Operation *user : store.getMemRef().getUsers()) {
      if (!root->isAncestor(user))
        continue;
      if (!isa<affine::AffineLoadOp, affine::AffineStoreOp,
               memref::DeallocOp>(user))
        legal = false;
    }
  }
  root.walk([&](affine::AffineLoadOp load) {
    auto found = llvm::find_if(stores, [&](affine::AffineStoreOp store) {
      return store.getMemRef() == load.getMemRef();
    });
    if (found != stores.end() &&
        (!load.getAffineMap().isIdentity() ||
         load.getMapOperands() != found->getMapOperands()))
      legal = false;
  });
  // Do not silently miss writes emitted in another memory dialect.
  root.walk([&](memref::StoreOp) { legal = false; });
  root.walk([&](memref::LoadOp load) {
    if (llvm::is_contained(storedBuffers, load.getMemRef()))
      legal = false;
  });
  return legal && foundStore;
}

// Iterator independence comes from structured lowering, never a guess based
// on the absence of a recognizable accumulator load. The translator only
// implements the schedule recorded here.
struct WorkDistributionPass
    : PassWrapper<WorkDistributionPass, OperationPass<ModuleOp>> {
  MLIR_DEFINE_EXPLICIT_INTERNAL_INLINE_TYPE_ID(WorkDistributionPass)
  StringRef getArgument() const final { return "sycl-work-distribution"; }
  StringRef getDescription() const final { return "Plan linear work-group distribution for proven parallel affine nests"; }
  void runOnOperation() override {
    getOperation().walk([&](affine::AffineForOp loop) {
      loop->removeAttr("sycl.distribute");
      loop->removeAttr("sycl.distribution_depth");
    });
    getOperation().walk([&](affine::AffineForOp loop) {
      if (loop->getParentOfType<affine::AffineForOp>() || !loop->hasAttr("sycl.parallel")) return;
      auto current=loop;
      unsigned depth=0;
      int64_t total=1;
      SmallVector<affine::AffineForOp> distributed;
      while (current && current->hasAttr("sycl.parallel") && !current->hasAttr("sycl.reduction") &&
             current.hasConstantBounds() && !current.getNumResults() &&
             current.getConstantLowerBound()==0 && current.getStep()==1) {
        int64_t size=current.getConstantUpperBound();
        if (size<=0 || total>INT64_MAX/size) return;
        total*=size; ++depth; distributed.push_back(current);
        auto &ops=current.getBody()->getOperations();
        if (ops.size()!=2) break;
        auto child=dyn_cast<affine::AffineForOp>(&ops.front());
        if (!child || !child->hasAttr("sycl.parallel")) break;
        current=child;
      }
      if (!depth) return;
      bool incomplete=false;
      current.walk([&](affine::AffineForOp nested) {
        if (nested!=current && nested->hasAttr("sycl.parallel") &&
            !nested->hasAttr("sycl.reduction"))
          incomplete=true;
      });
      if (incomplete || !hasUniqueStores(loop, distributed)) return;
      Builder builder(&getContext());
      loop->setAttr("sycl.distribute",builder.getUnitAttr());
      loop->setAttr("sycl.distribution_depth",builder.getI64IntegerAttr(depth));
    });
  }
};
}
namespace mlir::triton::sycl {
std::unique_ptr<OperationPass<ModuleOp>> createWorkDistributionPass() { return std::make_unique<WorkDistributionPass>(); }
}
