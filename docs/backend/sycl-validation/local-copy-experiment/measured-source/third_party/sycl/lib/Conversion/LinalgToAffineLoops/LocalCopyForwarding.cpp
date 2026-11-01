#include "sycl/include/Conversion/LinalgToAffineLoops/Passes.h"
#include "mlir/Dialect/Affine/IR/AffineOps.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/Dialect/MemRef/IR/MemRef.h"
#include "mlir/IR/BuiltinOps.h"
#include "llvm/ADT/STLExtras.h"
#include <optional>

using namespace mlir;
namespace {
static bool defaultAccess(Operation *op) {
  for (NamedAttribute attr : op->getAttrs()) {
    if (attr.getName().strref() == "map" && isa<AffineMapAttr>(attr.getValue()))
      continue;
    if (attr.getName().strref() == "sycl.scalar_half_bits" &&
        isa<UnitAttr>(attr.getValue()))
      continue;
    if (attr.getName().strref() == "nontemporal") {
      auto flag = dyn_cast<BoolAttr>(attr.getValue());
      if (flag && !flag.getValue()) continue;
    }
    return false;
  }
  return true;
}

static Operation *phase(Operation *op, Block *body) {
  while (op && op->getBlock() != body) op = op->getParentOp();
  return op;
}

// Only full permutations are accepted: one bijective source and destination
// coordinate per loop IV. No guessed equalities, address arithmetic or slices.
static std::optional<SmallVector<unsigned>>
permutation(ValueRange indices, ArrayRef<affine::AffineForOp> loops) {
  if (indices.size() != loops.size()) return std::nullopt;
  SmallVector<unsigned> result;
  for (Value value : indices) {
    auto found = llvm::find_if(loops, [&](auto loop) {
      return affine::AffineForOp(loop).getInductionVar() == value;
    });
    if (found == loops.end()) return std::nullopt;
    unsigned index = found - loops.begin();
    if (llvm::is_contained(result, index)) return std::nullopt;
    result.push_back(index);
  }
  return result;
}

static bool forwardCopy(affine::AffineForOp root) {
  auto function = dyn_cast<func::FuncOp>(root->getParentOp());
  if (!function) return false;
  SmallVector<affine::AffineForOp> loops;
  auto current = root;
  while (current) {
    if (loops.size() == 3 || !current.hasConstantBounds() ||
        current.getConstantLowerBound() || current.getStep() != 1 ||
        current.getConstantUpperBound() <= 0 || current.getNumResults() ||
        current->hasAttr("sycl.reduction"))
      return false;
    loops.push_back(current);
    auto &ops = current.getBody()->getOperations();
    if (ops.size() != 2 || !isa<affine::AffineForOp>(ops.front())) break;
    current = cast<affine::AffineForOp>(ops.front());
  }
  auto &ops = loops.back().getBody()->getOperations();
  if (ops.size() != 3) return false;
  auto load = dyn_cast<affine::AffineLoadOp>(ops.front());
  auto store = dyn_cast<affine::AffineStoreOp>(*std::next(ops.begin()));
  if (!load || !store || !load.getResult().hasOneUse() ||
      store.getValueToStore() != load.getResult() ||
      !load.getAffineMap().isIdentity() || !store.getAffineMap().isIdentity() ||
      !defaultAccess(load) || !defaultAccess(store))
    return false;
  auto src = load.getMemRef().getDefiningOp<memref::AllocOp>();
  auto dst = store.getMemRef().getDefiningOp<memref::AllocOp>();
  if (!src || !dst || src == dst ||
      src->getBlock() != root->getBlock() || dst->getBlock() != root->getBlock() ||
      !src->isBeforeInBlock(root) || !dst->isBeforeInBlock(root) ||
      src->hasAttr("sycl.thread_private") || dst->hasAttr("sycl.thread_private"))
    return false;
  auto a = src.getType(), b = dst.getType();
  if (!a.hasStaticShape() || !b.hasStaticShape() ||
      !a.getLayout().isIdentity() || !b.getLayout().isIdentity() ||
      a.getElementType() != b.getElementType() ||
      a.getMemorySpace() != b.getMemorySpace() ||
      a.getRank() != int64_t(loops.size()) || b.getRank() != a.getRank())
    return false;
  auto in = permutation(load.getMapOperands(), loops);
  auto out = permutation(store.getMapOperands(), loops);
  if (!in || !out) return false;
  SmallVector<unsigned> remap;
  for (unsigned i = 0; i < loops.size(); ++i) {
    if (a.getDimSize(i) != loops[(*in)[i]].getConstantUpperBound() ||
        b.getDimSize(i) != loops[(*out)[i]].getConstantUpperBound())
      return false;
    remap.push_back(llvm::find(*out, (*in)[i]) - out->begin());
  }
  auto *body = &function.front();
  SmallVector<Operation *> readers, deallocations;
  Operation *last = root;
  for (Operation *user : dst.getResult().getUsers()) {
    if (user == store.getOperation()) continue;
    auto *top = phase(user, body);
    if (!top || top == root || !root->isBeforeInBlock(top)) return false;
    if (isa<memref::DeallocOp>(user)) {
      if (top != user) return false;
      deallocations.push_back(user);
      continue;
    }
    if (!isa<memref::LoadOp, affine::AffineLoadOp>(user) || !defaultAccess(user))
      return false;
    if (!isa<affine::AffineForOp>(top)) return false;
    readers.push_back(user);
    if (last->isBeforeInBlock(top)) last = top;
  }
  if (readers.empty()) return false;
  for (Operation *user : src.getResult().getUsers()) {
    auto *top = phase(user, body);
    if (!top || !isa<memref::LoadOp, affine::AffineLoadOp, memref::StoreOp,
                     affine::AffineStoreOp, memref::DeallocOp>(user))
      return false; // No escaping aliases/calls may mutate the source.
    if (isa<memref::StoreOp, affine::AffineStoreOp, memref::DeallocOp>(user)) {
      if (top == root || (root->isBeforeInBlock(top) &&
                         (top == last || top->isBeforeInBlock(last))))
        return false; // Preserve the snapshot through every forwarded use.
      // Prior source writes must complete a top-level affine phase: its SYCL
      // emission has the work-group local barrier required by later readers.
      if (top->isBeforeInBlock(root) &&
          !isa<affine::AffineForOp>(top))
        return false;
    }
  }
  for (Operation *reader : readers) {
    OpBuilder builder(reader);
    Value replacement;
    if (auto read = dyn_cast<memref::LoadOp>(reader)) {
      SmallVector<Value> indices;
      for (unsigned dim : remap) indices.push_back(read.getIndices()[dim]);
      replacement = builder.create<memref::LoadOp>(reader->getLoc(), src, indices);
    } else {
      auto affineRead = cast<affine::AffineLoadOp>(reader);
      SmallVector<AffineExpr> expressions;
      for (unsigned dim : remap)
        expressions.push_back(affineRead.getAffineMap().getResult(dim));
      auto map = AffineMap::get(affineRead.getAffineMap().getNumDims(),
                               affineRead.getAffineMap().getNumSymbols(), expressions,
                               reader->getContext());
      replacement = builder.create<affine::AffineLoadOp>(
          reader->getLoc(), src, map, affineRead.getMapOperands());
    }
    reader->getResult(0).replaceAllUsesWith(replacement);
    reader->erase();
  }
  root.erase();
  for (auto *op : deallocations) op->erase();
  dst.erase();
  auto prior = function->getAttrOfType<IntegerAttr>("sycl.local_copies_forwarded");
  function->setAttr("sycl.local_copies_forwarded",
      IntegerAttr::get(IntegerType::get(function.getContext(),64),
                       (prior ? prior.getInt() : 0)+1));
  return true;
}

struct LocalCopyForwardingPass
    : PassWrapper<LocalCopyForwardingPass, OperationPass<ModuleOp>> {
  MLIR_DEFINE_EXPLICIT_INTERNAL_INLINE_TYPE_ID(LocalCopyForwardingPass)
  StringRef getArgument() const final { return "sycl-local-copy-forwarding"; }
  StringRef getDescription() const final {
    return "Forward complete immutable local buffer permutations into readers";
  }
  void runOnOperation() override {
    // Process top-level phases in order, so chains of copies can collapse.
    for (auto function : getOperation().getOps<func::FuncOp>())
      if (!function.empty())
        for (Operation &op : llvm::make_early_inc_range(function.front()))
          if (auto root = dyn_cast<affine::AffineForOp>(&op))
            forwardCopy(root);
  }
};
} // namespace

std::unique_ptr<OperationPass<ModuleOp>>
mlir::triton::sycl::createLocalCopyForwardingPass() {
  return std::make_unique<LocalCopyForwardingPass>();
}
