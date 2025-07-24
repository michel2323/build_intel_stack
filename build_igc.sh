#!/bin/bash

# Set prefix to current working directory (absolute path)
prefix=$(pwd)

# Create links in places where it will get detected by the IGC build system
cp -a opencl-clang llvm-project/llvm/projects/opencl-clang
cp -a SPIRV-LLVM-Translator llvm-project/llvm/projects/llvm-spirv

cd intel-graphics-compiler

CMAKE_FLAGS=()

# Select a build type
CMAKE_FLAGS+=(-DCMAKE_BUILD_TYPE=Debug)

# Install things into $prefix
CMAKE_FLAGS+=(-DCMAKE_INSTALL_PREFIX=${prefix})

# NOTE: igc currently can't cross compile due to a variety of issues:
# - https://github.com/intel/intel-graphics-compiler/issues/131
# - https://github.com/intel/opencl-clang/issues/91
CMAKE_FLAGS+=(-DCMAKE_CROSSCOMPILING:BOOL=OFF)
# Enable GenX IR
CMAKE_FLAGS+=(-DINSTALL_GENX_IR=ON)

# Silence developer warnings
CMAKE_FLAGS+=(-Wno-dev)

cmake -B build -S . -GNinja ${CMAKE_FLAGS[@]}
ninja -C build -j $(nproc) install