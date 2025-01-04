""" To import llvm """

load(
    "@bazel_tools//tools/build_defs/repo:git.bzl",
    "new_git_repository",
)

def import_llvm(name):
    """Imports LLVM."""

    
    LLVM_COMMIT = "cd5fcea6d4c70a7328ca9538c9098d9f5af69682"

    new_git_repository(
        name = name,
        # Build file is empty because llvm contains the bazel overlays.
        build_file_content = "# empty",
        commit = LLVM_COMMIT,
        init_submodules = False,
        remote = "https://github.com/llvm/llvm-project.git",
    )