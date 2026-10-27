if(NOT TARGET LinalgToAffineLoopsSYCL)
add_triton_library(LinalgToAffineLoopsSYCL
  LinalgToAffineLoops.cpp
  LocalMemoryReuse.cpp
  ElementwiseFusion.cpp

  DEPENDS
  LinalgToAffineLoopsSYCLConversionPassIncGen

  LINK_LIBS PUBLIC
  MLIRPass
  MLIRLinalgTransforms
)
endif()
