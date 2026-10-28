#include "sycl/include/Analysis/MaskAnalysis.h"
#include "sycl/include/Analysis/OpFoldResultUtils.h"
#include "sycl/include/Analysis/PtrAnalysis.h"

#include "triton/Dialect/Triton/IR/Dialect.h"

#include "mlir/Dialect/Affine/IR/AffineOps.h"
#include "mlir/Dialect/Bufferization/IR/Bufferization.h"
#include "mlir/Dialect/ControlFlow/IR/ControlFlowOps.h"
#include "mlir/Dialect/Linalg/IR/Linalg.h"
#include "mlir/Dialect/Linalg/Passes.h"
#include "mlir/Dialect/Utils/ReshapeOpsUtils.h"

#include "mlir/Dialect/GPU/IR/GPUDialect.h"
#include "mlir/IR/IRMapping.h"

#include "llvm/ADT/SmallVectorExtras.h"
#include "llvm/ADT/TypeSwitch.h"

using namespace mlir;
using namespace triton;
using namespace mlir::triton::sycl;

//===----------------------------------------------------------------------===//
// Utilities
//===----------------------------------------------------------------------===//

// Extract a scalar value from v.
// If v is a scalar, return that directly. Otherwise, parse through operations
// (currently only support splat, sitofp, and truncf) that produce it to
// extract the underlying scalar value. We then reconstruct the chain of
// operations that can produce this constant with the original type. If no
// scalar value can be extracted, a nullptr is returned.
static Value getScalarValue(Value operand, Location loc,
                            ConversionPatternRewriter &rewriter) {
  SmallVector<Operation *> ops;

  auto reconstructScalarValue = [&](Value src) {
    for (auto op = ops.rbegin(); op != ops.rend(); ++op) {
      src = TypeSwitch<Operation *, Value>(*op)
                .Case<arith::SIToFPOp>([&](Operation *op) {
                  auto resType = op->getResults()[0].getType();
                  if (auto shapedType = dyn_cast<ShapedType>(resType)) {
                    resType = shapedType.getElementType();
                  }
                  return rewriter.create<arith::SIToFPOp>(loc, resType, src);
                })
                .Case<arith::TruncFOp>([&](Operation *op) {
                  auto resType = op->getResults()[0].getType();
                  if (auto shapedType = dyn_cast<ShapedType>(resType)) {
                    resType = shapedType.getElementType();
                  }
                  return rewriter.create<arith::TruncFOp>(loc, resType, src);
                })
                .Default([](Operation *op) {
                  llvm_unreachable("unsupported op in generating ");
                  return nullptr;
                });
    }
    return src;
  };

  while (true) {
    if (!dyn_cast<ShapedType>(operand.getType())) {
      return reconstructScalarValue(operand);
    } else if (auto op = operand.getDefiningOp<arith::ConstantOp>()) {
      if (auto attr = dyn_cast<DenseElementsAttr>(op.getValue())) {
        if (!attr.isSplat()) {
          InFlightDiagnostic diag = emitError(loc)
                                    << "other value used in masked load "
                                       "produced by unsupported instruction";
          return nullptr;
        }
        auto elemValue = attr.getSplatValue<Attribute>();
        auto constOp = arith::ConstantOp::materialize(
            rewriter, elemValue, attr.getElementType(), op.getLoc());
        return reconstructScalarValue(constOp.getResult());
      }
    } else if (auto op = operand.getDefiningOp<triton::SplatOp>()) {
      operand = op.getSrc();
    } else if (auto op = operand.getDefiningOp<arith::SIToFPOp>()) {
      ops.push_back(op.getOperation());
      operand = op.getIn();
    } else if (auto op = operand.getDefiningOp<arith::TruncFOp>()) {
      ops.push_back(op.getOperation());
      operand = op.getIn();
    } else {
      InFlightDiagnostic diag = emitError(loc)
                                << "other value used in masked load produced "
                                   "by unsupported instruction";
      return nullptr;
    }
  }
  return nullptr;
}

inline bool isPtrTypeLike(Type t) {
  if (auto tensorType = dyn_cast<RankedTensorType>(t)) {
    return isa<triton::PointerType>(tensorType.getElementType());
  }
  return isa<triton::PointerType>(t);
}

static SmallVector<utils::IteratorType> getNParallelLoopsAttrs(unsigned n) {
  return SmallVector<utils::IteratorType>(n, utils::IteratorType::parallel);
}

static Value createZeroValue(Type type, Location loc,
                             ConversionPatternRewriter &rewriter) {
  if (isa<FloatType>(type))
    return rewriter.create<arith::ConstantOp>(
        loc, rewriter.getFloatAttr(type, 0.0));
  if (isa<IntegerType>(type))
    return rewriter.create<arith::ConstantOp>(
        loc, rewriter.getIntegerAttr(type, 0));
  return nullptr;
}

