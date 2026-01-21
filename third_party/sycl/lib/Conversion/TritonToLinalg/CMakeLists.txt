add_triton_library(TritonToLinalgSYCL
  TritonToLinalg.cpp

  DEPENDS
  TritonToLinalgSYCLConversionPassIncGen

  LINK_LIBS PUBLIC
  MLIRPass
  MLIRLinalgTransforms
  TritonSharedAnalysisSYCL
)
