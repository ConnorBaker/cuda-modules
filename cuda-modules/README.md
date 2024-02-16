# Cuda modules

> [!NOTE]
> This document is meant to help CUDA maintainers understand the structure of
> the CUDA packages in Nixpkgs. It is not meant to be a user-facing document.
> For a user-facing document, see [the CUDA section of the manual](../../../doc/languages-frameworks/cuda.section.md).

The files in this directory are added (in some way) to the `cudaPackages`
package set by [cuda-packages.nix](../../top-level/cuda-packages.nix).

## Top-level files

Top-level nix files are included in the initial creation of the `cudaPackages`
scope. These are typically required for the creation of the finalized
`cudaPackages` scope:

- `backend-stdenv.nix`: Standard environment for CUDA packages.
- `flags.nix`: Flags set, or consumed by, NVCC in order to build packages.
- `gpus.nix`: A list of supported NVIDIA GPUs.
- `nvcc-compatibilities.nix`: NVCC releases and the version range of GCC/Clang
    they support.

## Top-level directories

- `cuda`: CUDA redistributables! Provides extension to `cudaPackages` scope.
- `cudatoolkit`: monolothic CUDA Toolkit run-file installer. Provides extension
    to `cudaPackages` scope.
- `cudnn`: NVIDIA cuDNN library.
- `cutensor`: NVIDIA cuTENSOR library.
- `generic-builders`:
  - Contains a builder `manifest.nix` which operates on the `Manifest` type
      defined in `modules/generic/manifests`. Most packages are built using this
      builder.
  - Contains a builder `multiplex.nix` which leverages the Manifest builder. In
      short, the Multiplex builder adds multiple versions of a single package to
      single instance of the CUDA Packages package set. It is used primarily for
      packages like `cudnn` and `cutensor`.
- `modules`: Nixpkgs modules to check the shape and content of CUDA
    redistributable and feature manifests. These modules additionally use shims
    provided by some CUDA packages to allow them to re-use the
    `genericManifestBuilder`, even if they don't have manifest files of their
    own. `cudnn` and `tensorrt` are examples of packages which provide such
    shims. These modules are further described in the
    [Modules](./modules/README.md) documentation.
- `nccl`: NVIDIA NCCL library.
- `nccl-tests`: NVIDIA NCCL tests.
- `saxpy`: Example CMake project that uses CUDA.
- `setup-hooks`: Nixpkgs setup hooks for CUDA.
- `tensorrt`: NVIDIA TensorRT library.

### Modules

Modules as they are used in `modules` exist primarily to check the shape and
content of CUDA redistributable and feature manifests. They are ultimately meant
to reduce the repetitive nature of repackaging CUDA redistributables.

Building most redistributables follows a pattern of a manifest indicating which
packages are available at a location, their versions, and their hashes. To avoid
creating builders for each and every derivation, modules serve as a way for us
to use a single `genericManifestBuilder` to build all redistributables.

## `generic`

The modules in `generic` are reusable components meant to check the shape and
content of NVIDIA's CUDA redistributable manifests, our feature manifests (which
are derived from NVIDIA's manifests), or hand-crafted Nix expressions describing
available packages. They are used by the `genericManifestBuilder` to build CUDA
redistributables.

Generally, each package which relies on manifests or Nix release expressions
will create an alias to the relevant generic module. For example, the [module
for CUDNN](./cudnn/default.nix) aliases the generic module for release
expressions, while the [module for CUDA redistributables](./cuda/default.nix)
aliases the generic module for manifests.

Alternatively, additional fields or values may need to be configured to account
for the particulars of a package. For example, while the release expressions for
[CUDNN](./cudnn/releases.nix) and [TensorRT](./tensorrt/releases.nix) are very
close, they differ slightly in the fields they have. The [module for
CUDNN](./modules/cudnn/default.nix) is able to use the generic module for
release expressions, while the [module for
TensorRT](./modules/tensorrt/default.nix) must add additional fields to the
generic module.

### `manifests`

The modules in `generic/manifests` define the structure of NVIDIA's CUDA
redistributable manifests and our feature manifests.

NVIDIA's redistributable manifests are retrieved from their web server, while
the feature manifests are produced by
[`cuda-redist-find-features`](https://github.com/connorbaker/cuda-redist-find-features).

### `releases`

The modules in `generic/releases` define the structure of our hand-crafted Nix
expressions containing information necessary to download and repackage CUDA
redistributables. These expressions are created when NVIDIA-provided manifests
are unavailable or otherwise unusable. For example, though CUDNN has manifests,
a bug in NVIDIA's CI/CD causes manifests for different versions of CUDA to use
the same name, which leads to the manifests overwriting each other.

### `types`

The modules in `generic/types` define reusable types used in both
`generic/manifests` and `generic/releases`.


## Distinguished packages

### Cuda compatibility

[Cuda Compatibility](https://docs.nvidia.com/deploy/cuda-compatibility/),
available as `cudaPackages.cuda_compat`, is a component which makes it possible
to run applications built against a newer CUDA toolkit (for example CUDA 12) on
a machine with an older CUDA driver (for example CUDA 11), which isn't possible
out of the box. At the time of writing, Cuda Compatibility is only available on
the Nvidia Jetson architecture, but Nvidia might release support for more
architectures in the future.

As Cuda Compatibility strictly increases the range of supported applications, we
try our best to enable it by default on supported platforms.

#### Functioning

`cuda_compat` simply provides a new `libcuda.so` (and associated variants) that
needs to be used in place of the default CUDA driver's `libcuda.so`. However,
the other shared libraries of the default driver must still be accessible:
`cuda_compat` isn't a complete drop-in replacement for the driver (and that's
the point, otherwise, it would just be a newer driver).

Nvidia's recommendation is to set `LD_LIBRARY_PATH` to points to `cuda_compat`'s
driver. This is fine for a manual, one-shot usage, but in general setting
`LD_LIBRARY_PATH` is a red flag. This is global state which short-circuits most
of other dynamic libraries resolution mechanisms and can break things in
non-obvious ways, especially with other Nix-built software.

#### Cuda compat with Nix

Since `cuda_compat` is a known derivation, the easy way to do this in Nix would
be to add `cuda_compat` as a dependency of CUDA libraries and applications and
let Nix does its magic by filling the `DT_RUNPATH` fields. However,
`cuda_compat` itself depends on `libnvrm_mem` and `libnvrm_gpu` which are loaded
dynamically at runtime from `/run/opengl-driver`. This doesn't please the Nix
sandbox when building, which can't find those (a second minor issue is that
`addOpenGLRunpathHook` prepends the `/run/opengl-driver` path, so that would
still take precedence).

The current solution is to do something similar to `addOpenGLRunpathHook`: the
`addCudaCompatRunpathHook` prepends to the path to `cuda_compat`'s `libcuda.so`
to the `DT_RUNPATH` of whichever package includes the hook as a dependency, and
we include the hook by default for packages in `cudaPackages` (by adding it as a
inputs in `genericManifestBuilder`). We also make sure it's included after
`addOpenGLRunpathHook`, so that it appears _before_ in the `DT_RUNPATH` and
takes precedence.
