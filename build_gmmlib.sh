#!/bin/bash

# Set prefix to current working directory (absolute path)
prefix=$(pwd)

cd gmmlib

CMAKE_FLAGS=()

# Release build for best performance
# https://github.com/intel/gmmlib/issues/70
CMAKE_FLAGS+=(-DBUILD_TYPE=Release)

# Install things into $prefix
CMAKE_FLAGS+=(-DCMAKE_INSTALL_PREFIX=${prefix})

# Explicitly use our cmake toolchain file and tell CMake we're cross-compiling
CMAKE_FLAGS+=(-DCMAKE_TOOLCHAIN_FILE=${CMAKE_TARGET_TOOLCHAIN})
CMAKE_FLAGS+=(-DCMAKE_CROSSCOMPILING:BOOL=ON)

# Don't run tests
CMAKE_FLAGS+=(-DRUN_TEST_SUITE:Bool=OFF)

cmake -B build -S . -GNinja ${CMAKE_FLAGS[@]}
ninja -C build -j $(nproc) install