#ifndef MATMUL_DIALECT_H // if not defined , ye MATMUL_DIALECT_H Wale symbol ko include kardeta hain from the below line , nhi to skip karta hain
#define MATMUL_DIALECT_H // ye define kardeta hain 

#include "mlir/IR/Dialect.h" // this class allows us to use define custom dialects in mlir , to represent different ops
#include "mlir/IR/Operation.h" // to define custom operations in mlir , ye help karega "matx" ko operation banane mein
#include "mlir/IR/Type.h" // to define type of arg and return 
#include "MatmulOps.h" // ye tablegen se ayega ... 


namespace mlir {

    // declaration of matmuldialect class , subclass of dialect || abhi matmul ne sare properties inherit karli mlir/dialect ke
class MatmulDialect : public Dialect {
    public:
    explicit MatmulDialect(MLIRContext *context); // The constructor is used to initialize the MatmulDialect and associate it with the MLIRContext (kuch toh hain mlir system mein). This is the step where your custom dialect is "introduced" into the MLIR system.

    // This method registers operations for the dialect
  static StringRef getDialectNamespace() { return "Matmul"; } // iske saare ops matmul:: se start honge apne code mein

  // Method to parse operations
  void initialize() override;
};

}

#endif 
