#include "sycl/include/Conversion/LinalgToAffineLoops/Passes.h"
#include "mlir/Dialect/Affine/IR/AffineOps.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/Dialect/GPU/IR/GPUDialect.h"
#include "mlir/IR/BuiltinOps.h"

using namespace mlir;
namespace {
// Share the complete address/effect/ownership proof with wide terminal stores.
// Keep this separately configurable: narrow stores need explicit bit accesses
// and have their own measured profitability and correctness domain.
struct HalfStoreDistributionPass
    : PassWrapper<HalfStoreDistributionPass, OperationPass<ModuleOp>> {
  MLIR_DEFINE_EXPLICIT_INTERNAL_INLINE_TYPE_ID(HalfStoreDistributionPass)
  StringRef getArgument() const final { return "sycl-half-store-distribution"; }
  StringRef getDescription() const final {
    return "Distribute proven terminal IEEE binary16 copies with guarded storage accesses";
  }
  void getDependentDialects(DialectRegistry &registry) const override {
    registry.insert<gpu::GPUDialect>();
  }
  void runOnOperation() override {
    SmallVector<affine::AffineForOp> candidates;
    getOperation().walk([&](affine::AffineForOp loop) {
      if (isa<func::FuncOp>(loop->getParentOp()))
        candidates.push_back(loop);
    });
    for (auto loop : candidates)
      mlir::triton::sycl::planHalfStoreDistribution(loop);
  }
};
} // namespace

std::unique_ptr<OperationPass<ModuleOp>>
mlir::triton::sycl::createHalfStoreDistributionPass() {
  return std::make_unique<HalfStoreDistributionPass>();
}
