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

Fails with:

<details>
<summary>Click to expand error output</summary>

```
Add your error output here
```

</details>

