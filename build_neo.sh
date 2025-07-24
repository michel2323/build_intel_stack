#!/bin/bash

# Set prefix to current working directory (absolute path)
prefix=$(pwd)

cd compute-runtime

 # revert a change that breaks the cxx03 build
# https://github.com/intel/compute-runtime/issues/708
git revert 18c25e5aa3fc00c7d47469713adeace08a9aec07

# work around compilation failures
# already defined in gmmlib
sed -i '/__stdcall/d' shared/source/gmm_helper/gmm_lib.h
## extend LD_LIBRARY_PATH, don't overwrite it
# find . \( -name CMakeLists.txt -or -name '*.cmake' \) -exec \
#     sed -i 's/LD_LIBRARY_PATH=/LD_LIBRARY_PATH=$ENV{LD_LIBRARY_PATH}:/g' '{}' \;
## NO
sed -i '/-Werror/d' CMakeLists.txt

# Fails because C header is used in C++ code
sed -i 's/inttypes\.h/cinttypes/g' level_zero/core/source/mutable_cmdlist/mutable_indirect_data.cpp

export PATH=${prefix}/bin:$PATH

ln -sf level-zero include/level-zero

CMAKE_FLAGS=()

# Look for headers and libraries in the prefix
CMAKE_FLAGS+=(-DCMAKE_PREFIX_PATH=${prefix})

# Explicitly set library search paths for CMake
CMAKE_FLAGS+=(-DCMAKE_LIBRARY_PATH="${prefix}/lib64:${prefix}/lib")

# Need C++20
CMAKE_FLAGS+=(-DCMAKE_CXX_STANDARD=20)

# Release build for best performance
CMAKE_FLAGS+=(-DCMAKE_BUILD_TYPE="Debug")

# Install things into $prefix
CMAKE_FLAGS+=(-DCMAKE_INSTALL_PREFIX=${prefix})

# NOTE: NEO currently can't cross compile because of its IGC dependency
CMAKE_FLAGS+=(-DCMAKE_CROSSCOMPILING:BOOL=OFF)

# Explicitly use our cmake toolchain file
# CMAKE_FLAGS+=(-DCMAKE_TOOLCHAIN_FILE=${CMAKE_TARGET_TOOLCHAIN})

# Don't run tests
CMAKE_FLAGS+=(-DSKIP_UNIT_TESTS:Bool=true)

# we don't care about cl_intel_va_api_media_sharing
CMAKE_FLAGS+=(-DDISABLE_LIBVA:Bool=true)

# additional hardware support
CMAKE_FLAGS+=(-DNEO_ENABLE_i915_PRELIM_DETECTION=TRUE)

# libigc installs libraries and pkgconfig rules in lib64, so look for them there.
# FIXME: shouldn't BinaryBuilder do this?
export PKG_CONFIG_PATH=${prefix}/lib64/pkgconfig:${prefix}/lib/pkgconfig

# Ensure LD_LIBRARY_PATH includes all necessary paths
export LD_LIBRARY_PATH=${prefix}/lib64:${prefix}/lib:${LD_LIBRARY_PATH}

# Configure cmake with proper library paths
# CMAKE_FLAGS+=(-DCMAKE_BUILD_RPATH="${prefix}/lib64;${prefix}/lib")
# CMAKE_FLAGS+=(-DCMAKE_INSTALL_RPATH="${prefix}/lib64;${prefix}/lib")

# Ensure IGC libraries are found during build
CMAKE_FLAGS+=(-DIGC_DIR="${prefix}")

cmake -B build -S . -GNinja ${CMAKE_FLAGS[@]}

# Run ninja with explicit LD_LIBRARY_PATH to ensure ocloc can find IGC libraries
# LD_LIBRARY_PATH=${prefix}/lib64:${prefix}/lib:${prefix}/compute-runtime/build/bin:${LD_LIBRARY_PATH} ninja -C build -j $(nproc) install
ninja -C build -j $(nproc) install