static Value castDotOperand(Value value, Type targetType, Location loc,
                            OpBuilder &builder) {
  Type sourceType = value.getType();
  if (sourceType == targetType)
    return value;

  auto sourceFloat = dyn_cast<FloatType>(sourceType);
  auto targetFloat = dyn_cast<FloatType>(targetType);
  if (sourceFloat && targetFloat) {
    if (sourceFloat.getWidth() < targetFloat.getWidth())
      return builder.create<arith::ExtFOp>(loc, targetType, value);
    if (sourceFloat.getWidth() > targetFloat.getWidth())
      return builder.create<arith::TruncFOp>(loc, targetType, value);
  }

  auto sourceInteger = dyn_cast<IntegerType>(sourceType);
  auto targetInteger = dyn_cast<IntegerType>(targetType);
  if (sourceInteger && targetInteger) {
    if (sourceInteger.getWidth() < targetInteger.getWidth())
      return builder.create<arith::ExtSIOp>(loc, targetType, value);
    if (sourceInteger.getWidth() > targetInteger.getWidth())
      return builder.create<arith::TruncIOp>(loc, targetType, value);
  }

  return nullptr;
}

struct LegacyAddPtrConverter : public OpConversionPattern<triton::AddPtrOp> {
  using OpConversionPattern<triton::AddPtrOp>::OpConversionPattern;

  LogicalResult
  matchAndRewrite(triton::AddPtrOp op, OpAdaptor adaptor,
                  ConversionPatternRewriter &rewriter) const override {
    if (isa<RankedTensorType>(op.getType()))
      return rewriter.notifyMatchFailure(op, "tensor pointers must be scalarized before conversion");
    Value base = adaptor.getPtr(), offset = adaptor.getOffset();
    if (!offset.getType().isIndex())
      offset = rewriter.create<arith::IndexCastOp>(op.getLoc(), rewriter.getIndexType(), offset);
    while (auto previous = base.getDefiningOp<memref::ReinterpretCastOp>()) {
      auto previousOffset = previous.getMixedOffsets().front();
      Value value = getValueOrCreateConstantIndexOp(rewriter, op.getLoc(), previousOffset);
      offset = rewriter.create<arith::AddIOp>(op.getLoc(), offset, value);
      base = previous.getSource();
    }
    auto pointer = cast<triton::PointerType>(op.getType());
    Type element = pointer.getPointeeType();
    if (element.isInteger(1)) element = rewriter.getI8Type();
    auto type = MemRefType::get({1}, element,
        StridedLayoutAttr::get(op.getContext(), ShapedType::kDynamic, {1}));
    auto cast = rewriter.create<memref::ReinterpretCastOp>(op.getLoc(), type,
        base, offset, SmallVector<OpFoldResult>{rewriter.getIndexAttr(1)},
        SmallVector<OpFoldResult>{rewriter.getIndexAttr(1)});
    rewriter.replaceOp(op, cast.getResult());
    return success();
  }
};

// Tensor memory operations have already been scalarized with exact predicates.
static FailureOr<Value> scalarMemoryRef(Value pointer, Type element, Location loc,
                                        ConversionPatternRewriter &rewriter) {
  if (auto type = dyn_cast<MemRefType>(pointer.getType())) {
    if (type.getRank() == 1 && type.getElementType() == element) return pointer;
    return failure();
  }
  if (!isa<UnrankedMemRefType>(pointer.getType())) return failure();
  auto type = MemRefType::get({1}, element);
  return rewriter.create<memref::ReinterpretCastOp>(loc, type, pointer,
      rewriter.getIndexAttr(0), SmallVector<OpFoldResult>{rewriter.getIndexAttr(1)},
      SmallVector<OpFoldResult>{rewriter.getIndexAttr(1)}).getResult();
}

// Triton boolean memory uses byte storage; its frontend inserts pointer
// bitcasts before loads/stores. Equal-storage-width casts preserve the address.
struct FpToFpConverter : public OpConversionPattern<triton::FpToFpOp> {
  using OpConversionPattern<triton::FpToFpOp>::OpConversionPattern;
  LogicalResult matchAndRewrite(triton::FpToFpOp op, OpAdaptor adaptor,
      ConversionPatternRewriter &rewriter) const override {
    auto convert = [&](OpBuilder &builder, Location loc, Value value, Type target) -> Value {
      auto source = cast<FloatType>(value.getType());
      auto destination = cast<FloatType>(target);
      if (source == destination) return value;
      // Equal-width custom formats have distinct exponent ranges. Convert via
      // fp32, which represents every fp8 value exactly.
      if (source.getWidth() == destination.getWidth()) {
        value = builder.create<arith::ExtFOp>(loc, builder.getF32Type(), value);
        source = builder.getF32Type();
      }
      Operation *castOp;
      if (source.getWidth() < destination.getWidth())
        castOp = builder.create<arith::ExtFOp>(loc, target, value);
      else
        castOp = builder.create<arith::TruncFOp>(loc, target, value);
      if (auto rounding = op.getRoundingAttr())
        castOp->setAttr("sycl.rounding", builder.getI32IntegerAttr(static_cast<int>(rounding.getValue())));
      return castOp->getResult(0);
    };
    if (auto type = dyn_cast<RankedTensorType>(op.getType())) {
      Value source = adaptor.getSrc();
      if (auto memref = dyn_cast<MemRefType>(source.getType()))
        source = rewriter.create<bufferization::ToTensorOp>(op.getLoc(), op.getSrc().getType(), source, true, true);
      Value init = rewriter.create<tensor::EmptyOp>(op.getLoc(), type.getShape(), type.getElementType());
      auto identity = rewriter.getMultiDimIdentityMap(type.getRank());
      auto generic = rewriter.create<linalg::GenericOp>(op.getLoc(), TypeRange{type},
          ValueRange{source}, ValueRange{init}, SmallVector<AffineMap>{identity, identity},
          getNParallelLoopsAttrs(type.getRank()), [&](OpBuilder &builder, Location loc, ValueRange args) {
            builder.create<linalg::YieldOp>(loc, convert(builder, loc, args[0], type.getElementType()));
          });
      rewriter.replaceOp(op, generic.getResults());
    } else rewriter.replaceOp(op, convert(rewriter, op.getLoc(), adaptor.getSrc(), op.getType()));
    return success();
  }
};

