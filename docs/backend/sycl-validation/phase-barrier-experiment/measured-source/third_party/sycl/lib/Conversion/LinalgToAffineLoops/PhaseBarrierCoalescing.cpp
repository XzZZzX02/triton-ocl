#include "sycl/include/Conversion/LinalgToAffineLoops/Passes.h"
#include "mlir/Dialect/Affine/IR/AffineOps.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/Dialect/GPU/IR/GPUDialect.h"
#include "mlir/Dialect/MemRef/IR/MemRef.h"
#include "mlir/Interfaces/SideEffectInterfaces.h"

using namespace mlir;
namespace {
constexpr StringLiteral entry = "sycl.coalesced_entry_barrier";
constexpr StringLiteral explicitBarrier = "sycl.coalesced_local_barrier";
constexpr StringLiteral count = "sycl.phase_barriers_coalesced";

// Only operations emitted without device memory effects may separate the two
// barriers. Allocations are local accessors created in the host command group;
// deallocation is likewise owned by that command group in this backend.
static bool transparent(Operation *op) {
  if (isa<memref::AllocOp, memref::DeallocOp, memref::CastOp,
          memref::ReinterpretCastOp>(op))
    return true;
  return !op->getNumRegions() && isMemoryEffectFree(op) &&
         (op->getName().getDialectNamespace() == "arith" ||
          isa<affine::AffineApplyOp, affine::AffineMaxOp,
              affine::AffineMinOp>(op));
}

// This pass plans SYCL source emission, rather than deleting a general GPU IR
// barrier: every top-level affine phase in this backend ends with a uniform
// local-space barrier, whether scalar-owned, distributed or vector-copy.
// Keep its exit barrier; coalesce only a later identical barrier reached with
// no intervening memory access/control flow. Do not infer disjointness.
struct PhaseBarrierCoalescingPass
    : PassWrapper<PhaseBarrierCoalescingPass, OperationPass<ModuleOp>> {
  MLIR_DEFINE_EXPLICIT_INTERNAL_INLINE_TYPE_ID(PhaseBarrierCoalescingPass)
  StringRef getArgument() const final { return "sycl-phase-barrier-coalescing"; }
  StringRef getDescription() const final {
    return "Coalesce duplicate local barriers between unconditional SYCL phases";
  }
  void runOnOperation() override {
    getOperation().walk([](Operation *op) {
      op->removeAttr(entry);
      op->removeAttr(explicitBarrier);
      op->removeAttr(count);
    });
    for (auto function : getOperation().getOps<func::FuncOp>()) {
      if (function.empty()) continue;
      bool synchronized = false;
      int64_t removed = 0;
      Builder builder(&getContext());
      for (Operation &op : function.front()) {
        if (auto loop = dyn_cast<affine::AffineForOp>(&op)) {
          // Distributed/vector phases have no implicit entry barrier to skip.
          if (synchronized && !loop->hasAttr("sycl.distribute") &&
              !loop->hasAttr("sycl.vector_copy")) {
            loop->setAttr(entry, builder.getUnitAttr());
            ++removed;
          }
          synchronized = true; // The phase's exit barrier is always retained.
        } else if (isa<gpu::BarrierOp>(&op)) {
          if (synchronized) {
            op.setAttr(explicitBarrier, builder.getUnitAttr());
            ++removed;
          }
          synchronized = true;
        } else if (!transparent(&op)) {
          // Reads count as effects too: a later barrier may protect those
          // readers against subsequent writes by a faster work-item.
          synchronized = false;
        }
      }
      if (removed)
        function->setAttr(count, builder.getI64IntegerAttr(removed));
    }
  }
};
} // namespace

std::unique_ptr<OperationPass<ModuleOp>>
mlir::triton::sycl::createPhaseBarrierCoalescingPass() {
  return std::make_unique<PhaseBarrierCoalescingPass>();
}
