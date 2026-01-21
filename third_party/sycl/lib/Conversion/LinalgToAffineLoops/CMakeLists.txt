add_triton_library(LinalgToAffineLoopsSYCL
  LinalgToAffineLoops.cpp

  DEPENDS
  LinalgToAffineLoopsSYCLConversionPassIncGen

  LINK_LIBS PUBLIC
  MLIRPass
  MLIRLinalgTransforms
)