struct BitcastConverter : public OpConversionPattern<triton::BitcastOp> {
  using OpConversionPattern<triton::BitcastOp>::OpConversionPattern;
  LogicalResult matchAndRewrite(triton::BitcastOp op, OpAdaptor adaptor,
      ConversionPatternRewriter &rewriter) const override {
    if (auto pointer = dyn_cast<triton::PointerType>(op.getType())) {
      Type element = pointer.getPointeeType();
      Type sourceElement;
      if (auto type = dyn_cast<UnrankedMemRefType>(adaptor.getSrc().getType())) sourceElement = type.getElementType();
      if (auto type = dyn_cast<MemRefType>(adaptor.getSrc().getType())) sourceElement = type.getElementType();
      if (sourceElement != element)
        return rewriter.notifyMatchFailure(op, "pointer bitcast needs equal storage types");
      rewriter.replaceOp(op, adaptor.getSrc());
      return success();
    }
    if (auto target = dyn_cast<RankedTensorType>(op.getType())) {
      Value source = adaptor.getSrc();
      if (auto type = dyn_cast<MemRefType>(source.getType()))
        source = rewriter.create<bufferization::ToTensorOp>(op.getLoc(),
            op.getSrc().getType(), source, true, true);
      if (source.getType() == target) {
        rewriter.replaceOp(op, source);
        return success();
      }
      auto sourceType = dyn_cast<RankedTensorType>(source.getType());
      if (!sourceType || sourceType.getShape() != target.getShape() ||
          sourceType.getElementTypeBitWidth() != target.getElementTypeBitWidth())
        return rewriter.notifyMatchFailure(op, "bitcast needs equal element storage widths");
      Value init = rewriter.create<tensor::EmptyOp>(op.getLoc(),
          target.getShape(), target.getElementType());
      auto identity = rewriter.getMultiDimIdentityMap(target.getRank());
      auto generic = rewriter.create<linalg::GenericOp>(op.getLoc(),
          TypeRange{target}, ValueRange{source}, ValueRange{init},
          SmallVector<AffineMap>{identity, identity},
          getNParallelLoopsAttrs(target.getRank()),
          [&](OpBuilder &builder, Location loc, ValueRange args) {
            Value bits = builder.create<arith::BitcastOp>(loc,
                target.getElementType(), args[0]);
            builder.create<linalg::YieldOp>(loc, bits);
          });
      rewriter.replaceOp(op, generic.getResults());
      return success();
    }
    rewriter.replaceOpWithNewOp<arith::BitcastOp>(op, op.getType(), adaptor.getSrc());
    return success();
  }
};

struct LoadConverter : public OpConversionPattern<triton::LoadOp> {
  using OpConversionPattern<triton::LoadOp>::OpConversionPattern;
  LogicalResult matchAndRewrite(triton::LoadOp op, OpAdaptor adaptor,
      ConversionPatternRewriter &rewriter) const override {
    if (isa<ShapedType>(op.getType()))
      return rewriter.notifyMatchFailure(op, "tensor load was not scalarized");
    auto loc = op.getLoc();
    auto pointer = scalarMemoryRef(adaptor.getPtr(), op.getType(), loc, rewriter);
    if (failed(pointer)) return rewriter.notifyMatchFailure(op, "invalid scalar load pointer");
    Value zero = rewriter.create<arith::ConstantIndexOp>(loc, 0), value;
    if (adaptor.getMask()) {
      auto guarded = rewriter.create<scf::IfOp>(loc, TypeRange{op.getType()}, adaptor.getMask(), true);
      {
        OpBuilder::InsertionGuard guard(rewriter);
        rewriter.setInsertionPointToStart(&guarded.getThenRegion().front());
        Value loaded = rewriter.create<memref::LoadOp>(loc, *pointer, zero);
        rewriter.create<scf::YieldOp>(loc, loaded);
        rewriter.setInsertionPointToStart(&guarded.getElseRegion().front());
        Value other = adaptor.getOther();
        if (!other) other = rewriter.create<arith::ConstantOp>(loc, rewriter.getZeroAttr(op.getType()));
        rewriter.create<scf::YieldOp>(loc, other);
      }
      value = guarded.getResult(0);
    } else value = rewriter.create<memref::LoadOp>(loc, *pointer, zero);
    rewriter.replaceOp(op, value);
    return success();
  }
};

