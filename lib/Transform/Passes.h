#ifndef LIB_TRANSFORM_ARITH_PASSES_H_
#define LIB_TRANSFORM_ARITH_PASSES_H_

#include "lib/Transform/Tiling/MatmulTiling.h"


namespace mlir {
namespace tutorial {

#define GEN_PASS_REGISTRATION
#include "lib/Transform/Tiling/Passes.h.inc"

}  // namespace tutorial
}  // namespace mlir

#endif  // LIB_TRANSFORM_ARITH_PASSES_H_