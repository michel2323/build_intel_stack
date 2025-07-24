#!/bin/bash

# Repository commit hashes - modify these variables to use different commits
IGC_COMMIT="8044f62975eafe840d09ed00560385dab0bf9854"
OPENCL_CLANG_COMMIT="7eef46576eca117685ae431735c2725ddb889260"  # branch ocl-open-150
SPIRV_LLVM_TRANSLATOR_COMMIT="b3d425c0b265ee9f583894892ae0b0a192a2137c"  # branch llvm_release_150
SPIRV_TOOLS_COMMIT="f289d047f49fb60488301ec62bafab85573668cc"  # tag v2025.1.rc1
SPIRV_HEADERS_COMMIT="0e710677989b4326ac974fd80c5308191ed80965"  # main
VC_INTRINSICS_COMMIT="46286b96fb9eee9fa4fcf8b8ecf74a8c01af4c1a"  # tag v0.23.1
LLVM_PROJECT_COMMIT="8dfdcc7b7bf66834a761bd8de445840ef68e4d1a"  # tag llvmorg-15.0.7
COMPUTE_RUNTIME_COMMIT="d0fdeb0339afaa6db37411e10c41f291945aa727"
LEVEL_ZERO_COMMIT="e3b6efdd91d67bb03024b266094afabd39e213bf"
GMMLIB_COMMIT="246fa363c772d90575357e08900a4431f1374673"

# Repository URLs
IGC_REPO="https://github.com/intel/intel-graphics-compiler.git"
OPENCL_CLANG_REPO="https://github.com/intel/opencl-clang.git"
SPIRV_LLVM_TRANSLATOR_REPO="https://github.com/KhronosGroup/SPIRV-LLVM-Translator.git"
SPIRV_TOOLS_REPO="https://github.com/KhronosGroup/SPIRV-Tools.git"
SPIRV_HEADERS_REPO="https://github.com/KhronosGroup/SPIRV-Headers.git"
VC_INTRINSICS_REPO="https://github.com/intel/vc-intrinsics.git"
LLVM_PROJECT_REPO="https://github.com/llvm/llvm-project.git"
COMPUTE_RUNTIME_REPO="https://github.com/intel/compute-runtime.git"
LEVEL_ZERO_REPO="https://github.com/oneapi-src/level-zero.git"
GMMLIB_REPO="https://github.com/intel/gmmlib.git"

# Function to clone and checkout a specific commit
clone_and_checkout() {
    local repo_url=$1
    local commit_hash=$2
    local repo_name=$3

    echo "Setting up $repo_name..."

    if [ -d "$repo_name" ]; then
        echo "Directory $repo_name already exists. Updating..."
        cd "$repo_name"
        git fetch origin
        git checkout "$commit_hash"
        cd ..
    else
        echo "Cloning $repo_name..."
        git clone "$repo_url" "$repo_name"
        cd "$repo_name"
        git checkout "$commit_hash"
        cd ..
    fi

    echo "✓ $repo_name set to commit $commit_hash"
    echo
}

echo "Intel Graphics Stack Repository Setup"
echo "====================================="
echo

# Clone and checkout all repositories
clone_and_checkout "$IGC_REPO" "$IGC_COMMIT" "intel-graphics-compiler"
clone_and_checkout "$OPENCL_CLANG_REPO" "$OPENCL_CLANG_COMMIT" "opencl-clang"
clone_and_checkout "$SPIRV_LLVM_TRANSLATOR_REPO" "$SPIRV_LLVM_TRANSLATOR_COMMIT" "SPIRV-LLVM-Translator"
clone_and_checkout "$SPIRV_TOOLS_REPO" "$SPIRV_TOOLS_COMMIT" "SPIRV-Tools"
clone_and_checkout "$SPIRV_HEADERS_REPO" "$SPIRV_HEADERS_COMMIT" "SPIRV-Headers"
clone_and_checkout "$VC_INTRINSICS_REPO" "$VC_INTRINSICS_COMMIT" "vc-intrinsics"
clone_and_checkout "$LLVM_PROJECT_REPO" "$LLVM_PROJECT_COMMIT" "llvm-project"
clone_and_checkout "$COMPUTE_RUNTIME_REPO" "$COMPUTE_RUNTIME_COMMIT" "compute-runtime"
clone_and_checkout "$LEVEL_ZERO_REPO" "$LEVEL_ZERO_COMMIT" "level-zero"
clone_and_checkout "$GMMLIB_REPO" "$GMMLIB_COMMIT" "gmmlib"

echo "All repositories have been set up successfully!"
echo "Repository status:"
echo "- intel-graphics-compiler: $IGC_COMMIT"
echo "- opencl-clang: $OPENCL_CLANG_COMMIT (branch ocl-open-150)"
echo "- SPIRV-LLVM-Translator: $SPIRV_LLVM_TRANSLATOR_COMMIT (branch llvm_release_150)"
echo "- SPIRV-Tools: $SPIRV_TOOLS_COMMIT (tag v2025.1.rc1)"
echo "- SPIRV-Headers: $SPIRV_HEADERS_COMMIT (main)"
echo "- vc-intrinsics: $VC_INTRINSICS_COMMIT (tag v0.23.1)"
echo "- llvm-project: $LLVM_PROJECT_COMMIT (tag llvmorg-15.0.7)"
echo "- compute-runtime: $COMPUTE_RUNTIME_COMMIT"
echo "- level-zero: $LEVEL_ZERO_COMMIT"
echo "- gmmlib: $GMMLIB_COMMIT"

sudo apt-get install flex bison libz-dev cmake libc6 libstdc++6 python3-pip python3-mako
git config --global user.name "FirstName LastName"
git config --global user.email "your@email.com"