struct StoreConverter : public OpConversionPattern<triton::StoreOp> {
  using OpConversionPattern<triton::StoreOp>::OpConversionPattern;
  LogicalResult matchAndRewrite(triton::StoreOp op, OpAdaptor adaptor,
      ConversionPatternRewriter &rewriter) const override {
    Value value = adaptor.getValue();
    if (isa<ShapedType>(value.getType()))
      return rewriter.notifyMatchFailure(op, "tensor store was not scalarized");
    auto loc = op.getLoc();
    auto pointer = scalarMemoryRef(adaptor.getPtr(), value.getType(), loc, rewriter);
    if (failed(pointer)) return rewriter.notifyMatchFailure(op, "invalid scalar store pointer");
    Value zero = rewriter.create<arith::ConstantIndexOp>(loc, 0);
    if (adaptor.getMask()) {
      rewriter.create<scf::IfOp>(loc, adaptor.getMask(), [&](OpBuilder &builder, Location here) {
        builder.create<memref::StoreOp>(here, value, *pointer, zero);
        builder.create<scf::YieldOp>(here);
      });
    } else rewriter.create<memref::StoreOp>(loc, value, *pointer, zero);
    rewriter.eraseOp(op);
    return success();
  }
};

struct LoopConverter : public OpConversionPattern<scf::ForOp> {
  using OpConversionPattern<scf::ForOp>::OpConversionPattern;

  LogicalResult
  matchAndRewrite(scf::ForOp op, OpAdaptor adaptor,
                  ConversionPatternRewriter &rewriter) const override {
    return rewriter.notifyMatchFailure(op, "unresolved pointer loop; normalize to scalar base and offsets");
  }
};

struct YieldConverter : public OpConversionPattern<scf::YieldOp> {
  using OpConversionPattern<scf::YieldOp>::OpConversionPattern;

  LogicalResult
  matchAndRewrite(scf::YieldOp op, OpAdaptor adaptor,
                  ConversionPatternRewriter &rewriter) const override {
    rewriter.replaceOpWithNewOp<scf::YieldOp>(op, adaptor.getOperands());
    return success();
  }
};

// Remove all Meta ops except for AddPtr which is handled by AddPtrConverter.
// Use benefit == 10 to ensure that this pattern always takes precedence over
// other patterns.
struct MetaOpConverter : public RewritePattern {
private:
  // UseAnalysis will tag operations whose results are used only as meta-data
  // with "MetaUse" tag.
  bool isMetaUse(Operation *op) const { return op->hasAttr("MetaUse"); }

public:
  MetaOpConverter(MLIRContext *context)
      : RewritePattern(MatchAnyOpTypeTag(), /*benefit=*/10, context) {}

  LogicalResult matchAndRewrite(Operation *op,
                                PatternRewriter &rewriter) const final {

    if (isa<triton::AddPtrOp>(op)) {
      return rewriter.notifyMatchFailure(op,
                                         "AddPtrOp will be handled separately");
    }

    if (isMetaUse(op)) {
      rewriter.eraseOp(op);
      return success();
    }

    return rewriter.notifyMatchFailure(op, "requires meta ops");
  }
};

//-----------------------------
// End of monolithic only
//-----------------------------

struct SplatConverter : public OpConversionPattern<triton::SplatOp> {
  using OpConversionPattern<triton::SplatOp>::OpConversionPattern;

  LogicalResult
  matchAndRewrite(triton::SplatOp op, OpAdaptor adaptor,
                  ConversionPatternRewriter &rewriter) const override {
    auto opType = cast<TensorType>(op.getType());
    auto loc = op.getLoc();

    auto init = rewriter.create<tensor::EmptyOp>(loc, opType.getShape(),
                                                 opType.getElementType());

    auto filledTensor =
        rewriter
            .create<linalg::FillOp>(loc, ValueRange{adaptor.getSrc()},
                                    ValueRange{init})
            .result();

    rewriter.replaceOp(op, filledTensor);
    return success();
  }
};

struct BroadcastConverter : public OpConversionPattern<triton::BroadcastOp> {
private:
  using OpConversionPattern<triton::BroadcastOp>::OpConversionPattern;

  SmallVector<int64_t> getBroadcastDims(RankedTensorType src,
                                        RankedTensorType dst) const {
    SmallVector<int64_t> broadcastDims;
    auto srcShape = src.getShape();
    auto dstShape = dst.getShape();

    for (size_t i = 0; i < srcShape.size(); i++) {
      if (dstShape[i] != srcShape[i]) {
        assert(srcShape[i] == 1);
        broadcastDims.push_back(i);
      }
    }
    assert(!broadcastDims.empty() && "cannot identify broadcast dimension");
    return broadcastDims;
  }

