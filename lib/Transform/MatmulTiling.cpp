// To determine and initialise the Linalg Tiling Pass.

#include "mlir/Dialect/Affine/IR/AffineOps.h"
#include "mlir/Dialect/Affine/LoopUtils.h"
#include "mlir/Dialect/Arith/Utils/Utils.h"
#include "mlir/Dialect/ControlFlow/IR/ControlFlowOps.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/Dialect/Linalg/IR/Linalg.h"
#include "mlir/Dialect/Linalg/Passes.h"
#include "mlir/Dialect/Linalg/Transforms/Transforms.h"

namespace mlir {
namespace matlmul {
#define GEN_PASS_DEF_LINALGTILINGPASS
#include "mlir/Dialect/Linalg/Passes.h.inc"

using namespace mlir using namespace mlir::linalg

    //---logic for the pass to be implemented
    struct LinalgTilingPass
    : public impl::LinalgTilingPassBase<LinalgTilingPass> {
  void runOnOperation() override {
    // Get the current function being processed
    func::FuncOp funcOp = getOperation();
    MLIRContext *context = &getContext();

    // Walk over all `linalg.matmul` ops in the function
    funcOp.walk([&](linalg::MatmulOp matmulOp) {
      // Define tile sizes (M, N, K)
      SmallVector<int64_t, 3> tileSizes = {32, 32, 32};

      // Set up tiling options
      linalg::LinalgTilingOptions tilingOptions;
      tilingOptions.setTileSizes(tileSizes);

      // Apply tiling transformation
      FailureOr<linalg::TiledLinalgOp> tiledOp =
          linalg::tileLinalgOp(matmulOp, tilingOptions);
      if (failed(tiledOp)) {
        matmulOp.emitError("Matmul tiling failed.");
        signalPassFailure();
      }
    });
  }
};
} // namespace matlmul

/// Register the pass in MLIR
std::unique_ptr<Pass> createLinalgTilingPass() {
  return std::make_unique<LinalgTilingPass>();
}

} // namespace mlir
  // namespace mlir
