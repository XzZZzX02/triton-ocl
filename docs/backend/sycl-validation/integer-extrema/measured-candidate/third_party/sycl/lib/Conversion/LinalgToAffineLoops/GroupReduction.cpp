#include "sycl/include/Conversion/LinalgToAffineLoops/Passes.h"
#include "mlir/Dialect/Affine/IR/AffineOps.h"
#include "mlir/Dialect/Arith/IR/Arith.h"
#include "mlir/Dialect/Arith/Utils/Utils.h"
#include "mlir/Dialect/GPU/IR/GPUDialect.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/Dialect/MemRef/IR/MemRef.h"
#include "mlir/Dialect/SCF/IR/SCF.h"
#include "mlir/IR/IRMapping.h"
#include "mlir/IR/BuiltinOps.h"

using namespace mlir;
namespace {
struct GroupReductionPass : PassWrapper<GroupReductionPass, OperationPass<ModuleOp>> {
  MLIR_DEFINE_EXPLICIT_INTERNAL_INLINE_TYPE_ID(GroupReductionPass)
  StringRef getArgument() const final { return "sycl-group-reduction"; }
  StringRef getDescription() const final { return "Distribute independent scalar reductions and materialize gpu.all_reduce"; }
  void getDependentDialects(DialectRegistry &registry) const override {
    registry.insert<arith::ArithDialect, gpu::GPUDialect, scf::SCFDialect>();
  }
  void runOnOperation() override {
    SmallVector<affine::AffineForOp> candidates;
    getOperation().walk([&](affine::AffineForOp loop) {
      // Collectives must execute uniformly across the entire work-group.
      if (isa<func::FuncOp>(loop->getParentOp()) && loop->hasAttr("sycl.reduction") &&
          loop.hasConstantBounds() && loop.getConstantLowerBound() == 0 &&
          loop.getStep() == 1 && loop.getConstantUpperBound() >= 256) candidates.push_back(loop);
    });
    for (auto loop : candidates) {
      SmallVector<affine::AffineLoadOp> loads;
      affine::AffineStoreOp store;
      Operation *combine = nullptr;
      bool legal = true;
      for (Operation &inner : loop.getBody()->without_terminator()) {
        if (auto load = dyn_cast<affine::AffineLoadOp>(&inner)) loads.push_back(load);
        else if (auto write = dyn_cast<affine::AffineStoreOp>(&inner)) {
          if (store) legal = false;
          store = write;
        } else {
          if (combine) legal = false;
          combine = &inner;
        }
      }
      if (!legal || !store || !combine || loads.size() != 2 ||
          combine->getNumOperands() != 2 || combine->getNumResults() != 1 ||
          store.getValueToStore() != combine->getResult(0) || !store.getMapOperands().empty()) continue;
      affine::AffineLoadOp input, accumulator;
      for (auto load : loads) {
        if (load.getMemRef() == store.getMemRef() && load.getMapOperands().empty()) accumulator = load;
        else input = load;
      }
      // Distinct SSA memrefs can still alias through views or arguments.
      // Only separate owned allocations establish independence here.
      if (!input || !accumulator ||
          !input.getMemRef().getDefiningOp<memref::AllocOp>() ||
          !store.getMemRef().getDefiningOp<memref::AllocOp>() ||
          input.getMemRef() == store.getMemRef() ||
          !input.getAffineMap().isIdentity() ||
          !llvm::is_contained(input.getMapOperands(), loop.getInductionVar())) continue;
      if (!((combine->getOperand(0) == input.getResult() && combine->getOperand(1) == accumulator.getResult()) ||
            (combine->getOperand(1) == input.getResult() && combine->getOperand(0) == accumulator.getResult()))) continue;
      // Both loads must feed only the combiner. Reject escaping values.
      if (!input.getResult().hasOneUse() || !accumulator.getResult().hasOneUse() ||
          !combine->getResult(0).hasOneUse()) continue;
      auto identity = arith::getNeutralElement(combine);
      if (!identity) continue;
      std::optional<gpu::AllReduceOperation> kind;
      if (isa<arith::AddFOp, arith::AddIOp>(combine)) kind = gpu::AllReduceOperation::ADD;
      else if (isa<arith::MulFOp, arith::MulIOp>(combine)) kind = gpu::AllReduceOperation::MUL;
      else if (isa<arith::AndIOp>(combine)) kind = gpu::AllReduceOperation::AND;
      else if (isa<arith::OrIOp>(combine)) kind = gpu::AllReduceOperation::OR;
      else if (isa<arith::XOrIOp>(combine)) kind = gpu::AllReduceOperation::XOR;
      else if (isa<arith::MinSIOp>(combine)) kind = gpu::AllReduceOperation::MINSI;
      else if (isa<arith::MaxSIOp>(combine)) kind = gpu::AllReduceOperation::MAXSI;
      else if (isa<arith::MinUIOp>(combine)) kind = gpu::AllReduceOperation::MINUI;
      else if (isa<arith::MaxUIOp>(combine)) kind = gpu::AllReduceOperation::MAXUI;
      if (!kind) continue;
      Type type = combine->getResult(0).getType();
      if (!(type.isF32() || type.isF64() || type.isInteger(32) || type.isInteger(64))) continue;
      OpBuilder builder(loop);
      Location loc = loop.getLoc();
      auto binary = [&](auto tag, Value a, Value b) -> Value {
        return builder.create<decltype(tag)>(loc, a, b);
      };
      Value tx = builder.create<gpu::ThreadIdOp>(loc, gpu::Dimension::x);
      Value ty = builder.create<gpu::ThreadIdOp>(loc, gpu::Dimension::y);
      Value tz = builder.create<gpu::ThreadIdOp>(loc, gpu::Dimension::z);
      Value bx = builder.create<gpu::BlockDimOp>(loc, gpu::Dimension::x);
      Value by = builder.create<gpu::BlockDimOp>(loc, gpu::Dimension::y);
      Value bz = builder.create<gpu::BlockDimOp>(loc, gpu::Dimension::z);
      Value linear = binary(arith::AddIOp{}, binary(arith::MulIOp{},
          binary(arith::AddIOp{}, binary(arith::MulIOp{}, tx, by), ty), bz), tz);
      Value count = binary(arith::MulIOp{}, binary(arith::MulIOp{}, bx, by), bz);
      Value upper = builder.create<arith::ConstantIndexOp>(loc, loop.getConstantUpperBound());
      Value neutral = builder.create<arith::ConstantOp>(loc, *identity);
      auto partial = builder.create<scf::ForOp>(loc, linear, upper, count, ValueRange{neutral},
          [&](OpBuilder &nested, Location here, Value index, ValueRange carry) {
            IRMapping mapping;
            mapping.map(loop.getInductionVar(), index);
            mapping.map(accumulator.getResult(), carry[0]);
            // A thread-dependent SCF induction value is not an affine dim.
            SmallVector<Value> indices;
            for (Value operand : input.getMapOperands())
              indices.push_back(mapping.lookupOrDefault(operand));
            Value value = nested.create<memref::LoadOp>(here, input.getMemRef(), indices);
            mapping.map(input.getResult(), value);
            auto update = nested.clone(*combine, mapping);
            nested.create<scf::YieldOp>(here, update->getResult(0));
          });
      partial->setAttr("sycl.thread_private", builder.getUnitAttr());
      Value reduced = builder.create<gpu::AllReduceOp>(loc, partial.getResult(0),
          gpu::AllReduceOperationAttr::get(&getContext(), *kind), true);
      Value zero = builder.create<arith::ConstantIndexOp>(loc, 0);
      Value owner = builder.create<arith::CmpIOp>(loc, arith::CmpIPredicate::eq, linear, zero);
      builder.create<scf::IfOp>(loc, owner, [&](OpBuilder &nested, Location here) {
        IRMapping mapping;
        nested.clone(*accumulator, mapping);
        mapping.map(input.getResult(), reduced);
        nested.clone(*combine, mapping);
        auto write = nested.clone(*store, mapping);
        write->setAttr("sycl.scalar_owner", nested.getUnitAttr());
        nested.create<scf::YieldOp>(here);
      });
      builder.create<gpu::BarrierOp>(loc);
      loop.erase();
    }
  }
};
}
namespace mlir::triton::sycl {
std::unique_ptr<OperationPass<ModuleOp>> createGroupReductionPass() { return std::make_unique<GroupReductionPass>(); }
}
