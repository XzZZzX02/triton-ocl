add_triton_library(TritonSharedAnalysisSYCL
  MaskAnalysis.cpp
  OpFoldResultUtils.cpp
  PtrAnalysis.cpp
  UseAnalysis.cpp

  DEPENDS
  TritonTableGen

  LINK_LIBS PUBLIC
  MLIRAnalysis
)
