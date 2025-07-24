# Building the Intel stack for Julia

This repository provides scripts to build the Intel Graphics Compiler (IGC), gmmlib, and NEO for use with Julia's Yggdrasil build system. It includes undocumented fixes for building on Ubuntu 22.04 and 25.04.


* Downloading all the sources and dependencies listed in IGC release [2.14.1](https://github.com/intel/compute-runtime/releases/tag/2.14.1)
```bash
./setup.sh
```
* Building the Intel Graphics Compiler (IGC)
```bash
./build_igc.sh
```

* Building gmmlib
```bash
./build_gmmlib.sh
```

* Building NEO
```bash
./build_neo.sh
```

## Failure tested on Ubuntu 22.04, 25.04, and Julia's Yggdrasil buildsystem

Error message:

<details>
<summary>Click to expand error output</summary>

```
-- The C compiler identification is GNU 14.2.0
-- The CXX compiler identification is GNU 14.2.0
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Check for working C compiler: /usr/bin/cc - skipped
-- Detecting C compile features
-- Detecting C compile features - done
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Check for working CXX compiler: /usr/bin/c++ - skipped
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- branch dir list: /
-- Host processor: x86_64
-- Target processor: x86_64
-- Neo target processor: x86_64
-- Disabling LTO because compiler is GNU v14.2.0
-- Performing Test COMPILER_SUPPORTS_LLD
-- Performing Test COMPILER_SUPPORTS_LLD - Success
-- Performing Test COMPILER_SUPPORTS_GOLD
-- Performing Test COMPILER_SUPPORTS_GOLD - Success
-- Using linker: default
-- Debug build configuration
-- NEO_SKIP_AUB_TESTS: TRUE
-- NEO_SKIP_AUB_TESTS_RUN: TRUE
-- Aub Stream Headers dir: /home/michel/git/build_intel_stack/compute-runtime/third_party/aub_stream
-- Khronos OpenCL headers dir: /home/michel/git/build_intel_stack/compute-runtime/third_party/opencl_headers
-- Khronos OpenGL headers dir: /home/michel/git/build_intel_stack/compute-runtime/third_party/opengl_headers
-- AOT config headers dir: /home/michel/git/build_intel_stack/compute-runtime/third_party/aot_config_headers
-- Found PkgConfig: /usr/bin/pkg-config (found version "1.8.1")
-- Checking for module 'igc-opencl'
--   Found igc-opencl, version 2.14.0
-- IGC include dirs: /home/michel/git/build_intel_stack/include/igc;/home/michel/git/build_intel_stack/include/igc/cif;/home/michel/git/build_intel_stack/include/igc/ocl_igc_shared/executable_format;/home/michel/git/build_intel_stack/include/igc/ocl_igc_shared/device_enqueue
-- VISA Dir: /home/michel/git/build_intel_stack/include/visa
-- IGA library name: libiga64.so.2
-- IGA Includes dir: /home/michel/git/build_intel_stack/include/iga
-- Checking for module 'igdgmm'
--   Found igdgmm, version 12.8.0
-- GmmLib include dirs: /home/michel/git/build_intel_stack/include/igdgmm;/home/michel/git/build_intel_stack/include/igdgmm/GmmLib;/home/michel/git/build_intel_stack/include/igdgmm/GmmLib/inc;/home/michel/git/build_intel_stack/include/igdgmm/inc;/home/michel/git/build_intel_stack/include/igdgmm/inc/common;/home/michel/git/build_intel_stack/include/igdgmm/util
-- Checking for module 'libigdml'
--   Package 'libigdml', required by 'virtual:world', not found
-- Metrics Library dir: /home/michel/git/build_intel_stack/compute-runtime/third_party/metrics_library
-- Checking for module 'libigdmd'
--   Package 'libigdmd', required by 'virtual:world', not found
-- Metrics Discovery dir: /home/michel/git/build_intel_stack/compute-runtime/third_party/metrics_discovery
-- AUB_STREAM_DIR =
-- Engine node dir: /home/michel/git/build_intel_stack/compute-runtime/third_party/aub_stream
-- All supported platforms:  PTL BMG LNL PVC MTL DG2 ARL TGLLP DG1 RKL ADLS ADLP ADLN
-- All tested platforms:
-- Default supported platform: PVC
-- Default tested platform:
-- All supported core families: GEN12LP;XE_HPG_CORE;XE2_HPG_CORE;XE3_CORE;XE_HPC_CORE
-- All tested core families:
-- Default tested family name:
-- Platforms to have WDDM_LINUX disabled: PVC
-- WDK include paths: /home/michel/git/build_intel_stack/compute-runtime/third_party/DirectX-Headers/include/wsl;/home/michel/git/build_intel_stack/compute-runtime/third_party/DirectX-Headers/include/wsl/stubs;/home/michel/git/build_intel_stack/compute-runtime/third_party/DirectX-Headers/include/directx;/home/michel/git/build_intel_stack/compute-runtime/third_party/DirectX-Headers/include/dxguids;/home/michel/git/build_intel_stack/compute-runtime/third_party/libdxg/include/
-- Driver model : drm_or_wddm
-- i915 prelim headers detection: FALSE
-- xe prelim headers detection: FALSE
-- Xe EU Debug support: FALSE
-- drm includes dir: /home/michel/git/build_intel_stack/compute-runtime/third_party/uapi/drm-next/drm
-- i915 includes dir: /home/michel/git/build_intel_stack/compute-runtime/third_party/uapi/drm-next/i915
-- i915 prelim includes dir: /home/michel/git/build_intel_stack/compute-runtime/third_party/uapi/drm-uapi-helper/master
-- xe includes dir: /home/michel/git/build_intel_stack/compute-runtime/third_party/uapi/drm-next/xe
-- iaf includes dir: /home/michel/git/build_intel_stack/compute-runtime/third_party/uapi/drm-uapi-helper/master
-- Neo kernels build type dir: debug
-- Performing Test COMPILER_SUPPORTS_INDIRECT_BRANCH_THUNK
-- Performing Test COMPILER_SUPPORTS_INDIRECT_BRANCH_THUNK - Failed
CMake Warning at CMakeLists.txt:807 (message):
  Spectre mitigation -mindirect-branch=thunk flag is not supported by the
  compiler


-- Performing Test COMPILER_SUPPORTS_FUNCTION_RETURN_THUNK
-- Performing Test COMPILER_SUPPORTS_FUNCTION_RETURN_THUNK - Failed
CMake Warning at CMakeLists.txt:813 (message):
  Spectre mitigation -mfunction-return=thunk flag is not supported by the
  compiler


-- Performing Test COMPILER_SUPPORTS_INDIRECT_BRANCH_REGISTER
-- Performing Test COMPILER_SUPPORTS_INDIRECT_BRANCH_REGISTER - Success
-- Performing Test COMPILER_SUPPORTS_SSE42
-- Performing Test COMPILER_SUPPORTS_SSE42 - Success
-- Performing Test COMPILER_SUPPORTS_AVX2
-- Performing Test COMPILER_SUPPORTS_AVX2 - Success
-- Performing Test COMPILER_SUPPORTS_NEON
-- Performing Test COMPILER_SUPPORTS_NEON - Failed
-- Performing Test SUPPORTS_CLFLUSHOPT
-- Performing Test SUPPORTS_CLFLUSHOPT - Success
-- Performing Test SUPPORTS_WAITPKG
-- Performing Test SUPPORTS_WAITPKG - Success
-- [OCLOC] All supported platforms: TGLLP;DG1;RKL;ADLS;ADLP;ADLN;MTL;DG2;ARL;PVC;BMG;LNL;PTL
-- ocloc_lib current name: $<TARGET_FILE_NAME:ocloc_lib>
-- ocloc_lib former name: libocloc_legacy1.so
-- Failed to find OpenCL package
-- Failed to find OpenCL package
-- Level Zero driver version: 1.6.34303
-- Could NOT find LevelZero (missing: LevelZero_INCLUDE_DIR)
-- LevelZero_INCLUDE_DIRS:
-- Level zero headers not found
-- Skipping level zero
-- Configuring done (1.2s)
-- Generating done (0.6s)
CMake Warning:
  Manually-specified variables were not used by the project:

    NEO_ENABLE_i915_PRELIM_DETECTION


-- Build files have been written to: /home/michel/git/build_intel_stack/compute-runtime/build
ninja: Entering directory `build'
[1286/3961] Generating ../../../../bin/built_ins/x64/xe2_hpg_core/stateless_copy_buffer_rect_stateless_20_2_0.bin
FAILED: bin/built_ins/x64/xe2_hpg_core/stateless_copy_buffer_rect_stateless_20_2_0.bin /home/michel/git/build_intel_stack/compute-runtime/build/bin/built_ins/x64/xe2_hpg_core/stateless_copy_buffer_rect_stateless_20_2_0.bin
cd /home/michel/git/build_intel_stack/compute-runtime/shared/source/built_ins/kernels && /usr/bin/cmake -E env LD_LIBRARY_PATH=:/home/michel/git/build_intel_stack/lib/:/home/michel/git/build_intel_stack/compute-runtime/build/bin /home/michel/git/build_intel_stack/compute-runtime/build/bin/ocloc-25.27.1 -q -file /home/michel/git/build_intel_stack/compute-runtime/build/bin/built_ins/x64/xe2_hpg_core/stateless_copy_buffer_rect_stateless_bmg.spv -spirv_input -device 20.2.0 -heapless_mode disable -cl-intel-greater-than-4GB-buffer-required -64 -stateful_address_mode bindful -output stateless_copy_buffer_rect_stateless_20_2_0 -output_no_suffix -out_dir /home/michel/git/build_intel_stack/compute-runtime/build/bin/built_ins/x64/xe2_hpg_core -options -cl-kernel-arg-info
ocloc-25.27.1: /home/michel/git/build_intel_stack/intel-graphics-compiler/IGC/Compiler/igc_workaround_linux.cpp:204: void IGC::SetWorkaroundTable(SKU_FEATURE_TABLE*, CPlatform*): Assertion `0' failed.
Subprocess aborted
[1289/3961] Generating ../../../../bin/built_ins/x64/xe2_hpg_core/stateless_copy_buffer_to_buffer_stateless_20_2_0.bin
FAILED: bin/built_ins/x64/xe2_hpg_core/stateless_copy_buffer_to_buffer_stateless_20_2_0.bin /home/michel/git/build_intel_stack/compute-runtime/build/bin/built_ins/x64/xe2_hpg_core/stateless_copy_buffer_to_buffer_stateless_20_2_0.bin
cd /home/michel/git/build_intel_stack/compute-runtime/shared/source/built_ins/kernels && /usr/bin/cmake -E env LD_LIBRARY_PATH=:/home/michel/git/build_intel_stack/lib/:/home/michel/git/build_intel_stack/compute-runtime/build/bin /home/michel/git/build_intel_stack/compute-runtime/build/bin/ocloc-25.27.1 -q -file /home/michel/git/build_intel_stack/compute-runtime/build/bin/built_ins/x64/xe2_hpg_core/stateless_copy_buffer_to_buffer_stateless_bmg.spv -spirv_input -device 20.2.0 -heapless_mode disable -cl-intel-greater-than-4GB-buffer-required -64 -stateful_address_mode bindful -output stateless_copy_buffer_to_buffer_stateless_20_2_0 -output_no_suffix -out_dir /home/michel/git/build_intel_stack/compute-runtime/build/bin/built_ins/x64/xe2_hpg_core -options -cl-kernel-arg-info
ocloc-25.27.1: /home/michel/git/build_intel_stack/intel-graphics-compiler/IGC/Compiler/igc_workaround_linux.cpp:204: void IGC::SetWorkaroundTable(SKU_FEATURE_TABLE*, CPlatform*): Assertion `0' failed.
Subprocess aborted
[1290/3961] Generating ../../../../bin/built_ins/x64/xe2_hpg_core/stateless_copy_buffer_to_image3d_stateless_20_2_0.bin
FAILED: bin/built_ins/x64/xe2_hpg_core/stateless_copy_buffer_to_image3d_stateless_20_2_0.bin /home/michel/git/build_intel_stack/compute-runtime/build/bin/built_ins/x64/xe2_hpg_core/stateless_copy_buffer_to_image3d_stateless_20_2_0.bin
cd /home/michel/git/build_intel_stack/compute-runtime/shared/source/built_ins/kernels && /usr/bin/cmake -E env LD_LIBRARY_PATH=:/home/michel/git/build_intel_stack/lib/:/home/michel/git/build_intel_stack/compute-runtime/build/bin /home/michel/git/build_intel_stack/compute-runtime/build/bin/ocloc-25.27.1 -q -file /home/michel/git/build_intel_stack/compute-runtime/build/bin/built_ins/x64/xe2_hpg_core/stateless_copy_buffer_to_image3d_stateless_bmg.spv -spirv_input -device 20.2.0 -heapless_mode disable -cl-intel-greater-than-4GB-buffer-required -64 -stateful_address_mode bindful -output stateless_copy_buffer_to_image3d_stateless_20_2_0 -output_no_suffix -out_dir /home/michel/git/build_intel_stack/compute-runtime/build/bin/built_ins/x64/xe2_hpg_core -options -cl-kernel-arg-info
ocloc-25.27.1: /home/michel/git/build_intel_stack/intel-graphics-compiler/IGC/Compiler/igc_workaround_linux.cpp:204: void IGC::SetWorkaroundTable(SKU_FEATURE_TABLE*, CPlatform*): Assertion `0' failed.
Subprocess aborted
[1291/3961] Generating ../../../../bin/built_ins/x64/xe2_hpg_core/stateless_copy_image3d_to_buffer_stateless_20_2_0.bin
FAILED: bin/built_ins/x64/xe2_hpg_core/stateless_copy_image3d_to_buffer_stateless_20_2_0.bin /home/michel/git/build_intel_stack/compute-runtime/build/bin/built_ins/x64/xe2_hpg_core/stateless_copy_image3d_to_buffer_stateless_20_2_0.bin
cd /home/michel/git/build_intel_stack/compute-runtime/shared/source/built_ins/kernels && /usr/bin/cmake -E env LD_LIBRARY_PATH=:/home/michel/git/build_intel_stack/lib/:/home/michel/git/build_intel_stack/compute-runtime/build/bin /home/michel/git/build_intel_stack/compute-runtime/build/bin/ocloc-25.27.1 -q -file /home/michel/git/build_intel_stack/compute-runtime/build/bin/built_ins/x64/xe2_hpg_core/stateless_copy_image3d_to_buffer_stateless_bmg.spv -spirv_input -device 20.2.0 -heapless_mode disable -cl-intel-greater-than-4GB-buffer-required -64 -stateful_address_mode bindful -output stateless_copy_image3d_to_buffer_stateless_20_2_0 -output_no_suffix -out_dir /home/michel/git/build_intel_stack/compute-runtime/build/bin/built_ins/x64/xe2_hpg_core -options -cl-kernel-arg-info
ocloc-25.27.1: /home/michel/git/build_intel_stack/intel-graphics-compiler/IGC/Compiler/igc_workaround_linux.cpp:204: void IGC::SetWorkaroundTable(SKU_FEATURE_TABLE*, CPlatform*): Assertion `0' failed.
Subprocess aborted
[1292/3961] Generating ../../../../bin/built_ins/x64/xe2_hpg_core/stateless_fill_buffer_stateless_20_2_0.bin
FAILED: bin/built_ins/x64/xe2_hpg_core/stateless_fill_buffer_stateless_20_2_0.bin /home/michel/git/build_intel_stack/compute-runtime/build/bin/built_ins/x64/xe2_hpg_core/stateless_fill_buffer_stateless_20_2_0.bin
cd /home/michel/git/build_intel_stack/compute-runtime/shared/source/built_ins/kernels && /usr/bin/cmake -E env LD_LIBRARY_PATH=:/home/michel/git/build_intel_stack/lib/:/home/michel/git/build_intel_stack/compute-runtime/build/bin /home/michel/git/build_intel_stack/compute-runtime/build/bin/ocloc-25.27.1 -q -file /home/michel/git/build_intel_stack/compute-runtime/build/bin/built_ins/x64/xe2_hpg_core/stateless_fill_buffer_stateless_bmg.spv -spirv_input -device 20.2.0 -heapless_mode disable -cl-intel-greater-than-4GB-buffer-required -64 -stateful_address_mode bindful -output stateless_fill_buffer_stateless_20_2_0 -output_no_suffix -out_dir /home/michel/git/build_intel_stack/compute-runtime/build/bin/built_ins/x64/xe2_hpg_core -options -cl-kernel-arg-info
ocloc-25.27.1: /home/michel/git/build_intel_stack/intel-graphics-compiler/IGC/Compiler/igc_workaround_linux.cpp:204: void IGC::SetWorkaroundTable(SKU_FEATURE_TABLE*, CPlatform*): Assertion `0' failed.
Subprocess aborted
[1293/3961] Generating ../../../../bin/built_ins/x64/xe2_hpg_core/bindful_copy_buffer_rect_20_2_0.bin
FAILED: bin/built_ins/x64/xe2_hpg_core/bindful_copy_buffer_rect_20_2_0.bin /home/michel/git/build_intel_stack/compute-runtime/build/bin/built_ins/x64/xe2_hpg_core/bindful_copy_buffer_rect_20_2_0.bin
cd /home/michel/git/build_intel_stack/compute-runtime/shared/source/built_ins/kernels && /usr/bin/cmake -E env LD_LIBRARY_PATH=:/home/michel/git/build_intel_stack/lib/:/home/michel/git/build_intel_stack/compute-runtime/build/bin /home/michel/git/build_intel_stack/compute-runtime/build/bin/ocloc-25.27.1 -q -file /home/michel/git/build_intel_stack/compute-runtime/build/bin/built_ins/x64/xe2_hpg_core/bindful_copy_buffer_rect_bmg.spv -spirv_input -device 20.2.0 -heapless_mode disable -force_stos_opt -64 -stateful_address_mode bindful -output bindful_copy_buffer_rect_20_2_0 -output_no_suffix -out_dir /home/michel/git/build_intel_stack/compute-runtime/build/bin/built_ins/x64/xe2_hpg_core -options -cl-kernel-arg-info
ocloc-25.27.1: /home/michel/git/build_intel_stack/intel-graphics-compiler/IGC/Compiler/igc_workaround_linux.cpp:204: void IGC::SetWorkaroundTable(SKU_FEATURE_TABLE*, CPlatform*): Assertion `0' failed.
Subprocess aborted
[1294/3961] Generating ../../../../bin/built_ins/x64/xe2_hpg_core/bindful_copy_buffer_to_buffer_20_2_0.bin
FAILED: bin/built_ins/x64/xe2_hpg_core/bindful_copy_buffer_to_buffer_20_2_0.bin /home/michel/git/build_intel_stack/compute-runtime/build/bin/built_ins/x64/xe2_hpg_core/bindful_copy_buffer_to_buffer_20_2_0.bin
cd /home/michel/git/build_intel_stack/compute-runtime/shared/source/built_ins/kernels && /usr/bin/cmake -E env LD_LIBRARY_PATH=:/home/michel/git/build_intel_stack/lib/:/home/michel/git/build_intel_stack/compute-runtime/build/bin /home/michel/git/build_intel_stack/compute-runtime/build/bin/ocloc-25.27.1 -q -file /home/michel/git/build_intel_stack/compute-runtime/build/bin/built_ins/x64/xe2_hpg_core/bindful_copy_buffer_to_buffer_bmg.spv -spirv_input -device 20.2.0 -heapless_mode disable -force_stos_opt -64 -stateful_address_mode bindful -output bindful_copy_buffer_to_buffer_20_2_0 -output_no_suffix -out_dir /home/michel/git/build_intel_stack/compute-runtime/build/bin/built_ins/x64/xe2_hpg_core -options -cl-kernel-arg-info
ocloc-25.27.1: /home/michel/git/build_intel_stack/intel-graphics-compiler/IGC/Compiler/igc_workaround_linux.cpp:204: void IGC::SetWorkaroundTable(SKU_FEATURE_TABLE*, CPlatform*): Assertion `0' failed.
Subprocess aborted
[1295/3961] Generating ../../../../bin/built_ins/x64/xe2_hpg_core/bindful_copy_buffer_to_image3d_20_2_0.bin
FAILED: bin/built_ins/x64/xe2_hpg_core/bindful_copy_buffer_to_image3d_20_2_0.bin /home/michel/git/build_intel_stack/compute-runtime/build/bin/built_ins/x64/xe2_hpg_core/bindful_copy_buffer_to_image3d_20_2_0.bin
cd /home/michel/git/build_intel_stack/compute-runtime/shared/source/built_ins/kernels && /usr/bin/cmake -E env LD_LIBRARY_PATH=:/home/michel/git/build_intel_stack/lib/:/home/michel/git/build_intel_stack/compute-runtime/build/bin /home/michel/git/build_intel_stack/compute-runtime/build/bin/ocloc-25.27.1 -q -file /home/michel/git/build_intel_stack/compute-runtime/build/bin/built_ins/x64/xe2_hpg_core/bindful_copy_buffer_to_image3d_bmg.spv -spirv_input -device 20.2.0 -heapless_mode disable -force_stos_opt -64 -stateful_address_mode bindful -output bindful_copy_buffer_to_image3d_20_2_0 -output_no_suffix -out_dir /home/michel/git/build_intel_stack/compute-runtime/build/bin/built_ins/x64/xe2_hpg_core -options -cl-kernel-arg-info
ocloc-25.27.1: /home/michel/git/build_intel_stack/intel-graphics-compiler/IGC/Compiler/igc_workaround_linux.cpp:204: void IGC::SetWorkaroundTable(SKU_FEATURE_TABLE*, CPlatform*): Assertion `0' failed.
Subprocess aborted
[1296/3961] Generating ../../../../bin/built_ins/x64/xe2_hpg_core/bindful_copy_image3d_to_buffer_20_2_0.bin
FAILED: bin/built_ins/x64/xe2_hpg_core/bindful_copy_image3d_to_buffer_20_2_0.bin /home/michel/git/build_intel_stack/compute-runtime/build/bin/built_ins/x64/xe2_hpg_core/bindful_copy_image3d_to_buffer_20_2_0.bin
cd /home/michel/git/build_intel_stack/compute-runtime/shared/source/built_ins/kernels && /usr/bin/cmake -E env LD_LIBRARY_PATH=:/home/michel/git/build_intel_stack/lib/:/home/michel/git/build_intel_stack/compute-runtime/build/bin /home/michel/git/build_intel_stack/compute-runtime/build/bin/ocloc-25.27.1 -q -file /home/michel/git/build_intel_stack/compute-runtime/build/bin/built_ins/x64/xe2_hpg_core/bindful_copy_image3d_to_buffer_bmg.spv -spirv_input -device 20.2.0 -heapless_mode disable -force_stos_opt -64 -stateful_address_mode bindful -output bindful_copy_image3d_to_buffer_20_2_0 -output_no_suffix -out_dir /home/michel/git/build_intel_stack/compute-runtime/build/bin/built_ins/x64/xe2_hpg_core -options -cl-kernel-arg-info
ocloc-25.27.1: /home/michel/git/build_intel_stack/intel-graphics-compiler/IGC/Compiler/igc_workaround_linux.cpp:204: void IGC::SetWorkaroundTable(SKU_FEATURE_TABLE*, CPlatform*): Assertion `0' failed.
Subprocess aborted
[1297/3961] Generating ../../../../bin/built_ins/x64/xe2_hpg_core/bindful_copy_image_to_image1d_20_2_0.bin
FAILED: bin/built_ins/x64/xe2_hpg_core/bindful_copy_image_to_image1d_20_2_0.bin /home/michel/git/build_intel_stack/compute-runtime/build/bin/built_ins/x64/xe2_hpg_core/bindful_copy_image_to_image1d_20_2_0.bin
cd /home/michel/git/build_intel_stack/compute-runtime/shared/source/built_ins/kernels && /usr/bin/cmake -E env LD_LIBRARY_PATH=:/home/michel/git/build_intel_stack/lib/:/home/michel/git/build_intel_stack/compute-runtime/build/bin /home/michel/git/build_intel_stack/compute-runtime/build/bin/ocloc-25.27.1 -q -file /home/michel/git/build_intel_stack/compute-runtime/build/bin/built_ins/x64/xe2_hpg_core/bindful_copy_image_to_image1d_bmg.spv -spirv_input -device 20.2.0 -heapless_mode disable -force_stos_opt -64 -stateful_address_mode bindful -output bindful_copy_image_to_image1d_20_2_0 -output_no_suffix -out_dir /home/michel/git/build_intel_stack/compute-runtime/build/bin/built_ins/x64/xe2_hpg_core -options -cl-kernel-arg-info
ocloc-25.27.1: /home/michel/git/build_intel_stack/intel-graphics-compiler/IGC/Compiler/igc_workaround_linux.cpp:204: void IGC::SetWorkaroundTable(SKU_FEATURE_TABLE*, CPlatform*): Assertion `0' failed.
Subprocess aborted
ninja: build stopped: subcommand failed.
```

</details>

