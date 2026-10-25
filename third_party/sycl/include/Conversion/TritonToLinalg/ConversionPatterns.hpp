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
    llvm::SmallDenseMap<Value, PtrState> knownPtrs;
    PtrAnalysis::rewriteAddptrOp(op, rewriter, knownPtrs);
    return success();
  }
};

struct LoadConverter : public OpConversionPattern<triton::LoadOp> {
private:
  using OpConversionPattern<triton::LoadOp>::OpConversionPattern;

  void createSideBySideCopies(Value block1, Value block2, Value dst,
                              Location loc,
                              ConversionPatternRewriter &rewriter) const {

    auto zero =
        rewriter.create<arith::ConstantOp>(loc, rewriter.getIndexAttr(0));

    auto one =
        rewriter.create<arith::ConstantOp>(loc, rewriter.getIndexAttr(1));

    Value block1Row = rewriter.create<memref::DimOp>(loc, block1, 0);
    Value block1Col = rewriter.create<memref::DimOp>(loc, block1, 1);

    Value block2Row = rewriter.create<memref::DimOp>(loc, block2, 0);
    Value block2Col = rewriter.create<memref::DimOp>(loc, block2, 1);

    auto block1Dst =
        rewriter.create<memref::SubViewOp>(loc, dst, /* offsets */
                                           ValueRange{zero, zero},
                                           /* sizes */
                                           ValueRange{block1Row, block1Col},
                                           /* strides */
                                           ValueRange{one, one});

    auto block2Dst =
        rewriter.create<memref::SubViewOp>(loc, dst,
                                           /* offsets */
                                           ValueRange{zero, block1Col},
                                           /* sizes */
                                           ValueRange{block2Row, block2Col},
                                           /* strides */
                                           ValueRange{one, one});

    rewriter.create<memref::CopyOp>(loc, block1, block1Dst);
    rewriter.create<memref::CopyOp>(loc, block2, block2Dst);
  }

