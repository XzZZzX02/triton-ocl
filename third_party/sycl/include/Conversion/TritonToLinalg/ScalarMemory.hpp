// Generic, lane-wise memory lowering. Address arithmetic and predicates stay
// executable IR instead of being approximated as rectangular memory regions.
#ifndef TRITON_SYCL_SCALAR_MEMORY_H
#define TRITON_SYCL_SCALAR_MEMORY_H

#include "mlir/Dialect/Affine/IR/AffineOps.h"
#include "mlir/Dialect/Arith/IR/Arith.h"
#include "mlir/Dialect/Bufferization/IR/Bufferization.h"
#include "mlir/Dialect/MemRef/IR/MemRef.h"
#include "mlir/Dialect/SCF/IR/SCF.h"
#include "mlir/Dialect/Tensor/IR/Tensor.h"
#include "mlir/IR/IRMapping.h"
#include "llvm/ADT/DenseSet.h"
#include "triton/Dialect/Triton/IR/Dialect.h"

namespace mlir::triton::sycl {

// Materialize one logical element, including non-affine/data-dependent offsets.
// Tensor data not belonging to an address expression is extracted normally.
static FailureOr<Value> scalarMemoryElement(Value value, ValueRange indices,
                                            OpBuilder &builder, Location loc) {
  auto type = dyn_cast<RankedTensorType>(value.getType());
  if (!type)
    return value;
  auto *op = value.getDefiningOp();
  if (!op) {
    if (isa<triton::PointerType>(type.getElementType()))
      return failure();
    return builder.create<tensor::ExtractOp>(loc, value, indices).getResult();
  }
  if (auto splat = dyn_cast<triton::SplatOp>(op))
    return splat.getSrc();
  if (auto range = dyn_cast<triton::MakeRangeOp>(op)) {
    Value lane = builder.create<arith::IndexCastOp>(loc, type.getElementType(),
                                                    indices[0]);
    if (range.getStart()) {
      Value start =
          builder.create<arith::ConstantIntOp>(loc, range.getStart(), 32);
      lane = builder.create<arith::AddIOp>(loc, lane, start);
    }
    return lane;
  }
  if (auto expand = dyn_cast<triton::ExpandDimsOp>(op)) {
    SmallVector<Value> inner(indices);
    inner.erase(inner.begin() + expand.getAxis());
    return scalarMemoryElement(expand.getSrc(), inner, builder, loc);
  }
  if (auto broadcast = dyn_cast<triton::BroadcastOp>(op)) {
    SmallVector<Value> inner(indices);
    auto shape = broadcast.getSrc().getType().getShape();
    for (unsigned i = 0; i < shape.size(); ++i)
      if (shape[i] == 1)
        inner[i] = builder.create<arith::ConstantIndexOp>(loc, 0);
    return scalarMemoryElement(broadcast.getSrc(), inner, builder, loc);
  }
  if (auto trans = dyn_cast<triton::TransOp>(op)) {
    SmallVector<Value> inner(indices.size());
    for (auto [i, axis] : llvm::enumerate(trans.getOrder()))
      inner[axis] = indices[i];
    return scalarMemoryElement(trans.getSrc(), inner, builder, loc);
  }
  if (auto constant = dyn_cast<arith::ConstantOp>(op)) {
    auto dense = dyn_cast<DenseElementsAttr>(constant.getValue());
    if (dense && dense.isSplat())
      return builder
          .create<arith::ConstantOp>(loc, dense.getSplatValue<TypedAttr>())
          .getResult();
  }
  if (op->getNumRegions() == 0 && op->getNumResults() == 1 &&
      (isa<triton::AddPtrOp, triton::BitcastOp, triton::FpToFpOp>(op) ||
       op->getName().getDialectNamespace() == "arith" ||
       op->getName().getDialectNamespace() == "math")) {
    SmallVector<Value> operands;
    for (Value operand : op->getOperands()) {
      auto scalar = scalarMemoryElement(operand, indices, builder, loc);
      if (failed(scalar))
        return failure();
      operands.push_back(*scalar);
    }
    OperationState state(loc, op->getName());
    state.addOperands(operands);
    state.addTypes(type.getElementType());
    state.addAttributes(op->getAttrs());
    return builder.create(state)->getResult(0);
  }
  if (isa<triton::PointerType>(type.getElementType()))
    return failure();
  return builder.create<tensor::ExtractOp>(loc, value, indices).getResult();
}

// Carry integer offsets through control flow, with one invariant base pointer.
// This preserves arbitrary per-lane offsets without a tensor-of-pointer memref.
struct MemoryPointer { Value base, offset; };
static FailureOr<MemoryPointer> memoryPointer(Value value, OpBuilder &builder,
                                             Location loc) {
  auto type = dyn_cast<RankedTensorType>(value.getType());
  if (auto select = value.getDefiningOp<arith::SelectOp>()) {
    auto lhs = memoryPointer(select.getTrueValue(), builder, loc);
    auto rhs = memoryPointer(select.getFalseValue(), builder, loc);
    if (failed(lhs) || failed(rhs) || lhs->base != rhs->base) return failure();
    Value offset = builder.create<arith::SelectOp>(
        loc, select.getCondition(), lhs->offset, rhs->offset);
    return MemoryPointer{lhs->base, offset};
  }
  if (!type) {
    if (!isa<triton::PointerType>(value.getType())) return failure();
    if (auto add = value.getDefiningOp<triton::AddPtrOp>()) {
      auto pointer = memoryPointer(add.getPtr(), builder, loc);
      if (failed(pointer)) return failure();
      Value offset = add.getOffset();
      if (offset.getType().isIndex())
        offset = builder.create<arith::IndexCastOp>(loc, builder.getI64Type(), offset);
      else if (!offset.getType().isInteger(64))
        offset = builder.create<arith::ExtSIOp>(loc, builder.getI64Type(), offset);
      pointer->offset = builder.create<arith::AddIOp>(loc, pointer->offset, offset);
      return *pointer;
    }
    Value zero = builder.create<arith::ConstantIntOp>(loc, 0, 64);
    return MemoryPointer{value, zero};
  }
  if (auto splat = value.getDefiningOp<triton::SplatOp>()) {
    auto pointer = memoryPointer(splat.getSrc(), builder, loc);
    if (failed(pointer)) return failure();
    auto offsets = RankedTensorType::get(type.getShape(), builder.getI64Type());
    Value offset = builder.create<triton::SplatOp>(loc, offsets, pointer->offset);
    return MemoryPointer{pointer->base, offset};
  }
  if (auto add = value.getDefiningOp<triton::AddPtrOp>()) {
    auto pointer = memoryPointer(add.getPtr(), builder, loc);
    if (failed(pointer)) return failure();
    Value offset = add.getOffset();
    auto offsetType = RankedTensorType::get(type.getShape(), builder.getI64Type());
    if (offset.getType() != offsetType)
      offset = builder.create<arith::ExtSIOp>(loc, offsetType, offset);
    pointer->offset = builder.create<arith::AddIOp>(loc, pointer->offset, offset);
    return *pointer;
  }
  if (auto op = value.getDefiningOp()) {
    if (isa<triton::BroadcastOp, triton::ExpandDimsOp, triton::TransOp>(op)) {
      auto pointer = memoryPointer(op->getOperand(0), builder, loc);
      if (failed(pointer)) return failure();
      OperationState state(loc, op->getName());
      state.addOperands(pointer->offset);
      state.addTypes(RankedTensorType::get(type.getShape(), builder.getI64Type()));
      state.addAttributes(op->getAttrs());
      pointer->offset = builder.create(state)->getResult(0);
      return *pointer;
    }
  }
  return failure();
}

static LogicalResult normalizePointerLoop(scf::ForOp loop) {
  struct Carried { unsigned index; Value base; Type type; };
  SmallVector<Carried> carried;
  OpBuilder builder(loop);
  auto loc = loop.getLoc();
  for (auto [i, init] : llvm::enumerate(loop.getInitArgs())) {
    Type type = init.getType();
    auto tensorType = dyn_cast<RankedTensorType>(type);
    if (!isa<triton::PointerType>(type) &&
        (!tensorType || !isa<triton::PointerType>(tensorType.getElementType()))) continue;
    auto pointer = memoryPointer(init, builder, loc);
    if (failed(pointer))
      return loop.emitError("SYCL loop pointer must have an invariant scalar base");
    loop.getInitArgsMutable()[i].set(pointer->offset);
    auto arg = loop.getRegionIterArgs()[i];
    arg.setType(pointer->offset.getType());
    OpBuilder body = OpBuilder::atBlockBegin(loop.getBody());
    Value base = pointer->base;
    if (tensorType) base = body.create<triton::SplatOp>(loc, tensorType, base);
    Value reconstructed = body.create<triton::AddPtrOp>(loc, type, base, arg);
    arg.replaceAllUsesExcept(reconstructed, reconstructed.getDefiningOp());
    carried.push_back({static_cast<unsigned>(i), pointer->base, type});
  }
  SmallVector<scf::ForOp> nested;
  loop.walk([&](scf::ForOp inner) {
    if (inner != loop && inner->getParentOfType<scf::ForOp>() == loop)
      nested.push_back(inner);
  });
  for (auto inner : nested)
    if (failed(normalizePointerLoop(inner))) return failure();
  for (auto entry : carried) {
    auto yield = cast<scf::YieldOp>(loop.getBody()->getTerminator());
    builder.setInsertionPoint(yield);
    auto pointer = memoryPointer(yield.getOperand(entry.index), builder, loc);
    if (failed(pointer) || pointer->base != entry.base)
      return loop.emitError("SYCL loop-carried pointer changes its base allocation");
    // A recomputed tensor has no natural carried destination. Preserve that
    // equivalence explicitly. Existing updates that read the carried tensor
    // already obtain a destination through elementwise lowering; forcing a
    // second write there creates a RaW conflict in nested loops.
    bool readsCarriedOffset = false;
    SmallVector<Value> pending{pointer->offset};
    llvm::SmallDenseSet<Value, 16> visited;
    while (!pending.empty()) {
      Value value = pending.pop_back_val();
      if (value == loop.getRegionIterArgs()[entry.index]) {
        readsCarriedOffset = true;
        break;
      }
      if (!visited.insert(value).second) continue;
      if (auto *definition = value.getDefiningOp())
        llvm::append_range(pending, definition->getOperands());
    }
    if (isa<RankedTensorType>(entry.type) && !readsCarriedOffset)
      pointer->offset = builder.create<bufferization::MaterializeInDestinationOp>(
          loc, pointer->offset, loop.getRegionIterArgs()[entry.index]).getResult();
    yield.setOperand(entry.index, pointer->offset);
    Value result = loop.getResult(entry.index);
    result.setType(pointer->offset.getType());
    builder.setInsertionPointAfter(loop);
    Value base = entry.base;
    if (auto tensorType = dyn_cast<RankedTensorType>(entry.type))
      base = builder.create<triton::SplatOp>(loc, tensorType, base);
    Value reconstructed = builder.create<triton::AddPtrOp>(loc, entry.type, base, result);
    result.replaceAllUsesExcept(reconstructed, reconstructed.getDefiningOp());
  }
  return success();
}

static LogicalResult lowerScalarMemory(ModuleOp module) {
  SmallVector<scf::ForOp> loops;
  module.walk([&](scf::ForOp loop) {
    if (!loop->getParentOfType<scf::ForOp>()) loops.push_back(loop);
  });
  for (auto loop : loops)
    if (failed(normalizePointerLoop(loop))) return failure();
  SmallVector<Operation *> memory;
  module.walk([&](Operation *op) {
    if (isa<triton::LoadOp, triton::StoreOp>(op))
      memory.push_back(op);
  });
  for (Operation *op : memory) {
    bool load = isa<triton::LoadOp>(op);
    Value ptr = op->getOperand(0);
    auto pointerType = dyn_cast<RankedTensorType>(ptr.getType());
    if (!pointerType)
      continue;
    if (!pointerType.hasStaticShape())
      return op->emitError("SYCL logical blocks must have static shape; "
                           "runtime bounds and strides are supported");
    auto element = cast<triton::PointerType>(pointerType.getElementType())
                       .getPointeeType();
    OpBuilder builder(op);
    Location loc = op->getLoc();
    Value buffer;
    if (load)
      buffer = builder.create<memref::AllocOp>(
          loc, MemRefType::get(pointerType.getShape(), element));
    SmallVector<Value> indices;
    for (int64_t size : pointerType.getShape()) {
      auto loop = builder.create<affine::AffineForOp>(loc, 0, size);
      indices.push_back(loop.getInductionVar());
      builder.setInsertionPointToStart(loop.getBody());
    }
    auto scalarPtr = scalarMemoryElement(ptr, indices, builder, loc);
    if (failed(scalarPtr))
      return op->emitError("SYCL cannot scalarize this pointer expression "
                           "(pointer tensor loop arguments are unsupported)");
    Value mask = load ? cast<triton::LoadOp>(op).getMask()
                      : cast<triton::StoreOp>(op).getMask();
    Value predicate;
    if (mask) {
      auto scalar = scalarMemoryElement(mask, indices, builder, loc);
      if (failed(scalar))
        return op->emitError("SYCL cannot scalarize memory predicate");
      predicate = *scalar;
    }
    if (load) {
      auto original = cast<triton::LoadOp>(op);
      auto read = [&]() -> Value {
        return builder.create<triton::LoadOp>(
            loc, *scalarPtr, Value{}, Value{}, original.getCache(),
            original.getEvict(), original.getIsVolatile());
      };
      Value value;
      if (predicate) {
        auto guarded =
            builder.create<scf::IfOp>(loc, TypeRange{element}, predicate, true);
        {
          OpBuilder::InsertionGuard guard(builder);
          builder.setInsertionPointToStart(&guarded.getThenRegion().front());
          builder.create<scf::YieldOp>(loc, read());
          builder.setInsertionPointToStart(&guarded.getElseRegion().front());
          Value other;
          if (original.getOther()) {
            auto scalar =
                scalarMemoryElement(original.getOther(), indices, builder, loc);
            if (failed(scalar))
              return op->emitError("SYCL cannot scalarize masked load other");
            other = *scalar;
          } else {
            other = builder.create<arith::ConstantOp>(
                loc, builder.getZeroAttr(element));
          }
          builder.create<scf::YieldOp>(loc, other);
        }
        value = guarded.getResult(0);
      } else {
        value = read();
      }
      builder.create<memref::StoreOp>(loc, value, buffer, indices);
      builder.setInsertionPoint(op);
      Value tensor = builder.create<bufferization::ToTensorOp>(
          loc, original.getType(), buffer, true, true);
      original.getResult().replaceAllUsesWith(tensor);
    } else {
      auto original = cast<triton::StoreOp>(op);
      auto scalar =
          scalarMemoryElement(original.getValue(), indices, builder, loc);
      if (failed(scalar))
        return op->emitError("SYCL cannot scalarize store value");
      auto write = [&]() {
        builder.create<triton::StoreOp>(loc, *scalarPtr, *scalar, Value{},
                                        original.getCache(),
                                        original.getEvict());
      };
      if (predicate) {
        builder.create<scf::IfOp>(
            loc, predicate, [&](OpBuilder &nested, Location here) {
              OpBuilder::InsertionGuard guard(builder);
              builder.setInsertionPoint(nested.getInsertionBlock(),
                                        nested.getInsertionPoint());
              write();
              builder.create<scf::YieldOp>(here);
            });
      } else {
        write();
      }
    }
    op->erase();
  }
  return success();
}
} // namespace mlir::triton::sycl
#endif
