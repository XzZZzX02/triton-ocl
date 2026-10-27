//===----------------------------------------------------------------------===//
//
// Copyright 2020-2021 The ScaleHLS Authors.
// Refer to
// https://github.com/UIUC-ChenLab/ScaleHLS-HIDA/blob/main/lib/Translation/EmitHLSCpp.cpp
//
//===----------------------------------------------------------------------===//

#include "Utils/EmitUtils.h"
#include "Utils/EmitNumericSupport.h"
#include "llvm/Support/CommandLine.h"

static llvm::cl::opt<bool> vectorMemory(
    "sycl-vector-memory", llvm::cl::init(false),
    llvm::cl::desc("Enable experimental four-element global memory copies"));

using namespace mlir;

LogicalResult emitSYCL(ModuleOp module, llvm::raw_ostream &os);
void registerEmitSYCLTranslation();

static bool isReductionLoop(affine::AffineForOp op) {
  if (op->hasAttr("sycl.reduction"))
    return true;
  auto inductionVar = op.getInductionVar();
  SmallVector<affine::AffineLoadOp> loads;
  SmallVector<affine::AffineStoreOp> stores;
  for (Operation &nested : op.getBody()->getOperations()) {
    if (auto load = dyn_cast<affine::AffineLoadOp>(&nested))
      loads.push_back(load);
    if (auto store = dyn_cast<affine::AffineStoreOp>(&nested))
      stores.push_back(store);
  }

  for (auto store : stores) {
    if (llvm::is_contained(store.getMapOperands(), inductionVar))
      continue;
    for (auto load : loads) {
      if (load.getMemRef() != store.getMemRef())
        continue;
      if (!llvm::is_contained(load.getMapOperands(), inductionVar))
        return true;
    }
  }
  return false;
}

static bool hasParallelAffineParent(affine::AffineForOp op) {
  return op->getParentOfType<affine::AffineForOp>() != nullptr;
}

static unsigned getSYCLAccessorRank(MemRefType type) {
  return std::max<unsigned>(type.getRank(), 1);
}

// AdaptiveCpp 25.10 SSCP can misvectorize strided i8/i16 stores for odd
// work-group sizes on gfx906. Scalar device stores preserve both bits and
// addresses. Restrict this correctness guard to loops containing narrow
// stores; explicit vector-copy operations have a separate legality contract.
static bool hasNarrowStore(Operation *operation) {
  bool narrow = false;
  operation->walk([&](Operation *nested) {
    Value value;
    if (auto store = dyn_cast<memref::StoreOp>(nested)) value = store.getValueToStore();
    if (auto store = dyn_cast<affine::AffineStoreOp>(nested)) value = store.getValueToStore();
    if (value && value.getType().isIntOrFloat() &&
        value.getType().getIntOrFloatBitWidth() < 32) narrow = true;
  });
  return narrow;
}

void ModuleEmitter::emitOneAssign(arith::IndexCastOp op) {
  addAlias(op.getOperand(), op.getResult());
}

static std::string unsignedType(Type type) {
  if (auto shaped = dyn_cast<ShapedType>(type)) type = shaped.getElementType();
  unsigned width = type.isIndex() ? 64 : type.getIntOrFloatBitWidth();
  return width == 1 ? "bool" : "uint" + std::to_string(width) + "_t";
}

template <typename AssignOpType>
void ModuleEmitter::emitAssign(AssignOpType op) {
  unsigned rank = emitNestedLoopHeader(op.getResult());
  indent();
  emitValue(op.getResult(), rank);
  os << " = ";
  bool inputUnsigned = isa<arith::UIToFPOp, arith::ExtUIOp>(op.getOperation());
  bool outputUnsigned = isa<arith::FPToUIOp>(op.getOperation());
  bool floatingCast = isa<arith::TruncFOp, arith::ExtFOp>(op.getOperation());
  auto rounding = op->template getAttrOfType<IntegerAttr>("sycl.rounding");
  bool rtz = rounding && rounding.getInt() == 0;
  Type target = op.getResult().getType();
  if (auto shaped = dyn_cast<ShapedType>(target)) target = shaped.getElementType();
  if (inputUnsigned) os << "static_cast<" << unsignedType(op.getOperand().getType()) << ">(";
  if (outputUnsigned) os << "static_cast<" << unsignedType(target) << ">(";
  if (rtz) os << "triton_sycl_rtz<" << getDataTypeName(target, state.target) << ">(";
  // Software low-precision types need an explicit scalar intermediate: C++
  // cannot chain a conversion operator and a destination constructor implicitly.
  if (floatingCast) os << "static_cast<double>(";
  emitValue(op.getOperand(), rank);
  if (floatingCast) os << ")";
  if (inputUnsigned || outputUnsigned || rtz) os << ")";
  os << ";";
  emitInfoAndNewLine(op);
  emitNestedLoopFooter(rank);
}

void ModuleEmitter::emitBitcast(arith::BitcastOp op) {
  auto storageType = [&](Type type) {
    return StringRef(getDataTypeName(type, state.target)).starts_with("triton_sycl_");
  };
  bool sourceStorage = storageType(op.getIn().getType());
  bool targetStorage = storageType(op.getResult().getType());
  unsigned rank = emitNestedLoopHeader(op.getResult());
  indent();
  emitValue(op.getResult(), rank);
  if (targetStorage) {
    os << ";\n";
    indent(); emitValue(op.getResult(), rank); os << ".bits";
  }
  if (sourceStorage || targetStorage) {
    os << " = ";
    emitValue(op.getIn(), rank);
    if (sourceStorage) os << ".bits";
    os << ";";
    emitInfoAndNewLine(op);
    emitNestedLoopFooter(rank);
    return;
  }
  os << " = sycl::bit_cast<" << getDataTypeName(op.getResult().getType(), state.target) << ">(";
  emitValue(op.getIn(), rank);
  os << ");";
  emitInfoAndNewLine(op);
  emitNestedLoopFooter(rank);
}

/// Control flow operation emitters.
void ModuleEmitter::emitCall(func::CallOp op) {
  // Handle returned value by the callee.
  for (auto result : op.getResults()) {
    if (!isDeclared(result)) {
      indent();
      if (mlir::isa<MemRefType>(result.getType()))
        emitArrayDecl(result);
      else
        emitValue(result);
      os << ";\n";
    }
  }

  // Emit the function call.
  indent() << op.getCallee() << "(";

  bool needComma = false;
  if (state.target == EmitTarget::SYCL) {
    os << "item";
    needComma = true;
  }

  // Handle input arguments.
  for (auto arg : op.getOperands()) {
    if (needComma)
      os << ", ";
    emitValue(arg);

    needComma = true;
  }

  // Handle output arguments.
  for (auto result : op.getResults()) {
    if (needComma)
      os << ", ";
    // The address should be passed in for scalar result arguments.
    if (!mlir::isa<ShapedType>(result.getType()))
      os << "&";

    emitValue(result);
    needComma = true;
  }

  os << ");";
  emitInfoAndNewLine(op);
}

/// SCF statement emitters.
void ModuleEmitter::emitScfFor(scf::ForOp op) {
  for (auto [init, arg] : llvm::zip(op.getInitArgs(), op.getRegionIterArgs())) {
    indent();
    emitValue(arg);
    os << " = ";
    emitValue(init);
    os << ";";
    emitInfoAndNewLine(op);
  }
  if (state.target == EmitTarget::SYCL && hasNarrowStore(op))
    indent() << "#pragma clang loop vectorize(disable) interleave(disable)\n";
  indent() << "for (";
  auto iterVar = op.getInductionVar();

  // Emit lower bound.
  emitValue(iterVar);
  os << " = ";
  emitValue(op.getLowerBound());
  os << "; ";

  // Emit upper bound.
  emitValue(iterVar);
  os << " < ";
  emitValue(op.getUpperBound());
  os << "; ";

  // Emit increase step.
  emitValue(iterVar);
  os << " += ";
  emitValue(op.getStep());
  os << ") {";
  emitInfoAndNewLine(op);

  addIndent();

  emitBlock(*op.getBody());
  reduceIndent();

  if (state.target == EmitTarget::SYCL && !op->hasAttr("sycl.thread_private"))
    indent() << "item.barrier(sycl::access::fence_space::local_space);\n";
  indent() << "}\n";

  for (auto [arg, result] :
       llvm::zip(op.getRegionIterArgs(), op.getResults())) {
    indent();
    emitValue(result);
    os << " = ";
    emitValue(arg);
    os << ";";
    emitInfoAndNewLine(op);
  }
}