  // Broadcasts input tensor based on TosaToLinalg's broadcastToShape
  AffineMap getBroadcastAffineMap(MLIRContext *context,
                                  ArrayRef<int64_t> inputShape,
                                  ArrayRef<int64_t> broadcastToShape) const {

    assert(broadcastToShape.size() >= inputShape.size());

    // Create affine map and shapes for tensor initialization.
    SmallVector<AffineExpr> outExpr;

    size_t diff = broadcastToShape.size() - inputShape.size();
    for (size_t i = 0; i < broadcastToShape.size(); i++) {
      if (i < diff) {
        continue;
      }
      size_t j = i - diff;
      if (inputShape[j] == 1) {
        // Broadcast singleton dimension
        outExpr.push_back(mlir::getAffineConstantExpr(0, context));
        continue;
      }
      // Non-broadcast case
      outExpr.push_back(mlir::getAffineDimExpr(i, context));
    }
    return AffineMap::get(broadcastToShape.size(), 0, outExpr, context);
  }

public:
  LogicalResult
  matchAndRewrite(triton::BroadcastOp op, OpAdaptor adaptor,
                  ConversionPatternRewriter &rewriter) const override {
    auto loc = op.getLoc();

    assert(op->getNumResults() == 1 && "code assumes single result!");
    RankedTensorType sourceType =
        cast<RankedTensorType>(adaptor.getSrc().getType());
    RankedTensorType resultType = cast<RankedTensorType>(op.getType());
    auto elementType = resultType.getElementType();
    size_t resultRank = resultType.getRank();

    SmallVector<AffineMap> indexingMaps;
    indexingMaps.reserve(op->getNumOperands() + op->getNumResults());

    indexingMaps.push_back(getBroadcastAffineMap(
        op->getContext(), sourceType.getShape(), resultType.getShape()));
    indexingMaps.append(op->getNumResults(),
                        rewriter.getMultiDimIdentityMap(resultRank));

    assert(op->getNumResults() == 1 && "code assumes single result!");
    auto init = rewriter.create<tensor::EmptyOp>(loc, resultType.getShape(),
                                                 elementType);

    auto linalgOp = rewriter.create<linalg::GenericOp>(
        loc, op->getResultTypes(), ValueRange{adaptor.getSrc()},
        ValueRange{init}, indexingMaps, getNParallelLoopsAttrs(resultRank),
        [&](OpBuilder &nestedBuilder, Location nestedLoc,
            ValueRange blockArgs) {
          Value opResult = blockArgs[0];
          nestedBuilder.create<linalg::YieldOp>(loc, opResult);
        });

    linalgOp->setAttr("broadcastDims",
                      rewriter.getDenseI64ArrayAttr(
                          getBroadcastDims(sourceType, resultType)));

    rewriter.replaceOp(op, linalgOp->getResults());
    return success();
  }
};

// Data indices are needed by argmin/argmax, not only address metadata.
struct RangeConverter : public OpConversionPattern<triton::MakeRangeOp> {
  using OpConversionPattern<triton::MakeRangeOp>::OpConversionPattern;
  LogicalResult matchAndRewrite(triton::MakeRangeOp op, OpAdaptor,
                                 ConversionPatternRewriter &rewriter) const override {
    auto type = op.getType();
    Value init = rewriter.create<tensor::EmptyOp>(op.getLoc(), type.getShape(), type.getElementType());
    auto generic = rewriter.create<linalg::GenericOp>(
        op.getLoc(), TypeRange{type}, ValueRange{}, ValueRange{init},
        SmallVector<AffineMap>{rewriter.getMultiDimIdentityMap(1)},
        getNParallelLoopsAttrs(1), [&](OpBuilder &builder, Location loc, ValueRange) {
          Value index = builder.create<linalg::IndexOp>(loc, 0);
          Value value = builder.create<arith::IndexCastOp>(loc, type.getElementType(), index);
          if (op.getStart()) {
            Value start = builder.create<arith::ConstantIntOp>(loc, op.getStart(), 32);
            value = builder.create<arith::AddIOp>(loc, value, start);
          }
          builder.create<linalg::YieldOp>(loc, value);
        });
    rewriter.replaceOp(op, generic.getResults());
    return success();
  }
};
struct ExpandConverter : public OpConversionPattern<triton::ExpandDimsOp> {
  using OpConversionPattern<triton::ExpandDimsOp>::OpConversionPattern;
  LogicalResult matchAndRewrite(triton::ExpandDimsOp op, OpAdaptor adaptor,
                                 ConversionPatternRewriter &rewriter) const override {
    auto type = op.getType();
    unsigned rank = type.getRank();
    SmallVector<AffineExpr> exprs;
    for (unsigned i = 0; i < rank; ++i)
      if (i != op.getAxis())
        exprs.push_back(getAffineDimExpr(i, op.getContext()));
    Value init = rewriter.create<tensor::EmptyOp>(op.getLoc(), type.getShape(), type.getElementType());
    auto generic = rewriter.create<linalg::GenericOp>(
        op.getLoc(), TypeRange{type}, ValueRange{adaptor.getSrc()}, ValueRange{init},
        SmallVector<AffineMap>{AffineMap::get(rank, 0, exprs, op.getContext()),
                              rewriter.getMultiDimIdentityMap(rank)},
        getNParallelLoopsAttrs(rank), [&](OpBuilder &builder, Location loc, ValueRange args) {
          builder.create<linalg::YieldOp>(loc, args[0]);
        });
    rewriter.replaceOp(op, generic.getResults());
    return success();
  }
};

