get_property(dialect_libs GLOBAL PROPERTY MLIR_DIALECT_LIBS)
get_property(conversion_libs GLOBAL PROPERTY MLIR_CONVERSION_LIBS)

add_llvm_executable(triton-sycl-opt spirv-opt.cpp PARTIAL_SOURCES_INTENDED)

llvm_update_compile_flags(triton-sycl-opt)
target_link_libraries(triton-sycl-opt PRIVATE
  TritonTransforms
  AffineToLLVMSPV
  LinalgToAffineLoops
  TritonToLinalg
  ${dialect_libs}
  ${conversion_libs}
  # MLIR core
  MLIROptLib
  MLIRPass
  MLIRTransforms
)

mlir_check_all_link_libraries(triton-sycl-opt)
