#ifndef LIB_TRANSFORM_LINALG_CUSTOMMATMULTILING_H_
#define LIB_TRANSFORM_LINALG_CUSTOMMATMULTILING_H_

#include "mlir/Pass/Pass.h"

namespace mlir {
namespace matmul_tiling {

#define GEN_PASS_DECL_CUSTOMMATMULTILING
#include "lib/Transform/Linalg/Passes.h.inc"

}  // namespace matmul_tiling
}  // namespace mlir

#endif  // LIB_TRANSFORM_LINALG_CUSTOMMATMULTILING_H_