struct TransposeConverter : public OpConversionPattern<triton::TransOp> {
  using OpConversionPattern<triton::TransOp>::OpConversionPattern;
  LogicalResult matchAndRewrite(triton::TransOp op, OpAdaptor adaptor,
      ConversionPatternRewriter &rewriter) const override {
    auto type = op.getType();
    unsigned rank = type.getRank();
    SmallVector<AffineExpr> input(rank);
    for (auto [i, axis] : llvm::enumerate(op.getOrder()))
      input[axis] = getAffineDimExpr(i, op.getContext());
    Value init = rewriter.create<tensor::EmptyOp>(op.getLoc(), type.getShape(), type.getElementType());
    auto generic = rewriter.create<linalg::GenericOp>(
        op.getLoc(), TypeRange{type}, ValueRange{adaptor.getSrc()}, ValueRange{init},
        SmallVector<AffineMap>{AffineMap::get(rank, 0, input, op.getContext()),
                              rewriter.getMultiDimIdentityMap(rank)},
        getNParallelLoopsAttrs(rank), [](OpBuilder &builder, Location loc, ValueRange args) {
          builder.create<linalg::YieldOp>(loc, args[0]);
        });
    rewriter.replaceOp(op, generic.getResults());
    return success();
  }
};

struct DotConverter : public OpConversionPattern<triton::DotOp> {
  using OpConversionPattern<triton::DotOp>::OpConversionPattern;

  LogicalResult
  matchAndRewrite(triton::DotOp op, OpAdaptor adaptor,
                  ConversionPatternRewriter &rewriter) const override {
    auto aType = cast<RankedTensorType>(op.getA().getType());
    auto bType = cast<RankedTensorType>(op.getB().getType());
    auto cType = cast<RankedTensorType>(op.getC().getType());
    unsigned rank = aType.getRank();
    if (rank != 2 && rank != 3)
      return rewriter.notifyMatchFailure(op, "only 2D and 3D dot are supported");

    auto a = adaptor.getA();
    auto b = adaptor.getB();
    auto c = adaptor.getC();
    auto asTensor = [&](Value value, RankedTensorType type) -> Value {
      if (isa<RankedTensorType>(value.getType()))
        return value;
      if (auto memrefType = dyn_cast<MemRefType>(value.getType())) {
        if (memrefType.getShape() != type.getShape())
          return nullptr;
        return rewriter.create<bufferization::ToTensorOp>(
            op.getLoc(), type, value, true /* restrict */, true /* writable */);
      }
      return nullptr;
    };

    a = asTensor(a, aType);
    b = asTensor(b, bType);
    c = asTensor(c, cType);
    if (!a || !b || !c)
      return rewriter.notifyMatchFailure(
          op, "dot operands must be ranked tensors or static memrefs");

    MLIRContext *context = op.getContext();
    SmallVector<AffineExpr> aExprs, bExprs, cExprs;
    unsigned loopRank;
    if (rank == 2) {
      loopRank = 3; // M, N, K
      aExprs = {getAffineDimExpr(0, context), getAffineDimExpr(2, context)};
      bExprs = {getAffineDimExpr(2, context), getAffineDimExpr(1, context)};
      cExprs = {getAffineDimExpr(0, context), getAffineDimExpr(1, context)};
    } else {
      loopRank = 4; // B, M, N, K
      aExprs = {getAffineDimExpr(0, context), getAffineDimExpr(1, context),
                getAffineDimExpr(3, context)};
      bExprs = {getAffineDimExpr(0, context), getAffineDimExpr(3, context),
                getAffineDimExpr(2, context)};
      cExprs = {getAffineDimExpr(0, context), getAffineDimExpr(1, context),
                getAffineDimExpr(2, context)};
    }

    SmallVector<AffineMap> indexingMaps = {
        AffineMap::get(loopRank, 0, aExprs, context),
        AffineMap::get(loopRank, 0, bExprs, context),
        AffineMap::get(loopRank, 0, cExprs, context)};
    SmallVector<utils::IteratorType> iteratorTypes(
        loopRank - 1, utils::IteratorType::parallel);
    iteratorTypes.push_back(utils::IteratorType::reduction);

    Type accumulatorType = cType.getElementType();
    if (!isa<FloatType, IntegerType>(accumulatorType))
      return rewriter.notifyMatchFailure(
          op, "dot accumulator must use an integer or floating-point type");
    auto compatible = [&](Type input) {
      return (isa<FloatType>(input) && isa<FloatType>(accumulatorType)) ||
             (isa<IntegerType>(input) && isa<IntegerType>(accumulatorType));
    };
    if (!compatible(aType.getElementType()) || !compatible(bType.getElementType()))
      return rewriter.notifyMatchFailure(op, "dot input/accumulator numeric families must match");
    auto linalgOp = rewriter.create<linalg::GenericOp>(
        op.getLoc(), TypeRange{op->getResult(0).getType()}, ValueRange{a, b},
        ValueRange{c},
        indexingMaps, iteratorTypes,
        [&](OpBuilder &builder, Location loc, ValueRange args) {
          Value lhs = castDotOperand(args[0], accumulatorType, loc, builder);
          Value rhs = castDotOperand(args[1], accumulatorType, loc, builder);
          // Conversions are validated before creating the combiner.

          Value product;
          if (isa<FloatType>(accumulatorType))
            product = builder.create<arith::MulFOp>(loc, lhs, rhs);
          else if (isa<IntegerType>(accumulatorType))
            product = builder.create<arith::MulIOp>(loc, lhs, rhs);

          Value result = args[2];
          if (isa<FloatType>(accumulatorType))
            result = builder.create<arith::AddFOp>(loc, result, product);
          else
            result = builder.create<arith::AddIOp>(loc, result, product);
          builder.create<linalg::YieldOp>(loc, result);
        });

    linalgOp->setAttr("sycl.reduction_axis", rewriter.getI64IntegerAttr(loopRank - 1));
    rewriter.replaceOp(op, linalgOp->getResults());
    return success();
  }
};

