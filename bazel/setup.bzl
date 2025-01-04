

load("@llvm-raw//utils/bazel:configure.bzl", "llvm_configure")

# The subset of LLVM backend targets that should be compiled
_LLVM_TARGETS = [
    "X86",
    "NVPTX", #If we choose only x86 as backend targets. The bazel overlay will only define targets if x86 dependancies are present.
     
     # including the NVPTX backend explicitly as a target, even if it increases the cold-start build time, 
    # is a practical approach to ensure the GPU backend is defined and functional. This trade-off avoids potential configuration issues 
     # or incomplete builds during runtime,reducing overall development friction despite the slightly longer initial build process.
     
]

def setup_llvm(name):
    """Build @llvm-project from @llvm-raw using the upstream bazel overlays."""
    llvm_configure(
        name = name,
        targets = _LLVM_TARGETS,
    )