void ModuleEmitter::emitScfIf(scf::IfOp op) {
  // Declare all values returned by scf::YieldOp. They will be further handled
  // by the scf::YieldOp emitter.
  for (auto result : op.getResults()) {
    if (!isDeclared(result)) {
      indent();
      if (mlir::isa<MemRefType>(result.getType()))
        emitArrayDecl(result);
      else
        emitValue(result);
      os << ";\n";
    }
  }

  indent() << "if (";
  emitValue(op.getCondition());
  os << ") {";
  emitInfoAndNewLine(op);

  addIndent();
  emitBlock(op.getThenRegion().front());
  reduceIndent();

  if (!op.getElseRegion().empty()) {
    indent() << "} else {\n";
    addIndent();
    emitBlock(op.getElseRegion().front());
    reduceIndent();
  }

  indent() << "}\n";
}

void ModuleEmitter::emitScfYield(scf::YieldOp op) {
  if (op.getNumOperands() == 0)
    return;

  // For now, only and scf::If operations will use scf::Yield to return
  // generated values.
  if (auto parentOp = dyn_cast<scf::IfOp>(op->getParentOp())) {
    unsigned resultIdx = 0;
    for (auto result : parentOp.getResults()) {
      unsigned rank = emitNestedLoopHeader(result);
      indent();
      emitValue(result, rank);
      os << " = ";
      emitValue(op.getOperand(resultIdx++), rank);
      os << ";";
      emitInfoAndNewLine(op);
      emitNestedLoopFooter(rank);
    }
  } else if (auto forOp = dyn_cast<scf::ForOp>(op->getParentOp())) {
    for (auto [arg, yielded] :
         llvm::zip(forOp.getRegionIterArgs(), forOp.getYieldedValues())) {
      indent();
      emitValue(arg);
      os << " = ";
      emitValue(yielded);
      os << ";";
      emitInfoAndNewLine(op);
    }
  } else {
    emitError(op, "unsupported scf.yield parent");
  }
}

/// Affine statement emitters.

unsigned ModuleEmitter::getParallelLoopDepth(affine::AffineForOp op) {
  unsigned depth = 0;
  // Look for a nested AffineForOp in the body
  for (auto &nestedOp : op.getBody()->getOperations()) {
    if (auto nestedFor = llvm::dyn_cast<affine::AffineForOp>(nestedOp)) {
      if (isReductionLoop(nestedFor))
        continue;
      // Check if this nested loop is also parallelizable (same criteria as
      // emitAffineFor)
      auto lowerMap = nestedFor.getLowerBoundMap();
      auto upperMap = nestedFor.getUpperBoundMap();
      bool lowerIsZero =
          (lowerMap.getNumResults() == 1 &&
           llvm::isa<AffineConstantExpr>(lowerMap.getResult(0)) &&
           llvm::cast<AffineConstantExpr>(lowerMap.getResult(0)).getValue() ==
               0);
      bool upperIsSimple = (upperMap.getNumResults() >= 1);
      bool stepIsOne = (nestedFor.getStep() == 1);

      if (lowerIsZero && upperIsSimple && stepIsOne) {
        // If we found a nested parallel loop, our depth is 1 + its depth
        // We assume strict nesting for now (one child)
        depth = std::max(depth, 1 + getParallelLoopDepth(nestedFor));
      }
    }
  }
  return depth;
}

// Vectorize proven unit-stride, unmasked global/local copies. Arbitrary masks,
// strides, and gather expressions continue through the scalar semantic path.
bool ModuleEmitter::emitVectorCopy(affine::AffineForOp loop) {
  if (loop->getParentOfType<affine::AffineForOp>() || !loop.hasConstantBounds() ||
      loop.getConstantLowerBound() != 0 || loop.getStep() != 1 ||
      loop.getConstantUpperBound() % 4 != 0) return false;
  memref::LoadOp load;
  memref::StoreOp store;
  for (Operation &inner : loop.getBody()->without_terminator()) {
    if (auto read = dyn_cast<memref::LoadOp>(inner)) {
      if (load) return false;
      load = read;
    } else if (auto write = dyn_cast<memref::StoreOp>(inner)) {
      if (store) return false;
      store = write;
    } else if (!isa<memref::ReinterpretCastOp>(inner) &&
               inner.getName().getDialectNamespace() != "arith") return false;
  }
  if (!load || !store || store.getValueToStore() != load.getResult() ||
      !(load.getType().isF32() || load.getType().isInteger(32))) return false;
  auto source = load.getMemRef().getDefiningOp<memref::ReinterpretCastOp>();
  auto target = store.getMemRef().getDefiningOp<memref::ReinterpretCastOp>();
  if (bool(source) == bool(target)) return false;
  auto external = source ? source : target;
  Value local = source ? store.getMemRef() : load.getMemRef();
  auto localType = dyn_cast<MemRefType>(local.getType());
  auto localIndices = source ? store.getIndices() : load.getIndices();
  auto externalIndices = source ? load.getIndices() : store.getIndices();
  if (!isa<UnrankedMemRefType>(external.getSource().getType()) ||
      !localType || localType.getRank() != 1 || !local.getDefiningOp<memref::AllocOp>() ||
      localIndices.size() != 1 || localIndices[0] != loop.getInductionVar() ||
      externalIndices.size() != 1 ||
      getConstantIntValue(externalIndices[0]) != std::optional<int64_t>(0) ||
      getConstantIntValue(external.getMixedStrides()[0]) != std::optional<int64_t>(1)) return false;
  auto offset = dyn_cast<Value>(external.getMixedOffsets()[0]);
  if (!offset) return false;
  std::function<std::optional<int64_t>(Value)> coefficient = [&](Value value) -> std::optional<int64_t> {
    if (value == loop.getInductionVar()) return 1;
    Operation *def = value.getDefiningOp();
    if (!def || !loop->isProperAncestor(def)) return 0;
    if (auto cast = dyn_cast<arith::IndexCastOp>(def)) return coefficient(cast.getIn());
    if (isa<arith::ConstantOp>(def)) return 0;
    if (isa<arith::AddIOp, arith::SubIOp>(def)) {
      auto lhs = coefficient(def->getOperand(0)), rhs = coefficient(def->getOperand(1));
      if (lhs && rhs) return *lhs + (isa<arith::AddIOp>(def) ? *rhs : -*rhs);
    }
    return std::nullopt;
  };
  if (coefficient(offset) != std::optional<int64_t>(1)) return false;
  for (Operation &inner : loop.getBody()->without_terminator())
    if (&inner != store.getOperation() && &inner != load.getOperation())
      for (Value operand : inner.getOperands()) if (operand == load.getResult()) return false;
  indent() << "for ("; emitValue(loop.getInductionVar());
  os << " = 4 * item.get_local_linear_id(); "; emitValue(loop.getInductionVar());
  os << " < " << loop.getConstantUpperBound() << "; "; emitValue(loop.getInductionVar());
  os << " += 4 * item.get_local_range().size()) {\n"; addIndent();
  for (Operation &inner : loop.getBody()->without_terminator()) {
    if (&inner == load.getOperation() || &inner == store.getOperation()) continue;
    if (!ExprVisitor(*this).dispatchVisitor(&inner)) StmtVisitor(*this).dispatchVisitor(&inner);
  }
  std::string type = getDataTypeName(load.getType(), state.target);
  indent() << "sycl::vec<" << type << ", 4> packed;\n";
  if (source) {
    indent() << "packed.load(0, sycl::multi_ptr<const " << type
             << ", sycl::access::address_space::global_space>(&";
    emitMemRefAccess(load.getMemRef(), load.getIndices()); os << "));\n";
  }
  for (unsigned lane = 0; lane < 4; ++lane) {
    indent();
    if (!source) os << "packed[" << lane << "] = ";
    emitValue(local); os << "["; emitValue(loop.getInductionVar()); os << " + " << lane << "]";
    if (source) os << " = packed[" << lane << "]";
    os << ";\n";
  }
  if (target) {
    indent() << "packed.store(0, sycl::multi_ptr<" << type
             << ", sycl::access::address_space::global_space>(&";
    emitMemRefAccess(store.getMemRef(), store.getIndices()); os << "));\n";
  }
  reduceIndent(); indent() << "}\n";
  indent() << "item.barrier(sycl::access::fence_space::local_space);\n";
  return true;
}