struct ReduceConverter : public OpConversionPattern<triton::ReduceOp> {
  using OpConversionPattern<triton::ReduceOp>::OpConversionPattern;

  LogicalResult
  matchAndRewrite(triton::ReduceOp op, OpAdaptor adaptor,
                  ConversionPatternRewriter &rewriter) const override {
    unsigned count = op.getNumOperands();
    if (!count || count != op.getNumResults())
      return rewriter.notifyMatchFailure(op, "reduction needs matching inputs and outputs");
    auto inputType = dyn_cast<RankedTensorType>(op.getSrcs()[0].getType());
    int64_t axis = op.getAxis();
    if (!inputType || !inputType.hasStaticShape() || axis < 0 ||
        axis >= inputType.getRank() || inputType.getDimSize(axis) == 0)
      return rewriter.notifyMatchFailure(op, "reduction requires a nonempty static axis");
    if (!llvm::hasSingleElement(op.getCombineOp()))
      return rewriter.notifyMatchFailure(op, "reduction needs a single combiner block");
    Block &combiner = op.getCombineOp().front();
    auto *terminator = combiner.getTerminator();
    if (combiner.getNumArguments() != 2 * count ||
        terminator->getNumOperands() != count)
      return rewriter.notifyMatchFailure(op, "invalid reduction combiner signature");

    auto loc = op.getLoc();
    unsigned rank = inputType.getRank();
    SmallVector<int64_t> resultShape(inputType.getShape());
    resultShape.erase(resultShape.begin() + axis);
    SmallVector<RankedTensorType> resultTypes;
    SmallVector<Value> inputs, inits;
    // Put parallel dimensions first, reduction last. This also keeps the
    // emitter's work-item distribution outside the serial combiner loop.
    SmallVector<AffineExpr> resultExprs, inputExprs;
    for (unsigned i = 0; i < rank; ++i) {
      unsigned position = i == static_cast<unsigned>(axis) ? rank - 1
                          : i < static_cast<unsigned>(axis) ? i : i - 1;
      inputExprs.push_back(getAffineDimExpr(position, op.getContext()));
      if (i + 1 < rank)
        resultExprs.push_back(getAffineDimExpr(i, op.getContext()));
    }
    AffineMap outputMap = AffineMap::get(rank, 0, resultExprs, op.getContext());
    SmallVector<AffineMap> maps(
        count, AffineMap::get(rank, 0, inputExprs, op.getContext()));
    maps.append(count, outputMap);

    // Independent binary combiners use their real neutral element. Coupled
    // tuple combiners (argmax, etc.) start from the first input tuple: there is
    // no generally inferable identity for an arbitrary user-defined combiner.
    SmallVector<TypedAttr> identities;
    bool seedFirst = false;
    for (unsigned i = 0; i < count; ++i) {
      auto type = dyn_cast<RankedTensorType>(op.getSrcs()[i].getType());
      Type element = getElementTypeOrSelf(op->getResult(i).getType());
      if (!type || type.getShape() != inputType.getShape() ||
          type.getElementType() != element || !element.isIntOrFloat())
        return rewriter.notifyMatchFailure(op, "reduction input/output type mismatch");
      auto resultType = RankedTensorType::get(resultShape, element);
      if (auto declared = dyn_cast<RankedTensorType>(op->getResult(i).getType())) {
        if (declared != resultType)
          return rewriter.notifyMatchFailure(op, "invalid reduction result shape");
      } else if (!resultShape.empty()) {
        return rewriter.notifyMatchFailure(op, "nonscalar reduction needs tensor result");
      }
      resultTypes.push_back(resultType);
      Operation *binary = terminator->getOperand(i).getDefiningOp();
      std::optional<TypedAttr> identity;
      if (binary && binary->getNumOperands() == 2 &&
          ((binary->getOperand(0) == combiner.getArgument(i) &&
            binary->getOperand(1) == combiner.getArgument(count + i)) ||
           (binary->getOperand(1) == combiner.getArgument(i) &&
            binary->getOperand(0) == combiner.getArgument(count + i))))
        identity = arith::getNeutralElement(binary);
      // +/-infinity is not a neutral element for maxnum/minnum on all-NaN
      // inputs. Seed from the first element to preserve NaN results.
      if (binary && isa<arith::MaxNumFOp, arith::MinNumFOp>(binary)) identity.reset();
      identities.push_back(identity ? *identity : TypedAttr{});
      seedFirst |= !identity.has_value();
    }
    for (unsigned i = 0; i < count; ++i) {
      Value input = adaptor.getSrcs()[i];
      if (!isa<RankedTensorType>(input.getType())) {
        auto type = dyn_cast<MemRefType>(input.getType());
        if (!type || type.getShape() != inputType.getShape())
          return rewriter.notifyMatchFailure(op, "reduction input must be tensor or ranked memref");
        input = rewriter.create<bufferization::ToTensorOp>(
            loc, op.getSrcs()[i].getType(), input, true, true);
      }
      inputs.push_back(input);
      Value init = rewriter.create<tensor::EmptyOp>(
          loc, resultShape, resultTypes[i].getElementType());
      Value identity = seedFirst
          ? createZeroValue(resultTypes[i].getElementType(), loc, rewriter)
          : rewriter.create<arith::ConstantOp>(loc, identities[i]).getResult();
      inits.push_back(rewriter.create<linalg::FillOp>(
          loc, ValueRange{identity}, ValueRange{init}).result());
    }
    SmallVector<utils::IteratorType> iterators(rank, utils::IteratorType::parallel);
    iterators.back() = utils::IteratorType::reduction;
    SmallVector<Type> outputTypes(resultTypes.begin(), resultTypes.end());
    auto generic = rewriter.create<linalg::GenericOp>(
        loc, outputTypes, inputs, inits, maps, iterators,
        [&](OpBuilder &builder, Location nestedLoc, ValueRange args) {
          auto combine = [&](OpBuilder &nested) {
            IRMapping mapping;
            for (unsigned i = 0; i < count; ++i) {
              mapping.map(combiner.getArgument(i), args[count + i]);
              mapping.map(combiner.getArgument(count + i), args[i]);
            }
            for (Operation &inner : combiner.without_terminator())
              nested.clone(inner, mapping);
            SmallVector<Value> values;
            for (Value value : terminator->getOperands())
              values.push_back(mapping.lookupOrDefault(value));
            return values;
          };
          SmallVector<Value> values;
          if (seedFirst) {
            Value index = builder.create<linalg::IndexOp>(nestedLoc, rank - 1);
            Value zero = builder.create<arith::ConstantIndexOp>(nestedLoc, 0);
            Value first = builder.create<arith::CmpIOp>(
                nestedLoc, arith::CmpIPredicate::eq, index, zero);
            SmallVector<Type> types;
            for (auto type : resultTypes)
              types.push_back(type.getElementType());
            auto select = builder.create<scf::IfOp>(nestedLoc, types, first, true);
            {
              OpBuilder::InsertionGuard guard(builder);
              builder.setInsertionPointToStart(&select.getThenRegion().front());
              builder.create<scf::YieldOp>(nestedLoc, args.take_front(count));
              builder.setInsertionPointToStart(&select.getElseRegion().front());
              builder.create<scf::YieldOp>(nestedLoc, combine(builder));
            }
            values.append(select.getResults().begin(), select.getResults().end());
          } else {
            values = combine(builder);
          }
          builder.create<linalg::YieldOp>(nestedLoc, values);
        });
    generic->setAttr("sycl.reduction_axis", rewriter.getI64IntegerAttr(rank - 1));
    SmallVector<Value> results;
    for (unsigned i = 0; i < count; ++i) {
      Value result = generic->getResult(i);
      if (!isa<RankedTensorType>(op->getResult(i).getType()))
        result = rewriter.create<tensor::ExtractOp>(loc, result, ValueRange{});
      results.push_back(result);
    }
    rewriter.replaceOp(op, results);
    return success();
  }
};

