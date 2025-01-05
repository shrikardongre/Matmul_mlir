MLIR - DSL;

Proposed code structure: 


matmul-dialect/
├── WORKSPACE                # Bazel workspace file
├── BUILD                    # Bazel build file for the root
├── include/                 # Headers for dialect, passes, and utilities
│   ├── matmul/
│   │   ├── MatmulOps.td     # TableGen definitions for the matmul dialect
│   │   ├── MatmulDialect.h  # Header for the matmul dialect
│   │   ├── MatmulOps.h      # Header for operations in the matmul dialect
│   │   └── MatmulPasses.h   # Header for matmul-specific MLIR passes
│   ├── Passes/
│   │   └── Passes.h         # Shared header for all passes
├── lib/                     # Implementation files
│   ├── matmul/
│   │   ├── MatmulDialect.cpp # Implementation of the matmul dialect
│   │   ├── MatmulOps.cpp    # Implementation of matmul operations
│   │   └── MatmulPasses.cpp # Implementation of matmul-specific passes
├── test/                    # Test cases for dialect, passes, and tools
│   ├── matmul/
│   │   ├── dialect.mlir     # Test cases for the matmul dialect
│   │   ├── passes.mlir      # Test cases for matmul-specific passes
│   │   └── codegen.mlir     # Test cases for matmul lowering/codegen
├── tools/                   # Tools for custom syntax parsing and conversion
│   ├── matmul-translate/
│   │   ├── MatmulParser.cpp # Custom syntax parser
│   │   ├── MatmulPrinter.cpp # Printer for custom syntax
│   │   └── BUILD            # Bazel build file for the tools
├── bazel/
│   └── BUILD.tpl            # Template for shared Bazel rules
└── third_party/
    └── mlir/                # External MLIR dependencies for Bazel
        ├── BUILD            # Bazel build file for MLIR