// Flatten perfect parallel nests onto the work-group's linear local index.
// The contiguous dimension varies fastest, including rank3 and 2D local ranges.
bool ModuleEmitter::emitParallelAffineNest(affine::AffineForOp op) {
  if (op->getParentOfType<affine::AffineForOp>()) return false;
  SmallVector<affine::AffineForOp> loops;
  SmallVector<int64_t> sizes;
  auto current = op;
  while (current && !isReductionLoop(current) && current.hasConstantBounds() &&
         current.getConstantLowerBound() == 0 && current.getStep() == 1 &&
         current.getNumResults() == 0) {
    int64_t size = current.getConstantUpperBound();
    if (size <= 0) return false;
    loops.push_back(current); sizes.push_back(size);
    auto &operations = current.getBody()->getOperations();
    if (operations.size() != 2) break;
    current = dyn_cast<affine::AffineForOp>(&operations.front());
  }
  if (loops.empty()) return false;
  bool partialParallelNest = false;
  loops.back().walk([&](affine::AffineForOp nested) {
    if (nested != loops.back() && !isReductionLoop(nested)) partialParallelNest = true;
  });
  if (partialParallelNest) return false;

  int64_t total = 1;
  for (int64_t size : sizes) {
    if (total > INT64_MAX / size) return false;
    total *= size;
  }
  std::string flat = "linear_" + std::to_string(state.currentIndent);
  // The actual induction variables retain their SSA names inside the body.
  if (hasNarrowStore(op))
    indent() << "#pragma clang loop vectorize(disable) interleave(disable)\n";
  indent() << "for (int64_t " << flat << " = item.get_local_linear_id(); "
           << flat << " < " << total << "; " << flat
           << " += item.get_local_range().size()) {\n";
  addIndent();
  int64_t stride = total;
  for (auto [loop, size] : llvm::zip(loops, sizes)) {
    stride /= size;
    indent(); emitValue(loop.getInductionVar());
    os << " = (" << flat << " / " << stride << ") % " << size << ";\n";
  }
  emitBlock(*loops.back().getBody());
  reduceIndent(); indent() << "}\n";
  indent() << "item.barrier(sycl::access::fence_space::local_space);\n";
  return true;
}

void ModuleEmitter::emitAffineFor(affine::AffineForOp op) {
  if (state.target == EmitTarget::SYCL && vectorMemory && emitVectorCopy(op)) return;
  if (state.target == EmitTarget::SYCL && emitParallelAffineNest(op)) return;
  bool reductionLoop = isReductionLoop(op);
  // Group reduction is materialized by sycl-group-reduction in the IR.

  // For SYCL target, try to emit SIMT parallel code instead of serial loops
  if (state.target == EmitTarget::SYCL && !reductionLoop) {
    auto lowerMap = op.getLowerBoundMap();
    auto upperMap = op.getUpperBoundMap();

    // Check if loop is parallelizable:
    // - Lower bound is constant 0
    // - Upper bound is constant
    // - Step is 1
    // - No loop-carried dependencies (simple element-wise ops)
    bool lowerIsZero =
        (lowerMap.getNumResults() == 1 &&
         llvm::isa<AffineConstantExpr>(lowerMap.getResult(0)) &&
         llvm::cast<AffineConstantExpr>(lowerMap.getResult(0)).getValue() == 0);
    bool upperIsSimple = (upperMap.getNumResults() >= 1);
    bool stepIsOne = (op.getStep() == 1);

    // Now that local_accessor is used, SIMT transformation should work
    if (lowerIsZero && upperIsSimple && stepIsOne) {
      auto iterVar = op.getInductionVar();

      // Emit SIMT code: Grid-Stride Loop
      // usage: for (int iv = get_local_id(depth); iv < upper_bound; iv +=
      // get_local_range(depth)) { ... }
      unsigned depth = getParallelLoopDepth(op);
      if (hasNarrowStore(op))
        indent() << "#pragma clang loop vectorize(disable) interleave(disable)\n";

      indent() << "for (";
      emitValue(iterVar);
      os << " = item.get_local_id(" << depth << "); ";

      emitValue(iterVar);
      os << " < ";
      // Emit upper bound expression
      AffineExprEmitter upperEmitter(state, upperMap.getNumDims(),
                                     op.getUpperBoundOperands());
      if (upperMap.getNumResults() == 1)
        upperEmitter.emitAffineExpr(upperMap.getResult(0));
      else {
        // Handle min(a, b)
        for (unsigned i = 0, e = upperMap.getNumResults() - 1; i < e; ++i)
          os << (state.target == EmitTarget::SYCL ? "std::min(" : "min(");
        upperEmitter.emitAffineExpr(upperMap.getResult(0));
        for (auto &expr : llvm::drop_begin(upperMap.getResults(), 1)) {
          os << ", ";
          upperEmitter.emitAffineExpr(expr);
          os << ")";
        }
      }
      os << "; ";

      emitValue(iterVar);
      os << " += item.get_local_range(" << depth
         << ")) {\n"; // Stride by local range

      addIndent();
      emitBlock(*op.getBody());
      reduceIndent();

      indent() << "}\n";
      if (state.target == EmitTarget::SYCL && !op->getParentOfType<affine::AffineForOp>())
        indent() << "item.barrier(sycl::access::fence_space::local_space);\n";
      return;
    }
  }

  // Reduction loops carry a loop-carried dependency and must remain serial.
  // A scalar reduction has no outer parallel loop, so only one work-item in
  // the work-group is allowed to execute it.
  bool guardScalarReduction = reductionLoop && !hasParallelAffineParent(op);
  if (guardScalarReduction) {
    indent() << "item.barrier(sycl::access::fence_space::local_space);\n";
    indent() << "if (item.get_local_id(0) == 0 && item.get_local_id(1) == 0 && "
                 "item.get_local_id(2) == 0) {\n";
    addIndent();
  }

  // Fall back to original serial loop emission
  indent() << "for (";
  auto iterVar = op.getInductionVar();

  // Emit lower bound.
  emitValue(iterVar);
  os << " = ";
  auto lowerMap = op.getLowerBoundMap();
  AffineExprEmitter lowerEmitter(state, lowerMap.getNumDims(),
                                 op.getLowerBoundOperands());
  if (lowerMap.getNumResults() == 1)
    lowerEmitter.emitAffineExpr(lowerMap.getResult(0));
  else {
    for (unsigned i = 0, e = lowerMap.getNumResults() - 1; i < e; ++i)
      os << (state.target == EmitTarget::SYCL ? "std::max(" : "max(");
    lowerEmitter.emitAffineExpr(lowerMap.getResult(0));
    for (auto &expr : llvm::drop_begin(lowerMap.getResults(), 1)) {
      os << ", ";
      lowerEmitter.emitAffineExpr(expr);
      os << ")";
    }
  }
  os << "; ";

  // Emit upper bound.
  emitValue(iterVar);
  os << " < ";
  auto upperMap = op.getUpperBoundMap();
  AffineExprEmitter upperEmitter(state, upperMap.getNumDims(),
                                 op.getUpperBoundOperands());
  if (upperMap.getNumResults() == 1)
    upperEmitter.emitAffineExpr(upperMap.getResult(0));
  else {
    for (unsigned i = 0, e = upperMap.getNumResults() - 1; i < e; ++i)
      os << (state.target == EmitTarget::SYCL ? "std::min(" : "min(");
    upperEmitter.emitAffineExpr(upperMap.getResult(0));
    for (auto &expr : llvm::drop_begin(upperMap.getResults(), 1)) {
      os << ", ";
      upperEmitter.emitAffineExpr(expr);
      os << ")";
    }
  }
  os << "; ";

  // Emit increase step.
  emitValue(iterVar);
  os << " += " << op.getStep() << ") {";
  emitInfoAndNewLine(op);

  addIndent();

  emitBlock(*op.getBody());
  reduceIndent();

  indent() << "}\n";
  if (guardScalarReduction) {
    reduceIndent();
    indent() << "}\n";
  }
  if (state.target == EmitTarget::SYCL && !op->getParentOfType<affine::AffineForOp>())
    indent() << "item.barrier(sycl::access::fence_space::local_space);\n";
}

void ModuleEmitter::emitAffineIf(affine::AffineIfOp op) {
  // Declare all values returned by AffineYieldOp. They will be further
  // handled by the AffineYieldOp emitter.
  for (auto result : op.getResults()) {
    if (!isDeclared(result)) {
      indent();
      if (mlir::isa<MemRefType>(result.getType()))
        emitArrayDecl(result);
      else
        emitValue(result);
      os << ";\n";
    }
  }

  indent() << "if (";
  auto constrSet = op.getIntegerSet();
  AffineExprEmitter constrEmitter(state, constrSet.getNumDims(),
                                  op.getOperands());

  // Emit all constraints.
  unsigned constrIdx = 0;
  for (auto &expr : constrSet.getConstraints()) {
    constrEmitter.emitAffineExpr(expr);
    if (constrSet.isEq(constrIdx))
      os << " == 0";
    else
      os << " >= 0";

    if (constrIdx++ != constrSet.getNumConstraints() - 1)
      os << " && ";
  }
  os << ") {";
  emitInfoAndNewLine(op);

  addIndent();
  emitBlock(*op.getThenBlock());
  reduceIndent();

  if (op.hasElse()) {
    indent() << "} else {\n";
    addIndent();
    emitBlock(*op.getElseBlock());
    reduceIndent();
  }

  indent() << "}\n";
}

