if(NOT TARGET TritonSharedAnalysisSYCL)
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
target_include_directories(TritonSharedAnalysisSYCL PUBLIC
  ${CMAKE_CURRENT_SOURCE_DIR}/../../include
)
endif()