  void createStackedCopies(Value block1, Value block2, Value dst, Location loc,
                           ConversionPatternRewriter &rewriter) const {

    auto zero =
        rewriter.create<arith::ConstantOp>(loc, rewriter.getIndexAttr(0));
    auto one =
        rewriter.create<arith::ConstantOp>(loc, rewriter.getIndexAttr(1));

    Value block1Row = rewriter.create<memref::DimOp>(loc, block1, 0);
    Value block1Col = rewriter.create<memref::DimOp>(loc, block1, 1);

    Value block2Row = rewriter.create<memref::DimOp>(loc, block2, 0);
    Value block2Col = rewriter.create<memref::DimOp>(loc, block2, 1);

    auto block1Dst =
        rewriter.create<memref::SubViewOp>(loc, dst, /* offsets */
                                           ValueRange{zero, zero},
                                           /* sizes */
                                           ValueRange{block1Row, block1Col},
                                           /* strides */
                                           ValueRange{one, one});

    auto block2Dst =
        rewriter.create<memref::SubViewOp>(loc, dst,
                                           /* offsets */
                                           ValueRange{block1Row, zero},
                                           /* sizes */
                                           ValueRange{block2Row, block2Col},
                                           /* strides */
                                           ValueRange{one, one});

    rewriter.create<memref::CopyOp>(loc, block1, block1Dst);
    rewriter.create<memref::CopyOp>(loc, block2, block2Dst);
  }

public:
  LogicalResult
  matchAndRewrite(triton::LoadOp op, OpAdaptor adaptor,
                  ConversionPatternRewriter &rewriter) const override {
    auto ptr = adaptor.getPtr();
    auto mask = op.getMask();
    auto other = op.getOther();
    auto loc = op.getLoc();

    // 0. Shortcut for scalar loads
    if (!isa<ShapedType>(op.getResult().getType())) {
      auto sMemRef = PtrAnalysis::getScalarMemRef(op.getPtr(), adaptor.getPtr(),
                                                  loc, rewriter);
      auto index =
          rewriter.create<arith::ConstantOp>(loc, rewriter.getIndexAttr(0))
              .getResult();
      auto loadOp = rewriter.create<memref::LoadOp>(loc, sMemRef, index);
      rewriter.replaceOp(op, loadOp.getResult());
      return success();
    }

    // 1. Simple case where no mask is used.
    auto type = dyn_cast<MemRefType>(ptr.getType());
    if (!type) {
      // Seen when implicit broadcasting is done late in a chain of operations.
      // The workaround is to broadcast the pointers early in the address
      // calculation. A proper fix is complicated, but at least we can provide a
      // better error message.
      return rewriter.notifyMatchFailure(
          op, "LoadOp expects a memref, not a memref of pointers");
    }

    auto tensorType =
        RankedTensorType::get(type.getShape(), type.getElementType());
    auto alloc = rewriter.create<memref::AllocOp>(
        loc, MemRefType::get(type.getShape(), type.getElementType()));

    if (!mask) {
      assert(!other && "other value used in non-masked load");
      if (auto unrealizedCast =
              ptr.getDefiningOp<UnrealizedConversionCastOp>()) {
        if (auto wrapType = unrealizedCast->getAttrOfType<StringAttr>(
                ModuloState::WraparoundAttr)) {

          auto memrefs = unrealizedCast.getOperands();
          auto block1 = memrefs[0];
          auto block2 = memrefs[1];

          if (wrapType.getValue() == ModuloState::WraparoundSideBySide) {
            createSideBySideCopies(block1, block2, alloc, loc, rewriter);
          } else if (wrapType.getValue() == ModuloState::WraparoundStacked) {
            createStackedCopies(block1, block2, alloc, loc, rewriter);
          } else {
            llvm_unreachable("unexpected wraparound type");
          }
        } else {
          llvm_unreachable("unexpected unrealized cast op");
        }

      } else {
        rewriter.create<memref::CopyOp>(loc, ptr, alloc);
      }

      Value tensor = rewriter.create<bufferization::ToTensorOp>(
          loc, tensorType, alloc, true /* restrict */, true /* writable */);
      rewriter.replaceOp(op, tensor);

      return success();
    }

    // 2. Continuous masked loads.
    // Analyze the mask operand to determine at runtime the size of the data we
    // are moving.
    MaskState mstate;
    auto isContMask = mstate.parse(mask, loc, rewriter);

    if (isContMask.failed()) {
      return rewriter.notifyMatchFailure(
          op, "Cannot lower continuous masked loads");
    }

    // fill load destination with other value
    if (other) {
      auto scalarOther = getScalarValue(other, loc, rewriter);
      assert(scalarOther && "other value used in masked load produced by "
                            "unsupported instruction");

      // For each dimension check if mstate.dims[i] < shape[i], or-accumulate
      // the result
      auto shape = type.getShape();
      auto accBase =
          rewriter.create<arith::ConstantOp>(loc, rewriter.getBoolAttr(false))
              .getResult();
      for (size_t i = 0; i < type.getShape().size(); i++) {
        auto shapei = rewriter.create<arith::ConstantOp>(
            loc, rewriter.getIndexAttr(shape[i]));

        Value dimi = dyn_cast<Value>(mstate.dims[i]);
        if (!dimi) {
          dimi = rewriter.create<arith::ConstantOp>(
              loc, cast<IntegerAttr>(cast<Attribute>(mstate.dims[i])));
        }

        auto cmpOp = rewriter.create<arith::CmpIOp>(
            loc, arith::CmpIPredicate::slt, dimi, shapei);
        accBase = rewriter.create<arith::OrIOp>(loc, accBase, cmpOp.getResult())
                      .getResult();
      }

      // condition the memset on the or-accumulation
      // initialize with padding prior to CopyOp
      rewriter.create<scf::IfOp>(
          loc, accBase, [&](OpBuilder &builder, Location loc) {
            builder.create<linalg::FillOp>(loc, ValueRange{scalarOther},
                                           ValueRange{alloc});
            builder.create<scf::YieldOp>(loc);
          });
    }

    if (auto unrealizedCast = ptr.getDefiningOp<UnrealizedConversionCastOp>()) {
      if (auto wrapType = unrealizedCast->getAttrOfType<StringAttr>(
              ModuloState::WraparoundAttr)) {

        auto memrefs = unrealizedCast.getOperands();
        auto block1 = memrefs[0];
        auto block2 = memrefs[1];

        if (wrapType.getValue() == ModuloState::WraparoundSideBySide) {
          auto [subview1, subview2] =
              mstate.getSideBySideSubviews(block1, block2, loc, rewriter);

          createSideBySideCopies(subview1, subview2, alloc, loc, rewriter);
        } else if (wrapType.getValue() == ModuloState::WraparoundStacked) {
          auto [subview1, subview2] =
              mstate.getStackedSubviews(block1, block2, loc, rewriter);

          createStackedCopies(subview1, subview2, alloc, loc, rewriter);
        } else {
          llvm_unreachable("unexpected wraparound type");
        }

      } else {
        llvm_unreachable("unexpected unrealized cast op");
      }

    } else {
      memref::SubViewOp srcSubview = mstate.getSubview(ptr, loc, rewriter);
      memref::SubViewOp dstSubview = mstate.getSubview(alloc, loc, rewriter);
      rewriter.create<memref::CopyOp>(loc, srcSubview, dstSubview);
    }

    Value tensor = rewriter.create<bufferization::ToTensorOp>(
        loc, tensorType, alloc, true /* restrict */, true /* writable */);
    rewriter.replaceOp(op, tensor);

    return success();
  }
};