void ModuleEmitter::emitAffineParallel(affine::AffineParallelOp op) {
  // Declare all values returned by AffineParallelOp. They will be further
  // handled by the AffineYieldOp emitter.
  for (auto result : op.getResults()) {
    if (!isDeclared(result)) {
      indent();
      if (mlir::isa<MemRefType>(result.getType()))
        emitArrayDecl(result);
      else
        emitValue(result);
      os << ";\n";
    }
  }

  auto steps = getIntArrayAttrValue(op, op.getStepsAttrName());
  for (unsigned i = 0, e = op.getNumDims(); i < e; ++i) {
    indent() << "for (";
    auto iterVar = op.getBody()->getArgument(i);

    // Emit lower bound.
    emitValue(iterVar);
    os << " = ";
    auto lowerMap = op.getLowerBoundsValueMap().getAffineMap();
    AffineExprEmitter lowerEmitter(state, lowerMap.getNumDims(),
                                   op.getLowerBoundsOperands());
    lowerEmitter.emitAffineExpr(lowerMap.getResult(i));
    os << "; ";

    // Emit upper bound.
    emitValue(iterVar);
    os << " < ";
    auto upperMap = op.getUpperBoundsValueMap().getAffineMap();
    AffineExprEmitter upperEmitter(state, upperMap.getNumDims(),
                                   op.getUpperBoundsOperands());
    upperEmitter.emitAffineExpr(upperMap.getResult(i));
    os << "; ";

    // Emit increase step.
    emitValue(iterVar);
    os << " += " << steps[i] << ") {";
    emitInfoAndNewLine(op);

    addIndent();
  }

  emitBlock(*op.getBody());

  for (unsigned i = 0, e = op.getNumDims(); i < e; ++i) {
    reduceIndent();

    indent() << "}\n";
  }
}

void ModuleEmitter::emitAffineApply(affine::AffineApplyOp op) {
  indent();
  emitValue(op.getResult());
  os << " = ";
  auto affineMap = op.getAffineMap();
  AffineExprEmitter(state, affineMap.getNumDims(), op.getOperands())
      .emitAffineExpr(affineMap.getResult(0));
  os << ";";
  emitInfoAndNewLine(op);
}

template <typename OpType>
void ModuleEmitter::emitAffineMaxMin(OpType op, const char *syntax) {
  indent();
  emitValue(op.getResult());
  os << " = ";
  auto affineMap = op.getAffineMap();
  AffineExprEmitter affineEmitter(state, affineMap.getNumDims(),
                                  op.getOperands());
  for (unsigned i = 0, e = affineMap.getNumResults() - 1; i < e; ++i)
    os << syntax << "(";
  affineEmitter.emitAffineExpr(affineMap.getResult(0));
  for (auto &expr : llvm::drop_begin(affineMap.getResults(), 1)) {
    os << ", ";
    affineEmitter.emitAffineExpr(expr);
    os << ")";
  }
  os << ";";
  emitInfoAndNewLine(op);
}

void ModuleEmitter::emitAffineLoad(affine::AffineLoadOp op) {
  indent();
  emitValue(op.getResult());
  os << " = ";
  auto affineMap = op.getAffineMap();
  AffineExprEmitter affineEmitter(state, affineMap.getNumDims(),
                                  op.getMapOperands());
  if (auto reinterpretCast =
          op.getMemRef().getDefiningOp<memref::ReinterpretCastOp>()) {
    os << "(";
    emitValue(reinterpretCast.getSource());
    os << " + ";
    emitOpFoldResult(reinterpretCast.getMixedOffsets().front());
    auto strides = reinterpretCast.getMixedStrides();
    for (auto [index, stride] : llvm::zip(affineMap.getResults(), strides)) {
      os << " + (";
      affineEmitter.emitAffineExpr(index);
      os << ") * ";
      emitOpFoldResult(stride);
    }
    os << ")[0]";
  } else {
    emitValue(op.getMemRef());
    if (affineMap.getNumResults() == 0) {
      os << "[0]";
    } else {
      for (auto index : affineMap.getResults()) {
        os << "[";
        affineEmitter.emitAffineExpr(index);
        os << "]";
      }
    }
  }
  os << ";";
  emitInfoAndNewLine(op);
}

void ModuleEmitter::emitAffineStore(affine::AffineStoreOp op) {
  bool scalarOwner = state.target == EmitTarget::SYCL &&
      !op->getParentOfType<affine::AffineForOp>() &&
      !op->hasAttr("sycl.scalar_owner");
  if (scalarOwner) {
    indent() << "if (item.get_local_linear_id() == 0) {\n";
    addIndent();
  }
  indent();
  auto affineMap = op.getAffineMap();
  AffineExprEmitter affineEmitter(state, affineMap.getNumDims(),
                                  op.getMapOperands());
  if (auto reinterpretCast =
          op.getMemRef().getDefiningOp<memref::ReinterpretCastOp>()) {
    os << "(";
    emitValue(reinterpretCast.getSource());
    os << " + ";
    emitOpFoldResult(reinterpretCast.getMixedOffsets().front());
    auto strides = reinterpretCast.getMixedStrides();
    for (auto [index, stride] : llvm::zip(affineMap.getResults(), strides)) {
      os << " + (";
      affineEmitter.emitAffineExpr(index);
      os << ") * ";
      emitOpFoldResult(stride);
    }
    os << ")[0]";
  } else {
    emitValue(op.getMemRef());
    if (affineMap.getNumResults() == 0) {
      os << "[0]";
    } else {
      for (auto index : affineMap.getResults()) {
        os << "[";
        affineEmitter.emitAffineExpr(index);
        os << "]";
      }
    }
  }
  os << " = ";
  emitValue(op.getValueToStore());
  os << ";";
  emitInfoAndNewLine(op);
  if (scalarOwner) {
    reduceIndent();
    indent() << "}\n";
    indent() << "item.barrier(sycl::access::fence_space::local_space);\n";
  }
}

// TODO: For now, all values created in the AffineIf region will be declared
// in the generated C++. However, values which will be returned by affine
// yield operation should not be declared again. How to "bind" the pair of
// values inside/outside of AffineIf region needs to be considered.
void ModuleEmitter::emitAffineYield(affine::AffineYieldOp op) {
  if (op.getNumOperands() == 0)
    return;

  // For now, only AffineParallel and AffineIf operations will use
  // AffineYield to return generated values.
  if (auto parentOp = dyn_cast<affine::AffineIfOp>(op->getParentOp())) {
    unsigned resultIdx = 0;
    for (auto result : parentOp.getResults()) {
      unsigned rank = emitNestedLoopHeader(result);
      indent();
      emitValue(result, rank);
      os << " = ";
      emitValue(op.getOperand(resultIdx++), rank);
      os << ";";
      emitInfoAndNewLine(op);
      emitNestedLoopFooter(rank);
    }
  } else if (auto parentOp =
                 dyn_cast<affine::AffineParallelOp>(op->getParentOp())) {
    indent() << "if (";
    unsigned ivIdx = 0;
    for (auto iv : parentOp.getBody()->getArguments()) {
      emitValue(iv);
      os << " == 0";
      if (ivIdx++ != parentOp.getBody()->getNumArguments() - 1)
        os << " && ";
    }
    os << ") {\n";

    // When all induction values are 0, generated values will be directly
    // assigned to the current results, correspondingly.
    addIndent();
    unsigned resultIdx = 0;
    for (auto result : parentOp.getResults()) {
      unsigned rank = emitNestedLoopHeader(result);
      indent();
      emitValue(result, rank);
      os << " = ";
      emitValue(op.getOperand(resultIdx++), rank);
      os << ";";
      emitInfoAndNewLine(op);
      emitNestedLoopFooter(rank);
    }
    reduceIndent();

    indent() << "} else {\n";

    // Otherwise, generated values will be accumulated/reduced to the
    // current results with corresponding arith::AtomicRMWKind operations.

    indent() << "}\n";
  }
}

/// Helper to get the string indices of TransferRead/Write operations.
template <typename TransferOpType>
SmallVector<SmallString<8>, 4>
ModuleEmitter::getTransferIndices(TransferOpType op) {
  // Get the head indices of the transfer read/write.
  SmallVector<SmallString<8>, 4> indices;
  for (auto index : op.getIndices()) {
    if (!isDeclared(index)) {
      emitError(op, "undeclared memory index");
      return {};
    }
    indices.push_back(getName(index));
  }
  // Construct the physical indices.
  for (unsigned i = 0, e = op.getPermutationMap().getNumResults(); i < e; ++i) {
    auto expr = op.getPermutationMap().getResult(i);
    if (auto dimExpr = mlir::dyn_cast<AffineDimExpr>(expr))
      indices[dimExpr.getPosition()] += " + iv" + std::to_string(i);
  }
  return indices;
}

/// Helper to get the TransferRead/Write condition.
template <typename TransferOpType>
static SmallString<16>
getTransferCondition(TransferOpType op,
                     const SmallVector<SmallString<8>, 4> &indices) {
  // Figure out whether the transfer read/write could be out of bound.
  SmallVector<unsigned, 4> outOfBoundDims;
  for (unsigned i = 0, e = op.getVectorType().getRank(); i < e; ++i)
    if (!op.isDimInBounds(i))
      outOfBoundDims.push_back(i);

  // Construct the condition of transfer if required.
  SmallString<16> condition;
  for (auto i : outOfBoundDims) {
    auto expr = op.getPermutationMap().getResult(i);
    if (auto dimExpr = mlir::dyn_cast<AffineDimExpr>(expr)) {
      auto pos = dimExpr.getPosition();
      condition += indices[pos];
      condition += " < " + std::to_string(op.getShapedType().getDimSize(pos));
      if (i != outOfBoundDims.back())
        condition += " && ";
    }
  }
  return condition;
}

