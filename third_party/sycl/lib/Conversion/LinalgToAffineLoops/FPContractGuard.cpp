#include "sycl/include/Conversion/LinalgToAffineLoops/Passes.h"
#include "mlir/Dialect/Arith/IR/Arith.h"
#include "mlir/IR/BuiltinOps.h"
#include "llvm/ADT/APFloat.h"
#include "llvm/ADT/STLExtras.h"

using namespace mlir;
namespace {
constexpr StringLiteral guard = "sycl.fp_contract_off";

// A widened product is exact when both its significand and full exponent
// range fit the destination. Require even the smallest source-subnormal
// product to be normal there: no underflow or intermediate rounding is lost.
// This proves, for example, binary16 x binary16 -> binary32 and binary32 x
// binary32 -> binary64. It does not prove bfloat16 x bfloat16 -> binary32.
static FloatType narrowSource(Value value) {
  while (auto extend = value.getDefiningOp<arith::ExtFOp>())
    value = extend.getIn();
  return dyn_cast<FloatType>(value.getType());
}
static bool exactProduct(arith::MulFOp multiply) {
  auto destination = dyn_cast<FloatType>(multiply.getType());
  auto lhs = narrowSource(multiply.getLhs());
  auto rhs = narrowSource(multiply.getRhs());
  if (!destination || !lhs || !rhs)
    return false;
  const auto &a = lhs.getFloatSemantics();
  const auto &b = rhs.getFloatSemantics();
  const auto &d = destination.getFloatSemantics();
  int pa = llvm::APFloat::semanticsPrecision(a);
  int pb = llvm::APFloat::semanticsPrecision(b);
  int pd = llvm::APFloat::semanticsPrecision(d);
  int smallestA = llvm::APFloat::semanticsMinExponent(a) - pa + 1;
  int smallestB = llvm::APFloat::semanticsMinExponent(b) - pb + 1;
  return pa + pb <= pd &&
         smallestA + smallestB >= llvm::APFloat::semanticsMinExponent(d) &&
         llvm::APFloat::semanticsMaxExponent(a) +
                 llvm::APFloat::semanticsMaxExponent(b) + 1 <=
             llvm::APFloat::semanticsMaxExponent(d);
}
static bool permitsContract(Operation *op) {
  auto flags = op->getAttrOfType<arith::FastMathFlagsAttr>("fastmath");
  return flags && (static_cast<uint32_t>(flags.getValue()) &
                   static_cast<uint32_t>(arith::FastMathFlags::contract));
}

struct FPContractGuardPass
    : PassWrapper<FPContractGuardPass, OperationPass<ModuleOp>> {
  MLIR_DEFINE_EXPLICIT_INTERNAL_INLINE_TYPE_ID(FPContractGuardPass)
  StringRef getArgument() const final { return "sycl-fp-contract-guard"; }
  StringRef getDescription() const final {
    return "Preserve rounding of ordinary scalar products through SYCL C++ compilation";
  }
  void runOnOperation() override {
    getOperation().walk([&](arith::MulFOp multiply) {
      multiply->removeAttr(guard);
      auto type = dyn_cast<FloatType>(multiply.getType());
      // Software low-precision operators materialize storage rounding
      // themselves; the implicit native FMA hazard concerns float/double.
      if (!type || (!type.isF32() && !type.isF64()) ||
          exactProduct(multiply))
        return;
      // An explicitly permitted direct contraction can remain available.
      // Memory/call/unknown users are not an authorization to fuse a later
      // read with an unmarked addition.
      if (permitsContract(multiply) && !multiply.getResult().use_empty() &&
          llvm::all_of(multiply.getResult().getUsers(), [](Operation *user) {
            return isa<arith::AddFOp, arith::SubFOp>(user) &&
                   permitsContract(user);
          }))
        return;
      multiply->setAttr(guard, UnitAttr::get(&getContext()));
    });
  }
};
} // namespace
namespace mlir::triton::sycl {
std::unique_ptr<OperationPass<ModuleOp>> createFPContractGuardPass() {
  return std::make_unique<FPContractGuardPass>();
}
} // namespace mlir::triton::sycl
