MLIR - DSL;

Proposed code structure: 
```mermaid
graph TD;
    A[matmul-dialect] --> B[WORKSPACE];
    A --> C[BUILD];
    A --> D[include/];
    D --> E[matmul/];
    E --> F[MatmulOps.td];
    E --> G[MatmulDialect.h];
    E --> H[MatmulOps.h];
    E --> I[MatmulPasses.h];
    D --> J[Passes/];
    J --> K[Passes.h];
    A --> L[lib/];
    L --> M[matmul/];
    M --> N[MatmulDialect.cpp];
    M --> O[MatmulOps.cpp];
    M --> P[MatmulPasses.cpp];
    A --> Q[test/];
    Q --> R[matmul/];
    R --> S[dialect.mlir];
    R --> T[passes.mlir];
    R --> U[codegen.mlir];
    A --> V[tools/];
    V --> W[matmul-translate/];
    W --> X[MatmulParser.cpp];
    W --> Y[MatmulPrinter.cpp];
    W --> Z[BUILD];
    A --> AA[bazel/];
    AA --> AB[BUILD.tpl];
    A --> AC[third_party/];
    AC --> AD[mlir/];
    AD --> AE[BUILD];