/// Memref-related statement emitters.
template <typename OpType> void ModuleEmitter::emitAlloc(OpType op) {
  // A declared result indicates that the memref is output of the function, and
  // has been declared in the function signature.
  // For SYCL, local allocations are passed as local_accessor parameters,
  // so isDeclared() will return true (addName was called in emitFunction).
  if (isDeclared(op.getResult()))
    return;

  // Vivado HLS only supports static shape on-chip memory.
  if (!op.getType().hasStaticShape())
    emitError(op, "is unranked or has dynamic shape.");

  indent();
  if (state.target == EmitTarget::OpenCL)
    os << "__local ";
  emitArrayDecl(op.getResult());
  os << ";";
  emitInfoAndNewLine(op);
}

void ModuleEmitter::emitLoad(memref::LoadOp op) {
  indent();
  emitValue(op.getResult());
  os << " = ";
  emitMemRefAccess(op.getMemRef(), op.getIndices());
  os << ";";
  emitInfoAndNewLine(op);
}

void ModuleEmitter::emitStore(memref::StoreOp op) {
  bool scalarOwner = state.target == EmitTarget::SYCL &&
      !op->getParentOfType<affine::AffineForOp>();
  if (scalarOwner) {
    indent() << "if (item.get_local_linear_id() == 0) {\n";
    addIndent();
  }
  indent();
  emitMemRefAccess(op.getMemRef(), op.getIndices());
  os << " = ";
  emitValue(op.getValueToStore());
  os << ";";
  emitInfoAndNewLine(op);
  if (scalarOwner) {
    reduceIndent();
    indent() << "}\n";
    indent() << "item.barrier(sycl::access::fence_space::local_space);\n";
  }
}

void ModuleEmitter::emitIndexedMemRef(Value value, ArrayRef<std::string> indices) {
  if (auto castOp = value.getDefiningOp<memref::ReinterpretCastOp>()) {
    os << "(";
    emitValue(castOp.getSource());
    os << " + ";
    emitOpFoldResult(castOp.getMixedOffsets().front());
    for (auto [index, stride] : llvm::zip(indices, castOp.getMixedStrides())) {
      os << " + (" << index << ") * ";
      emitOpFoldResult(stride);
    }
    os << ")[0]";
    return;
  }
  if (auto subview = value.getDefiningOp<memref::SubViewOp>()) {
    auto sourceType = cast<MemRefType>(subview.getSource().getType());
    auto offsets = subview.getStaticOffsets();
    auto strides = subview.getStaticStrides();
    if (sourceType.getRank() != indices.size() ||
        llvm::is_contained(offsets, ShapedType::kDynamic) ||
        llvm::is_contained(strides, ShapedType::kDynamic)) {
      emitError(subview, "unsupported dynamic or rank-reduced copy subview");
      return;
    }
    SmallVector<std::string> sourceIndices;
    for (unsigned i = 0; i < indices.size(); ++i)
      sourceIndices.push_back("(" + std::to_string(offsets[i]) + " + (" +
                              indices[i] + ") * " + std::to_string(strides[i]) + ")");
    emitIndexedMemRef(subview.getSource(), sourceIndices);
    return;
  }
  emitValue(value);
  if (indices.empty())
    os << "[0]";
  for (const auto &index : indices)
    os << "[" << index << "]";
}

void ModuleEmitter::emitMemRefAccess(Value memref, ValueRange indices) {
  auto memrefType = cast<MemRefType>(memref.getType());
  if (auto reinterpretCast = memref.getDefiningOp<memref::ReinterpretCastOp>()) {
    os << "(";
    emitValue(reinterpretCast.getSource());
    os << " + ";
    emitOpFoldResult(reinterpretCast.getMixedOffsets().front());
    for (auto [index, stride] : llvm::zip(indices,
                                           reinterpretCast.getMixedStrides())) {
      os << " + ";
      emitValue(index);
      os << " * ";
      emitOpFoldResult(stride);
    }
    os << ")[0]";
    return;
  }

  emitValue(memref);
  if (memrefType.getRank() == 0) {
    os << "[0]";
    return;
  }
  for (auto index : indices) {
    os << "[";
    emitValue(index);
    os << "]";
  }
}

memref::SubViewOp getSubviewOp(Value val) {
  return val.getDefiningOp<memref::SubViewOp>();
}

bool checkOneDimMemref(Value val) {
  if (auto memrefTy = mlir::dyn_cast<MemRefType>(val.getType())) {
    return memrefTy.getRank() == 1;
  }
  return false;
}

bool checkSubViewOffsetAndStride(memref::SubViewOp op) {
  for (auto off : op.getMixedOffsets()) {
    if (!isConstantIntValue(off, 0)) {
      return false;
    }
  }
  for (auto stride : op.getMixedStrides()) {
    if (!isConstantIntValue(stride, 1)) {
      return false;
    }
  }
  return true;
}

bool is1D(MemRefType memref) { return memref.getRank() == 1; }

bool is2D(MemRefType memref) { return memref.getRank() == 2; }

bool lessOrEqual2D(MemRefType memref) { return memref.getRank() <= 2; }

bool isSimilar1D(MemRefType memref) {
  for (int i = 0; i < memref.getRank() - 1; i++)
    if (memref.getShape()[i] != 1)
      return false;
  return true;
}

void ModuleEmitter::emitMemCpyValue(Value val) {
  auto memrefType = mlir::cast<MemRefType>(val.getType());
  if (auto castOp = val.getDefiningOp<memref::ReinterpretCastOp>()) {
    // Wrap pointer arithmetic in parentheses to ensure correct operator
    // precedence when followed by array indexing: (var_0 + offset)[i] instead
    // of var_0 + offset[i]
    os << "(";
    emitValue(castOp.getSource());
    os << " + ";
    emitOpFoldResult(castOp.getMixedOffsets()[0]);
    if (!isSimilar1D(memrefType)) {
      os << " + i * ";
      emitOpFoldResult(castOp.getMixedStrides()[0]);
    }
    os << ")";
  } else if (auto allocOp = val.getDefiningOp<memref::AllocOp>()) {
    if (!isSimilar1D(memrefType)) {
      if (state.target == EmitTarget::SYCL) {
        // For SYCL local_accessor, we must use operator[] for multi-dimensional
        // access. Pointer arithmetic (val + i) does not work for accessors or
        // their subarrays.
        emitValue(val);
        os << "[i]";
      } else {
        // Wrap in parentheses for consistency
        os << "(";
        emitValue(val);
        os << " + i)";
      }
    } else {
      if (state.target == EmitTarget::SYCL) {
        // For linear access to an ND accessor (e.g. 1x16), we decay to pointer
        // &val[0]...[0] so that [i] indexing works as expected on the flat
        // buffer.
        os << "(&";
        emitValue(val);
        for (int k = 0; k < memrefType.getRank(); ++k)
          os << "[0]";
        os << ")";
      } else {
        emitValue(val);
      }
    }
  } else if (auto blockArg = mlir::dyn_cast<BlockArgument>(val)) {
    if (state.target == EmitTarget::SYCL && isSimilar1D(memrefType)) {
      // Same logic for block arguments (local accessors)
      os << "(&";
      emitValue(val);
      for (int k = 0; k < memrefType.getRank(); ++k)
        os << "[0]";
      os << ")";
    } else {
      emitValue(val);
    }
  } else {
    val.dump();
    emitError(val.getDefiningOp(), "unsupported memcpy view");
    return;
  }
}

void ModuleEmitter::emitOpFoldResult(OpFoldResult opFoldResult) {
  if (auto intAttr = getConstantIntValue(opFoldResult)) {
    os << intAttr;
  } else {
    emitValue(mlir::dyn_cast<Value>(opFoldResult));
  }
}

void ModuleEmitter::emitAsyncCopy(Value target, Value source) {
  indent();
  if (state.target == EmitTarget::SYCL)
    os << "ev = item.get_group().async_work_group_copy(";
  else
    os << "ev = async_work_group_copy(";
  emitMemCpyValue(target);
  os << ", ";
  emitMemCpyValue(source);
  os << ", ";
}

void ModuleEmitter::emitAsyncCopyWithOpFoldResult(Value target, Value source,
                                                  OpFoldResult num) {
  emitAsyncCopy(target, source);
  emitOpFoldResult(num);
  os << ", 0);";
}

void ModuleEmitter::emitAsyncCopyWithConstant(Value target, Value source,
                                              int num) {
  emitAsyncCopy(target, source);
  os << num << ", 0);";
}

