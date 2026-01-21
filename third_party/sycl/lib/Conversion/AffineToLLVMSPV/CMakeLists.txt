add_triton_library(AffineToLLVMSYCL
  AffineToLLVMSPV.cpp

  DEPENDS
  AffineToLLVMSYCLConversionPassIncGen

  LINK_LIBS PUBLIC
  MLIRPass
)
