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
      Value value;
      if (adaptor.getMask()) {
        auto guarded = rewriter.create<scf::IfOp>(loc, TypeRange{op.getType()}, adaptor.getMask(), true);
        {
          OpBuilder::InsertionGuard guard(rewriter);
          rewriter.setInsertionPointToStart(&guarded.getThenRegion().front());
          Value loaded = rewriter.create<memref::LoadOp>(loc, sMemRef, index);
          rewriter.create<scf::YieldOp>(loc, loaded);
          rewriter.setInsertionPointToStart(&guarded.getElseRegion().front());
          Value other = adaptor.getOther();
          if (!other)
            other = rewriter.create<arith::ConstantOp>(loc, rewriter.getZeroAttr(op.getType()));
          rewriter.create<scf::YieldOp>(loc, other);
        }
        value = guarded.getResult(0);
      } else {
        value = rewriter.create<memref::LoadOp>(loc, sMemRef, index);
      }
      rewriter.replaceOp(op, value);
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
      if (adaptor.getMask()) {
        rewriter.create<scf::IfOp>(loc, adaptor.getMask(), [&](OpBuilder &builder, Location here) {
          builder.create<memref::StoreOp>(here, val, sMemRef, index);
          builder.create<scf::YieldOp>(here);
        });
      } else {
        rewriter.create<memref::StoreOp>(loc, val, sMemRef, index);
      }
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