void ModuleEmitter::emitMemCpy(memref::CopyOp op) {
  if (state.target == EmitTarget::SYCL &&
      cast<MemRefType>(op.getTarget().getType()).getRank() == 0) {
    // A rank-zero memref is represented by a one-element local_accessor.
    // Copy the element, not the accessor: copying &accessor aliases the two
    // buffers and corrupts independent reduction accumulators.
    indent() << "if (item.get_local_linear_id() == 0) {\n";
    addIndent();
    indent();
    emitMemRefAccess(op.getTarget(), ValueRange{});
    os << " = ";
    emitMemRefAccess(op.getSource(), ValueRange{});
    os << ";\n";
    reduceIndent();
    indent() << "}\n";
    indent() << "item.barrier(sycl::access::fence_space::local_space);\n";
    return;
  }
  if (state.target == EmitTarget::SYCL &&
      cast<MemRefType>(op.getTarget().getType()).getRank() > 2) {
    auto type = cast<MemRefType>(op.getTarget().getType());
    if (!type.hasStaticShape()) {
      emitError(op, "SYCL copy needs a static logical block shape");
      return;
    }
    SmallVector<std::string> indices;
    unsigned rank = type.getRank();
    for (unsigned i = 0; i < rank; ++i) {
      std::string index = "copy_i" + std::to_string(i);
      indices.push_back(index);
      indent() << "for (int64_t " << index << " = ";
      os << (i + 1 == rank ? "item.get_local_id(0)" : "0");
      os << "; " << index << " < " << type.getDimSize(i) << "; " << index << " += ";
      os << (i + 1 == rank ? "item.get_local_range(0)" : "1");
      os << ") {\n";
      addIndent();
    }
    indent();
    emitIndexedMemRef(op.getTarget(), indices);
    os << " = ";
    emitIndexedMemRef(op.getSource(), indices);
    os << ";\n";
    for (unsigned i = 0; i < rank; ++i) {
      reduceIndent();
      indent() << "}\n";
    }
    if (!op->getParentOfType<affine::AffineForOp>())
      indent() << "item.barrier(sycl::access::fence_space::local_space);\n";
    return;
  }
  if (state.target == EmitTarget::SYCL) {
    auto sourceSubView = getSubviewOp(op.getSource());
    auto targetSubView = getSubviewOp(op.getTarget());
    bool isCopySubView = false;
    if (sourceSubView || targetSubView) {
      if (!sourceSubView || !targetSubView ||
          !checkSubViewOffsetAndStride(sourceSubView) ||
          !checkSubViewOffsetAndStride(targetSubView)) {
        emitError(op, "unsupported SYCL copy subview offsets/strides");
        return;
      }
      isCopySubView = true;
    }

    auto targetMemref =
        mlir::dyn_cast<mlir::MemRefType>(op.getTarget().getType());
    if (!targetMemref || !lessOrEqual2D(targetMemref)) {
      emitError(op, "unsupported SYCL copy rank");
      return;
    }

    auto emitLinearCopy = [&](Value target, Value source, OpFoldResult num) {
      if (state.target == EmitTarget::SYCL) {
        // Coalesced access: each work-item loads/stores strided elements
        indent() << "for (int i = item.get_local_id(0); i < ";
        emitOpFoldResult(num);
        os << "; i += item.get_local_range(0)) {\n";
      } else {
        indent() << "for (int i = 0; i < ";
        emitOpFoldResult(num);
        os << "; i += 1) {\n";
      }
      addIndent();
      indent();
      emitMemCpyValue(target);
      os << "[i] = ";
      emitMemCpyValue(source);
      os << "[i];\n";
      reduceIndent();
      indent() << "}\n";
    };

    auto emitRowCopy = [&](Value target, Value source, OpFoldResult rows,
                           OpFoldResult cols) {
      indent() << "for (int i = 0; i < ";
      emitOpFoldResult(rows);
      os << "; i += 1) {\n";
      addIndent();

      if (state.target == EmitTarget::SYCL) {
        // Coalesced access on inner dimension
        indent() << "for (int j = item.get_local_id(0); j < ";
        emitOpFoldResult(cols);
        os << "; j += item.get_local_range(0)) {\n";
      } else {
        indent() << "for (int j = 0; j < ";
        emitOpFoldResult(cols);
        os << "; j += 1) {\n";
      }

      addIndent();
      indent();
      emitMemCpyValue(target);
      os << "[j] = ";
      emitMemCpyValue(source);
      os << "[j];\n";
      reduceIndent();
      indent() << "}\n";
      reduceIndent();
      indent() << "}\n";
    };

    if (isCopySubView) {
      if (is1D(targetMemref)) {
        emitLinearCopy(targetSubView.getSource(), sourceSubView.getSource(),
                       targetSubView.getMixedSizes()[0]);
      } else if (is2D(targetMemref)) {
        emitRowCopy(targetSubView.getSource(), sourceSubView.getSource(),
                    targetSubView.getMixedSizes()[0],
                    targetSubView.getMixedSizes()[1]);
      }
    } else {
      if (isSimilar1D(targetMemref)) {
        auto idxType = IndexType::get(op.getContext());
        OpFoldResult numElements =
            IntegerAttr::get(idxType, targetMemref.getNumElements());
        emitLinearCopy(op.getTarget(), op.getSource(), numElements);
      } else if (is2D(targetMemref)) {
        auto targetCast =
            op.getTarget().getDefiningOp<memref::ReinterpretCastOp>();
        auto sourceCast =
            op.getSource().getDefiningOp<memref::ReinterpretCastOp>();
        if (targetCast)
          emitRowCopy(op.getTarget(), op.getSource(),
                      targetCast.getMixedSizes()[0],
                      targetCast.getMixedSizes()[1]);
        else if (sourceCast)
          emitRowCopy(op.getTarget(), op.getSource(),
                      sourceCast.getMixedSizes()[0],
                      sourceCast.getMixedSizes()[1]);
      }
    }
    emitInfoAndNewLine(op);
    if (state.target == EmitTarget::SYCL)
      indent() << "item.barrier(sycl::access::fence_space::local_space);\n";
    return;
  }

  auto sourceSubView = getSubviewOp(op.getSource());
  auto targetSubView = getSubviewOp(op.getTarget());
  bool isCopySubView = false;
  if (sourceSubView || targetSubView) {
    assert(checkSubViewOffsetAndStride(sourceSubView) &&
           "source subview not support");
    assert(checkSubViewOffsetAndStride(targetSubView) &&
           "target subview not support");
    isCopySubView = true;
  }

  auto targetMemref =
      mlir::dyn_cast<mlir::MemRefType>(op.getTarget().getType());
  assert(lessOrEqual2D(targetMemref) && "mecpy unsupported not support > 2D");
  if (isCopySubView) {
    if (is1D(targetMemref)) {
      emitAsyncCopyWithOpFoldResult(targetSubView.getSource(),
                                    sourceSubView.getSource(),
                                    targetSubView.getMixedSizes()[0]);
    } else if (is2D(targetMemref)) {
      indent() << "for (int i = 0; i < ";
      emitOpFoldResult(targetSubView.getMixedSizes()[0]);
      os << "; i += 1) {\n";
      addIndent();
      emitAsyncCopyWithOpFoldResult(targetSubView.getSource(),
                                    sourceSubView.getSource(),
                                    targetSubView.getMixedSizes()[1]);
      os << "\n";
      reduceIndent();
      indent() << "}";
    }
  } else {
    if (isSimilar1D(targetMemref)) {
      emitAsyncCopyWithConstant(op.getTarget(), op.getSource(),
                                targetMemref.getNumElements());
    } else if (is2D(targetMemref)) {
      if (auto castOp =
              op.getSource().getDefiningOp<memref::ReinterpretCastOp>()) {
        indent() << "for (int i = 0; i < ";
        emitOpFoldResult(castOp.getMixedSizes()[0]);
        os << "; i += 1) {\n";
        addIndent();
        emitAsyncCopyWithOpFoldResult(op.getTarget(), op.getSource(),
                                      castOp.getMixedSizes()[1]);
        os << "\n";
        reduceIndent();
        indent() << "}";
      }
    }
  }
  emitInfoAndNewLine(op);
  if (state.target == EmitTarget::SYCL)
    indent() << "item.barrier(sycl::access::fence_space::local_space);\n";
  else
    indent() << "wait_group_events(1, &ev);\n";
}

template <typename OpType> void ModuleEmitter::emitReshape(OpType op) {
  auto array = op->getResult(0);
  assert(!isDeclared(array) && "has been declared before.");

  auto arrayType = mlir::cast<ShapedType>(array.getType());
  indent() << arrayType << " (*";

  // Add the new value to nameTable and emit its name.
  os << addName(array, false);
  os << ")";

  for (auto &shape : llvm::drop_begin(arrayType.getShape(), 1))
    os << "[" << shape << "]";

  os << " = (" << arrayType << "(*)";
  for (auto &shape : llvm::drop_begin(arrayType.getShape(), 1))
    os << "[" << shape << "]";
  os << ") ";

  emitValue(op->getOperand(0));
  os << ";";
  emitInfoAndNewLine(op);
}

