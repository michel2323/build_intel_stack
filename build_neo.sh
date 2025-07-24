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

CMAKE_FLAGS=()

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
export PATH=${prefix}/bin:$PATH
export LD_LIBRARY_PATH=${prefix}/lib64:${prefix}/lib
export PKG_CONFIG_PATH=${prefix}/lib64/pkgconfig:${prefix}/lib/pkgconfig

cmake -B build -S . -GNinja ${CMAKE_FLAGS[@]}
ninja -C build -j $(nproc) install
