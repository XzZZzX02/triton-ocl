#include "sycl/include/Conversion/LinalgToAffineLoops/Passes.h"
#include "mlir/Dialect/Affine/IR/AffineOps.h"
#include "mlir/IR/BuiltinOps.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/Dialect/MemRef/IR/MemRef.h"
#include "llvm/ADT/DenseMap.h"

using namespace mlir;
namespace {
// SYCL translation synchronizes after every top-level affine phase. Only
// allocations whose direct uses are contained in these phases can share space.
// Escaping values, views, nested allocations and overlapping intervals fail
// legality conservatively; no kernel names or workload dimensions are matched.
struct LocalMemoryReusePass
    : PassWrapper<LocalMemoryReusePass, OperationPass<ModuleOp>> {
  MLIR_DEFINE_EXPLICIT_INTERNAL_INLINE_TYPE_ID(LocalMemoryReusePass)
  StringRef getArgument() const final { return "sycl-local-memory-reuse"; }
  StringRef getDescription() const final { return "Reuse equal-typed SYCL local buffers across disjoint synchronized phases"; }
  void runOnOperation() override {
    for (auto function : getOperation().getOps<func::FuncOp>()) {
      if (function.empty()) continue;
      struct Interval { memref::AllocOp allocation; unsigned first, last; bool legal; };
      SmallVector<Interval> intervals, slots;
      DenseMap<Operation *, unsigned> position;
      unsigned end = 0;
      for (Operation &operation : function.front()) position[&operation] = end++;
      int64_t before = 0, after = 0, reused = 0;
      function.walk([&](memref::AllocOp allocation) {
        auto type = allocation.getType();
        if (!type.hasStaticShape()) return;
        before += type.getNumElements() * std::max<unsigned>(8, type.getElementTypeBitWidth()) / 8;
        Interval interval{allocation, end, 0, allocation->getBlock() == &function.front()};
        for (Operation *use : allocation.getResult().getUsers()) {
          if (isa<memref::DeallocOp>(use)) continue;
          if (!isa<memref::LoadOp, memref::StoreOp, affine::AffineLoadOp, affine::AffineStoreOp>(use)) interval.legal = false;
          Operation *phase = use;
          while (phase && phase->getBlock() != &function.front()) phase = phase->getParentOp();
          if (!phase || !isa<affine::AffineForOp>(phase)) { interval.legal = false; continue; }
          interval.first = std::min(interval.first, position[phase]);
          interval.last = std::max(interval.last, position[phase]);
        }
        intervals.push_back(interval);
      });
      llvm::stable_sort(intervals, [](const Interval &a, const Interval &b) { return a.first < b.first; });
      for (auto interval : intervals) {
        auto slot = llvm::find_if(slots, [&](const Interval &prior) {
          return interval.legal && prior.legal && prior.last < interval.first &&
                 prior.allocation->getResult(0).getType() == interval.allocation.getType();
        });
        if (slot == slots.end()) {
          slots.push_back(interval);
          auto type = interval.allocation.getType();
          after += type.getNumElements() * std::max<unsigned>(8, type.getElementTypeBitWidth()) / 8;
          continue;
        }
        SmallVector<Operation *> deallocations;
        for (Operation *user : interval.allocation.getResult().getUsers())
          if (isa<memref::DeallocOp>(user)) deallocations.push_back(user);
        for (Operation *user : deallocations) user->erase();
        // Local storage is owned by the generated command group, not dealloc.
        deallocations.clear();
        for (Operation *user : slot->allocation.getResult().getUsers())
          if (isa<memref::DeallocOp>(user)) deallocations.push_back(user);
        for (Operation *user : deallocations) user->erase();
        interval.allocation.getResult().replaceAllUsesWith(slot->allocation.getResult());
        interval.allocation.erase();
        slot->last = interval.last;
        ++reused;
      }
      auto builder = Builder(&getContext());
      function->setAttr("sycl.local_bytes_before", builder.getI64IntegerAttr(before));
      function->setAttr("sycl.local_bytes_after", builder.getI64IntegerAttr(after));
      function->setAttr("sycl.local_buffers_reused", builder.getI64IntegerAttr(reused));
    }
  }
};
}
namespace mlir::triton::sycl {
std::unique_ptr<OperationPass<ModuleOp>> createLocalMemoryReusePass() {
  return std::make_unique<LocalMemoryReusePass>();
}
}