/// Standard expression emitters.
void ModuleEmitter::emitUnary(Operation *op, const char *syntax) {
  auto rank = emitNestedLoopHeader(op->getResult(0));
  indent();
  emitValue(op->getResult(0), rank);
  os << " = ";
  bool floatingMath = state.target == EmitTarget::SYCL &&
      op->getName().getDialectNamespace() == "math" &&
      !isa<math::AbsIOp>(op);
  if (floatingMath) {
    // Unqualified abs(float) can select ::abs(int). Always choose the SYCL
    // floating overload; software storage types explicitly widen first.
    if (isa<math::AbsFOp>(op)) os << "sycl::fabs";
    else if (isa<math::RsqrtOp>(op)) os << "sycl::rsqrt";
    else os << "sycl::" << syntax;
  } else os << syntax;
  os << "(";
  if (floatingMath) {
    Type type = op->getOperand(0).getType();
    if (auto shaped = dyn_cast<ShapedType>(type)) type = shaped.getElementType();
    os << "static_cast<" << (type.isF64() ? "double" : "float") << ">(";
  }
  emitValue(op->getOperand(0), rank);
  if (floatingMath) os << ")";
  os << ");";
  emitInfoAndNewLine(op);
  emitNestedLoopFooter(rank);
}

void ModuleEmitter::emitBinary(Operation *op, const char *syntax, bool unsignedOperands) {
  auto rank = emitNestedLoopHeader(op->getResult(0));
  indent();
  emitValue(op->getResult(0), rank);
  os << " = ";
  auto operand = [&](unsigned i) {
    if (unsignedOperands) os << "uint64_t(static_cast<" << unsignedType(op->getOperand(i).getType()) << ">(";
    emitValue(op->getOperand(i), rank);
    if (unsignedOperands) os << "))";
  };
  operand(0);
  os << " " << syntax << " ";
  operand(1);
  os << ";";
  emitInfoAndNewLine(op);
  emitNestedLoopFooter(rank);
}

void ModuleEmitter::emitFloatCompare(arith::CmpFOp op) {
  auto rank = emitNestedLoopHeader(op.getResult());
  indent();
  emitValue(op.getResult(), rank);
  os << " = triton_sycl_cmp<" << static_cast<unsigned>(op.getPredicate()) << ">(";
  emitValue(op.getLhs(), rank);
  os << ", ";
  emitValue(op.getRhs(), rank);
  os << ");";
  emitInfoAndNewLine(op);
  emitNestedLoopFooter(rank);
}

template <typename OpType>
void ModuleEmitter::emitMaxMin(OpType op, const char *syntax) {
  auto rank = emitNestedLoopHeader(op.getResult());
  indent();
  emitValue(op.getResult());
  bool unsignedOperands = isa<arith::MaxUIOp, arith::MinUIOp>(op.getOperation());
  bool floating = isa<arith::MaximumFOp, arith::MinimumFOp, arith::MaxNumFOp, arith::MinNumFOp>(op.getOperation());
  if (state.target == EmitTarget::SYCL && floating)
    os << " = triton_sycl_" << syntax << "(";
  else if (state.target == EmitTarget::SYCL && isa<arith::RemFOp, math::PowFOp>(op.getOperation()))
    os << " = sycl::" << syntax << "(";
  else if (state.target == EmitTarget::SYCL)
    os << " = std::" << syntax << "<" << (unsignedOperands ? unsignedType(op.getResult().getType()) : getDataTypeName(op.getResult().getType(), state.target)) << ">(";
  else
    os << " = " << syntax << "(";
  if (unsignedOperands) os << "static_cast<" << unsignedType(op.getLhs().getType()) << ">(";
  emitValue(op.getLhs(), rank);
  if (unsignedOperands) os << ")";
  os << ", ";
  if (unsignedOperands) os << "static_cast<" << unsignedType(op.getRhs().getType()) << ">(";
  emitValue(op.getRhs(), rank);
  if (unsignedOperands) os << ")";
  os << ");";
  emitInfoAndNewLine(op);
  emitNestedLoopFooter(rank);
}

/// Special expression emitters.
void ModuleEmitter::emitSelect(arith::SelectOp op) {
  unsigned rank = emitNestedLoopHeader(op.getResult());
  unsigned conditionRank = rank;
  if (!mlir::isa<ShapedType>(op.getCondition().getType()))
    conditionRank = 0;

  indent();
  emitValue(op.getResult(), rank);
  os << " = ";
  emitValue(op.getCondition(), conditionRank);
  os << " ? ";
  // os << "(" << getTypeName(op.getTrueValue()) << ")";
  emitValue(op.getTrueValue(), rank);
  os << " : ";
  // os << "(" << getTypeName(op.getFalseValue()) << ")";
  emitValue(op.getFalseValue(), rank);
  os << ";";
  emitInfoAndNewLine(op);
  emitNestedLoopFooter(rank);
}

template <typename OpType> void ModuleEmitter::emitConstant(OpType op) {
  // This indicates the constant type is scalar (float, integer, or bool).
  if (isDeclared(op.getResult()))
    return;

  if (auto denseAttr = mlir::dyn_cast<DenseElementsAttr>(op.getValue())) {
    indent();
    emitArrayDecl(op.getResult());
    os << " = {";
    auto type =
        mlir::cast<MemRefType>(op.getResult().getType()).getElementType();

    unsigned elementIdx = 0;
    for (auto element : denseAttr.template getValues<Attribute>()) {
      auto string = getConstantString(type, element);
      if (string.empty())
        op.emitOpError("constant has invalid value");
      os << string;
      if (elementIdx++ != denseAttr.getNumElements() - 1)
        os << ", ";
    }
    os << "};";
    emitInfoAndNewLine(op);
  } else
    emitError(op, "has unsupported constant type.");
}

void ModuleEmitter::planLocalBuffers(func::FuncOp func) {
  uint64_t bytes = 0;
  for (auto allocation : localAllocs)
    bytes += allocation.getType().getNumElements() * std::max<unsigned>(8, allocation.getType().getElementTypeBitWidth()) / 8;
  auto before = func->getAttrOfType<IntegerAttr>("sycl.local_bytes_before");
  os << "// SYCL local storage: " << (before ? before.getInt() : bytes)
     << " -> " << bytes << " bytes (pipeline phase reuse)\n";
}

void ModuleEmitter::emitFunction(func::FuncOp func) {
  if (func.getBlocks().size() != 1) {
    emitError(func, "needs exactly one basic block");
    return;
  }

  // For SYCL, scan for local allocations first
  localAllocs.clear();
  if (state.target == EmitTarget::SYCL) {
    func.walk([&](memref::AllocOp allocOp) {
      if (allocOp.getType().hasStaticShape()) {
        localAllocs.push_back(allocOp);
      }
    });
  }

  planLocalBuffers(func);

  // Emit function signature.
  if (state.target == EmitTarget::SYCL)
    os << "inline void " << func.getName() << "(\n";
  else if (state.target == EmitTarget::SYCL)
    os << "inline void " << func.getName() << "(\n";
  else
    os << "__kernel void " << func.getName() << "(\n";
  addIndent();

  // This vector is to record all ports of the function.
  SmallVector<Value, 8> portList;

  bool needComma = false;
  if (state.target == EmitTarget::SYCL) {
    indent() << "sycl::nd_item<3> item";
    needComma = true;
  }

  // Emit input arguments.
  for (auto &arg : func.getArguments()) {
    if (needComma)
      os << ",\n";
    indent();
    auto type = arg.getType();

    if (mlir::isa<MemRefType>(type))
      emitArrayDecl(arg);
    else
      emitValue(arg);

    portList.push_back(arg);
    needComma = true;
  }

  // For SYCL, emit local_accessor parameters for each local allocation
  if (state.target == EmitTarget::SYCL) {
    for (auto allocOp : localAllocs) {
      if (needComma)
        os << ",\n";
      indent();
      auto memrefType = allocOp.getType();
      auto elemType = memrefType.getElementType();
      auto rank = getSYCLAccessorRank(memrefType);
      os << "sycl::local_accessor<" << getDataTypeName(elemType, state.target)
         << ", " << rank << "> " << addName(allocOp.getResult());
      needComma = true;
    }
  }

  reduceIndent();
  os << "\n) {";
  emitInfoAndNewLine(func);

  // Emit function body.
  addIndent();
  // Emit event for OpenCL async copies.
  if (state.target == EmitTarget::OpenCL)
    indent() << "event_t ev = 0;\n";

  emitBlock(func.front());
  reduceIndent();
  os << "}\n";
  // An empty line.
  os << "\n";
}

