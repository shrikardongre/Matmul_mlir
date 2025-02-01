#ifndef LIB_TRANSFORM_ARITH_PASSES_TD_
#define LIB_TRANSFORM_ARITH_PASSES_TD_

include "mlir/Dialect/PDL/IR/PDLDialect.td"
include "mlir/Dialect/PDLInterp/IR/PDLInterpOps.td"
include "mlir/Pass/PassBase.td"

def TilingMatMulPass : Pass<"tiling-matmul"> {
  let summary = "Tile matrix multiplication operations for optimization";
  let description = [{
    This pass tiles matrix multiplication (MatMul) operations to optimize performance,
    enabling better memory usage, parallelism, and hardware acceleration.
  }];
}

def TilingMatMulPassPdll : Pass<"tiling-matmul-pdll"> {
  let summary = "Tile matrix multiplication operations using pdll for optimization";
  let description = [{
    This pass tiles matrix multiplication (MatMul) operations using PDL, enabling 
    optimization for better memory management and parallel execution.
  }];
  let dependentDialects = [
    "mlir::pdl::PDLDialect",
    "mlir::pdl_interp::PDLInterpDialect",
  ];
}

#endif  // LIB_TRANSFORM_ARITH_PASSES_TD_