struct StoreConverter : public OpConversionPattern<triton::StoreOp> {
  using OpConversionPattern<triton::StoreOp>::OpConversionPattern;

  LogicalResult
  matchAndRewrite(triton::StoreOp op, OpAdaptor adaptor,
                  ConversionPatternRewriter &rewriter) const override {
    auto ptr = adaptor.getPtr();
    auto val = adaptor.getValue();
    auto mask = op.getMask();
    auto loc = op.getLoc();

    // 0. Shortcut for scalar stores
    if (!isa<ShapedType>(val.getType())) {
      auto sMemRef =
          PtrAnalysis::getScalarMemRef(op.getPtr(), ptr, loc, rewriter);
      auto index =
          rewriter.create<arith::ConstantOp>(loc, rewriter.getIndexAttr(0))
              .getResult();
      rewriter.create<memref::StoreOp>(loc, val, sMemRef, index);
      rewriter.eraseOp(op);
      return success();
    }

    // 1. Simple case where no mask is used.
    if (!mask) {
      auto storeOp = rewriter.create<bufferization::MaterializeInDestinationOp>(
          loc, val, ptr);
      storeOp.setWritable(true);
      rewriter.eraseOp(op);
      return success();
    }

    // 2. Continuous masked stores.
    // Analyze the mask operand to determine at runtime the size of the data we
    // are moving.
    MaskState mstate;
    auto isContMask = mstate.parse(mask, loc, rewriter);

    if (isContMask.failed())
      return failure();

    auto srcSlice = mstate.getExtractSlice(val, loc, rewriter);
    auto dstSubview = mstate.getSubview(ptr, loc, rewriter);

    auto storeOp = rewriter.create<bufferization::MaterializeInDestinationOp>(
        loc, srcSlice, dstSubview);
    storeOp.setWritable(true);
    rewriter.eraseOp(op);

    return success();
  }
};

struct LoopConverter : public OpConversionPattern<scf::ForOp> {
  using OpConversionPattern<scf::ForOp>::OpConversionPattern;