struct GetProgramIDConverter
    : public OpConversionPattern<triton::GetProgramIdOp> {
  using OpConversionPattern<triton::GetProgramIdOp>::OpConversionPattern;

public:
  LogicalResult
  matchAndRewrite(triton::GetProgramIdOp op, OpAdaptor adaptor,
                  ConversionPatternRewriter &rewriter) const override {
    auto axis = (uint32_t)op.getAxis();
    auto loc = op.getLoc();
    auto i32_ty = rewriter.getIntegerType(32);

    static constexpr mlir::gpu::Dimension dims[] = {mlir::gpu::Dimension::x,
                                                    mlir::gpu::Dimension::y,
                                                    mlir::gpu::Dimension::z};
    // use gpu::GlobalIdOp
    auto globalIdOp = rewriter.create<::mlir::gpu::GlobalIdOp>(loc, dims[axis]);
    auto id = rewriter.create<arith::IndexCastOp>(loc, i32_ty, globalIdOp);
    rewriter.replaceOp(op, id);
    return success();
  }
};

struct DenseConstantConverter : public OpConversionPattern<arith::ConstantOp> {
  using OpConversionPattern<arith::ConstantOp>::OpConversionPattern;
  LogicalResult
  matchAndRewrite(arith::ConstantOp op, OpAdaptor adaptor,
                  ConversionPatternRewriter &rewriter) const override {
    auto attr = cast<DenseElementsAttr>(op.getValue());
    auto loc = op.getLoc();

    auto splatConst = arith::ConstantOp::materialize(
        rewriter, attr.getSplatValue<Attribute>(), attr.getElementType(), loc);

    auto init = rewriter.create<tensor::EmptyOp>(
        loc, cast<RankedTensorType>(op.getResult().getType()).getShape(),
        attr.getElementType());

    rewriter.replaceOpWithNewOp<linalg::FillOp>(op, ValueRange{splatConst},
                                                ValueRange{init});

    return success();
  }
};
