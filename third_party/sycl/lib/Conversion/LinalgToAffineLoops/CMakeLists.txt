if(NOT TARGET LinalgToAffineLoopsSYCL)
add_triton_library(LinalgToAffineLoopsSYCL
  LinalgToAffineLoops.cpp
  LocalMemoryReuse.cpp
  ElementwiseFusion.cpp
  GroupReduction.cpp
  RegisterAccumulator.cpp
  MatmulRegisterTiling.cpp
  OrderedReductionUnroll.cpp
  AccumulatorInitForwarding.cpp
  WorkDistribution.cpp
  TerminalStoreDistribution.cpp
  CooperativeLoadStaging.cpp
  VectorMemory.cpp

  DEPENDS
  LinalgToAffineLoopsSYCLConversionPassIncGen

  LINK_LIBS PUBLIC
  MLIRPass
  MLIRLinalgTransforms
)
endif()
