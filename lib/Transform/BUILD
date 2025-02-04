load("@llvm-project//mlir:tblgen.bzl" , "gentbl_cc_library")


package(
    default_visibility =["//visibility:public"],

)

gentbl_cc_library(
	name = "pass_inc_gen",
	tbl_outs = [
		(
			[
		"-gen-passa-decls", // to generate declarations for MLIR passes 
		"-name=Tiling", // sepcifies the name of passes being generated 
      ],
		

	  "Passes.h.inc", // the o/p c++ file containing the passs declarations 

		),
		(
			["-gen-pass-doc"], // to generate documaentationfor the passes 
			"TilingPasses.md",// o/p file

		),
	],
	tblgen = "@llvm-project/mlir:mlir-tblgen",
	td_file = "Passes.td", // this contains the schema / defns that specify how the pass should behave.
	deps =[
		"@llvm-project//mlir:OpBaseTdFiles",
		"@llvm-project//mlir:PassBaseTdFiles",

	],


)

cc_library(
	name = "MatmulTiling.cpp",
	srcs =["MatMulTiling.cpp"],
	hdrs =[
		"MatmulTiling.h",
		"Passes.h",

	],

	deps =[
		"@llvm-project//mlir:LinalgDialect", // the dependencies are extracted for tiling from linalg dialect of mlir
		"@llvm-project//mlir:LinalgUtils",
		"@llvm-project//mlir:Tensor",
		"@llvm-project//mlir:Pass",
		"@llvm-project//mlir:Tramsforms",
	],

)

cc_library(
	name="Passes",
	hdrs=["Passes.h"],
	deps =[
		":LinalgTiling",
		"pass_inc_gen",
	],
)