void ModuleEmitter::emitGlobalId(gpu::GlobalIdOp op) {
  indent();
  emitValue(op.getResult());
  gpu::Dimension dim = op.getDimension();
  if (state.target == EmitTarget::SYCL) {
    // Triton's program_id corresponds to SYCL work-group ID (not global
    // work-item ID)
    os << " = item.get_group(";
    os << static_cast<int64_t>(dim);
  } else {
    os << " = get_group_id(";
    os << static_cast<int64_t>(dim);
  }
  os << ");\n";
}

void ModuleEmitter::emitLocalId(Operation *op, gpu::Dimension dimension, bool range) {
  indent(); emitValue(op->getResult(0));
  os << (range ? " = item.get_local_range(" : " = item.get_local_id(")
     << static_cast<int64_t>(dimension) << ");\n";
}

void ModuleEmitter::emitAllReduce(gpu::AllReduceOp op) {
  auto kind = op.getOp();
  StringRef function;
  if (kind == gpu::AllReduceOperation::ADD) function = "plus";
  else if (kind == gpu::AllReduceOperation::MUL) function = "multiplies";
  else if (kind == gpu::AllReduceOperation::AND) function = "bit_and";
  else if (kind == gpu::AllReduceOperation::OR) function = "bit_or";
  else if (kind == gpu::AllReduceOperation::XOR) function = "bit_xor";
  else { emitError(op, "unsupported group reduction operation"); return; }
  Type type = op.getResult().getType();
  std::string name = isa<IntegerType>(type) ? unsignedType(type) : getDataTypeName(type, state.target);
  indent(); emitValue(op.getResult());
  os << " = sycl::reduce_over_group(item.get_group(), static_cast<" << name << ">(";
  emitValue(op.getValue());
  os << "), sycl::" << function << "<" << name << ">());\n";
}

void ModuleEmitter::emitBarrier(gpu::BarrierOp op) {
  indent();
  if (state.target == EmitTarget::SYCL)
    os << "item.barrier(sycl::access::fence_space::local_space);\n";
  else
    os << "barrier(CLK_LOCAL_MEM_FENCE);\n";
}

void ModuleEmitter::emitHostWrapper(func::FuncOp func) {
  if (state.target != EmitTarget::SYCL)
    return;

  // Scan for local allocations again (or reuse localAllocs if scope is
  // preserved, but best to rescan to be safe/stateless)
  auto hostLocalAllocs = localAllocs;

  // Emit both the normal asynchronous launcher and a profiling launcher.
  // The latter returns the device event duration and is used by benchmarks to
  // exclude Python, process startup, and compilation time.
  auto emitHostFunction = [&](StringRef wrapperName, bool profile) {
    os << "extern \"C\" void " << wrapperName << "(";
    os << "sycl::queue* q, size_t gridX, size_t gridY, size_t gridZ, ";
    os << "size_t blockX, size_t blockY, size_t blockZ";

    for (auto &arg : func.getArguments()) {
      os << ", ";
      auto type = arg.getType();
      if (mlir::isa<MemRefType>(type)) {
        // Use a pointer in the host ABI for both ranked and unranked memrefs.
        // The generated kernel's array parameters decay to the same pointer.
        os << getDataTypeName(type, state.target) << "* " << getName(arg);
      } else {
        os << getDataTypeName(type, state.target) << " " << getName(arg);
      }
    }
    if (profile)
      os << ", uint64_t* elapsed_ns";
    os << ") {\n";
    addIndent();

    if (profile)
      indent() << "sycl::event kernel_event = q->submit([&](sycl::handler &h) {\n";
    else
      indent() << "q->submit([&](sycl::handler &h) {\n";
    addIndent();

    for (auto allocOp : hostLocalAllocs) {
      indent();
      auto memrefType = allocOp.getType();
      auto elemType = memrefType.getElementType();
      auto rank = getSYCLAccessorRank(memrefType);
      os << "sycl::local_accessor<" << getDataTypeName(elemType, state.target)
         << ", " << rank << "> " << getName(allocOp.getResult())
         << "(sycl::range<" << rank << ">(";
      auto shape = memrefType.getShape();
      if (memrefType.getRank() == 0) {
        os << "1";
      } else {
        for (unsigned i = 0; i < rank; ++i) {
          os << shape[i];
          if (i != rank - 1)
            os << ", ";
        }
      }
      os << "), h);\n";
    }

    indent()
        << "h.parallel_for(sycl::nd_range<3>(sycl::range<3>(gridX, gridY, gridZ) "
           "* sycl::range<3>(blockX, blockY, blockZ), sycl::range<3>(blockX, "
           "blockY, blockZ)), [=](sycl::nd_item<3> item) {\n";
    addIndent();

    indent() << func.getName() << "(item";
    for (auto &arg : func.getArguments())
      os << ", " << getName(arg);
    for (auto allocOp : hostLocalAllocs)
      os << ", " << getName(allocOp.getResult());
    os << ");\n";

    reduceIndent();
    indent() << "});\n";
    reduceIndent();
    indent() << "});\n";
    if (profile) {
      indent() << "kernel_event.wait_and_throw();\n";
      indent() << "*elapsed_ns = kernel_event.get_profiling_info<"
               << "sycl::info::event_profiling::command_end>() - "
               << "kernel_event.get_profiling_info<"
               << "sycl::info::event_profiling::command_start>();\n";
    }
    reduceIndent();
    os << "}\n\n";
  };

  emitHostFunction("launch_" + func.getName().str(), false);
  emitHostFunction("profile_" + func.getName().str(), true);
}

/// Top-level MLIR module emitter.
void ModuleEmitter::emitModule(ModuleOp module) {
  if (state.target == EmitTarget::SYCL) {
    os << R"XXX(//===------------------------------------------------------------*- C++ -*-===//
//
// Automatically generated file for SYCL
//
//===----------------------------------------------------------------------===//

#include <sycl/sycl.hpp>
#include <algorithm>
#include <cstdint>

)XXX";
    os << tritonSYCLNumericSupport;
  } else {
    os << R"XXX(//===------------------------------------------------------------*- C++ -*-===//
//
// Automatically generated file for OpenCL
//
//===----------------------------------------------------------------------===//

)XXX";
  }

  // Emit all functions in the call graph in a post order.
  CallGraph graph(module);
  llvm::SmallDenseSet<func::FuncOp> emittedFuncs;
  for (auto node : llvm::post_order<const CallGraph *>(&graph)) {
    if (node->isExternal())
      continue;
    if (auto func =
            node->getCallableRegion()->getParentOfType<func::FuncOp>()) {
      emitFunction(func);
      if (state.target == EmitTarget::SYCL)
        emitHostWrapper(func);
      emittedFuncs.insert(func);
    }
  }

  // Emit remained functions accordingly.
  for (auto &op : *module.getBody()) {
    if (auto func = dyn_cast<func::FuncOp>(op)) {
      if (!emittedFuncs.count(func)) {
        emitFunction(func);
        if (state.target == EmitTarget::SYCL)
          emitHostWrapper(func);
      }
    } else if (!isa<ml_program::GlobalOp>(op))
      emitError(&op, "is unsupported operation");
  }
}

//===----------------------------------------------------------------------===//
// Entry of triton-spirv-translate
//===----------------------------------------------------------------------===//

LogicalResult emitSYCL(ModuleOp module, llvm::raw_ostream &os) {
  bool invalid = false;
  module.walk([&](Operation *op) {
    auto check = [&](Type type) {
      if (auto shaped = dyn_cast<ShapedType>(type)) type = shaped.getElementType();
      if (getDataTypeName(type, EmitTarget::SYCL).find("unsupported") != std::string::npos) {
        op->emitError("unsupported SYCL source type: ") << type;
        invalid = true;
      }
    };
    for (Type type : op->getOperandTypes()) check(type);
    for (Type type : op->getResultTypes()) check(type);
    for (Region &region : op->getRegions())
      for (Block &block : region)
        for (BlockArgument arg : block.getArguments()) check(arg.getType());
  });
  if (invalid) return failure();
  ScaleHLSEmitterState state(os, EmitTarget::SYCL);
  ModuleEmitter(state).emitModule(module);
  return failure(state.encounteredError);
}

void registerEmitSYCLTranslation() {
  static TranslateFromMLIRRegistration toSYCL(
      "triton-sycl-emit-sycl", "Translate MLIR into SYCL", emitSYCL,
      [&](DialectRegistry &registry) {
        registry.insert<mlir::math::MathDialect, mlir::arith::ArithDialect,
                        mlir::scf::SCFDialect, mlir::func::FuncDialect,
                        mlir::memref::MemRefDialect, ::mlir::gpu::GPUDialect,
                        mlir::affine::AffineDialect>();
      });
}

int main(int argc, char **argv) {

  registerEmitSYCLTranslation();

  return mlir::failed(
      mlir::mlirTranslateMain(argc, argv, "SPIRV Translation Tool"));
}