  LogicalResult
  matchAndRewrite(scf::ForOp op, OpAdaptor adaptor,
                  ConversionPatternRewriter &rewriter) const override {
    llvm::SmallDenseMap<Value, PtrState> knownPtrs;
    PtrAnalysis::IndexMapSet
        levelToBlockArgIndex; // level -> set of block arg index to be replaced

    PtrAnalysis::rewriteForOp(op, rewriter, levelToBlockArgIndex, 0, knownPtrs);
    return success();
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
    auto linalgOp = rewriter.create<linalg::GenericOp>(
        op.getLoc(), TypeRange{op->getResult(0).getType()}, ValueRange{a, b},
        ValueRange{c},
        indexingMaps, iteratorTypes,
        [&](OpBuilder &builder, Location loc, ValueRange args) {
          Value lhs = castDotOperand(args[0], accumulatorType, loc, builder);
          Value rhs = castDotOperand(args[1], accumulatorType, loc, builder);
          assert(lhs && rhs && "unsupported dot operand type conversion");

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

    rewriter.replaceOp(op, linalgOp->getResults());
    return success();
  }
};

struct ReduceConverter : public OpConversionPattern<triton::ReduceOp> {
  using OpConversionPattern<triton::ReduceOp>::OpConversionPattern;

  LogicalResult
  matchAndRewrite(triton::ReduceOp op, OpAdaptor adaptor,
                  ConversionPatternRewriter &rewriter) const override {
    if (op.getNumOperands() != 1 || op.getNumResults() != 1)
      return rewriter.notifyMatchFailure(
          op, "only single-input single-output reductions are supported");

    auto inputType = cast<RankedTensorType>(op.getSrcs()[0].getType());
    Type originalResultType = op->getResult(0).getType();
    auto resultType = dyn_cast<RankedTensorType>(originalResultType);
    bool resultIsScalar = !resultType;
    RankedTensorType resultTensorType = resultType;
    if (resultIsScalar)
      resultTensorType = RankedTensorType::get({}, originalResultType);
    int64_t axis = op.getAxis();
    if (axis < 0 || axis >= inputType.getRank() ||
        resultTensorType.getRank() != inputType.getRank() - 1)
      return rewriter.notifyMatchFailure(op, "invalid reduction axis");

    Value input = adaptor.getSrcs()[0];
    if (!isa<RankedTensorType>(input.getType())) {
      auto memrefType = dyn_cast<MemRefType>(input.getType());
      if (!memrefType || memrefType.getShape() != inputType.getShape())
        return rewriter.notifyMatchFailure(
            op, "reduction input must be a ranked tensor or static memref");
      input = rewriter.create<bufferization::ToTensorOp>(
          op.getLoc(), inputType, input, true /* restrict */, true /* writable */);
    }

    SmallVector<AffineExpr> inputExprs;
    SmallVector<AffineExpr> resultExprs;
    for (unsigned i = 0; i < inputType.getRank(); ++i) {
      inputExprs.push_back(getAffineDimExpr(i, op.getContext()));
      if (i != static_cast<unsigned>(axis))
        resultExprs.push_back(getAffineDimExpr(
            resultExprs.size(), op.getContext()));
    }

    unsigned rank = inputType.getRank();
    SmallVector<utils::IteratorType> iteratorTypes(
        rank, utils::IteratorType::parallel);
    iteratorTypes[axis] = utils::IteratorType::reduction;
    auto init = rewriter.create<tensor::EmptyOp>(
        op.getLoc(), resultTensorType.getShape(),
        resultTensorType.getElementType());
    Value zero = createZeroValue(resultTensorType.getElementType(), op.getLoc(),
                                 rewriter);
    if (!zero)
      return rewriter.notifyMatchFailure(op, "unsupported reduction element type");
    auto filled = rewriter.create<linalg::FillOp>(
        op.getLoc(), ValueRange{zero}, ValueRange{init});

    auto linalgOp = rewriter.create<linalg::GenericOp>(
        op.getLoc(), TypeRange{resultTensorType}, ValueRange{input},
        ValueRange{filled.result()},
        SmallVector<AffineMap>{
            AffineMap::get(rank, 0, inputExprs, op.getContext()),
            AffineMap::get(rank, 0, resultExprs, op.getContext())},
        iteratorTypes,
        [&](OpBuilder &builder, Location loc, ValueRange args) {
          Block &combiner = op.getCombineOp().front();
          IRMapping mapping;
          mapping.map(combiner.getArgument(0), args[1]);
          mapping.map(combiner.getArgument(1), args[0]);
          for (Operation &inner : combiner.without_terminator())
            builder.clone(inner, mapping);

          auto *terminator = combiner.getTerminator();
          if (terminator->getNumOperands() != 1)
            return;
          Value result = mapping.lookupOrDefault(terminator->getOperand(0));
          builder.create<linalg::YieldOp>(loc, result);
        });

    if (resultIsScalar) {
      auto scalar = rewriter.create<tensor::ExtractOp>(
          op.getLoc(), linalgOp->getResult(0), ValueRange{});
      rewriter.replaceOp(op, scalar.getResult());
    } else {
      rewriter.replaceOp(op, linalgOp->getResults());
    }
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
