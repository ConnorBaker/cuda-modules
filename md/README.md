## \_module.args

Additional arguments passed to each module in addition to ones
like `lib`, `config`,
and `pkgs`, `modulesPath`.

This option is also available to all submodules. Submodules do not
inherit args from their parent module, nor do they provide args to
their parent module or sibling submodules. The sole exception to
this is the argument `name` which is provided by
parent modules to a submodule and contains the attribute name
the submodule is bound to, or a unique generated name if it is
not bound to an attribute.

Some arguments are already passed by default, of which the
following *cannot* be changed with this option:

- `lib`: The nixpkgs library.

- `config`: The results of all options after merging the values from all modules together.

- `options`: The options declared in all modules.

- `specialArgs`: The `specialArgs` argument passed to `evalModules`.

- All attributes of `specialArgs`

  Whereas option values can generally depend on other option values
  thanks to laziness, this does not apply to `imports`, which
  must be computed statically before anything else.

  For this reason, callers of the module system can provide `specialArgs`
  which are available during import resolution.

  For NixOS, `specialArgs` includes
  `modulesPath`, which allows you to import
  extra modules from the nixpkgs package tree without having to
  somehow make the module aware of the location of the
  `nixpkgs` or NixOS directories.

  ```
  { modulesPath, ... }: {
    imports = [
      (modulesPath + "/profiles/minimal.nix")
    ];
  }
  ```

For NixOS, the default value for this option includes at least this argument:

- `pkgs`: The nixpkgs package set according to
  the `nixpkgs.pkgs` option.

*Type:*
lazy attribute set of raw value

*Declared by:*

- [\<nixpkgs/lib/modules.nix>](https://github.com/NixOS/nixpkgs/blob//lib/modules.nix)

## cudaPackagesPackageSets

CUDA Package Sets

*Type:*
submodule

*Default:*

```
{
  cudaPackages_10_0 = {
    cudaVersion = "10.0";
  };
  cudaPackages_10_1 = {
    cudaVersion = "10.1";
  };
  cudaPackages_10_2 = {
    cudaVersion = "10.2";
  };
  cudaPackages_11_0 = {
    cudaVersion = "11.0";
  };
  cudaPackages_11_1 = {
    cudaVersion = "11.1";
  };
  cudaPackages_11_2 = {
    cudaVersion = "11.2";
  };
  cudaPackages_11_3 = {
    cudaVersion = "11.3";
  };
  cudaPackages_11_4 = {
    cudaVersion = "11.4";
  };
  cudaPackages_11_5 = {
    cudaVersion = "11.5";
  };
  cudaPackages_11_6 = {
    cudaVersion = "11.6";
  };
  cudaPackages_11_7 = {
    cudaVersion = "11.7";
  };
  cudaPackages_11_8 = {
    cudaVersion = "11.8";
  };
  cudaPackages_12_0 = {
    cudaVersion = "12.0";
  };
  cudaPackages_12_1 = {
    cudaVersion = "12.1";
  };
  cudaPackages_12_2 = {
    cudaVersion = "12.2";
  };
  cudaPackages_12_3 = {
    cudaVersion = "12.3";
  };
}
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules)

## cudaPackagesPackageSets.cudaPackages_10_0

A CUDA package set for a particular version of CUDA

*Type:*
submodule

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules)

## cudaPackagesPackageSets.cudaPackages_10_0.cudaAtLeast

A utility to check if the CUDA version is at least a given version

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_10_0.cudaAtMost

A utility to check if the CUDA version is at most a given version

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_10_0.cudaFlags.data.archNames

The names of the architectures to build for

*Type:*
list of string

*Default:*
`[ ]`

*Example:*

```
[
  "Turing"
  "Ampere"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_0.cudaFlags.data.arches

The architectures to build for. Includes a virtual architecture if forward compatibility is enabled.

*Type:*
list of (A real/physical CUDA architecture name. or A virtual CUDA architecture name.)

*Default:*

```
[
  "sm_89"
]
```

*Example:*

```
[
  "sm_75"
  "sm_86"
  "compute_86"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_0.cudaFlags.data.cudaCapabilities

CUDA capabilities (hardware generations) to build for

*Type:*
list of A CUDA capability version.

*Default:*

```
[
  "8.9"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_0.cudaFlags.data.cudaForwardCompat

Build with forward compatibility gencode (+PTX) to support future GPU generations

*Type:*
boolean

*Default:*
`false`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_0.cudaFlags.data.cudaGpus

CUDA GPUs to build for

*Type:*
list of (submodule)

*Default:*
`[ ]`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_0.cudaFlags.data.cudaGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_0.cudaFlags.data.cudaGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_0.cudaFlags.data.cudaGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_0.cudaFlags.data.cudaGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of true, false

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_0.cudaFlags.data.cudaGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_0.cudaFlags.data.cudaGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_0.cudaFlags.data.cudaJetsonGpus

CUDA GPUs to build for, including only Jetson devices

*Type:*
list of (submodule)

*Default:*
`[ ]`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_0.cudaFlags.data.cudaJetsonGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_0.cudaFlags.data.cudaJetsonGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_0.cudaFlags.data.cudaJetsonGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_0.cudaFlags.data.cudaJetsonGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of true, false

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)
- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_0.cudaFlags.data.cudaJetsonGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_0.cudaFlags.data.cudaJetsonGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_0.cudaFlags.data.cudaNonJetsonGpus

CUDA GPUs to build for, excluding Jetson devices

*Type:*
list of (submodule)

*Default:*
`[ ]`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_0.cudaFlags.data.cudaNonJetsonGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_0.cudaFlags.data.cudaNonJetsonGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_0.cudaFlags.data.cudaNonJetsonGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_0.cudaFlags.data.cudaNonJetsonGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of false, true

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)
- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_0.cudaFlags.data.cudaNonJetsonGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_0.cudaFlags.data.cudaNonJetsonGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_0.cudaFlags.data.cudaSupport

Build packages with CUDA support

*Type:*
boolean

*Default:*
`true`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_0.cudaFlags.data.defaultCapabilities

The default compute capabilities for a given CUDA version

*Type:*
list of A CUDA capability version.

*Default:*

```
[
  "3.0"
  "3.2"
  "3.5"
  "3.7"
  "5.0"
  "5.2"
  "6.0"
  "6.1"
  "7.0"
  "7.5"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_0.cudaFlags.data.defaultGpus

The default GPUs for a given CUDA version

*Type:*
list of (submodule)

*Default:*

```
[
  {
    archName = "Kepler";
    computeCapability = "3.0";
    dontDefaultAfter = "10.2";
    isJetson = false;
    maxCudaVersion = "10.2";
    minCudaVersion = "10.0";
  }
  {
    archName = "Kepler";
    computeCapability = "3.2";
    dontDefaultAfter = "10.2";
    isJetson = false;
    maxCudaVersion = "10.2";
    minCudaVersion = "10.0";
  }
  {
    archName = "Kepler";
    computeCapability = "3.5";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = "11.8";
    minCudaVersion = "10.0";
  }
  {
    archName = "Kepler";
    computeCapability = "3.7";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = "11.8";
    minCudaVersion = "10.0";
  }
  {
    archName = "Maxwell";
    computeCapability = "5.0";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Maxwell";
    computeCapability = "5.2";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.1";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Volta";
    computeCapability = "7.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Turing";
    computeCapability = "7.5";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_0.cudaFlags.data.defaultGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_0.cudaFlags.data.defaultGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_0.cudaFlags.data.defaultGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_0.cudaFlags.data.defaultGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of true, false

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_0.cudaFlags.data.defaultGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_0.cudaFlags.data.defaultGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_0.cudaFlags.data.gencodeArgs

The gencode arguments to pass to NVCC

*Type:*
list of A \`gencode\` argument for the \`nvcc\` compiler.

*Default:*

```
[
  "-gencode=arch=compute_89,code=sm_89"
]
```

*Example:*

```
[
  "-gencode=arch=compute_75,code=sm_75"
  "-gencode=arch=compute_86,code=sm_86"
  "-gencode=arch=compute_86,code=compute_86"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_0.cudaFlags.data.gencodeString

A space-separated string of CUDA gencode arguments to pass to NVCC

*Type:*
string

*Default:*
`"-gencode=arch=compute_89,code=sm_89"`

*Example:*
`"-gencode=arch=compute_75,code=sm_75 ... -gencode=arch=compute_86,code=compute_86"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_0.cudaFlags.data.isJetsonBuild

Whether the build is for a Jetson device.

Jetson devices cannot be targeted by the same binaries which target non-Jetson devices. While
NVIDIA provides both `linux-aarch64` and `linux-sbsa` packages, which both target `aarch64`,
they are built with different settings and cannot be mixed.

*Type:*
boolean

*Default:*
`false`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_0.cudaFlags.data.realArches

The physical architectures to build for

*Type:*
list of A real/physical CUDA architecture name.

*Default:*

```
[
  "sm_89"
]
```

*Example:*

```
[
  "sm_75"
  "sm_86"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_0.cudaFlags.data.supportedCapabilities

The compute capabilities supported by a given CUDA version

*Type:*
list of A CUDA capability version.

*Default:*

```
[
  "3.0"
  "3.2"
  "3.5"
  "3.7"
  "5.0"
  "5.2"
  "5.3"
  "6.0"
  "6.1"
  "6.2"
  "7.0"
  "7.2"
  "7.5"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_0.cudaFlags.data.supportedGpus

The GPUs supported by a given CUDA version

*Type:*
list of (submodule)

*Default:*

```
[
  {
    archName = "Kepler";
    computeCapability = "3.0";
    dontDefaultAfter = "10.2";
    isJetson = false;
    maxCudaVersion = "10.2";
    minCudaVersion = "10.0";
  }
  {
    archName = "Kepler";
    computeCapability = "3.2";
    dontDefaultAfter = "10.2";
    isJetson = false;
    maxCudaVersion = "10.2";
    minCudaVersion = "10.0";
  }
  {
    archName = "Kepler";
    computeCapability = "3.5";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = "11.8";
    minCudaVersion = "10.0";
  }
  {
    archName = "Kepler";
    computeCapability = "3.7";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = "11.8";
    minCudaVersion = "10.0";
  }
  {
    archName = "Maxwell";
    computeCapability = "5.0";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Maxwell";
    computeCapability = "5.2";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Maxwell";
    computeCapability = "5.3";
    dontDefaultAfter = null;
    isJetson = true;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.1";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.2";
    dontDefaultAfter = null;
    isJetson = true;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Volta";
    computeCapability = "7.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Volta";
    computeCapability = "7.2";
    dontDefaultAfter = null;
    isJetson = true;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Turing";
    computeCapability = "7.5";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_0.cudaFlags.data.supportedGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_0.cudaFlags.data.supportedGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_0.cudaFlags.data.supportedGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_0.cudaFlags.data.supportedGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of true, false

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_0.cudaFlags.data.supportedGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_0.cudaFlags.data.supportedGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_0.cudaFlags.data.virtualArches

The virtual architectures to build for. These are typically used for forward compatibility,
when trying to support an architecture newer than the CUDA version allows.

*Type:*
list of A virtual CUDA architecture name.

*Default:*

```
[
  "compute_89"
]
```

*Example:*

```
[
  "compute_75"
  "compute_86"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_0.cudaFlags.utils.archMapper

Maps a feature across a list of compute capabilities to produce a list of architectures.

For example, “sm” and \[ “8.0” “8.6” “8.7” \] yield \[ “sm_80” “sm_86” “sm_87” \].

*Type:*
function that evaluates to a(n) function that evaluates to a(n) list of string

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_0.cudaFlags.utils.dropDot

Drops dots from a string.

*Type:*
function that evaluates to a(n) string

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_0.cudaFlags.utils.gencodeMapper

Maps a feature across a list of compute capabilities to produce a list of gencode arguments.

For example, “sm” and \[ “8.0” “8.6” “8.7” \] yield \[ “-gencode=arch=compute_80,code=sm_80”
“-gencode=arch=compute_86,code=sm_86” “-gencode=arch=compute_87,code=sm_87” \].

*Type:*
function that evaluates to a(n) function that evaluates to a(n) list of string

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_0.cudaFlags.utils.getNixSystem

Maps NVIDIA redist arch to Nix system.

NOTE: This function *will* be called by unsupported systems because `cudaPackages` is part of
`all-packages.nix`, which is evaluated on all systems. As such, we need to handle unsupported
systems gracefully.

*Type:*
function that evaluates to a(n) (one of “unsupported”, “aaarch64-linux”, “x86_64-linux”, “ppc64le-linux”, “x86_64-windows”)

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_0.cudaFlags.utils.getRedistArch

Maps Nix system to NVIDIA redist arch.

NOTE: We swap out the default `linux-sbsa` redist (for server-grade ARM chips) with the
`linux-aarch64` redist (which is for Jetson devices) if we’re building any Jetson devices.
Since both are based on aarch64, we can only have one or the other, otherwise there’s an
ambiguity as to which should be used.

NOTE: This function *will* be called by unsupported systems because `cudaPackages` is part of
`all-packages.nix`, which is evaluated on all systems. As such, we need to handle unsupported
systems gracefully.

*Type:*
function that evaluates to a(n) (one of “unsupported”, “linux-aarch64”, “linux-sbsa”, “linux-x86_64”, “linux-ppc64le”, “windows-x86_64”)

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_0.cudaFlags.utils.isDefault

Whether a GPU is included in the default capabilities

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function, args: {dontDefaultAfter, isJetson}>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_0.cudaFlags.utils.isSupported

Whether a CUDA version supports a given GPU

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function, args: {maxCudaVersion, minCudaVersion}>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_0.cudaMajorMinorVersion

The major and minor version of the CUDA package set

*Type:*
string

*Default:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_10_0.cudaMajorVersion

The major version of the CUDA package set

*Type:*
string

*Default:*
`"10"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_10_0.cudaNewer

A utility to check if the CUDA version is newer than a given version

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_10_0.cudaOlder

A utility to check if the CUDA version is older than a given version

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_10_0.cudaVersion

The CUDA version of the package set

*Type:*
A version number with a major and minor component.

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_10_1

A CUDA package set for a particular version of CUDA

*Type:*
submodule

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules)

## cudaPackagesPackageSets.cudaPackages_10_1.cudaAtLeast

A utility to check if the CUDA version is at least a given version

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_10_1.cudaAtMost

A utility to check if the CUDA version is at most a given version

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_10_1.cudaFlags.data.archNames

The names of the architectures to build for

*Type:*
list of string

*Default:*
`[ ]`

*Example:*

```
[
  "Turing"
  "Ampere"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_1.cudaFlags.data.arches

The architectures to build for. Includes a virtual architecture if forward compatibility is enabled.

*Type:*
list of (A real/physical CUDA architecture name. or A virtual CUDA architecture name.)

*Default:*

```
[
  "sm_89"
]
```

*Example:*

```
[
  "sm_75"
  "sm_86"
  "compute_86"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_1.cudaFlags.data.cudaCapabilities

CUDA capabilities (hardware generations) to build for

*Type:*
list of A CUDA capability version.

*Default:*

```
[
  "8.9"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_1.cudaFlags.data.cudaForwardCompat

Build with forward compatibility gencode (+PTX) to support future GPU generations

*Type:*
boolean

*Default:*
`false`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_1.cudaFlags.data.cudaGpus

CUDA GPUs to build for

*Type:*
list of (submodule)

*Default:*
`[ ]`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_1.cudaFlags.data.cudaGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_1.cudaFlags.data.cudaGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_1.cudaFlags.data.cudaGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_1.cudaFlags.data.cudaGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of true, false

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_1.cudaFlags.data.cudaGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_1.cudaFlags.data.cudaGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_1.cudaFlags.data.cudaJetsonGpus

CUDA GPUs to build for, including only Jetson devices

*Type:*
list of (submodule)

*Default:*
`[ ]`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_1.cudaFlags.data.cudaJetsonGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_1.cudaFlags.data.cudaJetsonGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_1.cudaFlags.data.cudaJetsonGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_1.cudaFlags.data.cudaJetsonGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of true, false

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)
- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_1.cudaFlags.data.cudaJetsonGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_1.cudaFlags.data.cudaJetsonGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_1.cudaFlags.data.cudaNonJetsonGpus

CUDA GPUs to build for, excluding Jetson devices

*Type:*
list of (submodule)

*Default:*
`[ ]`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_1.cudaFlags.data.cudaNonJetsonGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_1.cudaFlags.data.cudaNonJetsonGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_1.cudaFlags.data.cudaNonJetsonGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_1.cudaFlags.data.cudaNonJetsonGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of false, true

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)
- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_1.cudaFlags.data.cudaNonJetsonGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_1.cudaFlags.data.cudaNonJetsonGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_1.cudaFlags.data.cudaSupport

Build packages with CUDA support

*Type:*
boolean

*Default:*
`true`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_1.cudaFlags.data.defaultCapabilities

The default compute capabilities for a given CUDA version

*Type:*
list of A CUDA capability version.

*Default:*

```
[
  "3.0"
  "3.2"
  "3.5"
  "3.7"
  "5.0"
  "5.2"
  "6.0"
  "6.1"
  "7.0"
  "7.5"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_1.cudaFlags.data.defaultGpus

The default GPUs for a given CUDA version

*Type:*
list of (submodule)

*Default:*

```
[
  {
    archName = "Kepler";
    computeCapability = "3.0";
    dontDefaultAfter = "10.2";
    isJetson = false;
    maxCudaVersion = "10.2";
    minCudaVersion = "10.0";
  }
  {
    archName = "Kepler";
    computeCapability = "3.2";
    dontDefaultAfter = "10.2";
    isJetson = false;
    maxCudaVersion = "10.2";
    minCudaVersion = "10.0";
  }
  {
    archName = "Kepler";
    computeCapability = "3.5";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = "11.8";
    minCudaVersion = "10.0";
  }
  {
    archName = "Kepler";
    computeCapability = "3.7";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = "11.8";
    minCudaVersion = "10.0";
  }
  {
    archName = "Maxwell";
    computeCapability = "5.0";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Maxwell";
    computeCapability = "5.2";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.1";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Volta";
    computeCapability = "7.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Turing";
    computeCapability = "7.5";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_1.cudaFlags.data.defaultGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_1.cudaFlags.data.defaultGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_1.cudaFlags.data.defaultGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_1.cudaFlags.data.defaultGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of true, false

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_1.cudaFlags.data.defaultGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_1.cudaFlags.data.defaultGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_1.cudaFlags.data.gencodeArgs

The gencode arguments to pass to NVCC

*Type:*
list of A \`gencode\` argument for the \`nvcc\` compiler.

*Default:*

```
[
  "-gencode=arch=compute_89,code=sm_89"
]
```

*Example:*

```
[
  "-gencode=arch=compute_75,code=sm_75"
  "-gencode=arch=compute_86,code=sm_86"
  "-gencode=arch=compute_86,code=compute_86"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_1.cudaFlags.data.gencodeString

A space-separated string of CUDA gencode arguments to pass to NVCC

*Type:*
string

*Default:*
`"-gencode=arch=compute_89,code=sm_89"`

*Example:*
`"-gencode=arch=compute_75,code=sm_75 ... -gencode=arch=compute_86,code=compute_86"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_1.cudaFlags.data.isJetsonBuild

Whether the build is for a Jetson device.

Jetson devices cannot be targeted by the same binaries which target non-Jetson devices. While
NVIDIA provides both `linux-aarch64` and `linux-sbsa` packages, which both target `aarch64`,
they are built with different settings and cannot be mixed.

*Type:*
boolean

*Default:*
`false`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_1.cudaFlags.data.realArches

The physical architectures to build for

*Type:*
list of A real/physical CUDA architecture name.

*Default:*

```
[
  "sm_89"
]
```

*Example:*

```
[
  "sm_75"
  "sm_86"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_1.cudaFlags.data.supportedCapabilities

The compute capabilities supported by a given CUDA version

*Type:*
list of A CUDA capability version.

*Default:*

```
[
  "3.0"
  "3.2"
  "3.5"
  "3.7"
  "5.0"
  "5.2"
  "5.3"
  "6.0"
  "6.1"
  "6.2"
  "7.0"
  "7.2"
  "7.5"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_1.cudaFlags.data.supportedGpus

The GPUs supported by a given CUDA version

*Type:*
list of (submodule)

*Default:*

```
[
  {
    archName = "Kepler";
    computeCapability = "3.0";
    dontDefaultAfter = "10.2";
    isJetson = false;
    maxCudaVersion = "10.2";
    minCudaVersion = "10.0";
  }
  {
    archName = "Kepler";
    computeCapability = "3.2";
    dontDefaultAfter = "10.2";
    isJetson = false;
    maxCudaVersion = "10.2";
    minCudaVersion = "10.0";
  }
  {
    archName = "Kepler";
    computeCapability = "3.5";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = "11.8";
    minCudaVersion = "10.0";
  }
  {
    archName = "Kepler";
    computeCapability = "3.7";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = "11.8";
    minCudaVersion = "10.0";
  }
  {
    archName = "Maxwell";
    computeCapability = "5.0";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Maxwell";
    computeCapability = "5.2";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Maxwell";
    computeCapability = "5.3";
    dontDefaultAfter = null;
    isJetson = true;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.1";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.2";
    dontDefaultAfter = null;
    isJetson = true;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Volta";
    computeCapability = "7.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Volta";
    computeCapability = "7.2";
    dontDefaultAfter = null;
    isJetson = true;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Turing";
    computeCapability = "7.5";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_1.cudaFlags.data.supportedGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_1.cudaFlags.data.supportedGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_1.cudaFlags.data.supportedGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_1.cudaFlags.data.supportedGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of true, false

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_1.cudaFlags.data.supportedGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_1.cudaFlags.data.supportedGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_1.cudaFlags.data.virtualArches

The virtual architectures to build for. These are typically used for forward compatibility,
when trying to support an architecture newer than the CUDA version allows.

*Type:*
list of A virtual CUDA architecture name.

*Default:*

```
[
  "compute_89"
]
```

*Example:*

```
[
  "compute_75"
  "compute_86"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_1.cudaFlags.utils.archMapper

Maps a feature across a list of compute capabilities to produce a list of architectures.

For example, “sm” and \[ “8.0” “8.6” “8.7” \] yield \[ “sm_80” “sm_86” “sm_87” \].

*Type:*
function that evaluates to a(n) function that evaluates to a(n) list of string

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_1.cudaFlags.utils.dropDot

Drops dots from a string.

*Type:*
function that evaluates to a(n) string

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_1.cudaFlags.utils.gencodeMapper

Maps a feature across a list of compute capabilities to produce a list of gencode arguments.

For example, “sm” and \[ “8.0” “8.6” “8.7” \] yield \[ “-gencode=arch=compute_80,code=sm_80”
“-gencode=arch=compute_86,code=sm_86” “-gencode=arch=compute_87,code=sm_87” \].

*Type:*
function that evaluates to a(n) function that evaluates to a(n) list of string

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_1.cudaFlags.utils.getNixSystem

Maps NVIDIA redist arch to Nix system.

NOTE: This function *will* be called by unsupported systems because `cudaPackages` is part of
`all-packages.nix`, which is evaluated on all systems. As such, we need to handle unsupported
systems gracefully.

*Type:*
function that evaluates to a(n) (one of “unsupported”, “aaarch64-linux”, “x86_64-linux”, “ppc64le-linux”, “x86_64-windows”)

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_1.cudaFlags.utils.getRedistArch

Maps Nix system to NVIDIA redist arch.

NOTE: We swap out the default `linux-sbsa` redist (for server-grade ARM chips) with the
`linux-aarch64` redist (which is for Jetson devices) if we’re building any Jetson devices.
Since both are based on aarch64, we can only have one or the other, otherwise there’s an
ambiguity as to which should be used.

NOTE: This function *will* be called by unsupported systems because `cudaPackages` is part of
`all-packages.nix`, which is evaluated on all systems. As such, we need to handle unsupported
systems gracefully.

*Type:*
function that evaluates to a(n) (one of “unsupported”, “linux-aarch64”, “linux-sbsa”, “linux-x86_64”, “linux-ppc64le”, “windows-x86_64”)

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_1.cudaFlags.utils.isDefault

Whether a GPU is included in the default capabilities

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function, args: {dontDefaultAfter, isJetson}>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_1.cudaFlags.utils.isSupported

Whether a CUDA version supports a given GPU

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function, args: {maxCudaVersion, minCudaVersion}>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_1.cudaMajorMinorVersion

The major and minor version of the CUDA package set

*Type:*
string

*Default:*
`"10.1"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_10_1.cudaMajorVersion

The major version of the CUDA package set

*Type:*
string

*Default:*
`"10"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_10_1.cudaNewer

A utility to check if the CUDA version is newer than a given version

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_10_1.cudaOlder

A utility to check if the CUDA version is older than a given version

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_10_1.cudaVersion

The CUDA version of the package set

*Type:*
A version number with a major and minor component.

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_10_2

A CUDA package set for a particular version of CUDA

*Type:*
submodule

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules)

## cudaPackagesPackageSets.cudaPackages_10_2.cudaAtLeast

A utility to check if the CUDA version is at least a given version

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_10_2.cudaAtMost

A utility to check if the CUDA version is at most a given version

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_10_2.cudaFlags.data.archNames

The names of the architectures to build for

*Type:*
list of string

*Default:*
`[ ]`

*Example:*

```
[
  "Turing"
  "Ampere"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_2.cudaFlags.data.arches

The architectures to build for. Includes a virtual architecture if forward compatibility is enabled.

*Type:*
list of (A real/physical CUDA architecture name. or A virtual CUDA architecture name.)

*Default:*

```
[
  "sm_89"
]
```

*Example:*

```
[
  "sm_75"
  "sm_86"
  "compute_86"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_2.cudaFlags.data.cudaCapabilities

CUDA capabilities (hardware generations) to build for

*Type:*
list of A CUDA capability version.

*Default:*

```
[
  "8.9"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_2.cudaFlags.data.cudaForwardCompat

Build with forward compatibility gencode (+PTX) to support future GPU generations

*Type:*
boolean

*Default:*
`false`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_2.cudaFlags.data.cudaGpus

CUDA GPUs to build for

*Type:*
list of (submodule)

*Default:*
`[ ]`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_2.cudaFlags.data.cudaGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_2.cudaFlags.data.cudaGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_2.cudaFlags.data.cudaGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_2.cudaFlags.data.cudaGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of true, false

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_2.cudaFlags.data.cudaGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_2.cudaFlags.data.cudaGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_2.cudaFlags.data.cudaJetsonGpus

CUDA GPUs to build for, including only Jetson devices

*Type:*
list of (submodule)

*Default:*
`[ ]`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_2.cudaFlags.data.cudaJetsonGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_2.cudaFlags.data.cudaJetsonGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_2.cudaFlags.data.cudaJetsonGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_2.cudaFlags.data.cudaJetsonGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of true, false

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)
- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_2.cudaFlags.data.cudaJetsonGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_2.cudaFlags.data.cudaJetsonGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_2.cudaFlags.data.cudaNonJetsonGpus

CUDA GPUs to build for, excluding Jetson devices

*Type:*
list of (submodule)

*Default:*
`[ ]`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_2.cudaFlags.data.cudaNonJetsonGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_2.cudaFlags.data.cudaNonJetsonGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_2.cudaFlags.data.cudaNonJetsonGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_2.cudaFlags.data.cudaNonJetsonGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of false, true

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)
- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_2.cudaFlags.data.cudaNonJetsonGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_2.cudaFlags.data.cudaNonJetsonGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_2.cudaFlags.data.cudaSupport

Build packages with CUDA support

*Type:*
boolean

*Default:*
`true`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_2.cudaFlags.data.defaultCapabilities

The default compute capabilities for a given CUDA version

*Type:*
list of A CUDA capability version.

*Default:*

```
[
  "3.0"
  "3.2"
  "3.5"
  "3.7"
  "5.0"
  "5.2"
  "6.0"
  "6.1"
  "7.0"
  "7.5"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_2.cudaFlags.data.defaultGpus

The default GPUs for a given CUDA version

*Type:*
list of (submodule)

*Default:*

```
[
  {
    archName = "Kepler";
    computeCapability = "3.0";
    dontDefaultAfter = "10.2";
    isJetson = false;
    maxCudaVersion = "10.2";
    minCudaVersion = "10.0";
  }
  {
    archName = "Kepler";
    computeCapability = "3.2";
    dontDefaultAfter = "10.2";
    isJetson = false;
    maxCudaVersion = "10.2";
    minCudaVersion = "10.0";
  }
  {
    archName = "Kepler";
    computeCapability = "3.5";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = "11.8";
    minCudaVersion = "10.0";
  }
  {
    archName = "Kepler";
    computeCapability = "3.7";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = "11.8";
    minCudaVersion = "10.0";
  }
  {
    archName = "Maxwell";
    computeCapability = "5.0";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Maxwell";
    computeCapability = "5.2";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.1";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Volta";
    computeCapability = "7.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Turing";
    computeCapability = "7.5";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_2.cudaFlags.data.defaultGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_2.cudaFlags.data.defaultGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_2.cudaFlags.data.defaultGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_2.cudaFlags.data.defaultGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of true, false

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_2.cudaFlags.data.defaultGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_2.cudaFlags.data.defaultGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_2.cudaFlags.data.gencodeArgs

The gencode arguments to pass to NVCC

*Type:*
list of A \`gencode\` argument for the \`nvcc\` compiler.

*Default:*

```
[
  "-gencode=arch=compute_89,code=sm_89"
]
```

*Example:*

```
[
  "-gencode=arch=compute_75,code=sm_75"
  "-gencode=arch=compute_86,code=sm_86"
  "-gencode=arch=compute_86,code=compute_86"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_2.cudaFlags.data.gencodeString

A space-separated string of CUDA gencode arguments to pass to NVCC

*Type:*
string

*Default:*
`"-gencode=arch=compute_89,code=sm_89"`

*Example:*
`"-gencode=arch=compute_75,code=sm_75 ... -gencode=arch=compute_86,code=compute_86"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_2.cudaFlags.data.isJetsonBuild

Whether the build is for a Jetson device.

Jetson devices cannot be targeted by the same binaries which target non-Jetson devices. While
NVIDIA provides both `linux-aarch64` and `linux-sbsa` packages, which both target `aarch64`,
they are built with different settings and cannot be mixed.

*Type:*
boolean

*Default:*
`false`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_2.cudaFlags.data.realArches

The physical architectures to build for

*Type:*
list of A real/physical CUDA architecture name.

*Default:*

```
[
  "sm_89"
]
```

*Example:*

```
[
  "sm_75"
  "sm_86"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_2.cudaFlags.data.supportedCapabilities

The compute capabilities supported by a given CUDA version

*Type:*
list of A CUDA capability version.

*Default:*

```
[
  "3.0"
  "3.2"
  "3.5"
  "3.7"
  "5.0"
  "5.2"
  "5.3"
  "6.0"
  "6.1"
  "6.2"
  "7.0"
  "7.2"
  "7.5"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_2.cudaFlags.data.supportedGpus

The GPUs supported by a given CUDA version

*Type:*
list of (submodule)

*Default:*

```
[
  {
    archName = "Kepler";
    computeCapability = "3.0";
    dontDefaultAfter = "10.2";
    isJetson = false;
    maxCudaVersion = "10.2";
    minCudaVersion = "10.0";
  }
  {
    archName = "Kepler";
    computeCapability = "3.2";
    dontDefaultAfter = "10.2";
    isJetson = false;
    maxCudaVersion = "10.2";
    minCudaVersion = "10.0";
  }
  {
    archName = "Kepler";
    computeCapability = "3.5";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = "11.8";
    minCudaVersion = "10.0";
  }
  {
    archName = "Kepler";
    computeCapability = "3.7";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = "11.8";
    minCudaVersion = "10.0";
  }
  {
    archName = "Maxwell";
    computeCapability = "5.0";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Maxwell";
    computeCapability = "5.2";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Maxwell";
    computeCapability = "5.3";
    dontDefaultAfter = null;
    isJetson = true;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.1";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.2";
    dontDefaultAfter = null;
    isJetson = true;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Volta";
    computeCapability = "7.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Volta";
    computeCapability = "7.2";
    dontDefaultAfter = null;
    isJetson = true;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Turing";
    computeCapability = "7.5";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_2.cudaFlags.data.supportedGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_2.cudaFlags.data.supportedGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_2.cudaFlags.data.supportedGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_2.cudaFlags.data.supportedGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of true, false

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_2.cudaFlags.data.supportedGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_2.cudaFlags.data.supportedGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_2.cudaFlags.data.virtualArches

The virtual architectures to build for. These are typically used for forward compatibility,
when trying to support an architecture newer than the CUDA version allows.

*Type:*
list of A virtual CUDA architecture name.

*Default:*

```
[
  "compute_89"
]
```

*Example:*

```
[
  "compute_75"
  "compute_86"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_2.cudaFlags.utils.archMapper

Maps a feature across a list of compute capabilities to produce a list of architectures.

For example, “sm” and \[ “8.0” “8.6” “8.7” \] yield \[ “sm_80” “sm_86” “sm_87” \].

*Type:*
function that evaluates to a(n) function that evaluates to a(n) list of string

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_2.cudaFlags.utils.dropDot

Drops dots from a string.

*Type:*
function that evaluates to a(n) string

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_2.cudaFlags.utils.gencodeMapper

Maps a feature across a list of compute capabilities to produce a list of gencode arguments.

For example, “sm” and \[ “8.0” “8.6” “8.7” \] yield \[ “-gencode=arch=compute_80,code=sm_80”
“-gencode=arch=compute_86,code=sm_86” “-gencode=arch=compute_87,code=sm_87” \].

*Type:*
function that evaluates to a(n) function that evaluates to a(n) list of string

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_2.cudaFlags.utils.getNixSystem

Maps NVIDIA redist arch to Nix system.

NOTE: This function *will* be called by unsupported systems because `cudaPackages` is part of
`all-packages.nix`, which is evaluated on all systems. As such, we need to handle unsupported
systems gracefully.

*Type:*
function that evaluates to a(n) (one of “unsupported”, “aaarch64-linux”, “x86_64-linux”, “ppc64le-linux”, “x86_64-windows”)

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_2.cudaFlags.utils.getRedistArch

Maps Nix system to NVIDIA redist arch.

NOTE: We swap out the default `linux-sbsa` redist (for server-grade ARM chips) with the
`linux-aarch64` redist (which is for Jetson devices) if we’re building any Jetson devices.
Since both are based on aarch64, we can only have one or the other, otherwise there’s an
ambiguity as to which should be used.

NOTE: This function *will* be called by unsupported systems because `cudaPackages` is part of
`all-packages.nix`, which is evaluated on all systems. As such, we need to handle unsupported
systems gracefully.

*Type:*
function that evaluates to a(n) (one of “unsupported”, “linux-aarch64”, “linux-sbsa”, “linux-x86_64”, “linux-ppc64le”, “windows-x86_64”)

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_2.cudaFlags.utils.isDefault

Whether a GPU is included in the default capabilities

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function, args: {dontDefaultAfter, isJetson}>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_2.cudaFlags.utils.isSupported

Whether a CUDA version supports a given GPU

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function, args: {maxCudaVersion, minCudaVersion}>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_10_2.cudaMajorMinorVersion

The major and minor version of the CUDA package set

*Type:*
string

*Default:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_10_2.cudaMajorVersion

The major version of the CUDA package set

*Type:*
string

*Default:*
`"10"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_10_2.cudaNewer

A utility to check if the CUDA version is newer than a given version

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_10_2.cudaOlder

A utility to check if the CUDA version is older than a given version

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_10_2.cudaVersion

The CUDA version of the package set

*Type:*
A version number with a major and minor component.

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_11_0

A CUDA package set for a particular version of CUDA

*Type:*
submodule

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules)

## cudaPackagesPackageSets.cudaPackages_11_0.cudaAtLeast

A utility to check if the CUDA version is at least a given version

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_11_0.cudaAtMost

A utility to check if the CUDA version is at most a given version

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_11_0.cudaFlags.data.archNames

The names of the architectures to build for

*Type:*
list of string

*Default:*
`[ ]`

*Example:*

```
[
  "Turing"
  "Ampere"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_0.cudaFlags.data.arches

The architectures to build for. Includes a virtual architecture if forward compatibility is enabled.

*Type:*
list of (A real/physical CUDA architecture name. or A virtual CUDA architecture name.)

*Default:*

```
[
  "sm_89"
]
```

*Example:*

```
[
  "sm_75"
  "sm_86"
  "compute_86"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_0.cudaFlags.data.cudaCapabilities

CUDA capabilities (hardware generations) to build for

*Type:*
list of A CUDA capability version.

*Default:*

```
[
  "8.9"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_0.cudaFlags.data.cudaForwardCompat

Build with forward compatibility gencode (+PTX) to support future GPU generations

*Type:*
boolean

*Default:*
`false`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_0.cudaFlags.data.cudaGpus

CUDA GPUs to build for

*Type:*
list of (submodule)

*Default:*
`[ ]`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_0.cudaFlags.data.cudaGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_0.cudaFlags.data.cudaGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_0.cudaFlags.data.cudaGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_0.cudaFlags.data.cudaGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of true, false

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_0.cudaFlags.data.cudaGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_0.cudaFlags.data.cudaGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_0.cudaFlags.data.cudaJetsonGpus

CUDA GPUs to build for, including only Jetson devices

*Type:*
list of (submodule)

*Default:*
`[ ]`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_0.cudaFlags.data.cudaJetsonGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_0.cudaFlags.data.cudaJetsonGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_0.cudaFlags.data.cudaJetsonGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_0.cudaFlags.data.cudaJetsonGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of true, false

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)
- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_0.cudaFlags.data.cudaJetsonGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_0.cudaFlags.data.cudaJetsonGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_0.cudaFlags.data.cudaNonJetsonGpus

CUDA GPUs to build for, excluding Jetson devices

*Type:*
list of (submodule)

*Default:*
`[ ]`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_0.cudaFlags.data.cudaNonJetsonGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_0.cudaFlags.data.cudaNonJetsonGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_0.cudaFlags.data.cudaNonJetsonGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_0.cudaFlags.data.cudaNonJetsonGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of false, true

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)
- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_0.cudaFlags.data.cudaNonJetsonGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_0.cudaFlags.data.cudaNonJetsonGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_0.cudaFlags.data.cudaSupport

Build packages with CUDA support

*Type:*
boolean

*Default:*
`true`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_0.cudaFlags.data.defaultCapabilities

The default compute capabilities for a given CUDA version

*Type:*
list of A CUDA capability version.

*Default:*

```
[
  "3.5"
  "3.7"
  "5.0"
  "5.2"
  "6.0"
  "6.1"
  "7.0"
  "7.5"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_0.cudaFlags.data.defaultGpus

The default GPUs for a given CUDA version

*Type:*
list of (submodule)

*Default:*

```
[
  {
    archName = "Kepler";
    computeCapability = "3.5";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = "11.8";
    minCudaVersion = "10.0";
  }
  {
    archName = "Kepler";
    computeCapability = "3.7";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = "11.8";
    minCudaVersion = "10.0";
  }
  {
    archName = "Maxwell";
    computeCapability = "5.0";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Maxwell";
    computeCapability = "5.2";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.1";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Volta";
    computeCapability = "7.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Turing";
    computeCapability = "7.5";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_0.cudaFlags.data.defaultGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_0.cudaFlags.data.defaultGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_0.cudaFlags.data.defaultGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_0.cudaFlags.data.defaultGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of true, false

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_0.cudaFlags.data.defaultGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_0.cudaFlags.data.defaultGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_0.cudaFlags.data.gencodeArgs

The gencode arguments to pass to NVCC

*Type:*
list of A \`gencode\` argument for the \`nvcc\` compiler.

*Default:*

```
[
  "-gencode=arch=compute_89,code=sm_89"
]
```

*Example:*

```
[
  "-gencode=arch=compute_75,code=sm_75"
  "-gencode=arch=compute_86,code=sm_86"
  "-gencode=arch=compute_86,code=compute_86"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_0.cudaFlags.data.gencodeString

A space-separated string of CUDA gencode arguments to pass to NVCC

*Type:*
string

*Default:*
`"-gencode=arch=compute_89,code=sm_89"`

*Example:*
`"-gencode=arch=compute_75,code=sm_75 ... -gencode=arch=compute_86,code=compute_86"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_0.cudaFlags.data.isJetsonBuild

Whether the build is for a Jetson device.

Jetson devices cannot be targeted by the same binaries which target non-Jetson devices. While
NVIDIA provides both `linux-aarch64` and `linux-sbsa` packages, which both target `aarch64`,
they are built with different settings and cannot be mixed.

*Type:*
boolean

*Default:*
`false`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_0.cudaFlags.data.realArches

The physical architectures to build for

*Type:*
list of A real/physical CUDA architecture name.

*Default:*

```
[
  "sm_89"
]
```

*Example:*

```
[
  "sm_75"
  "sm_86"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_0.cudaFlags.data.supportedCapabilities

The compute capabilities supported by a given CUDA version

*Type:*
list of A CUDA capability version.

*Default:*

```
[
  "3.5"
  "3.7"
  "5.0"
  "5.2"
  "5.3"
  "6.0"
  "6.1"
  "6.2"
  "7.0"
  "7.2"
  "7.5"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_0.cudaFlags.data.supportedGpus

The GPUs supported by a given CUDA version

*Type:*
list of (submodule)

*Default:*

```
[
  {
    archName = "Kepler";
    computeCapability = "3.5";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = "11.8";
    minCudaVersion = "10.0";
  }
  {
    archName = "Kepler";
    computeCapability = "3.7";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = "11.8";
    minCudaVersion = "10.0";
  }
  {
    archName = "Maxwell";
    computeCapability = "5.0";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Maxwell";
    computeCapability = "5.2";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Maxwell";
    computeCapability = "5.3";
    dontDefaultAfter = null;
    isJetson = true;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.1";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.2";
    dontDefaultAfter = null;
    isJetson = true;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Volta";
    computeCapability = "7.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Volta";
    computeCapability = "7.2";
    dontDefaultAfter = null;
    isJetson = true;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Turing";
    computeCapability = "7.5";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_0.cudaFlags.data.supportedGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_0.cudaFlags.data.supportedGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_0.cudaFlags.data.supportedGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_0.cudaFlags.data.supportedGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of true, false

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_0.cudaFlags.data.supportedGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_0.cudaFlags.data.supportedGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_0.cudaFlags.data.virtualArches

The virtual architectures to build for. These are typically used for forward compatibility,
when trying to support an architecture newer than the CUDA version allows.

*Type:*
list of A virtual CUDA architecture name.

*Default:*

```
[
  "compute_89"
]
```

*Example:*

```
[
  "compute_75"
  "compute_86"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_0.cudaFlags.utils.archMapper

Maps a feature across a list of compute capabilities to produce a list of architectures.

For example, “sm” and \[ “8.0” “8.6” “8.7” \] yield \[ “sm_80” “sm_86” “sm_87” \].

*Type:*
function that evaluates to a(n) function that evaluates to a(n) list of string

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_0.cudaFlags.utils.dropDot

Drops dots from a string.

*Type:*
function that evaluates to a(n) string

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_0.cudaFlags.utils.gencodeMapper

Maps a feature across a list of compute capabilities to produce a list of gencode arguments.

For example, “sm” and \[ “8.0” “8.6” “8.7” \] yield \[ “-gencode=arch=compute_80,code=sm_80”
“-gencode=arch=compute_86,code=sm_86” “-gencode=arch=compute_87,code=sm_87” \].

*Type:*
function that evaluates to a(n) function that evaluates to a(n) list of string

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_0.cudaFlags.utils.getNixSystem

Maps NVIDIA redist arch to Nix system.

NOTE: This function *will* be called by unsupported systems because `cudaPackages` is part of
`all-packages.nix`, which is evaluated on all systems. As such, we need to handle unsupported
systems gracefully.

*Type:*
function that evaluates to a(n) (one of “unsupported”, “aaarch64-linux”, “x86_64-linux”, “ppc64le-linux”, “x86_64-windows”)

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_0.cudaFlags.utils.getRedistArch

Maps Nix system to NVIDIA redist arch.

NOTE: We swap out the default `linux-sbsa` redist (for server-grade ARM chips) with the
`linux-aarch64` redist (which is for Jetson devices) if we’re building any Jetson devices.
Since both are based on aarch64, we can only have one or the other, otherwise there’s an
ambiguity as to which should be used.

NOTE: This function *will* be called by unsupported systems because `cudaPackages` is part of
`all-packages.nix`, which is evaluated on all systems. As such, we need to handle unsupported
systems gracefully.

*Type:*
function that evaluates to a(n) (one of “unsupported”, “linux-aarch64”, “linux-sbsa”, “linux-x86_64”, “linux-ppc64le”, “windows-x86_64”)

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_0.cudaFlags.utils.isDefault

Whether a GPU is included in the default capabilities

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function, args: {dontDefaultAfter, isJetson}>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_0.cudaFlags.utils.isSupported

Whether a CUDA version supports a given GPU

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function, args: {maxCudaVersion, minCudaVersion}>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_0.cudaMajorMinorVersion

The major and minor version of the CUDA package set

*Type:*
string

*Default:*
`"11.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_11_0.cudaMajorVersion

The major version of the CUDA package set

*Type:*
string

*Default:*
`"11"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_11_0.cudaNewer

A utility to check if the CUDA version is newer than a given version

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_11_0.cudaOlder

A utility to check if the CUDA version is older than a given version

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_11_0.cudaVersion

The CUDA version of the package set

*Type:*
A version number with a major and minor component.

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_11_1

A CUDA package set for a particular version of CUDA

*Type:*
submodule

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules)

## cudaPackagesPackageSets.cudaPackages_11_1.cudaAtLeast

A utility to check if the CUDA version is at least a given version

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_11_1.cudaAtMost

A utility to check if the CUDA version is at most a given version

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_11_1.cudaFlags.data.archNames

The names of the architectures to build for

*Type:*
list of string

*Default:*
`[ ]`

*Example:*

```
[
  "Turing"
  "Ampere"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_1.cudaFlags.data.arches

The architectures to build for. Includes a virtual architecture if forward compatibility is enabled.

*Type:*
list of (A real/physical CUDA architecture name. or A virtual CUDA architecture name.)

*Default:*

```
[
  "sm_89"
]
```

*Example:*

```
[
  "sm_75"
  "sm_86"
  "compute_86"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_1.cudaFlags.data.cudaCapabilities

CUDA capabilities (hardware generations) to build for

*Type:*
list of A CUDA capability version.

*Default:*

```
[
  "8.9"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_1.cudaFlags.data.cudaForwardCompat

Build with forward compatibility gencode (+PTX) to support future GPU generations

*Type:*
boolean

*Default:*
`false`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_1.cudaFlags.data.cudaGpus

CUDA GPUs to build for

*Type:*
list of (submodule)

*Default:*
`[ ]`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_1.cudaFlags.data.cudaGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_1.cudaFlags.data.cudaGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_1.cudaFlags.data.cudaGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_1.cudaFlags.data.cudaGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of true, false

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_1.cudaFlags.data.cudaGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_1.cudaFlags.data.cudaGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_1.cudaFlags.data.cudaJetsonGpus

CUDA GPUs to build for, including only Jetson devices

*Type:*
list of (submodule)

*Default:*
`[ ]`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_1.cudaFlags.data.cudaJetsonGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_1.cudaFlags.data.cudaJetsonGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_1.cudaFlags.data.cudaJetsonGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_1.cudaFlags.data.cudaJetsonGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of true, false

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)
- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_1.cudaFlags.data.cudaJetsonGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_1.cudaFlags.data.cudaJetsonGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_1.cudaFlags.data.cudaNonJetsonGpus

CUDA GPUs to build for, excluding Jetson devices

*Type:*
list of (submodule)

*Default:*
`[ ]`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_1.cudaFlags.data.cudaNonJetsonGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_1.cudaFlags.data.cudaNonJetsonGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_1.cudaFlags.data.cudaNonJetsonGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_1.cudaFlags.data.cudaNonJetsonGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of false, true

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)
- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_1.cudaFlags.data.cudaNonJetsonGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_1.cudaFlags.data.cudaNonJetsonGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_1.cudaFlags.data.cudaSupport

Build packages with CUDA support

*Type:*
boolean

*Default:*
`true`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_1.cudaFlags.data.defaultCapabilities

The default compute capabilities for a given CUDA version

*Type:*
list of A CUDA capability version.

*Default:*

```
[
  "6.0"
  "6.1"
  "7.0"
  "7.5"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_1.cudaFlags.data.defaultGpus

The default GPUs for a given CUDA version

*Type:*
list of (submodule)

*Default:*

```
[
  {
    archName = "Pascal";
    computeCapability = "6.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.1";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Volta";
    computeCapability = "7.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Turing";
    computeCapability = "7.5";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_1.cudaFlags.data.defaultGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_1.cudaFlags.data.defaultGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_1.cudaFlags.data.defaultGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_1.cudaFlags.data.defaultGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of true, false

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_1.cudaFlags.data.defaultGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_1.cudaFlags.data.defaultGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_1.cudaFlags.data.gencodeArgs

The gencode arguments to pass to NVCC

*Type:*
list of A \`gencode\` argument for the \`nvcc\` compiler.

*Default:*

```
[
  "-gencode=arch=compute_89,code=sm_89"
]
```

*Example:*

```
[
  "-gencode=arch=compute_75,code=sm_75"
  "-gencode=arch=compute_86,code=sm_86"
  "-gencode=arch=compute_86,code=compute_86"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_1.cudaFlags.data.gencodeString

A space-separated string of CUDA gencode arguments to pass to NVCC

*Type:*
string

*Default:*
`"-gencode=arch=compute_89,code=sm_89"`

*Example:*
`"-gencode=arch=compute_75,code=sm_75 ... -gencode=arch=compute_86,code=compute_86"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_1.cudaFlags.data.isJetsonBuild

Whether the build is for a Jetson device.

Jetson devices cannot be targeted by the same binaries which target non-Jetson devices. While
NVIDIA provides both `linux-aarch64` and `linux-sbsa` packages, which both target `aarch64`,
they are built with different settings and cannot be mixed.

*Type:*
boolean

*Default:*
`false`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_1.cudaFlags.data.realArches

The physical architectures to build for

*Type:*
list of A real/physical CUDA architecture name.

*Default:*

```
[
  "sm_89"
]
```

*Example:*

```
[
  "sm_75"
  "sm_86"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_1.cudaFlags.data.supportedCapabilities

The compute capabilities supported by a given CUDA version

*Type:*
list of A CUDA capability version.

*Default:*

```
[
  "3.5"
  "3.7"
  "5.0"
  "5.2"
  "5.3"
  "6.0"
  "6.1"
  "6.2"
  "7.0"
  "7.2"
  "7.5"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_1.cudaFlags.data.supportedGpus

The GPUs supported by a given CUDA version

*Type:*
list of (submodule)

*Default:*

```
[
  {
    archName = "Kepler";
    computeCapability = "3.5";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = "11.8";
    minCudaVersion = "10.0";
  }
  {
    archName = "Kepler";
    computeCapability = "3.7";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = "11.8";
    minCudaVersion = "10.0";
  }
  {
    archName = "Maxwell";
    computeCapability = "5.0";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Maxwell";
    computeCapability = "5.2";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Maxwell";
    computeCapability = "5.3";
    dontDefaultAfter = null;
    isJetson = true;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.1";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.2";
    dontDefaultAfter = null;
    isJetson = true;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Volta";
    computeCapability = "7.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Volta";
    computeCapability = "7.2";
    dontDefaultAfter = null;
    isJetson = true;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Turing";
    computeCapability = "7.5";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_1.cudaFlags.data.supportedGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_1.cudaFlags.data.supportedGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_1.cudaFlags.data.supportedGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_1.cudaFlags.data.supportedGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of true, false

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_1.cudaFlags.data.supportedGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_1.cudaFlags.data.supportedGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_1.cudaFlags.data.virtualArches

The virtual architectures to build for. These are typically used for forward compatibility,
when trying to support an architecture newer than the CUDA version allows.

*Type:*
list of A virtual CUDA architecture name.

*Default:*

```
[
  "compute_89"
]
```

*Example:*

```
[
  "compute_75"
  "compute_86"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_1.cudaFlags.utils.archMapper

Maps a feature across a list of compute capabilities to produce a list of architectures.

For example, “sm” and \[ “8.0” “8.6” “8.7” \] yield \[ “sm_80” “sm_86” “sm_87” \].

*Type:*
function that evaluates to a(n) function that evaluates to a(n) list of string

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_1.cudaFlags.utils.dropDot

Drops dots from a string.

*Type:*
function that evaluates to a(n) string

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_1.cudaFlags.utils.gencodeMapper

Maps a feature across a list of compute capabilities to produce a list of gencode arguments.

For example, “sm” and \[ “8.0” “8.6” “8.7” \] yield \[ “-gencode=arch=compute_80,code=sm_80”
“-gencode=arch=compute_86,code=sm_86” “-gencode=arch=compute_87,code=sm_87” \].

*Type:*
function that evaluates to a(n) function that evaluates to a(n) list of string

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_1.cudaFlags.utils.getNixSystem

Maps NVIDIA redist arch to Nix system.

NOTE: This function *will* be called by unsupported systems because `cudaPackages` is part of
`all-packages.nix`, which is evaluated on all systems. As such, we need to handle unsupported
systems gracefully.

*Type:*
function that evaluates to a(n) (one of “unsupported”, “aaarch64-linux”, “x86_64-linux”, “ppc64le-linux”, “x86_64-windows”)

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_1.cudaFlags.utils.getRedistArch

Maps Nix system to NVIDIA redist arch.

NOTE: We swap out the default `linux-sbsa` redist (for server-grade ARM chips) with the
`linux-aarch64` redist (which is for Jetson devices) if we’re building any Jetson devices.
Since both are based on aarch64, we can only have one or the other, otherwise there’s an
ambiguity as to which should be used.

NOTE: This function *will* be called by unsupported systems because `cudaPackages` is part of
`all-packages.nix`, which is evaluated on all systems. As such, we need to handle unsupported
systems gracefully.

*Type:*
function that evaluates to a(n) (one of “unsupported”, “linux-aarch64”, “linux-sbsa”, “linux-x86_64”, “linux-ppc64le”, “windows-x86_64”)

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_1.cudaFlags.utils.isDefault

Whether a GPU is included in the default capabilities

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function, args: {dontDefaultAfter, isJetson}>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_1.cudaFlags.utils.isSupported

Whether a CUDA version supports a given GPU

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function, args: {maxCudaVersion, minCudaVersion}>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_1.cudaMajorMinorVersion

The major and minor version of the CUDA package set

*Type:*
string

*Default:*
`"11.1"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_11_1.cudaMajorVersion

The major version of the CUDA package set

*Type:*
string

*Default:*
`"11"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_11_1.cudaNewer

A utility to check if the CUDA version is newer than a given version

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_11_1.cudaOlder

A utility to check if the CUDA version is older than a given version

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_11_1.cudaVersion

The CUDA version of the package set

*Type:*
A version number with a major and minor component.

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_11_2

A CUDA package set for a particular version of CUDA

*Type:*
submodule

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules)

## cudaPackagesPackageSets.cudaPackages_11_2.cudaAtLeast

A utility to check if the CUDA version is at least a given version

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_11_2.cudaAtMost

A utility to check if the CUDA version is at most a given version

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_11_2.cudaFlags.data.archNames

The names of the architectures to build for

*Type:*
list of string

*Default:*
`[ ]`

*Example:*

```
[
  "Turing"
  "Ampere"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_2.cudaFlags.data.arches

The architectures to build for. Includes a virtual architecture if forward compatibility is enabled.

*Type:*
list of (A real/physical CUDA architecture name. or A virtual CUDA architecture name.)

*Default:*

```
[
  "sm_89"
]
```

*Example:*

```
[
  "sm_75"
  "sm_86"
  "compute_86"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_2.cudaFlags.data.cudaCapabilities

CUDA capabilities (hardware generations) to build for

*Type:*
list of A CUDA capability version.

*Default:*

```
[
  "8.9"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_2.cudaFlags.data.cudaForwardCompat

Build with forward compatibility gencode (+PTX) to support future GPU generations

*Type:*
boolean

*Default:*
`false`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_2.cudaFlags.data.cudaGpus

CUDA GPUs to build for

*Type:*
list of (submodule)

*Default:*
`[ ]`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_2.cudaFlags.data.cudaGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_2.cudaFlags.data.cudaGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_2.cudaFlags.data.cudaGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_2.cudaFlags.data.cudaGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of true, false

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_2.cudaFlags.data.cudaGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_2.cudaFlags.data.cudaGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_2.cudaFlags.data.cudaJetsonGpus

CUDA GPUs to build for, including only Jetson devices

*Type:*
list of (submodule)

*Default:*
`[ ]`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_2.cudaFlags.data.cudaJetsonGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_2.cudaFlags.data.cudaJetsonGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_2.cudaFlags.data.cudaJetsonGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_2.cudaFlags.data.cudaJetsonGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of true, false

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)
- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_2.cudaFlags.data.cudaJetsonGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_2.cudaFlags.data.cudaJetsonGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_2.cudaFlags.data.cudaNonJetsonGpus

CUDA GPUs to build for, excluding Jetson devices

*Type:*
list of (submodule)

*Default:*
`[ ]`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_2.cudaFlags.data.cudaNonJetsonGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_2.cudaFlags.data.cudaNonJetsonGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_2.cudaFlags.data.cudaNonJetsonGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_2.cudaFlags.data.cudaNonJetsonGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of false, true

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)
- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_2.cudaFlags.data.cudaNonJetsonGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_2.cudaFlags.data.cudaNonJetsonGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_2.cudaFlags.data.cudaSupport

Build packages with CUDA support

*Type:*
boolean

*Default:*
`true`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_2.cudaFlags.data.defaultCapabilities

The default compute capabilities for a given CUDA version

*Type:*
list of A CUDA capability version.

*Default:*

```
[
  "6.0"
  "6.1"
  "7.0"
  "7.5"
  "8.0"
  "8.6"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_2.cudaFlags.data.defaultGpus

The default GPUs for a given CUDA version

*Type:*
list of (submodule)

*Default:*

```
[
  {
    archName = "Pascal";
    computeCapability = "6.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.1";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Volta";
    computeCapability = "7.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Turing";
    computeCapability = "7.5";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Ampere";
    computeCapability = "8.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.2";
  }
  {
    archName = "Ampere";
    computeCapability = "8.6";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.2";
  }
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_2.cudaFlags.data.defaultGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_2.cudaFlags.data.defaultGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_2.cudaFlags.data.defaultGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_2.cudaFlags.data.defaultGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of true, false

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_2.cudaFlags.data.defaultGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_2.cudaFlags.data.defaultGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_2.cudaFlags.data.gencodeArgs

The gencode arguments to pass to NVCC

*Type:*
list of A \`gencode\` argument for the \`nvcc\` compiler.

*Default:*

```
[
  "-gencode=arch=compute_89,code=sm_89"
]
```

*Example:*

```
[
  "-gencode=arch=compute_75,code=sm_75"
  "-gencode=arch=compute_86,code=sm_86"
  "-gencode=arch=compute_86,code=compute_86"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_2.cudaFlags.data.gencodeString

A space-separated string of CUDA gencode arguments to pass to NVCC

*Type:*
string

*Default:*
`"-gencode=arch=compute_89,code=sm_89"`

*Example:*
`"-gencode=arch=compute_75,code=sm_75 ... -gencode=arch=compute_86,code=compute_86"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_2.cudaFlags.data.isJetsonBuild

Whether the build is for a Jetson device.

Jetson devices cannot be targeted by the same binaries which target non-Jetson devices. While
NVIDIA provides both `linux-aarch64` and `linux-sbsa` packages, which both target `aarch64`,
they are built with different settings and cannot be mixed.

*Type:*
boolean

*Default:*
`false`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_2.cudaFlags.data.realArches

The physical architectures to build for

*Type:*
list of A real/physical CUDA architecture name.

*Default:*

```
[
  "sm_89"
]
```

*Example:*

```
[
  "sm_75"
  "sm_86"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_2.cudaFlags.data.supportedCapabilities

The compute capabilities supported by a given CUDA version

*Type:*
list of A CUDA capability version.

*Default:*

```
[
  "3.5"
  "3.7"
  "5.0"
  "5.2"
  "5.3"
  "6.0"
  "6.1"
  "6.2"
  "7.0"
  "7.2"
  "7.5"
  "8.0"
  "8.6"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_2.cudaFlags.data.supportedGpus

The GPUs supported by a given CUDA version

*Type:*
list of (submodule)

*Default:*

```
[
  {
    archName = "Kepler";
    computeCapability = "3.5";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = "11.8";
    minCudaVersion = "10.0";
  }
  {
    archName = "Kepler";
    computeCapability = "3.7";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = "11.8";
    minCudaVersion = "10.0";
  }
  {
    archName = "Maxwell";
    computeCapability = "5.0";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Maxwell";
    computeCapability = "5.2";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Maxwell";
    computeCapability = "5.3";
    dontDefaultAfter = null;
    isJetson = true;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.1";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.2";
    dontDefaultAfter = null;
    isJetson = true;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Volta";
    computeCapability = "7.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Volta";
    computeCapability = "7.2";
    dontDefaultAfter = null;
    isJetson = true;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Turing";
    computeCapability = "7.5";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Ampere";
    computeCapability = "8.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.2";
  }
  {
    archName = "Ampere";
    computeCapability = "8.6";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.2";
  }
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_2.cudaFlags.data.supportedGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_2.cudaFlags.data.supportedGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_2.cudaFlags.data.supportedGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_2.cudaFlags.data.supportedGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of true, false

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_2.cudaFlags.data.supportedGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_2.cudaFlags.data.supportedGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_2.cudaFlags.data.virtualArches

The virtual architectures to build for. These are typically used for forward compatibility,
when trying to support an architecture newer than the CUDA version allows.

*Type:*
list of A virtual CUDA architecture name.

*Default:*

```
[
  "compute_89"
]
```

*Example:*

```
[
  "compute_75"
  "compute_86"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_2.cudaFlags.utils.archMapper

Maps a feature across a list of compute capabilities to produce a list of architectures.

For example, “sm” and \[ “8.0” “8.6” “8.7” \] yield \[ “sm_80” “sm_86” “sm_87” \].

*Type:*
function that evaluates to a(n) function that evaluates to a(n) list of string

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_2.cudaFlags.utils.dropDot

Drops dots from a string.

*Type:*
function that evaluates to a(n) string

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_2.cudaFlags.utils.gencodeMapper

Maps a feature across a list of compute capabilities to produce a list of gencode arguments.

For example, “sm” and \[ “8.0” “8.6” “8.7” \] yield \[ “-gencode=arch=compute_80,code=sm_80”
“-gencode=arch=compute_86,code=sm_86” “-gencode=arch=compute_87,code=sm_87” \].

*Type:*
function that evaluates to a(n) function that evaluates to a(n) list of string

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_2.cudaFlags.utils.getNixSystem

Maps NVIDIA redist arch to Nix system.

NOTE: This function *will* be called by unsupported systems because `cudaPackages` is part of
`all-packages.nix`, which is evaluated on all systems. As such, we need to handle unsupported
systems gracefully.

*Type:*
function that evaluates to a(n) (one of “unsupported”, “aaarch64-linux”, “x86_64-linux”, “ppc64le-linux”, “x86_64-windows”)

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_2.cudaFlags.utils.getRedistArch

Maps Nix system to NVIDIA redist arch.

NOTE: We swap out the default `linux-sbsa` redist (for server-grade ARM chips) with the
`linux-aarch64` redist (which is for Jetson devices) if we’re building any Jetson devices.
Since both are based on aarch64, we can only have one or the other, otherwise there’s an
ambiguity as to which should be used.

NOTE: This function *will* be called by unsupported systems because `cudaPackages` is part of
`all-packages.nix`, which is evaluated on all systems. As such, we need to handle unsupported
systems gracefully.

*Type:*
function that evaluates to a(n) (one of “unsupported”, “linux-aarch64”, “linux-sbsa”, “linux-x86_64”, “linux-ppc64le”, “windows-x86_64”)

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_2.cudaFlags.utils.isDefault

Whether a GPU is included in the default capabilities

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function, args: {dontDefaultAfter, isJetson}>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_2.cudaFlags.utils.isSupported

Whether a CUDA version supports a given GPU

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function, args: {maxCudaVersion, minCudaVersion}>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_2.cudaMajorMinorVersion

The major and minor version of the CUDA package set

*Type:*
string

*Default:*
`"11.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_11_2.cudaMajorVersion

The major version of the CUDA package set

*Type:*
string

*Default:*
`"11"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_11_2.cudaNewer

A utility to check if the CUDA version is newer than a given version

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_11_2.cudaOlder

A utility to check if the CUDA version is older than a given version

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_11_2.cudaVersion

The CUDA version of the package set

*Type:*
A version number with a major and minor component.

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_11_3

A CUDA package set for a particular version of CUDA

*Type:*
submodule

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules)

## cudaPackagesPackageSets.cudaPackages_11_3.cudaAtLeast

A utility to check if the CUDA version is at least a given version

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_11_3.cudaAtMost

A utility to check if the CUDA version is at most a given version

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_11_3.cudaFlags.data.archNames

The names of the architectures to build for

*Type:*
list of string

*Default:*
`[ ]`

*Example:*

```
[
  "Turing"
  "Ampere"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_3.cudaFlags.data.arches

The architectures to build for. Includes a virtual architecture if forward compatibility is enabled.

*Type:*
list of (A real/physical CUDA architecture name. or A virtual CUDA architecture name.)

*Default:*

```
[
  "sm_89"
]
```

*Example:*

```
[
  "sm_75"
  "sm_86"
  "compute_86"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_3.cudaFlags.data.cudaCapabilities

CUDA capabilities (hardware generations) to build for

*Type:*
list of A CUDA capability version.

*Default:*

```
[
  "8.9"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_3.cudaFlags.data.cudaForwardCompat

Build with forward compatibility gencode (+PTX) to support future GPU generations

*Type:*
boolean

*Default:*
`false`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_3.cudaFlags.data.cudaGpus

CUDA GPUs to build for

*Type:*
list of (submodule)

*Default:*
`[ ]`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_3.cudaFlags.data.cudaGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_3.cudaFlags.data.cudaGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_3.cudaFlags.data.cudaGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_3.cudaFlags.data.cudaGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of true, false

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_3.cudaFlags.data.cudaGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_3.cudaFlags.data.cudaGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_3.cudaFlags.data.cudaJetsonGpus

CUDA GPUs to build for, including only Jetson devices

*Type:*
list of (submodule)

*Default:*
`[ ]`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_3.cudaFlags.data.cudaJetsonGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_3.cudaFlags.data.cudaJetsonGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_3.cudaFlags.data.cudaJetsonGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_3.cudaFlags.data.cudaJetsonGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of true, false

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)
- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_3.cudaFlags.data.cudaJetsonGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_3.cudaFlags.data.cudaJetsonGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_3.cudaFlags.data.cudaNonJetsonGpus

CUDA GPUs to build for, excluding Jetson devices

*Type:*
list of (submodule)

*Default:*
`[ ]`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_3.cudaFlags.data.cudaNonJetsonGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_3.cudaFlags.data.cudaNonJetsonGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_3.cudaFlags.data.cudaNonJetsonGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_3.cudaFlags.data.cudaNonJetsonGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of false, true

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)
- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_3.cudaFlags.data.cudaNonJetsonGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_3.cudaFlags.data.cudaNonJetsonGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_3.cudaFlags.data.cudaSupport

Build packages with CUDA support

*Type:*
boolean

*Default:*
`true`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_3.cudaFlags.data.defaultCapabilities

The default compute capabilities for a given CUDA version

*Type:*
list of A CUDA capability version.

*Default:*

```
[
  "6.0"
  "6.1"
  "7.0"
  "7.5"
  "8.0"
  "8.6"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_3.cudaFlags.data.defaultGpus

The default GPUs for a given CUDA version

*Type:*
list of (submodule)

*Default:*

```
[
  {
    archName = "Pascal";
    computeCapability = "6.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.1";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Volta";
    computeCapability = "7.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Turing";
    computeCapability = "7.5";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Ampere";
    computeCapability = "8.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.2";
  }
  {
    archName = "Ampere";
    computeCapability = "8.6";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.2";
  }
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_3.cudaFlags.data.defaultGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_3.cudaFlags.data.defaultGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_3.cudaFlags.data.defaultGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_3.cudaFlags.data.defaultGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of true, false

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_3.cudaFlags.data.defaultGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_3.cudaFlags.data.defaultGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_3.cudaFlags.data.gencodeArgs

The gencode arguments to pass to NVCC

*Type:*
list of A \`gencode\` argument for the \`nvcc\` compiler.

*Default:*

```
[
  "-gencode=arch=compute_89,code=sm_89"
]
```

*Example:*

```
[
  "-gencode=arch=compute_75,code=sm_75"
  "-gencode=arch=compute_86,code=sm_86"
  "-gencode=arch=compute_86,code=compute_86"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_3.cudaFlags.data.gencodeString

A space-separated string of CUDA gencode arguments to pass to NVCC

*Type:*
string

*Default:*
`"-gencode=arch=compute_89,code=sm_89"`

*Example:*
`"-gencode=arch=compute_75,code=sm_75 ... -gencode=arch=compute_86,code=compute_86"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_3.cudaFlags.data.isJetsonBuild

Whether the build is for a Jetson device.

Jetson devices cannot be targeted by the same binaries which target non-Jetson devices. While
NVIDIA provides both `linux-aarch64` and `linux-sbsa` packages, which both target `aarch64`,
they are built with different settings and cannot be mixed.

*Type:*
boolean

*Default:*
`false`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_3.cudaFlags.data.realArches

The physical architectures to build for

*Type:*
list of A real/physical CUDA architecture name.

*Default:*

```
[
  "sm_89"
]
```

*Example:*

```
[
  "sm_75"
  "sm_86"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_3.cudaFlags.data.supportedCapabilities

The compute capabilities supported by a given CUDA version

*Type:*
list of A CUDA capability version.

*Default:*

```
[
  "3.5"
  "3.7"
  "5.0"
  "5.2"
  "5.3"
  "6.0"
  "6.1"
  "6.2"
  "7.0"
  "7.2"
  "7.5"
  "8.0"
  "8.6"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_3.cudaFlags.data.supportedGpus

The GPUs supported by a given CUDA version

*Type:*
list of (submodule)

*Default:*

```
[
  {
    archName = "Kepler";
    computeCapability = "3.5";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = "11.8";
    minCudaVersion = "10.0";
  }
  {
    archName = "Kepler";
    computeCapability = "3.7";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = "11.8";
    minCudaVersion = "10.0";
  }
  {
    archName = "Maxwell";
    computeCapability = "5.0";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Maxwell";
    computeCapability = "5.2";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Maxwell";
    computeCapability = "5.3";
    dontDefaultAfter = null;
    isJetson = true;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.1";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.2";
    dontDefaultAfter = null;
    isJetson = true;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Volta";
    computeCapability = "7.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Volta";
    computeCapability = "7.2";
    dontDefaultAfter = null;
    isJetson = true;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Turing";
    computeCapability = "7.5";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Ampere";
    computeCapability = "8.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.2";
  }
  {
    archName = "Ampere";
    computeCapability = "8.6";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.2";
  }
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_3.cudaFlags.data.supportedGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_3.cudaFlags.data.supportedGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_3.cudaFlags.data.supportedGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_3.cudaFlags.data.supportedGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of true, false

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_3.cudaFlags.data.supportedGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_3.cudaFlags.data.supportedGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_3.cudaFlags.data.virtualArches

The virtual architectures to build for. These are typically used for forward compatibility,
when trying to support an architecture newer than the CUDA version allows.

*Type:*
list of A virtual CUDA architecture name.

*Default:*

```
[
  "compute_89"
]
```

*Example:*

```
[
  "compute_75"
  "compute_86"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_3.cudaFlags.utils.archMapper

Maps a feature across a list of compute capabilities to produce a list of architectures.

For example, “sm” and \[ “8.0” “8.6” “8.7” \] yield \[ “sm_80” “sm_86” “sm_87” \].

*Type:*
function that evaluates to a(n) function that evaluates to a(n) list of string

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_3.cudaFlags.utils.dropDot

Drops dots from a string.

*Type:*
function that evaluates to a(n) string

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_3.cudaFlags.utils.gencodeMapper

Maps a feature across a list of compute capabilities to produce a list of gencode arguments.

For example, “sm” and \[ “8.0” “8.6” “8.7” \] yield \[ “-gencode=arch=compute_80,code=sm_80”
“-gencode=arch=compute_86,code=sm_86” “-gencode=arch=compute_87,code=sm_87” \].

*Type:*
function that evaluates to a(n) function that evaluates to a(n) list of string

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_3.cudaFlags.utils.getNixSystem

Maps NVIDIA redist arch to Nix system.

NOTE: This function *will* be called by unsupported systems because `cudaPackages` is part of
`all-packages.nix`, which is evaluated on all systems. As such, we need to handle unsupported
systems gracefully.

*Type:*
function that evaluates to a(n) (one of “unsupported”, “aaarch64-linux”, “x86_64-linux”, “ppc64le-linux”, “x86_64-windows”)

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_3.cudaFlags.utils.getRedistArch

Maps Nix system to NVIDIA redist arch.

NOTE: We swap out the default `linux-sbsa` redist (for server-grade ARM chips) with the
`linux-aarch64` redist (which is for Jetson devices) if we’re building any Jetson devices.
Since both are based on aarch64, we can only have one or the other, otherwise there’s an
ambiguity as to which should be used.

NOTE: This function *will* be called by unsupported systems because `cudaPackages` is part of
`all-packages.nix`, which is evaluated on all systems. As such, we need to handle unsupported
systems gracefully.

*Type:*
function that evaluates to a(n) (one of “unsupported”, “linux-aarch64”, “linux-sbsa”, “linux-x86_64”, “linux-ppc64le”, “windows-x86_64”)

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_3.cudaFlags.utils.isDefault

Whether a GPU is included in the default capabilities

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function, args: {dontDefaultAfter, isJetson}>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_3.cudaFlags.utils.isSupported

Whether a CUDA version supports a given GPU

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function, args: {maxCudaVersion, minCudaVersion}>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_3.cudaMajorMinorVersion

The major and minor version of the CUDA package set

*Type:*
string

*Default:*
`"11.3"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_11_3.cudaMajorVersion

The major version of the CUDA package set

*Type:*
string

*Default:*
`"11"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_11_3.cudaNewer

A utility to check if the CUDA version is newer than a given version

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_11_3.cudaOlder

A utility to check if the CUDA version is older than a given version

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_11_3.cudaVersion

The CUDA version of the package set

*Type:*
A version number with a major and minor component.

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_11_4

A CUDA package set for a particular version of CUDA

*Type:*
submodule

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules)

## cudaPackagesPackageSets.cudaPackages_11_4.cudaAtLeast

A utility to check if the CUDA version is at least a given version

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_11_4.cudaAtMost

A utility to check if the CUDA version is at most a given version

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_11_4.cudaFlags.data.archNames

The names of the architectures to build for

*Type:*
list of string

*Default:*
`[ ]`

*Example:*

```
[
  "Turing"
  "Ampere"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_4.cudaFlags.data.arches

The architectures to build for. Includes a virtual architecture if forward compatibility is enabled.

*Type:*
list of (A real/physical CUDA architecture name. or A virtual CUDA architecture name.)

*Default:*

```
[
  "sm_89"
]
```

*Example:*

```
[
  "sm_75"
  "sm_86"
  "compute_86"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_4.cudaFlags.data.cudaCapabilities

CUDA capabilities (hardware generations) to build for

*Type:*
list of A CUDA capability version.

*Default:*

```
[
  "8.9"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_4.cudaFlags.data.cudaForwardCompat

Build with forward compatibility gencode (+PTX) to support future GPU generations

*Type:*
boolean

*Default:*
`false`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_4.cudaFlags.data.cudaGpus

CUDA GPUs to build for

*Type:*
list of (submodule)

*Default:*
`[ ]`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_4.cudaFlags.data.cudaGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_4.cudaFlags.data.cudaGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_4.cudaFlags.data.cudaGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_4.cudaFlags.data.cudaGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of true, false

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_4.cudaFlags.data.cudaGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_4.cudaFlags.data.cudaGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_4.cudaFlags.data.cudaJetsonGpus

CUDA GPUs to build for, including only Jetson devices

*Type:*
list of (submodule)

*Default:*
`[ ]`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_4.cudaFlags.data.cudaJetsonGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_4.cudaFlags.data.cudaJetsonGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_4.cudaFlags.data.cudaJetsonGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_4.cudaFlags.data.cudaJetsonGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of true, false

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)
- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_4.cudaFlags.data.cudaJetsonGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_4.cudaFlags.data.cudaJetsonGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_4.cudaFlags.data.cudaNonJetsonGpus

CUDA GPUs to build for, excluding Jetson devices

*Type:*
list of (submodule)

*Default:*
`[ ]`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_4.cudaFlags.data.cudaNonJetsonGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_4.cudaFlags.data.cudaNonJetsonGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_4.cudaFlags.data.cudaNonJetsonGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_4.cudaFlags.data.cudaNonJetsonGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of false, true

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)
- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_4.cudaFlags.data.cudaNonJetsonGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_4.cudaFlags.data.cudaNonJetsonGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_4.cudaFlags.data.cudaSupport

Build packages with CUDA support

*Type:*
boolean

*Default:*
`true`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_4.cudaFlags.data.defaultCapabilities

The default compute capabilities for a given CUDA version

*Type:*
list of A CUDA capability version.

*Default:*

```
[
  "6.0"
  "6.1"
  "7.0"
  "7.5"
  "8.0"
  "8.6"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_4.cudaFlags.data.defaultGpus

The default GPUs for a given CUDA version

*Type:*
list of (submodule)

*Default:*

```
[
  {
    archName = "Pascal";
    computeCapability = "6.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.1";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Volta";
    computeCapability = "7.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Turing";
    computeCapability = "7.5";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Ampere";
    computeCapability = "8.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.2";
  }
  {
    archName = "Ampere";
    computeCapability = "8.6";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.2";
  }
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_4.cudaFlags.data.defaultGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_4.cudaFlags.data.defaultGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_4.cudaFlags.data.defaultGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_4.cudaFlags.data.defaultGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of true, false

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_4.cudaFlags.data.defaultGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_4.cudaFlags.data.defaultGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_4.cudaFlags.data.gencodeArgs

The gencode arguments to pass to NVCC

*Type:*
list of A \`gencode\` argument for the \`nvcc\` compiler.

*Default:*

```
[
  "-gencode=arch=compute_89,code=sm_89"
]
```

*Example:*

```
[
  "-gencode=arch=compute_75,code=sm_75"
  "-gencode=arch=compute_86,code=sm_86"
  "-gencode=arch=compute_86,code=compute_86"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_4.cudaFlags.data.gencodeString

A space-separated string of CUDA gencode arguments to pass to NVCC

*Type:*
string

*Default:*
`"-gencode=arch=compute_89,code=sm_89"`

*Example:*
`"-gencode=arch=compute_75,code=sm_75 ... -gencode=arch=compute_86,code=compute_86"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_4.cudaFlags.data.isJetsonBuild

Whether the build is for a Jetson device.

Jetson devices cannot be targeted by the same binaries which target non-Jetson devices. While
NVIDIA provides both `linux-aarch64` and `linux-sbsa` packages, which both target `aarch64`,
they are built with different settings and cannot be mixed.

*Type:*
boolean

*Default:*
`false`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_4.cudaFlags.data.realArches

The physical architectures to build for

*Type:*
list of A real/physical CUDA architecture name.

*Default:*

```
[
  "sm_89"
]
```

*Example:*

```
[
  "sm_75"
  "sm_86"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_4.cudaFlags.data.supportedCapabilities

The compute capabilities supported by a given CUDA version

*Type:*
list of A CUDA capability version.

*Default:*

```
[
  "3.5"
  "3.7"
  "5.0"
  "5.2"
  "5.3"
  "6.0"
  "6.1"
  "6.2"
  "7.0"
  "7.2"
  "7.5"
  "8.0"
  "8.6"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_4.cudaFlags.data.supportedGpus

The GPUs supported by a given CUDA version

*Type:*
list of (submodule)

*Default:*

```
[
  {
    archName = "Kepler";
    computeCapability = "3.5";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = "11.8";
    minCudaVersion = "10.0";
  }
  {
    archName = "Kepler";
    computeCapability = "3.7";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = "11.8";
    minCudaVersion = "10.0";
  }
  {
    archName = "Maxwell";
    computeCapability = "5.0";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Maxwell";
    computeCapability = "5.2";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Maxwell";
    computeCapability = "5.3";
    dontDefaultAfter = null;
    isJetson = true;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.1";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.2";
    dontDefaultAfter = null;
    isJetson = true;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Volta";
    computeCapability = "7.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Volta";
    computeCapability = "7.2";
    dontDefaultAfter = null;
    isJetson = true;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Turing";
    computeCapability = "7.5";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Ampere";
    computeCapability = "8.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.2";
  }
  {
    archName = "Ampere";
    computeCapability = "8.6";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.2";
  }
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_4.cudaFlags.data.supportedGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_4.cudaFlags.data.supportedGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_4.cudaFlags.data.supportedGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_4.cudaFlags.data.supportedGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of true, false

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_4.cudaFlags.data.supportedGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_4.cudaFlags.data.supportedGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_4.cudaFlags.data.virtualArches

The virtual architectures to build for. These are typically used for forward compatibility,
when trying to support an architecture newer than the CUDA version allows.

*Type:*
list of A virtual CUDA architecture name.

*Default:*

```
[
  "compute_89"
]
```

*Example:*

```
[
  "compute_75"
  "compute_86"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_4.cudaFlags.utils.archMapper

Maps a feature across a list of compute capabilities to produce a list of architectures.

For example, “sm” and \[ “8.0” “8.6” “8.7” \] yield \[ “sm_80” “sm_86” “sm_87” \].

*Type:*
function that evaluates to a(n) function that evaluates to a(n) list of string

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_4.cudaFlags.utils.dropDot

Drops dots from a string.

*Type:*
function that evaluates to a(n) string

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_4.cudaFlags.utils.gencodeMapper

Maps a feature across a list of compute capabilities to produce a list of gencode arguments.

For example, “sm” and \[ “8.0” “8.6” “8.7” \] yield \[ “-gencode=arch=compute_80,code=sm_80”
“-gencode=arch=compute_86,code=sm_86” “-gencode=arch=compute_87,code=sm_87” \].

*Type:*
function that evaluates to a(n) function that evaluates to a(n) list of string

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_4.cudaFlags.utils.getNixSystem

Maps NVIDIA redist arch to Nix system.

NOTE: This function *will* be called by unsupported systems because `cudaPackages` is part of
`all-packages.nix`, which is evaluated on all systems. As such, we need to handle unsupported
systems gracefully.

*Type:*
function that evaluates to a(n) (one of “unsupported”, “aaarch64-linux”, “x86_64-linux”, “ppc64le-linux”, “x86_64-windows”)

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_4.cudaFlags.utils.getRedistArch

Maps Nix system to NVIDIA redist arch.

NOTE: We swap out the default `linux-sbsa` redist (for server-grade ARM chips) with the
`linux-aarch64` redist (which is for Jetson devices) if we’re building any Jetson devices.
Since both are based on aarch64, we can only have one or the other, otherwise there’s an
ambiguity as to which should be used.

NOTE: This function *will* be called by unsupported systems because `cudaPackages` is part of
`all-packages.nix`, which is evaluated on all systems. As such, we need to handle unsupported
systems gracefully.

*Type:*
function that evaluates to a(n) (one of “unsupported”, “linux-aarch64”, “linux-sbsa”, “linux-x86_64”, “linux-ppc64le”, “windows-x86_64”)

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_4.cudaFlags.utils.isDefault

Whether a GPU is included in the default capabilities

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function, args: {dontDefaultAfter, isJetson}>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_4.cudaFlags.utils.isSupported

Whether a CUDA version supports a given GPU

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function, args: {maxCudaVersion, minCudaVersion}>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_4.cudaMajorMinorVersion

The major and minor version of the CUDA package set

*Type:*
string

*Default:*
`"11.4"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_11_4.cudaMajorVersion

The major version of the CUDA package set

*Type:*
string

*Default:*
`"11"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_11_4.cudaNewer

A utility to check if the CUDA version is newer than a given version

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_11_4.cudaOlder

A utility to check if the CUDA version is older than a given version

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_11_4.cudaVersion

The CUDA version of the package set

*Type:*
A version number with a major and minor component.

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_11_5

A CUDA package set for a particular version of CUDA

*Type:*
submodule

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules)

## cudaPackagesPackageSets.cudaPackages_11_5.cudaAtLeast

A utility to check if the CUDA version is at least a given version

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_11_5.cudaAtMost

A utility to check if the CUDA version is at most a given version

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_11_5.cudaFlags.data.archNames

The names of the architectures to build for

*Type:*
list of string

*Default:*
`[ ]`

*Example:*

```
[
  "Turing"
  "Ampere"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_5.cudaFlags.data.arches

The architectures to build for. Includes a virtual architecture if forward compatibility is enabled.

*Type:*
list of (A real/physical CUDA architecture name. or A virtual CUDA architecture name.)

*Default:*

```
[
  "sm_89"
]
```

*Example:*

```
[
  "sm_75"
  "sm_86"
  "compute_86"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_5.cudaFlags.data.cudaCapabilities

CUDA capabilities (hardware generations) to build for

*Type:*
list of A CUDA capability version.

*Default:*

```
[
  "8.9"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_5.cudaFlags.data.cudaForwardCompat

Build with forward compatibility gencode (+PTX) to support future GPU generations

*Type:*
boolean

*Default:*
`false`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_5.cudaFlags.data.cudaGpus

CUDA GPUs to build for

*Type:*
list of (submodule)

*Default:*
`[ ]`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_5.cudaFlags.data.cudaGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_5.cudaFlags.data.cudaGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_5.cudaFlags.data.cudaGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_5.cudaFlags.data.cudaGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of true, false

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_5.cudaFlags.data.cudaGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_5.cudaFlags.data.cudaGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_5.cudaFlags.data.cudaJetsonGpus

CUDA GPUs to build for, including only Jetson devices

*Type:*
list of (submodule)

*Default:*
`[ ]`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_5.cudaFlags.data.cudaJetsonGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_5.cudaFlags.data.cudaJetsonGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_5.cudaFlags.data.cudaJetsonGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_5.cudaFlags.data.cudaJetsonGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of true, false

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)
- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_5.cudaFlags.data.cudaJetsonGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_5.cudaFlags.data.cudaJetsonGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_5.cudaFlags.data.cudaNonJetsonGpus

CUDA GPUs to build for, excluding Jetson devices

*Type:*
list of (submodule)

*Default:*
`[ ]`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_5.cudaFlags.data.cudaNonJetsonGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_5.cudaFlags.data.cudaNonJetsonGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_5.cudaFlags.data.cudaNonJetsonGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_5.cudaFlags.data.cudaNonJetsonGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of false, true

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)
- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_5.cudaFlags.data.cudaNonJetsonGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_5.cudaFlags.data.cudaNonJetsonGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_5.cudaFlags.data.cudaSupport

Build packages with CUDA support

*Type:*
boolean

*Default:*
`true`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_5.cudaFlags.data.defaultCapabilities

The default compute capabilities for a given CUDA version

*Type:*
list of A CUDA capability version.

*Default:*

```
[
  "6.0"
  "6.1"
  "7.0"
  "7.5"
  "8.0"
  "8.6"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_5.cudaFlags.data.defaultGpus

The default GPUs for a given CUDA version

*Type:*
list of (submodule)

*Default:*

```
[
  {
    archName = "Pascal";
    computeCapability = "6.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.1";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Volta";
    computeCapability = "7.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Turing";
    computeCapability = "7.5";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Ampere";
    computeCapability = "8.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.2";
  }
  {
    archName = "Ampere";
    computeCapability = "8.6";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.2";
  }
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_5.cudaFlags.data.defaultGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_5.cudaFlags.data.defaultGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_5.cudaFlags.data.defaultGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_5.cudaFlags.data.defaultGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of true, false

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_5.cudaFlags.data.defaultGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_5.cudaFlags.data.defaultGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_5.cudaFlags.data.gencodeArgs

The gencode arguments to pass to NVCC

*Type:*
list of A \`gencode\` argument for the \`nvcc\` compiler.

*Default:*

```
[
  "-gencode=arch=compute_89,code=sm_89"
]
```

*Example:*

```
[
  "-gencode=arch=compute_75,code=sm_75"
  "-gencode=arch=compute_86,code=sm_86"
  "-gencode=arch=compute_86,code=compute_86"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_5.cudaFlags.data.gencodeString

A space-separated string of CUDA gencode arguments to pass to NVCC

*Type:*
string

*Default:*
`"-gencode=arch=compute_89,code=sm_89"`

*Example:*
`"-gencode=arch=compute_75,code=sm_75 ... -gencode=arch=compute_86,code=compute_86"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_5.cudaFlags.data.isJetsonBuild

Whether the build is for a Jetson device.

Jetson devices cannot be targeted by the same binaries which target non-Jetson devices. While
NVIDIA provides both `linux-aarch64` and `linux-sbsa` packages, which both target `aarch64`,
they are built with different settings and cannot be mixed.

*Type:*
boolean

*Default:*
`false`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_5.cudaFlags.data.realArches

The physical architectures to build for

*Type:*
list of A real/physical CUDA architecture name.

*Default:*

```
[
  "sm_89"
]
```

*Example:*

```
[
  "sm_75"
  "sm_86"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_5.cudaFlags.data.supportedCapabilities

The compute capabilities supported by a given CUDA version

*Type:*
list of A CUDA capability version.

*Default:*

```
[
  "3.5"
  "3.7"
  "5.0"
  "5.2"
  "5.3"
  "6.0"
  "6.1"
  "6.2"
  "7.0"
  "7.2"
  "7.5"
  "8.0"
  "8.6"
  "8.7"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_5.cudaFlags.data.supportedGpus

The GPUs supported by a given CUDA version

*Type:*
list of (submodule)

*Default:*

```
[
  {
    archName = "Kepler";
    computeCapability = "3.5";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = "11.8";
    minCudaVersion = "10.0";
  }
  {
    archName = "Kepler";
    computeCapability = "3.7";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = "11.8";
    minCudaVersion = "10.0";
  }
  {
    archName = "Maxwell";
    computeCapability = "5.0";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Maxwell";
    computeCapability = "5.2";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Maxwell";
    computeCapability = "5.3";
    dontDefaultAfter = null;
    isJetson = true;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.1";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.2";
    dontDefaultAfter = null;
    isJetson = true;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Volta";
    computeCapability = "7.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Volta";
    computeCapability = "7.2";
    dontDefaultAfter = null;
    isJetson = true;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Turing";
    computeCapability = "7.5";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Ampere";
    computeCapability = "8.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.2";
  }
  {
    archName = "Ampere";
    computeCapability = "8.6";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.2";
  }
  {
    archName = "Ampere";
    computeCapability = "8.7";
    dontDefaultAfter = null;
    isJetson = true;
    maxCudaVersion = null;
    minCudaVersion = "11.5";
  }
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_5.cudaFlags.data.supportedGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_5.cudaFlags.data.supportedGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_5.cudaFlags.data.supportedGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_5.cudaFlags.data.supportedGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of true, false

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_5.cudaFlags.data.supportedGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_5.cudaFlags.data.supportedGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_5.cudaFlags.data.virtualArches

The virtual architectures to build for. These are typically used for forward compatibility,
when trying to support an architecture newer than the CUDA version allows.

*Type:*
list of A virtual CUDA architecture name.

*Default:*

```
[
  "compute_89"
]
```

*Example:*

```
[
  "compute_75"
  "compute_86"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_5.cudaFlags.utils.archMapper

Maps a feature across a list of compute capabilities to produce a list of architectures.

For example, “sm” and \[ “8.0” “8.6” “8.7” \] yield \[ “sm_80” “sm_86” “sm_87” \].

*Type:*
function that evaluates to a(n) function that evaluates to a(n) list of string

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_5.cudaFlags.utils.dropDot

Drops dots from a string.

*Type:*
function that evaluates to a(n) string

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_5.cudaFlags.utils.gencodeMapper

Maps a feature across a list of compute capabilities to produce a list of gencode arguments.

For example, “sm” and \[ “8.0” “8.6” “8.7” \] yield \[ “-gencode=arch=compute_80,code=sm_80”
“-gencode=arch=compute_86,code=sm_86” “-gencode=arch=compute_87,code=sm_87” \].

*Type:*
function that evaluates to a(n) function that evaluates to a(n) list of string

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_5.cudaFlags.utils.getNixSystem

Maps NVIDIA redist arch to Nix system.

NOTE: This function *will* be called by unsupported systems because `cudaPackages` is part of
`all-packages.nix`, which is evaluated on all systems. As such, we need to handle unsupported
systems gracefully.

*Type:*
function that evaluates to a(n) (one of “unsupported”, “aaarch64-linux”, “x86_64-linux”, “ppc64le-linux”, “x86_64-windows”)

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_5.cudaFlags.utils.getRedistArch

Maps Nix system to NVIDIA redist arch.

NOTE: We swap out the default `linux-sbsa` redist (for server-grade ARM chips) with the
`linux-aarch64` redist (which is for Jetson devices) if we’re building any Jetson devices.
Since both are based on aarch64, we can only have one or the other, otherwise there’s an
ambiguity as to which should be used.

NOTE: This function *will* be called by unsupported systems because `cudaPackages` is part of
`all-packages.nix`, which is evaluated on all systems. As such, we need to handle unsupported
systems gracefully.

*Type:*
function that evaluates to a(n) (one of “unsupported”, “linux-aarch64”, “linux-sbsa”, “linux-x86_64”, “linux-ppc64le”, “windows-x86_64”)

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_5.cudaFlags.utils.isDefault

Whether a GPU is included in the default capabilities

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function, args: {dontDefaultAfter, isJetson}>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_5.cudaFlags.utils.isSupported

Whether a CUDA version supports a given GPU

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function, args: {maxCudaVersion, minCudaVersion}>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_5.cudaMajorMinorVersion

The major and minor version of the CUDA package set

*Type:*
string

*Default:*
`"11.5"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_11_5.cudaMajorVersion

The major version of the CUDA package set

*Type:*
string

*Default:*
`"11"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_11_5.cudaNewer

A utility to check if the CUDA version is newer than a given version

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_11_5.cudaOlder

A utility to check if the CUDA version is older than a given version

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_11_5.cudaVersion

The CUDA version of the package set

*Type:*
A version number with a major and minor component.

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_11_6

A CUDA package set for a particular version of CUDA

*Type:*
submodule

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules)

## cudaPackagesPackageSets.cudaPackages_11_6.cudaAtLeast

A utility to check if the CUDA version is at least a given version

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_11_6.cudaAtMost

A utility to check if the CUDA version is at most a given version

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_11_6.cudaFlags.data.archNames

The names of the architectures to build for

*Type:*
list of string

*Default:*
`[ ]`

*Example:*

```
[
  "Turing"
  "Ampere"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_6.cudaFlags.data.arches

The architectures to build for. Includes a virtual architecture if forward compatibility is enabled.

*Type:*
list of (A real/physical CUDA architecture name. or A virtual CUDA architecture name.)

*Default:*

```
[
  "sm_89"
]
```

*Example:*

```
[
  "sm_75"
  "sm_86"
  "compute_86"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_6.cudaFlags.data.cudaCapabilities

CUDA capabilities (hardware generations) to build for

*Type:*
list of A CUDA capability version.

*Default:*

```
[
  "8.9"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_6.cudaFlags.data.cudaForwardCompat

Build with forward compatibility gencode (+PTX) to support future GPU generations

*Type:*
boolean

*Default:*
`false`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_6.cudaFlags.data.cudaGpus

CUDA GPUs to build for

*Type:*
list of (submodule)

*Default:*
`[ ]`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_6.cudaFlags.data.cudaGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_6.cudaFlags.data.cudaGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_6.cudaFlags.data.cudaGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_6.cudaFlags.data.cudaGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of true, false

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_6.cudaFlags.data.cudaGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_6.cudaFlags.data.cudaGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_6.cudaFlags.data.cudaJetsonGpus

CUDA GPUs to build for, including only Jetson devices

*Type:*
list of (submodule)

*Default:*
`[ ]`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_6.cudaFlags.data.cudaJetsonGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_6.cudaFlags.data.cudaJetsonGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_6.cudaFlags.data.cudaJetsonGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_6.cudaFlags.data.cudaJetsonGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of true, false

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)
- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_6.cudaFlags.data.cudaJetsonGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_6.cudaFlags.data.cudaJetsonGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_6.cudaFlags.data.cudaNonJetsonGpus

CUDA GPUs to build for, excluding Jetson devices

*Type:*
list of (submodule)

*Default:*
`[ ]`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_6.cudaFlags.data.cudaNonJetsonGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_6.cudaFlags.data.cudaNonJetsonGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_6.cudaFlags.data.cudaNonJetsonGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_6.cudaFlags.data.cudaNonJetsonGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of false, true

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)
- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_6.cudaFlags.data.cudaNonJetsonGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_6.cudaFlags.data.cudaNonJetsonGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_6.cudaFlags.data.cudaSupport

Build packages with CUDA support

*Type:*
boolean

*Default:*
`true`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_6.cudaFlags.data.defaultCapabilities

The default compute capabilities for a given CUDA version

*Type:*
list of A CUDA capability version.

*Default:*

```
[
  "6.0"
  "6.1"
  "7.0"
  "7.5"
  "8.0"
  "8.6"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_6.cudaFlags.data.defaultGpus

The default GPUs for a given CUDA version

*Type:*
list of (submodule)

*Default:*

```
[
  {
    archName = "Pascal";
    computeCapability = "6.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.1";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Volta";
    computeCapability = "7.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Turing";
    computeCapability = "7.5";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Ampere";
    computeCapability = "8.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.2";
  }
  {
    archName = "Ampere";
    computeCapability = "8.6";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.2";
  }
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_6.cudaFlags.data.defaultGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_6.cudaFlags.data.defaultGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_6.cudaFlags.data.defaultGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_6.cudaFlags.data.defaultGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of true, false

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_6.cudaFlags.data.defaultGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_6.cudaFlags.data.defaultGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_6.cudaFlags.data.gencodeArgs

The gencode arguments to pass to NVCC

*Type:*
list of A \`gencode\` argument for the \`nvcc\` compiler.

*Default:*

```
[
  "-gencode=arch=compute_89,code=sm_89"
]
```

*Example:*

```
[
  "-gencode=arch=compute_75,code=sm_75"
  "-gencode=arch=compute_86,code=sm_86"
  "-gencode=arch=compute_86,code=compute_86"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_6.cudaFlags.data.gencodeString

A space-separated string of CUDA gencode arguments to pass to NVCC

*Type:*
string

*Default:*
`"-gencode=arch=compute_89,code=sm_89"`

*Example:*
`"-gencode=arch=compute_75,code=sm_75 ... -gencode=arch=compute_86,code=compute_86"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_6.cudaFlags.data.isJetsonBuild

Whether the build is for a Jetson device.

Jetson devices cannot be targeted by the same binaries which target non-Jetson devices. While
NVIDIA provides both `linux-aarch64` and `linux-sbsa` packages, which both target `aarch64`,
they are built with different settings and cannot be mixed.

*Type:*
boolean

*Default:*
`false`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_6.cudaFlags.data.realArches

The physical architectures to build for

*Type:*
list of A real/physical CUDA architecture name.

*Default:*

```
[
  "sm_89"
]
```

*Example:*

```
[
  "sm_75"
  "sm_86"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_6.cudaFlags.data.supportedCapabilities

The compute capabilities supported by a given CUDA version

*Type:*
list of A CUDA capability version.

*Default:*

```
[
  "3.5"
  "3.7"
  "5.0"
  "5.2"
  "5.3"
  "6.0"
  "6.1"
  "6.2"
  "7.0"
  "7.2"
  "7.5"
  "8.0"
  "8.6"
  "8.7"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_6.cudaFlags.data.supportedGpus

The GPUs supported by a given CUDA version

*Type:*
list of (submodule)

*Default:*

```
[
  {
    archName = "Kepler";
    computeCapability = "3.5";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = "11.8";
    minCudaVersion = "10.0";
  }
  {
    archName = "Kepler";
    computeCapability = "3.7";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = "11.8";
    minCudaVersion = "10.0";
  }
  {
    archName = "Maxwell";
    computeCapability = "5.0";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Maxwell";
    computeCapability = "5.2";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Maxwell";
    computeCapability = "5.3";
    dontDefaultAfter = null;
    isJetson = true;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.1";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.2";
    dontDefaultAfter = null;
    isJetson = true;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Volta";
    computeCapability = "7.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Volta";
    computeCapability = "7.2";
    dontDefaultAfter = null;
    isJetson = true;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Turing";
    computeCapability = "7.5";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Ampere";
    computeCapability = "8.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.2";
  }
  {
    archName = "Ampere";
    computeCapability = "8.6";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.2";
  }
  {
    archName = "Ampere";
    computeCapability = "8.7";
    dontDefaultAfter = null;
    isJetson = true;
    maxCudaVersion = null;
    minCudaVersion = "11.5";
  }
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_6.cudaFlags.data.supportedGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_6.cudaFlags.data.supportedGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_6.cudaFlags.data.supportedGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_6.cudaFlags.data.supportedGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of true, false

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_6.cudaFlags.data.supportedGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_6.cudaFlags.data.supportedGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_6.cudaFlags.data.virtualArches

The virtual architectures to build for. These are typically used for forward compatibility,
when trying to support an architecture newer than the CUDA version allows.

*Type:*
list of A virtual CUDA architecture name.

*Default:*

```
[
  "compute_89"
]
```

*Example:*

```
[
  "compute_75"
  "compute_86"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_6.cudaFlags.utils.archMapper

Maps a feature across a list of compute capabilities to produce a list of architectures.

For example, “sm” and \[ “8.0” “8.6” “8.7” \] yield \[ “sm_80” “sm_86” “sm_87” \].

*Type:*
function that evaluates to a(n) function that evaluates to a(n) list of string

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_6.cudaFlags.utils.dropDot

Drops dots from a string.

*Type:*
function that evaluates to a(n) string

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_6.cudaFlags.utils.gencodeMapper

Maps a feature across a list of compute capabilities to produce a list of gencode arguments.

For example, “sm” and \[ “8.0” “8.6” “8.7” \] yield \[ “-gencode=arch=compute_80,code=sm_80”
“-gencode=arch=compute_86,code=sm_86” “-gencode=arch=compute_87,code=sm_87” \].

*Type:*
function that evaluates to a(n) function that evaluates to a(n) list of string

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_6.cudaFlags.utils.getNixSystem

Maps NVIDIA redist arch to Nix system.

NOTE: This function *will* be called by unsupported systems because `cudaPackages` is part of
`all-packages.nix`, which is evaluated on all systems. As such, we need to handle unsupported
systems gracefully.

*Type:*
function that evaluates to a(n) (one of “unsupported”, “aaarch64-linux”, “x86_64-linux”, “ppc64le-linux”, “x86_64-windows”)

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_6.cudaFlags.utils.getRedistArch

Maps Nix system to NVIDIA redist arch.

NOTE: We swap out the default `linux-sbsa` redist (for server-grade ARM chips) with the
`linux-aarch64` redist (which is for Jetson devices) if we’re building any Jetson devices.
Since both are based on aarch64, we can only have one or the other, otherwise there’s an
ambiguity as to which should be used.

NOTE: This function *will* be called by unsupported systems because `cudaPackages` is part of
`all-packages.nix`, which is evaluated on all systems. As such, we need to handle unsupported
systems gracefully.

*Type:*
function that evaluates to a(n) (one of “unsupported”, “linux-aarch64”, “linux-sbsa”, “linux-x86_64”, “linux-ppc64le”, “windows-x86_64”)

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_6.cudaFlags.utils.isDefault

Whether a GPU is included in the default capabilities

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function, args: {dontDefaultAfter, isJetson}>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_6.cudaFlags.utils.isSupported

Whether a CUDA version supports a given GPU

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function, args: {maxCudaVersion, minCudaVersion}>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_6.cudaMajorMinorVersion

The major and minor version of the CUDA package set

*Type:*
string

*Default:*
`"11.6"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_11_6.cudaMajorVersion

The major version of the CUDA package set

*Type:*
string

*Default:*
`"11"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_11_6.cudaNewer

A utility to check if the CUDA version is newer than a given version

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_11_6.cudaOlder

A utility to check if the CUDA version is older than a given version

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_11_6.cudaVersion

The CUDA version of the package set

*Type:*
A version number with a major and minor component.

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_11_7

A CUDA package set for a particular version of CUDA

*Type:*
submodule

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules)

## cudaPackagesPackageSets.cudaPackages_11_7.cudaAtLeast

A utility to check if the CUDA version is at least a given version

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_11_7.cudaAtMost

A utility to check if the CUDA version is at most a given version

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_11_7.cudaFlags.data.archNames

The names of the architectures to build for

*Type:*
list of string

*Default:*
`[ ]`

*Example:*

```
[
  "Turing"
  "Ampere"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_7.cudaFlags.data.arches

The architectures to build for. Includes a virtual architecture if forward compatibility is enabled.

*Type:*
list of (A real/physical CUDA architecture name. or A virtual CUDA architecture name.)

*Default:*

```
[
  "sm_89"
]
```

*Example:*

```
[
  "sm_75"
  "sm_86"
  "compute_86"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_7.cudaFlags.data.cudaCapabilities

CUDA capabilities (hardware generations) to build for

*Type:*
list of A CUDA capability version.

*Default:*

```
[
  "8.9"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_7.cudaFlags.data.cudaForwardCompat

Build with forward compatibility gencode (+PTX) to support future GPU generations

*Type:*
boolean

*Default:*
`false`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_7.cudaFlags.data.cudaGpus

CUDA GPUs to build for

*Type:*
list of (submodule)

*Default:*
`[ ]`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_7.cudaFlags.data.cudaGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_7.cudaFlags.data.cudaGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_7.cudaFlags.data.cudaGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_7.cudaFlags.data.cudaGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of true, false

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_7.cudaFlags.data.cudaGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_7.cudaFlags.data.cudaGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_7.cudaFlags.data.cudaJetsonGpus

CUDA GPUs to build for, including only Jetson devices

*Type:*
list of (submodule)

*Default:*
`[ ]`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_7.cudaFlags.data.cudaJetsonGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_7.cudaFlags.data.cudaJetsonGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_7.cudaFlags.data.cudaJetsonGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_7.cudaFlags.data.cudaJetsonGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of true, false

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)
- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_7.cudaFlags.data.cudaJetsonGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_7.cudaFlags.data.cudaJetsonGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_7.cudaFlags.data.cudaNonJetsonGpus

CUDA GPUs to build for, excluding Jetson devices

*Type:*
list of (submodule)

*Default:*
`[ ]`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_7.cudaFlags.data.cudaNonJetsonGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_7.cudaFlags.data.cudaNonJetsonGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_7.cudaFlags.data.cudaNonJetsonGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_7.cudaFlags.data.cudaNonJetsonGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of false, true

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)
- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_7.cudaFlags.data.cudaNonJetsonGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_7.cudaFlags.data.cudaNonJetsonGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_7.cudaFlags.data.cudaSupport

Build packages with CUDA support

*Type:*
boolean

*Default:*
`true`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_7.cudaFlags.data.defaultCapabilities

The default compute capabilities for a given CUDA version

*Type:*
list of A CUDA capability version.

*Default:*

```
[
  "6.0"
  "6.1"
  "7.0"
  "7.5"
  "8.0"
  "8.6"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_7.cudaFlags.data.defaultGpus

The default GPUs for a given CUDA version

*Type:*
list of (submodule)

*Default:*

```
[
  {
    archName = "Pascal";
    computeCapability = "6.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.1";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Volta";
    computeCapability = "7.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Turing";
    computeCapability = "7.5";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Ampere";
    computeCapability = "8.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.2";
  }
  {
    archName = "Ampere";
    computeCapability = "8.6";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.2";
  }
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_7.cudaFlags.data.defaultGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_7.cudaFlags.data.defaultGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_7.cudaFlags.data.defaultGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_7.cudaFlags.data.defaultGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of true, false

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_7.cudaFlags.data.defaultGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_7.cudaFlags.data.defaultGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_7.cudaFlags.data.gencodeArgs

The gencode arguments to pass to NVCC

*Type:*
list of A \`gencode\` argument for the \`nvcc\` compiler.

*Default:*

```
[
  "-gencode=arch=compute_89,code=sm_89"
]
```

*Example:*

```
[
  "-gencode=arch=compute_75,code=sm_75"
  "-gencode=arch=compute_86,code=sm_86"
  "-gencode=arch=compute_86,code=compute_86"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_7.cudaFlags.data.gencodeString

A space-separated string of CUDA gencode arguments to pass to NVCC

*Type:*
string

*Default:*
`"-gencode=arch=compute_89,code=sm_89"`

*Example:*
`"-gencode=arch=compute_75,code=sm_75 ... -gencode=arch=compute_86,code=compute_86"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_7.cudaFlags.data.isJetsonBuild

Whether the build is for a Jetson device.

Jetson devices cannot be targeted by the same binaries which target non-Jetson devices. While
NVIDIA provides both `linux-aarch64` and `linux-sbsa` packages, which both target `aarch64`,
they are built with different settings and cannot be mixed.

*Type:*
boolean

*Default:*
`false`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_7.cudaFlags.data.realArches

The physical architectures to build for

*Type:*
list of A real/physical CUDA architecture name.

*Default:*

```
[
  "sm_89"
]
```

*Example:*

```
[
  "sm_75"
  "sm_86"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_7.cudaFlags.data.supportedCapabilities

The compute capabilities supported by a given CUDA version

*Type:*
list of A CUDA capability version.

*Default:*

```
[
  "3.5"
  "3.7"
  "5.0"
  "5.2"
  "5.3"
  "6.0"
  "6.1"
  "6.2"
  "7.0"
  "7.2"
  "7.5"
  "8.0"
  "8.6"
  "8.7"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_7.cudaFlags.data.supportedGpus

The GPUs supported by a given CUDA version

*Type:*
list of (submodule)

*Default:*

```
[
  {
    archName = "Kepler";
    computeCapability = "3.5";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = "11.8";
    minCudaVersion = "10.0";
  }
  {
    archName = "Kepler";
    computeCapability = "3.7";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = "11.8";
    minCudaVersion = "10.0";
  }
  {
    archName = "Maxwell";
    computeCapability = "5.0";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Maxwell";
    computeCapability = "5.2";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Maxwell";
    computeCapability = "5.3";
    dontDefaultAfter = null;
    isJetson = true;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.1";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.2";
    dontDefaultAfter = null;
    isJetson = true;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Volta";
    computeCapability = "7.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Volta";
    computeCapability = "7.2";
    dontDefaultAfter = null;
    isJetson = true;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Turing";
    computeCapability = "7.5";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Ampere";
    computeCapability = "8.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.2";
  }
  {
    archName = "Ampere";
    computeCapability = "8.6";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.2";
  }
  {
    archName = "Ampere";
    computeCapability = "8.7";
    dontDefaultAfter = null;
    isJetson = true;
    maxCudaVersion = null;
    minCudaVersion = "11.5";
  }
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_7.cudaFlags.data.supportedGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_7.cudaFlags.data.supportedGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_7.cudaFlags.data.supportedGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_7.cudaFlags.data.supportedGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of true, false

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_7.cudaFlags.data.supportedGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_7.cudaFlags.data.supportedGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_7.cudaFlags.data.virtualArches

The virtual architectures to build for. These are typically used for forward compatibility,
when trying to support an architecture newer than the CUDA version allows.

*Type:*
list of A virtual CUDA architecture name.

*Default:*

```
[
  "compute_89"
]
```

*Example:*

```
[
  "compute_75"
  "compute_86"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_7.cudaFlags.utils.archMapper

Maps a feature across a list of compute capabilities to produce a list of architectures.

For example, “sm” and \[ “8.0” “8.6” “8.7” \] yield \[ “sm_80” “sm_86” “sm_87” \].

*Type:*
function that evaluates to a(n) function that evaluates to a(n) list of string

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_7.cudaFlags.utils.dropDot

Drops dots from a string.

*Type:*
function that evaluates to a(n) string

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_7.cudaFlags.utils.gencodeMapper

Maps a feature across a list of compute capabilities to produce a list of gencode arguments.

For example, “sm” and \[ “8.0” “8.6” “8.7” \] yield \[ “-gencode=arch=compute_80,code=sm_80”
“-gencode=arch=compute_86,code=sm_86” “-gencode=arch=compute_87,code=sm_87” \].

*Type:*
function that evaluates to a(n) function that evaluates to a(n) list of string

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_7.cudaFlags.utils.getNixSystem

Maps NVIDIA redist arch to Nix system.

NOTE: This function *will* be called by unsupported systems because `cudaPackages` is part of
`all-packages.nix`, which is evaluated on all systems. As such, we need to handle unsupported
systems gracefully.

*Type:*
function that evaluates to a(n) (one of “unsupported”, “aaarch64-linux”, “x86_64-linux”, “ppc64le-linux”, “x86_64-windows”)

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_7.cudaFlags.utils.getRedistArch

Maps Nix system to NVIDIA redist arch.

NOTE: We swap out the default `linux-sbsa` redist (for server-grade ARM chips) with the
`linux-aarch64` redist (which is for Jetson devices) if we’re building any Jetson devices.
Since both are based on aarch64, we can only have one or the other, otherwise there’s an
ambiguity as to which should be used.

NOTE: This function *will* be called by unsupported systems because `cudaPackages` is part of
`all-packages.nix`, which is evaluated on all systems. As such, we need to handle unsupported
systems gracefully.

*Type:*
function that evaluates to a(n) (one of “unsupported”, “linux-aarch64”, “linux-sbsa”, “linux-x86_64”, “linux-ppc64le”, “windows-x86_64”)

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_7.cudaFlags.utils.isDefault

Whether a GPU is included in the default capabilities

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function, args: {dontDefaultAfter, isJetson}>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_7.cudaFlags.utils.isSupported

Whether a CUDA version supports a given GPU

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function, args: {maxCudaVersion, minCudaVersion}>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_7.cudaMajorMinorVersion

The major and minor version of the CUDA package set

*Type:*
string

*Default:*
`"11.7"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_11_7.cudaMajorVersion

The major version of the CUDA package set

*Type:*
string

*Default:*
`"11"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_11_7.cudaNewer

A utility to check if the CUDA version is newer than a given version

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_11_7.cudaOlder

A utility to check if the CUDA version is older than a given version

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_11_7.cudaVersion

The CUDA version of the package set

*Type:*
A version number with a major and minor component.

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_11_8

A CUDA package set for a particular version of CUDA

*Type:*
submodule

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules)

## cudaPackagesPackageSets.cudaPackages_11_8.cudaAtLeast

A utility to check if the CUDA version is at least a given version

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_11_8.cudaAtMost

A utility to check if the CUDA version is at most a given version

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_11_8.cudaFlags.data.archNames

The names of the architectures to build for

*Type:*
list of string

*Default:*

```
[
  "Ada"
]
```

*Example:*

```
[
  "Turing"
  "Ampere"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_8.cudaFlags.data.arches

The architectures to build for. Includes a virtual architecture if forward compatibility is enabled.

*Type:*
list of (A real/physical CUDA architecture name. or A virtual CUDA architecture name.)

*Default:*

```
[
  "sm_89"
]
```

*Example:*

```
[
  "sm_75"
  "sm_86"
  "compute_86"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_8.cudaFlags.data.cudaCapabilities

CUDA capabilities (hardware generations) to build for

*Type:*
list of A CUDA capability version.

*Default:*

```
[
  "8.9"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_8.cudaFlags.data.cudaForwardCompat

Build with forward compatibility gencode (+PTX) to support future GPU generations

*Type:*
boolean

*Default:*
`false`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_8.cudaFlags.data.cudaGpus

CUDA GPUs to build for

*Type:*
list of (submodule)

*Default:*

```
[
  {
    archName = "Ada";
    computeCapability = "8.9";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.8";
  }
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_8.cudaFlags.data.cudaGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_8.cudaFlags.data.cudaGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_8.cudaFlags.data.cudaGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_8.cudaFlags.data.cudaGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of true, false

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_8.cudaFlags.data.cudaGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_8.cudaFlags.data.cudaGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_8.cudaFlags.data.cudaJetsonGpus

CUDA GPUs to build for, including only Jetson devices

*Type:*
list of (submodule)

*Default:*
`[ ]`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_8.cudaFlags.data.cudaJetsonGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_8.cudaFlags.data.cudaJetsonGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_8.cudaFlags.data.cudaJetsonGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_8.cudaFlags.data.cudaJetsonGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of true, false

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)
- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_8.cudaFlags.data.cudaJetsonGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_8.cudaFlags.data.cudaJetsonGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_8.cudaFlags.data.cudaNonJetsonGpus

CUDA GPUs to build for, excluding Jetson devices

*Type:*
list of (submodule)

*Default:*

```
[
  {
    archName = "Ada";
    computeCapability = "8.9";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.8";
  }
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_8.cudaFlags.data.cudaNonJetsonGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_8.cudaFlags.data.cudaNonJetsonGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_8.cudaFlags.data.cudaNonJetsonGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_8.cudaFlags.data.cudaNonJetsonGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of false, true

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)
- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_8.cudaFlags.data.cudaNonJetsonGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_8.cudaFlags.data.cudaNonJetsonGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_8.cudaFlags.data.cudaSupport

Build packages with CUDA support

*Type:*
boolean

*Default:*
`true`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_8.cudaFlags.data.defaultCapabilities

The default compute capabilities for a given CUDA version

*Type:*
list of A CUDA capability version.

*Default:*

```
[
  "6.0"
  "6.1"
  "7.0"
  "7.5"
  "8.0"
  "8.6"
  "8.9"
  "9.0"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_8.cudaFlags.data.defaultGpus

The default GPUs for a given CUDA version

*Type:*
list of (submodule)

*Default:*

```
[
  {
    archName = "Pascal";
    computeCapability = "6.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.1";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Volta";
    computeCapability = "7.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Turing";
    computeCapability = "7.5";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Ampere";
    computeCapability = "8.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.2";
  }
  {
    archName = "Ampere";
    computeCapability = "8.6";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.2";
  }
  {
    archName = "Ada";
    computeCapability = "8.9";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.8";
  }
  {
    archName = "Hopper";
    computeCapability = "9.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.8";
  }
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_8.cudaFlags.data.defaultGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_8.cudaFlags.data.defaultGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_8.cudaFlags.data.defaultGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_8.cudaFlags.data.defaultGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of true, false

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_8.cudaFlags.data.defaultGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_8.cudaFlags.data.defaultGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_8.cudaFlags.data.gencodeArgs

The gencode arguments to pass to NVCC

*Type:*
list of A \`gencode\` argument for the \`nvcc\` compiler.

*Default:*

```
[
  "-gencode=arch=compute_89,code=sm_89"
]
```

*Example:*

```
[
  "-gencode=arch=compute_75,code=sm_75"
  "-gencode=arch=compute_86,code=sm_86"
  "-gencode=arch=compute_86,code=compute_86"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_8.cudaFlags.data.gencodeString

A space-separated string of CUDA gencode arguments to pass to NVCC

*Type:*
string

*Default:*
`"-gencode=arch=compute_89,code=sm_89"`

*Example:*
`"-gencode=arch=compute_75,code=sm_75 ... -gencode=arch=compute_86,code=compute_86"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_8.cudaFlags.data.isJetsonBuild

Whether the build is for a Jetson device.

Jetson devices cannot be targeted by the same binaries which target non-Jetson devices. While
NVIDIA provides both `linux-aarch64` and `linux-sbsa` packages, which both target `aarch64`,
they are built with different settings and cannot be mixed.

*Type:*
boolean

*Default:*
`false`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_8.cudaFlags.data.realArches

The physical architectures to build for

*Type:*
list of A real/physical CUDA architecture name.

*Default:*

```
[
  "sm_89"
]
```

*Example:*

```
[
  "sm_75"
  "sm_86"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_8.cudaFlags.data.supportedCapabilities

The compute capabilities supported by a given CUDA version

*Type:*
list of A CUDA capability version.

*Default:*

```
[
  "3.5"
  "3.7"
  "5.0"
  "5.2"
  "5.3"
  "6.0"
  "6.1"
  "6.2"
  "7.0"
  "7.2"
  "7.5"
  "8.0"
  "8.6"
  "8.7"
  "8.9"
  "9.0"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_8.cudaFlags.data.supportedGpus

The GPUs supported by a given CUDA version

*Type:*
list of (submodule)

*Default:*

```
[
  {
    archName = "Kepler";
    computeCapability = "3.5";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = "11.8";
    minCudaVersion = "10.0";
  }
  {
    archName = "Kepler";
    computeCapability = "3.7";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = "11.8";
    minCudaVersion = "10.0";
  }
  {
    archName = "Maxwell";
    computeCapability = "5.0";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Maxwell";
    computeCapability = "5.2";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Maxwell";
    computeCapability = "5.3";
    dontDefaultAfter = null;
    isJetson = true;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.1";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.2";
    dontDefaultAfter = null;
    isJetson = true;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Volta";
    computeCapability = "7.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Volta";
    computeCapability = "7.2";
    dontDefaultAfter = null;
    isJetson = true;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Turing";
    computeCapability = "7.5";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Ampere";
    computeCapability = "8.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.2";
  }
  {
    archName = "Ampere";
    computeCapability = "8.6";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.2";
  }
  {
    archName = "Ampere";
    computeCapability = "8.7";
    dontDefaultAfter = null;
    isJetson = true;
    maxCudaVersion = null;
    minCudaVersion = "11.5";
  }
  {
    archName = "Ada";
    computeCapability = "8.9";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.8";
  }
  {
    archName = "Hopper";
    computeCapability = "9.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.8";
  }
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_8.cudaFlags.data.supportedGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_8.cudaFlags.data.supportedGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_8.cudaFlags.data.supportedGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_8.cudaFlags.data.supportedGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of true, false

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_8.cudaFlags.data.supportedGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_8.cudaFlags.data.supportedGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_8.cudaFlags.data.virtualArches

The virtual architectures to build for. These are typically used for forward compatibility,
when trying to support an architecture newer than the CUDA version allows.

*Type:*
list of A virtual CUDA architecture name.

*Default:*

```
[
  "compute_89"
]
```

*Example:*

```
[
  "compute_75"
  "compute_86"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_8.cudaFlags.utils.archMapper

Maps a feature across a list of compute capabilities to produce a list of architectures.

For example, “sm” and \[ “8.0” “8.6” “8.7” \] yield \[ “sm_80” “sm_86” “sm_87” \].

*Type:*
function that evaluates to a(n) function that evaluates to a(n) list of string

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_8.cudaFlags.utils.dropDot

Drops dots from a string.

*Type:*
function that evaluates to a(n) string

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_8.cudaFlags.utils.gencodeMapper

Maps a feature across a list of compute capabilities to produce a list of gencode arguments.

For example, “sm” and \[ “8.0” “8.6” “8.7” \] yield \[ “-gencode=arch=compute_80,code=sm_80”
“-gencode=arch=compute_86,code=sm_86” “-gencode=arch=compute_87,code=sm_87” \].

*Type:*
function that evaluates to a(n) function that evaluates to a(n) list of string

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_8.cudaFlags.utils.getNixSystem

Maps NVIDIA redist arch to Nix system.

NOTE: This function *will* be called by unsupported systems because `cudaPackages` is part of
`all-packages.nix`, which is evaluated on all systems. As such, we need to handle unsupported
systems gracefully.

*Type:*
function that evaluates to a(n) (one of “unsupported”, “aaarch64-linux”, “x86_64-linux”, “ppc64le-linux”, “x86_64-windows”)

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_8.cudaFlags.utils.getRedistArch

Maps Nix system to NVIDIA redist arch.

NOTE: We swap out the default `linux-sbsa` redist (for server-grade ARM chips) with the
`linux-aarch64` redist (which is for Jetson devices) if we’re building any Jetson devices.
Since both are based on aarch64, we can only have one or the other, otherwise there’s an
ambiguity as to which should be used.

NOTE: This function *will* be called by unsupported systems because `cudaPackages` is part of
`all-packages.nix`, which is evaluated on all systems. As such, we need to handle unsupported
systems gracefully.

*Type:*
function that evaluates to a(n) (one of “unsupported”, “linux-aarch64”, “linux-sbsa”, “linux-x86_64”, “linux-ppc64le”, “windows-x86_64”)

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_8.cudaFlags.utils.isDefault

Whether a GPU is included in the default capabilities

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function, args: {dontDefaultAfter, isJetson}>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_8.cudaFlags.utils.isSupported

Whether a CUDA version supports a given GPU

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function, args: {maxCudaVersion, minCudaVersion}>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_11_8.cudaMajorMinorVersion

The major and minor version of the CUDA package set

*Type:*
string

*Default:*
`"11.8"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_11_8.cudaMajorVersion

The major version of the CUDA package set

*Type:*
string

*Default:*
`"11"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_11_8.cudaNewer

A utility to check if the CUDA version is newer than a given version

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_11_8.cudaOlder

A utility to check if the CUDA version is older than a given version

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_11_8.cudaVersion

The CUDA version of the package set

*Type:*
A version number with a major and minor component.

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_12_0

A CUDA package set for a particular version of CUDA

*Type:*
submodule

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules)

## cudaPackagesPackageSets.cudaPackages_12_0.cudaAtLeast

A utility to check if the CUDA version is at least a given version

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_12_0.cudaAtMost

A utility to check if the CUDA version is at most a given version

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_12_0.cudaFlags.data.archNames

The names of the architectures to build for

*Type:*
list of string

*Default:*

```
[
  "Ada"
]
```

*Example:*

```
[
  "Turing"
  "Ampere"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_0.cudaFlags.data.arches

The architectures to build for. Includes a virtual architecture if forward compatibility is enabled.

*Type:*
list of (A real/physical CUDA architecture name. or A virtual CUDA architecture name.)

*Default:*

```
[
  "sm_89"
]
```

*Example:*

```
[
  "sm_75"
  "sm_86"
  "compute_86"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_0.cudaFlags.data.cudaCapabilities

CUDA capabilities (hardware generations) to build for

*Type:*
list of A CUDA capability version.

*Default:*

```
[
  "8.9"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_0.cudaFlags.data.cudaForwardCompat

Build with forward compatibility gencode (+PTX) to support future GPU generations

*Type:*
boolean

*Default:*
`false`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_0.cudaFlags.data.cudaGpus

CUDA GPUs to build for

*Type:*
list of (submodule)

*Default:*

```
[
  {
    archName = "Ada";
    computeCapability = "8.9";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.8";
  }
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_0.cudaFlags.data.cudaGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_0.cudaFlags.data.cudaGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_0.cudaFlags.data.cudaGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_0.cudaFlags.data.cudaGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of true, false

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_0.cudaFlags.data.cudaGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_0.cudaFlags.data.cudaGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_0.cudaFlags.data.cudaJetsonGpus

CUDA GPUs to build for, including only Jetson devices

*Type:*
list of (submodule)

*Default:*
`[ ]`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_0.cudaFlags.data.cudaJetsonGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_0.cudaFlags.data.cudaJetsonGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_0.cudaFlags.data.cudaJetsonGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_0.cudaFlags.data.cudaJetsonGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of true, false

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)
- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_0.cudaFlags.data.cudaJetsonGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_0.cudaFlags.data.cudaJetsonGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_0.cudaFlags.data.cudaNonJetsonGpus

CUDA GPUs to build for, excluding Jetson devices

*Type:*
list of (submodule)

*Default:*

```
[
  {
    archName = "Ada";
    computeCapability = "8.9";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.8";
  }
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_0.cudaFlags.data.cudaNonJetsonGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_0.cudaFlags.data.cudaNonJetsonGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_0.cudaFlags.data.cudaNonJetsonGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_0.cudaFlags.data.cudaNonJetsonGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of false, true

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)
- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_0.cudaFlags.data.cudaNonJetsonGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_0.cudaFlags.data.cudaNonJetsonGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_0.cudaFlags.data.cudaSupport

Build packages with CUDA support

*Type:*
boolean

*Default:*
`true`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_0.cudaFlags.data.defaultCapabilities

The default compute capabilities for a given CUDA version

*Type:*
list of A CUDA capability version.

*Default:*

```
[
  "6.0"
  "6.1"
  "7.0"
  "7.5"
  "8.0"
  "8.6"
  "8.9"
  "9.0"
  "9.0a"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_0.cudaFlags.data.defaultGpus

The default GPUs for a given CUDA version

*Type:*
list of (submodule)

*Default:*

```
[
  {
    archName = "Pascal";
    computeCapability = "6.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.1";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Volta";
    computeCapability = "7.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Turing";
    computeCapability = "7.5";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Ampere";
    computeCapability = "8.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.2";
  }
  {
    archName = "Ampere";
    computeCapability = "8.6";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.2";
  }
  {
    archName = "Ada";
    computeCapability = "8.9";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.8";
  }
  {
    archName = "Hopper";
    computeCapability = "9.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.8";
  }
  {
    archName = "Hopper";
    computeCapability = "9.0a";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "12.0";
  }
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_0.cudaFlags.data.defaultGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_0.cudaFlags.data.defaultGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_0.cudaFlags.data.defaultGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_0.cudaFlags.data.defaultGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of true, false

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_0.cudaFlags.data.defaultGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_0.cudaFlags.data.defaultGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_0.cudaFlags.data.gencodeArgs

The gencode arguments to pass to NVCC

*Type:*
list of A \`gencode\` argument for the \`nvcc\` compiler.

*Default:*

```
[
  "-gencode=arch=compute_89,code=sm_89"
]
```

*Example:*

```
[
  "-gencode=arch=compute_75,code=sm_75"
  "-gencode=arch=compute_86,code=sm_86"
  "-gencode=arch=compute_86,code=compute_86"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_0.cudaFlags.data.gencodeString

A space-separated string of CUDA gencode arguments to pass to NVCC

*Type:*
string

*Default:*
`"-gencode=arch=compute_89,code=sm_89"`

*Example:*
`"-gencode=arch=compute_75,code=sm_75 ... -gencode=arch=compute_86,code=compute_86"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_0.cudaFlags.data.isJetsonBuild

Whether the build is for a Jetson device.

Jetson devices cannot be targeted by the same binaries which target non-Jetson devices. While
NVIDIA provides both `linux-aarch64` and `linux-sbsa` packages, which both target `aarch64`,
they are built with different settings and cannot be mixed.

*Type:*
boolean

*Default:*
`false`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_0.cudaFlags.data.realArches

The physical architectures to build for

*Type:*
list of A real/physical CUDA architecture name.

*Default:*

```
[
  "sm_89"
]
```

*Example:*

```
[
  "sm_75"
  "sm_86"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_0.cudaFlags.data.supportedCapabilities

The compute capabilities supported by a given CUDA version

*Type:*
list of A CUDA capability version.

*Default:*

```
[
  "5.0"
  "5.2"
  "5.3"
  "6.0"
  "6.1"
  "6.2"
  "7.0"
  "7.2"
  "7.5"
  "8.0"
  "8.6"
  "8.7"
  "8.9"
  "9.0"
  "9.0a"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_0.cudaFlags.data.supportedGpus

The GPUs supported by a given CUDA version

*Type:*
list of (submodule)

*Default:*

```
[
  {
    archName = "Maxwell";
    computeCapability = "5.0";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Maxwell";
    computeCapability = "5.2";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Maxwell";
    computeCapability = "5.3";
    dontDefaultAfter = null;
    isJetson = true;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.1";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.2";
    dontDefaultAfter = null;
    isJetson = true;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Volta";
    computeCapability = "7.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Volta";
    computeCapability = "7.2";
    dontDefaultAfter = null;
    isJetson = true;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Turing";
    computeCapability = "7.5";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Ampere";
    computeCapability = "8.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.2";
  }
  {
    archName = "Ampere";
    computeCapability = "8.6";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.2";
  }
  {
    archName = "Ampere";
    computeCapability = "8.7";
    dontDefaultAfter = null;
    isJetson = true;
    maxCudaVersion = null;
    minCudaVersion = "11.5";
  }
  {
    archName = "Ada";
    computeCapability = "8.9";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.8";
  }
  {
    archName = "Hopper";
    computeCapability = "9.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.8";
  }
  {
    archName = "Hopper";
    computeCapability = "9.0a";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "12.0";
  }
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_0.cudaFlags.data.supportedGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_0.cudaFlags.data.supportedGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_0.cudaFlags.data.supportedGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_0.cudaFlags.data.supportedGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of true, false

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_0.cudaFlags.data.supportedGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_0.cudaFlags.data.supportedGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_0.cudaFlags.data.virtualArches

The virtual architectures to build for. These are typically used for forward compatibility,
when trying to support an architecture newer than the CUDA version allows.

*Type:*
list of A virtual CUDA architecture name.

*Default:*

```
[
  "compute_89"
]
```

*Example:*

```
[
  "compute_75"
  "compute_86"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_0.cudaFlags.utils.archMapper

Maps a feature across a list of compute capabilities to produce a list of architectures.

For example, “sm” and \[ “8.0” “8.6” “8.7” \] yield \[ “sm_80” “sm_86” “sm_87” \].

*Type:*
function that evaluates to a(n) function that evaluates to a(n) list of string

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_0.cudaFlags.utils.dropDot

Drops dots from a string.

*Type:*
function that evaluates to a(n) string

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_0.cudaFlags.utils.gencodeMapper

Maps a feature across a list of compute capabilities to produce a list of gencode arguments.

For example, “sm” and \[ “8.0” “8.6” “8.7” \] yield \[ “-gencode=arch=compute_80,code=sm_80”
“-gencode=arch=compute_86,code=sm_86” “-gencode=arch=compute_87,code=sm_87” \].

*Type:*
function that evaluates to a(n) function that evaluates to a(n) list of string

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_0.cudaFlags.utils.getNixSystem

Maps NVIDIA redist arch to Nix system.

NOTE: This function *will* be called by unsupported systems because `cudaPackages` is part of
`all-packages.nix`, which is evaluated on all systems. As such, we need to handle unsupported
systems gracefully.

*Type:*
function that evaluates to a(n) (one of “unsupported”, “aaarch64-linux”, “x86_64-linux”, “ppc64le-linux”, “x86_64-windows”)

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_0.cudaFlags.utils.getRedistArch

Maps Nix system to NVIDIA redist arch.

NOTE: We swap out the default `linux-sbsa` redist (for server-grade ARM chips) with the
`linux-aarch64` redist (which is for Jetson devices) if we’re building any Jetson devices.
Since both are based on aarch64, we can only have one or the other, otherwise there’s an
ambiguity as to which should be used.

NOTE: This function *will* be called by unsupported systems because `cudaPackages` is part of
`all-packages.nix`, which is evaluated on all systems. As such, we need to handle unsupported
systems gracefully.

*Type:*
function that evaluates to a(n) (one of “unsupported”, “linux-aarch64”, “linux-sbsa”, “linux-x86_64”, “linux-ppc64le”, “windows-x86_64”)

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_0.cudaFlags.utils.isDefault

Whether a GPU is included in the default capabilities

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function, args: {dontDefaultAfter, isJetson}>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_0.cudaFlags.utils.isSupported

Whether a CUDA version supports a given GPU

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function, args: {maxCudaVersion, minCudaVersion}>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_0.cudaMajorMinorVersion

The major and minor version of the CUDA package set

*Type:*
string

*Default:*
`"12.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_12_0.cudaMajorVersion

The major version of the CUDA package set

*Type:*
string

*Default:*
`"12"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_12_0.cudaNewer

A utility to check if the CUDA version is newer than a given version

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_12_0.cudaOlder

A utility to check if the CUDA version is older than a given version

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_12_0.cudaVersion

The CUDA version of the package set

*Type:*
A version number with a major and minor component.

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_12_1

A CUDA package set for a particular version of CUDA

*Type:*
submodule

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules)

## cudaPackagesPackageSets.cudaPackages_12_1.cudaAtLeast

A utility to check if the CUDA version is at least a given version

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_12_1.cudaAtMost

A utility to check if the CUDA version is at most a given version

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_12_1.cudaFlags.data.archNames

The names of the architectures to build for

*Type:*
list of string

*Default:*

```
[
  "Ada"
]
```

*Example:*

```
[
  "Turing"
  "Ampere"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_1.cudaFlags.data.arches

The architectures to build for. Includes a virtual architecture if forward compatibility is enabled.

*Type:*
list of (A real/physical CUDA architecture name. or A virtual CUDA architecture name.)

*Default:*

```
[
  "sm_89"
]
```

*Example:*

```
[
  "sm_75"
  "sm_86"
  "compute_86"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_1.cudaFlags.data.cudaCapabilities

CUDA capabilities (hardware generations) to build for

*Type:*
list of A CUDA capability version.

*Default:*

```
[
  "8.9"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_1.cudaFlags.data.cudaForwardCompat

Build with forward compatibility gencode (+PTX) to support future GPU generations

*Type:*
boolean

*Default:*
`false`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_1.cudaFlags.data.cudaGpus

CUDA GPUs to build for

*Type:*
list of (submodule)

*Default:*

```
[
  {
    archName = "Ada";
    computeCapability = "8.9";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.8";
  }
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_1.cudaFlags.data.cudaGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_1.cudaFlags.data.cudaGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_1.cudaFlags.data.cudaGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_1.cudaFlags.data.cudaGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of true, false

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_1.cudaFlags.data.cudaGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_1.cudaFlags.data.cudaGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_1.cudaFlags.data.cudaJetsonGpus

CUDA GPUs to build for, including only Jetson devices

*Type:*
list of (submodule)

*Default:*
`[ ]`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_1.cudaFlags.data.cudaJetsonGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_1.cudaFlags.data.cudaJetsonGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_1.cudaFlags.data.cudaJetsonGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_1.cudaFlags.data.cudaJetsonGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of true, false

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)
- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_1.cudaFlags.data.cudaJetsonGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_1.cudaFlags.data.cudaJetsonGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_1.cudaFlags.data.cudaNonJetsonGpus

CUDA GPUs to build for, excluding Jetson devices

*Type:*
list of (submodule)

*Default:*

```
[
  {
    archName = "Ada";
    computeCapability = "8.9";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.8";
  }
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_1.cudaFlags.data.cudaNonJetsonGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_1.cudaFlags.data.cudaNonJetsonGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_1.cudaFlags.data.cudaNonJetsonGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_1.cudaFlags.data.cudaNonJetsonGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of false, true

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)
- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_1.cudaFlags.data.cudaNonJetsonGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_1.cudaFlags.data.cudaNonJetsonGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_1.cudaFlags.data.cudaSupport

Build packages with CUDA support

*Type:*
boolean

*Default:*
`true`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_1.cudaFlags.data.defaultCapabilities

The default compute capabilities for a given CUDA version

*Type:*
list of A CUDA capability version.

*Default:*

```
[
  "6.0"
  "6.1"
  "7.0"
  "7.5"
  "8.0"
  "8.6"
  "8.9"
  "9.0"
  "9.0a"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_1.cudaFlags.data.defaultGpus

The default GPUs for a given CUDA version

*Type:*
list of (submodule)

*Default:*

```
[
  {
    archName = "Pascal";
    computeCapability = "6.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.1";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Volta";
    computeCapability = "7.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Turing";
    computeCapability = "7.5";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Ampere";
    computeCapability = "8.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.2";
  }
  {
    archName = "Ampere";
    computeCapability = "8.6";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.2";
  }
  {
    archName = "Ada";
    computeCapability = "8.9";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.8";
  }
  {
    archName = "Hopper";
    computeCapability = "9.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.8";
  }
  {
    archName = "Hopper";
    computeCapability = "9.0a";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "12.0";
  }
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_1.cudaFlags.data.defaultGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_1.cudaFlags.data.defaultGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_1.cudaFlags.data.defaultGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_1.cudaFlags.data.defaultGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of true, false

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_1.cudaFlags.data.defaultGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_1.cudaFlags.data.defaultGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_1.cudaFlags.data.gencodeArgs

The gencode arguments to pass to NVCC

*Type:*
list of A \`gencode\` argument for the \`nvcc\` compiler.

*Default:*

```
[
  "-gencode=arch=compute_89,code=sm_89"
]
```

*Example:*

```
[
  "-gencode=arch=compute_75,code=sm_75"
  "-gencode=arch=compute_86,code=sm_86"
  "-gencode=arch=compute_86,code=compute_86"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_1.cudaFlags.data.gencodeString

A space-separated string of CUDA gencode arguments to pass to NVCC

*Type:*
string

*Default:*
`"-gencode=arch=compute_89,code=sm_89"`

*Example:*
`"-gencode=arch=compute_75,code=sm_75 ... -gencode=arch=compute_86,code=compute_86"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_1.cudaFlags.data.isJetsonBuild

Whether the build is for a Jetson device.

Jetson devices cannot be targeted by the same binaries which target non-Jetson devices. While
NVIDIA provides both `linux-aarch64` and `linux-sbsa` packages, which both target `aarch64`,
they are built with different settings and cannot be mixed.

*Type:*
boolean

*Default:*
`false`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_1.cudaFlags.data.realArches

The physical architectures to build for

*Type:*
list of A real/physical CUDA architecture name.

*Default:*

```
[
  "sm_89"
]
```

*Example:*

```
[
  "sm_75"
  "sm_86"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_1.cudaFlags.data.supportedCapabilities

The compute capabilities supported by a given CUDA version

*Type:*
list of A CUDA capability version.

*Default:*

```
[
  "5.0"
  "5.2"
  "5.3"
  "6.0"
  "6.1"
  "6.2"
  "7.0"
  "7.2"
  "7.5"
  "8.0"
  "8.6"
  "8.7"
  "8.9"
  "9.0"
  "9.0a"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_1.cudaFlags.data.supportedGpus

The GPUs supported by a given CUDA version

*Type:*
list of (submodule)

*Default:*

```
[
  {
    archName = "Maxwell";
    computeCapability = "5.0";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Maxwell";
    computeCapability = "5.2";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Maxwell";
    computeCapability = "5.3";
    dontDefaultAfter = null;
    isJetson = true;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.1";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.2";
    dontDefaultAfter = null;
    isJetson = true;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Volta";
    computeCapability = "7.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Volta";
    computeCapability = "7.2";
    dontDefaultAfter = null;
    isJetson = true;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Turing";
    computeCapability = "7.5";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Ampere";
    computeCapability = "8.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.2";
  }
  {
    archName = "Ampere";
    computeCapability = "8.6";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.2";
  }
  {
    archName = "Ampere";
    computeCapability = "8.7";
    dontDefaultAfter = null;
    isJetson = true;
    maxCudaVersion = null;
    minCudaVersion = "11.5";
  }
  {
    archName = "Ada";
    computeCapability = "8.9";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.8";
  }
  {
    archName = "Hopper";
    computeCapability = "9.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.8";
  }
  {
    archName = "Hopper";
    computeCapability = "9.0a";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "12.0";
  }
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_1.cudaFlags.data.supportedGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_1.cudaFlags.data.supportedGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_1.cudaFlags.data.supportedGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_1.cudaFlags.data.supportedGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of true, false

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_1.cudaFlags.data.supportedGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_1.cudaFlags.data.supportedGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_1.cudaFlags.data.virtualArches

The virtual architectures to build for. These are typically used for forward compatibility,
when trying to support an architecture newer than the CUDA version allows.

*Type:*
list of A virtual CUDA architecture name.

*Default:*

```
[
  "compute_89"
]
```

*Example:*

```
[
  "compute_75"
  "compute_86"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_1.cudaFlags.utils.archMapper

Maps a feature across a list of compute capabilities to produce a list of architectures.

For example, “sm” and \[ “8.0” “8.6” “8.7” \] yield \[ “sm_80” “sm_86” “sm_87” \].

*Type:*
function that evaluates to a(n) function that evaluates to a(n) list of string

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_1.cudaFlags.utils.dropDot

Drops dots from a string.

*Type:*
function that evaluates to a(n) string

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_1.cudaFlags.utils.gencodeMapper

Maps a feature across a list of compute capabilities to produce a list of gencode arguments.

For example, “sm” and \[ “8.0” “8.6” “8.7” \] yield \[ “-gencode=arch=compute_80,code=sm_80”
“-gencode=arch=compute_86,code=sm_86” “-gencode=arch=compute_87,code=sm_87” \].

*Type:*
function that evaluates to a(n) function that evaluates to a(n) list of string

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_1.cudaFlags.utils.getNixSystem

Maps NVIDIA redist arch to Nix system.

NOTE: This function *will* be called by unsupported systems because `cudaPackages` is part of
`all-packages.nix`, which is evaluated on all systems. As such, we need to handle unsupported
systems gracefully.

*Type:*
function that evaluates to a(n) (one of “unsupported”, “aaarch64-linux”, “x86_64-linux”, “ppc64le-linux”, “x86_64-windows”)

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_1.cudaFlags.utils.getRedistArch

Maps Nix system to NVIDIA redist arch.

NOTE: We swap out the default `linux-sbsa` redist (for server-grade ARM chips) with the
`linux-aarch64` redist (which is for Jetson devices) if we’re building any Jetson devices.
Since both are based on aarch64, we can only have one or the other, otherwise there’s an
ambiguity as to which should be used.

NOTE: This function *will* be called by unsupported systems because `cudaPackages` is part of
`all-packages.nix`, which is evaluated on all systems. As such, we need to handle unsupported
systems gracefully.

*Type:*
function that evaluates to a(n) (one of “unsupported”, “linux-aarch64”, “linux-sbsa”, “linux-x86_64”, “linux-ppc64le”, “windows-x86_64”)

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_1.cudaFlags.utils.isDefault

Whether a GPU is included in the default capabilities

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function, args: {dontDefaultAfter, isJetson}>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_1.cudaFlags.utils.isSupported

Whether a CUDA version supports a given GPU

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function, args: {maxCudaVersion, minCudaVersion}>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_1.cudaMajorMinorVersion

The major and minor version of the CUDA package set

*Type:*
string

*Default:*
`"12.1"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_12_1.cudaMajorVersion

The major version of the CUDA package set

*Type:*
string

*Default:*
`"12"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_12_1.cudaNewer

A utility to check if the CUDA version is newer than a given version

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_12_1.cudaOlder

A utility to check if the CUDA version is older than a given version

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_12_1.cudaVersion

The CUDA version of the package set

*Type:*
A version number with a major and minor component.

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_12_2

A CUDA package set for a particular version of CUDA

*Type:*
submodule

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules)

## cudaPackagesPackageSets.cudaPackages_12_2.cudaAtLeast

A utility to check if the CUDA version is at least a given version

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_12_2.cudaAtMost

A utility to check if the CUDA version is at most a given version

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_12_2.cudaFlags.data.archNames

The names of the architectures to build for

*Type:*
list of string

*Default:*

```
[
  "Ada"
]
```

*Example:*

```
[
  "Turing"
  "Ampere"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_2.cudaFlags.data.arches

The architectures to build for. Includes a virtual architecture if forward compatibility is enabled.

*Type:*
list of (A real/physical CUDA architecture name. or A virtual CUDA architecture name.)

*Default:*

```
[
  "sm_89"
]
```

*Example:*

```
[
  "sm_75"
  "sm_86"
  "compute_86"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_2.cudaFlags.data.cudaCapabilities

CUDA capabilities (hardware generations) to build for

*Type:*
list of A CUDA capability version.

*Default:*

```
[
  "8.9"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_2.cudaFlags.data.cudaForwardCompat

Build with forward compatibility gencode (+PTX) to support future GPU generations

*Type:*
boolean

*Default:*
`false`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_2.cudaFlags.data.cudaGpus

CUDA GPUs to build for

*Type:*
list of (submodule)

*Default:*

```
[
  {
    archName = "Ada";
    computeCapability = "8.9";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.8";
  }
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_2.cudaFlags.data.cudaGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_2.cudaFlags.data.cudaGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_2.cudaFlags.data.cudaGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_2.cudaFlags.data.cudaGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of true, false

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_2.cudaFlags.data.cudaGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_2.cudaFlags.data.cudaGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_2.cudaFlags.data.cudaJetsonGpus

CUDA GPUs to build for, including only Jetson devices

*Type:*
list of (submodule)

*Default:*
`[ ]`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_2.cudaFlags.data.cudaJetsonGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_2.cudaFlags.data.cudaJetsonGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_2.cudaFlags.data.cudaJetsonGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_2.cudaFlags.data.cudaJetsonGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of true, false

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)
- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_2.cudaFlags.data.cudaJetsonGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_2.cudaFlags.data.cudaJetsonGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_2.cudaFlags.data.cudaNonJetsonGpus

CUDA GPUs to build for, excluding Jetson devices

*Type:*
list of (submodule)

*Default:*

```
[
  {
    archName = "Ada";
    computeCapability = "8.9";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.8";
  }
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_2.cudaFlags.data.cudaNonJetsonGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_2.cudaFlags.data.cudaNonJetsonGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_2.cudaFlags.data.cudaNonJetsonGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_2.cudaFlags.data.cudaNonJetsonGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of false, true

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)
- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_2.cudaFlags.data.cudaNonJetsonGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_2.cudaFlags.data.cudaNonJetsonGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_2.cudaFlags.data.cudaSupport

Build packages with CUDA support

*Type:*
boolean

*Default:*
`true`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_2.cudaFlags.data.defaultCapabilities

The default compute capabilities for a given CUDA version

*Type:*
list of A CUDA capability version.

*Default:*

```
[
  "6.0"
  "6.1"
  "7.0"
  "7.5"
  "8.0"
  "8.6"
  "8.9"
  "9.0"
  "9.0a"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_2.cudaFlags.data.defaultGpus

The default GPUs for a given CUDA version

*Type:*
list of (submodule)

*Default:*

```
[
  {
    archName = "Pascal";
    computeCapability = "6.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.1";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Volta";
    computeCapability = "7.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Turing";
    computeCapability = "7.5";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Ampere";
    computeCapability = "8.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.2";
  }
  {
    archName = "Ampere";
    computeCapability = "8.6";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.2";
  }
  {
    archName = "Ada";
    computeCapability = "8.9";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.8";
  }
  {
    archName = "Hopper";
    computeCapability = "9.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.8";
  }
  {
    archName = "Hopper";
    computeCapability = "9.0a";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "12.0";
  }
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_2.cudaFlags.data.defaultGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_2.cudaFlags.data.defaultGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_2.cudaFlags.data.defaultGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_2.cudaFlags.data.defaultGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of true, false

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_2.cudaFlags.data.defaultGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_2.cudaFlags.data.defaultGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_2.cudaFlags.data.gencodeArgs

The gencode arguments to pass to NVCC

*Type:*
list of A \`gencode\` argument for the \`nvcc\` compiler.

*Default:*

```
[
  "-gencode=arch=compute_89,code=sm_89"
]
```

*Example:*

```
[
  "-gencode=arch=compute_75,code=sm_75"
  "-gencode=arch=compute_86,code=sm_86"
  "-gencode=arch=compute_86,code=compute_86"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_2.cudaFlags.data.gencodeString

A space-separated string of CUDA gencode arguments to pass to NVCC

*Type:*
string

*Default:*
`"-gencode=arch=compute_89,code=sm_89"`

*Example:*
`"-gencode=arch=compute_75,code=sm_75 ... -gencode=arch=compute_86,code=compute_86"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_2.cudaFlags.data.isJetsonBuild

Whether the build is for a Jetson device.

Jetson devices cannot be targeted by the same binaries which target non-Jetson devices. While
NVIDIA provides both `linux-aarch64` and `linux-sbsa` packages, which both target `aarch64`,
they are built with different settings and cannot be mixed.

*Type:*
boolean

*Default:*
`false`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_2.cudaFlags.data.realArches

The physical architectures to build for

*Type:*
list of A real/physical CUDA architecture name.

*Default:*

```
[
  "sm_89"
]
```

*Example:*

```
[
  "sm_75"
  "sm_86"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_2.cudaFlags.data.supportedCapabilities

The compute capabilities supported by a given CUDA version

*Type:*
list of A CUDA capability version.

*Default:*

```
[
  "5.0"
  "5.2"
  "5.3"
  "6.0"
  "6.1"
  "6.2"
  "7.0"
  "7.2"
  "7.5"
  "8.0"
  "8.6"
  "8.7"
  "8.9"
  "9.0"
  "9.0a"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_2.cudaFlags.data.supportedGpus

The GPUs supported by a given CUDA version

*Type:*
list of (submodule)

*Default:*

```
[
  {
    archName = "Maxwell";
    computeCapability = "5.0";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Maxwell";
    computeCapability = "5.2";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Maxwell";
    computeCapability = "5.3";
    dontDefaultAfter = null;
    isJetson = true;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.1";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.2";
    dontDefaultAfter = null;
    isJetson = true;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Volta";
    computeCapability = "7.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Volta";
    computeCapability = "7.2";
    dontDefaultAfter = null;
    isJetson = true;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Turing";
    computeCapability = "7.5";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Ampere";
    computeCapability = "8.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.2";
  }
  {
    archName = "Ampere";
    computeCapability = "8.6";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.2";
  }
  {
    archName = "Ampere";
    computeCapability = "8.7";
    dontDefaultAfter = null;
    isJetson = true;
    maxCudaVersion = null;
    minCudaVersion = "11.5";
  }
  {
    archName = "Ada";
    computeCapability = "8.9";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.8";
  }
  {
    archName = "Hopper";
    computeCapability = "9.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.8";
  }
  {
    archName = "Hopper";
    computeCapability = "9.0a";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "12.0";
  }
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_2.cudaFlags.data.supportedGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_2.cudaFlags.data.supportedGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_2.cudaFlags.data.supportedGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_2.cudaFlags.data.supportedGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of true, false

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_2.cudaFlags.data.supportedGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_2.cudaFlags.data.supportedGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_2.cudaFlags.data.virtualArches

The virtual architectures to build for. These are typically used for forward compatibility,
when trying to support an architecture newer than the CUDA version allows.

*Type:*
list of A virtual CUDA architecture name.

*Default:*

```
[
  "compute_89"
]
```

*Example:*

```
[
  "compute_75"
  "compute_86"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_2.cudaFlags.utils.archMapper

Maps a feature across a list of compute capabilities to produce a list of architectures.

For example, “sm” and \[ “8.0” “8.6” “8.7” \] yield \[ “sm_80” “sm_86” “sm_87” \].

*Type:*
function that evaluates to a(n) function that evaluates to a(n) list of string

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_2.cudaFlags.utils.dropDot

Drops dots from a string.

*Type:*
function that evaluates to a(n) string

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_2.cudaFlags.utils.gencodeMapper

Maps a feature across a list of compute capabilities to produce a list of gencode arguments.

For example, “sm” and \[ “8.0” “8.6” “8.7” \] yield \[ “-gencode=arch=compute_80,code=sm_80”
“-gencode=arch=compute_86,code=sm_86” “-gencode=arch=compute_87,code=sm_87” \].

*Type:*
function that evaluates to a(n) function that evaluates to a(n) list of string

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_2.cudaFlags.utils.getNixSystem

Maps NVIDIA redist arch to Nix system.

NOTE: This function *will* be called by unsupported systems because `cudaPackages` is part of
`all-packages.nix`, which is evaluated on all systems. As such, we need to handle unsupported
systems gracefully.

*Type:*
function that evaluates to a(n) (one of “unsupported”, “aaarch64-linux”, “x86_64-linux”, “ppc64le-linux”, “x86_64-windows”)

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_2.cudaFlags.utils.getRedistArch

Maps Nix system to NVIDIA redist arch.

NOTE: We swap out the default `linux-sbsa` redist (for server-grade ARM chips) with the
`linux-aarch64` redist (which is for Jetson devices) if we’re building any Jetson devices.
Since both are based on aarch64, we can only have one or the other, otherwise there’s an
ambiguity as to which should be used.

NOTE: This function *will* be called by unsupported systems because `cudaPackages` is part of
`all-packages.nix`, which is evaluated on all systems. As such, we need to handle unsupported
systems gracefully.

*Type:*
function that evaluates to a(n) (one of “unsupported”, “linux-aarch64”, “linux-sbsa”, “linux-x86_64”, “linux-ppc64le”, “windows-x86_64”)

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_2.cudaFlags.utils.isDefault

Whether a GPU is included in the default capabilities

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function, args: {dontDefaultAfter, isJetson}>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_2.cudaFlags.utils.isSupported

Whether a CUDA version supports a given GPU

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function, args: {maxCudaVersion, minCudaVersion}>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_2.cudaMajorMinorVersion

The major and minor version of the CUDA package set

*Type:*
string

*Default:*
`"12.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_12_2.cudaMajorVersion

The major version of the CUDA package set

*Type:*
string

*Default:*
`"12"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_12_2.cudaNewer

A utility to check if the CUDA version is newer than a given version

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_12_2.cudaOlder

A utility to check if the CUDA version is older than a given version

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_12_2.cudaVersion

The CUDA version of the package set

*Type:*
A version number with a major and minor component.

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_12_3

A CUDA package set for a particular version of CUDA

*Type:*
submodule

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules)

## cudaPackagesPackageSets.cudaPackages_12_3.cudaAtLeast

A utility to check if the CUDA version is at least a given version

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_12_3.cudaAtMost

A utility to check if the CUDA version is at most a given version

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_12_3.cudaFlags.data.archNames

The names of the architectures to build for

*Type:*
list of string

*Default:*

```
[
  "Ada"
]
```

*Example:*

```
[
  "Turing"
  "Ampere"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_3.cudaFlags.data.arches

The architectures to build for. Includes a virtual architecture if forward compatibility is enabled.

*Type:*
list of (A real/physical CUDA architecture name. or A virtual CUDA architecture name.)

*Default:*

```
[
  "sm_89"
]
```

*Example:*

```
[
  "sm_75"
  "sm_86"
  "compute_86"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_3.cudaFlags.data.cudaCapabilities

CUDA capabilities (hardware generations) to build for

*Type:*
list of A CUDA capability version.

*Default:*

```
[
  "8.9"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_3.cudaFlags.data.cudaForwardCompat

Build with forward compatibility gencode (+PTX) to support future GPU generations

*Type:*
boolean

*Default:*
`false`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_3.cudaFlags.data.cudaGpus

CUDA GPUs to build for

*Type:*
list of (submodule)

*Default:*

```
[
  {
    archName = "Ada";
    computeCapability = "8.9";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.8";
  }
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_3.cudaFlags.data.cudaGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_3.cudaFlags.data.cudaGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_3.cudaFlags.data.cudaGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_3.cudaFlags.data.cudaGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of true, false

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_3.cudaFlags.data.cudaGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_3.cudaFlags.data.cudaGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_3.cudaFlags.data.cudaJetsonGpus

CUDA GPUs to build for, including only Jetson devices

*Type:*
list of (submodule)

*Default:*
`[ ]`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_3.cudaFlags.data.cudaJetsonGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_3.cudaFlags.data.cudaJetsonGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_3.cudaFlags.data.cudaJetsonGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_3.cudaFlags.data.cudaJetsonGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of true, false

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)
- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_3.cudaFlags.data.cudaJetsonGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_3.cudaFlags.data.cudaJetsonGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_3.cudaFlags.data.cudaNonJetsonGpus

CUDA GPUs to build for, excluding Jetson devices

*Type:*
list of (submodule)

*Default:*

```
[
  {
    archName = "Ada";
    computeCapability = "8.9";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.8";
  }
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_3.cudaFlags.data.cudaNonJetsonGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_3.cudaFlags.data.cudaNonJetsonGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_3.cudaFlags.data.cudaNonJetsonGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_3.cudaFlags.data.cudaNonJetsonGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of false, true

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)
- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_3.cudaFlags.data.cudaNonJetsonGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_3.cudaFlags.data.cudaNonJetsonGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_3.cudaFlags.data.cudaSupport

Build packages with CUDA support

*Type:*
boolean

*Default:*
`true`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_3.cudaFlags.data.defaultCapabilities

The default compute capabilities for a given CUDA version

*Type:*
list of A CUDA capability version.

*Default:*

```
[
  "6.0"
  "6.1"
  "7.0"
  "7.5"
  "8.0"
  "8.6"
  "8.9"
  "9.0"
  "9.0a"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_3.cudaFlags.data.defaultGpus

The default GPUs for a given CUDA version

*Type:*
list of (submodule)

*Default:*

```
[
  {
    archName = "Pascal";
    computeCapability = "6.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.1";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Volta";
    computeCapability = "7.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Turing";
    computeCapability = "7.5";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Ampere";
    computeCapability = "8.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.2";
  }
  {
    archName = "Ampere";
    computeCapability = "8.6";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.2";
  }
  {
    archName = "Ada";
    computeCapability = "8.9";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.8";
  }
  {
    archName = "Hopper";
    computeCapability = "9.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.8";
  }
  {
    archName = "Hopper";
    computeCapability = "9.0a";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "12.0";
  }
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_3.cudaFlags.data.defaultGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_3.cudaFlags.data.defaultGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_3.cudaFlags.data.defaultGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_3.cudaFlags.data.defaultGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of true, false

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_3.cudaFlags.data.defaultGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_3.cudaFlags.data.defaultGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_3.cudaFlags.data.gencodeArgs

The gencode arguments to pass to NVCC

*Type:*
list of A \`gencode\` argument for the \`nvcc\` compiler.

*Default:*

```
[
  "-gencode=arch=compute_89,code=sm_89"
]
```

*Example:*

```
[
  "-gencode=arch=compute_75,code=sm_75"
  "-gencode=arch=compute_86,code=sm_86"
  "-gencode=arch=compute_86,code=compute_86"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_3.cudaFlags.data.gencodeString

A space-separated string of CUDA gencode arguments to pass to NVCC

*Type:*
string

*Default:*
`"-gencode=arch=compute_89,code=sm_89"`

*Example:*
`"-gencode=arch=compute_75,code=sm_75 ... -gencode=arch=compute_86,code=compute_86"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_3.cudaFlags.data.isJetsonBuild

Whether the build is for a Jetson device.

Jetson devices cannot be targeted by the same binaries which target non-Jetson devices. While
NVIDIA provides both `linux-aarch64` and `linux-sbsa` packages, which both target `aarch64`,
they are built with different settings and cannot be mixed.

*Type:*
boolean

*Default:*
`false`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_3.cudaFlags.data.realArches

The physical architectures to build for

*Type:*
list of A real/physical CUDA architecture name.

*Default:*

```
[
  "sm_89"
]
```

*Example:*

```
[
  "sm_75"
  "sm_86"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_3.cudaFlags.data.supportedCapabilities

The compute capabilities supported by a given CUDA version

*Type:*
list of A CUDA capability version.

*Default:*

```
[
  "5.0"
  "5.2"
  "5.3"
  "6.0"
  "6.1"
  "6.2"
  "7.0"
  "7.2"
  "7.5"
  "8.0"
  "8.6"
  "8.7"
  "8.9"
  "9.0"
  "9.0a"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_3.cudaFlags.data.supportedGpus

The GPUs supported by a given CUDA version

*Type:*
list of (submodule)

*Default:*

```
[
  {
    archName = "Maxwell";
    computeCapability = "5.0";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Maxwell";
    computeCapability = "5.2";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Maxwell";
    computeCapability = "5.3";
    dontDefaultAfter = null;
    isJetson = true;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.1";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.2";
    dontDefaultAfter = null;
    isJetson = true;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Volta";
    computeCapability = "7.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Volta";
    computeCapability = "7.2";
    dontDefaultAfter = null;
    isJetson = true;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Turing";
    computeCapability = "7.5";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Ampere";
    computeCapability = "8.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.2";
  }
  {
    archName = "Ampere";
    computeCapability = "8.6";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.2";
  }
  {
    archName = "Ampere";
    computeCapability = "8.7";
    dontDefaultAfter = null;
    isJetson = true;
    maxCudaVersion = null;
    minCudaVersion = "11.5";
  }
  {
    archName = "Ada";
    computeCapability = "8.9";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.8";
  }
  {
    archName = "Hopper";
    computeCapability = "9.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.8";
  }
  {
    archName = "Hopper";
    computeCapability = "9.0a";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "12.0";
  }
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_3.cudaFlags.data.supportedGpus.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_3.cudaFlags.data.supportedGpus.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_3.cudaFlags.data.supportedGpus.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_3.cudaFlags.data.supportedGpus.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of true, false

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_3.cudaFlags.data.supportedGpus.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_3.cudaFlags.data.supportedGpus.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_3.cudaFlags.data.virtualArches

The virtual architectures to build for. These are typically used for forward compatibility,
when trying to support an architecture newer than the CUDA version allows.

*Type:*
list of A virtual CUDA architecture name.

*Default:*

```
[
  "compute_89"
]
```

*Example:*

```
[
  "compute_75"
  "compute_86"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_3.cudaFlags.utils.archMapper

Maps a feature across a list of compute capabilities to produce a list of architectures.

For example, “sm” and \[ “8.0” “8.6” “8.7” \] yield \[ “sm_80” “sm_86” “sm_87” \].

*Type:*
function that evaluates to a(n) function that evaluates to a(n) list of string

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_3.cudaFlags.utils.dropDot

Drops dots from a string.

*Type:*
function that evaluates to a(n) string

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_3.cudaFlags.utils.gencodeMapper

Maps a feature across a list of compute capabilities to produce a list of gencode arguments.

For example, “sm” and \[ “8.0” “8.6” “8.7” \] yield \[ “-gencode=arch=compute_80,code=sm_80”
“-gencode=arch=compute_86,code=sm_86” “-gencode=arch=compute_87,code=sm_87” \].

*Type:*
function that evaluates to a(n) function that evaluates to a(n) list of string

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_3.cudaFlags.utils.getNixSystem

Maps NVIDIA redist arch to Nix system.

NOTE: This function *will* be called by unsupported systems because `cudaPackages` is part of
`all-packages.nix`, which is evaluated on all systems. As such, we need to handle unsupported
systems gracefully.

*Type:*
function that evaluates to a(n) (one of “unsupported”, “aaarch64-linux”, “x86_64-linux”, “ppc64le-linux”, “x86_64-windows”)

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_3.cudaFlags.utils.getRedistArch

Maps Nix system to NVIDIA redist arch.

NOTE: We swap out the default `linux-sbsa` redist (for server-grade ARM chips) with the
`linux-aarch64` redist (which is for Jetson devices) if we’re building any Jetson devices.
Since both are based on aarch64, we can only have one or the other, otherwise there’s an
ambiguity as to which should be used.

NOTE: This function *will* be called by unsupported systems because `cudaPackages` is part of
`all-packages.nix`, which is evaluated on all systems. As such, we need to handle unsupported
systems gracefully.

*Type:*
function that evaluates to a(n) (one of “unsupported”, “linux-aarch64”, “linux-sbsa”, “linux-x86_64”, “linux-ppc64le”, “windows-x86_64”)

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_3.cudaFlags.utils.isDefault

Whether a GPU is included in the default capabilities

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function, args: {dontDefaultAfter, isJetson}>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_3.cudaFlags.utils.isSupported

Whether a CUDA version supports a given GPU

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function, args: {maxCudaVersion, minCudaVersion}>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-flags.nix)

## cudaPackagesPackageSets.cudaPackages_12_3.cudaMajorMinorVersion

The major and minor version of the CUDA package set

*Type:*
string

*Default:*
`"12.3"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_12_3.cudaMajorVersion

The major version of the CUDA package set

*Type:*
string

*Default:*
`"12"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_12_3.cudaNewer

A utility to check if the CUDA version is newer than a given version

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_12_3.cudaOlder

A utility to check if the CUDA version is older than a given version

*Type:*
function that evaluates to a(n) boolean

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaPackagesPackageSets.cudaPackages_12_3.cudaVersion

The CUDA version of the package set

*Type:*
A version number with a major and minor component.

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/cuda-packages-package-set.nix)

## cudaVersions

A list of CUDA versions to create package sets for

*Type:*
list of A version number with a major and minor component.

*Default:*

```
[
  "10.0"
  "10.1"
  "10.2"
  "11.0"
  "11.1"
  "11.2"
  "11.3"
  "11.4"
  "11.5"
  "11.6"
  "11.7"
  "11.8"
  "12.0"
  "12.1"
  "12.2"
  "12.3"
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules)

## generic.data.gpus.all

Known GPUs

*Type:*
list of (submodule)

*Default:*

```
[
  {
    archName = "Kepler";
    computeCapability = "3.0";
    dontDefaultAfter = "10.2";
    isJetson = false;
    maxCudaVersion = "10.2";
    minCudaVersion = "10.0";
  }
  {
    archName = "Kepler";
    computeCapability = "3.2";
    dontDefaultAfter = "10.2";
    isJetson = false;
    maxCudaVersion = "10.2";
    minCudaVersion = "10.0";
  }
  {
    archName = "Kepler";
    computeCapability = "3.5";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = "11.8";
    minCudaVersion = "10.0";
  }
  {
    archName = "Kepler";
    computeCapability = "3.7";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = "11.8";
    minCudaVersion = "10.0";
  }
  {
    archName = "Maxwell";
    computeCapability = "5.0";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Maxwell";
    computeCapability = "5.2";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Maxwell";
    computeCapability = "5.3";
    dontDefaultAfter = null;
    isJetson = true;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.1";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.2";
    dontDefaultAfter = null;
    isJetson = true;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Volta";
    computeCapability = "7.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Volta";
    computeCapability = "7.2";
    dontDefaultAfter = null;
    isJetson = true;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Turing";
    computeCapability = "7.5";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Ampere";
    computeCapability = "8.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.2";
  }
  {
    archName = "Ampere";
    computeCapability = "8.6";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.2";
  }
  {
    archName = "Ampere";
    computeCapability = "8.7";
    dontDefaultAfter = null;
    isJetson = true;
    maxCudaVersion = null;
    minCudaVersion = "11.5";
  }
  {
    archName = "Ada";
    computeCapability = "8.9";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.8";
  }
  {
    archName = "Hopper";
    computeCapability = "9.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.8";
  }
  {
    archName = "Hopper";
    computeCapability = "9.0a";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "12.0";
  }
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/data/gpus\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/data/gpus)

## generic.data.gpus.all.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/data/gpus\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/data/gpus)

## generic.data.gpus.all.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/data/gpus\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/data/gpus)

## generic.data.gpus.all.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/data/gpus\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/data/gpus)

## generic.data.gpus.all.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of true, false

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/data/gpus\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/data/gpus)

## generic.data.gpus.all.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/data/gpus\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/data/gpus)

## generic.data.gpus.all.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/data/gpus\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/data/gpus)

## generic.data.gpus.jetsons

Known GPUs that are part of NVIDIA’s Jetson line of embedded computers

*Type:*
list of (submodule)

*Default:*

```
[
  {
    archName = "Maxwell";
    computeCapability = "5.3";
    dontDefaultAfter = null;
    isJetson = true;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.2";
    dontDefaultAfter = null;
    isJetson = true;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Volta";
    computeCapability = "7.2";
    dontDefaultAfter = null;
    isJetson = true;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Ampere";
    computeCapability = "8.7";
    dontDefaultAfter = null;
    isJetson = true;
    maxCudaVersion = null;
    minCudaVersion = "11.5";
  }
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/data/gpus\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/data/gpus)

## generic.data.gpus.jetsons.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/data/gpus\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/data/gpus)

## generic.data.gpus.jetsons.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/data/gpus\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/data/gpus)

## generic.data.gpus.jetsons.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/data/gpus\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/data/gpus)

## generic.data.gpus.jetsons.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of true, false

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/data/gpus\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/data/gpus)
- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/data/gpus\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/data/gpus)

## generic.data.gpus.jetsons.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/data/gpus\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/data/gpus)

## generic.data.gpus.jetsons.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/data/gpus\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/data/gpus)

## generic.data.gpus.nonJetsons

Known GPUs that are not part of NVIDIA’s Jetson line of embedded computers

*Type:*
list of (submodule)

*Default:*

```
[
  {
    archName = "Kepler";
    computeCapability = "3.0";
    dontDefaultAfter = "10.2";
    isJetson = false;
    maxCudaVersion = "10.2";
    minCudaVersion = "10.0";
  }
  {
    archName = "Kepler";
    computeCapability = "3.2";
    dontDefaultAfter = "10.2";
    isJetson = false;
    maxCudaVersion = "10.2";
    minCudaVersion = "10.0";
  }
  {
    archName = "Kepler";
    computeCapability = "3.5";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = "11.8";
    minCudaVersion = "10.0";
  }
  {
    archName = "Kepler";
    computeCapability = "3.7";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = "11.8";
    minCudaVersion = "10.0";
  }
  {
    archName = "Maxwell";
    computeCapability = "5.0";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Maxwell";
    computeCapability = "5.2";
    dontDefaultAfter = "11.0";
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Pascal";
    computeCapability = "6.1";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Volta";
    computeCapability = "7.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Turing";
    computeCapability = "7.5";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "10.0";
  }
  {
    archName = "Ampere";
    computeCapability = "8.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.2";
  }
  {
    archName = "Ampere";
    computeCapability = "8.6";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.2";
  }
  {
    archName = "Ada";
    computeCapability = "8.9";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.8";
  }
  {
    archName = "Hopper";
    computeCapability = "9.0";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "11.8";
  }
  {
    archName = "Hopper";
    computeCapability = "9.0a";
    dontDefaultAfter = null;
    isJetson = false;
    maxCudaVersion = null;
    minCudaVersion = "12.0";
  }
]
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/data/gpus\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/data/gpus)

## generic.data.gpus.nonJetsons.\*.archName

Name of the microarchitecture

*Type:*
A CUDA architecture name, like Ampere or Ada.

*Example:*
`"Kepler"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/data/gpus\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/data/gpus)

## generic.data.gpus.nonJetsons.\*.computeCapability

Compute capability of the GPU

*Type:*
A CUDA capability version.

*Example:*
`"3.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/data/gpus\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/data/gpus)

## generic.data.gpus.nonJetsons.\*.dontDefaultAfter

The CUDA version after which to exclude this GPU from the list of default capabilities
we build. null means we always include this GPU in the default capabilities if it is
supported.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/data/gpus\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/data/gpus)

## generic.data.gpus.nonJetsons.\*.isJetson

Whether a GPU is part of NVIDIA’s line of Jetson embedded computers.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64). More on Jetson devices here:
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request.

*Type:*
one of false, true

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/data/gpus\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/data/gpus)
- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/data/gpus\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/data/gpus)

## generic.data.gpus.nonJetsons.\*.maxCudaVersion

The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.

*Type:*
null or A version number with a major and minor component.

*Example:*
`"10.2"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/data/gpus\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/data/gpus)

## generic.data.gpus.nonJetsons.\*.minCudaVersion

The minimum (inclusive) CUDA version that supports this GPU.

*Type:*
A version number with a major and minor component.

*Example:*
`"10.0"`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/data/gpus\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/data/gpus)

## generic.data.nvccCompatibilities

Mapping of CUDA version to known NVCC compatibilities with GCC and Clang

*Type:*
attribute set of (submodule)

*Default:*

```
{
  "10.0" = {
    clangMaxMajorVersion = "6";
    clangMinMajorVersion = "6";
    gccMaxMajorVersion = "7";
    gccMinMajorVersion = "5";
  };
  "10.1" = {
    clangMaxMajorVersion = "7";
    clangMinMajorVersion = "6";
    gccMaxMajorVersion = "8";
    gccMinMajorVersion = "5";
  };
  "10.2" = {
    clangMaxMajorVersion = "8";
    clangMinMajorVersion = "6";
    gccMaxMajorVersion = "8";
    gccMinMajorVersion = "5";
  };
  "11.0" = {
    clangMaxMajorVersion = "9";
    clangMinMajorVersion = "7";
    gccMaxMajorVersion = "9";
    gccMinMajorVersion = "6";
  };
  "11.1" = {
    clangMaxMajorVersion = "10";
    clangMinMajorVersion = "7";
    gccMaxMajorVersion = "10";
    gccMinMajorVersion = "6";
  };
  "11.2" = {
    clangMaxMajorVersion = "11";
    clangMinMajorVersion = "7";
    gccMaxMajorVersion = "10";
    gccMinMajorVersion = "6";
  };
  "11.3" = {
    clangMaxMajorVersion = "11";
    clangMinMajorVersion = "7";
    gccMaxMajorVersion = "10";
    gccMinMajorVersion = "6";
  };
  "11.4" = {
    clangMaxMajorVersion = "12";
    clangMinMajorVersion = "7";
    gccMaxMajorVersion = "10";
    gccMinMajorVersion = "6";
  };
  "11.5" = {
    clangMaxMajorVersion = "12";
    clangMinMajorVersion = "7";
    gccMaxMajorVersion = "10";
    gccMinMajorVersion = "6";
  };
  "11.6" = {
    clangMaxMajorVersion = "12";
    clangMinMajorVersion = "7";
    gccMaxMajorVersion = "11";
    gccMinMajorVersion = "6";
  };
  "11.7" = {
    clangMaxMajorVersion = "13";
    clangMinMajorVersion = "7";
    gccMaxMajorVersion = "11";
    gccMinMajorVersion = "6";
  };
  "11.8" = {
    clangMaxMajorVersion = "14";
    clangMinMajorVersion = "7";
    gccMaxMajorVersion = "11";
    gccMinMajorVersion = "6";
  };
  "12.0" = {
    clangMaxMajorVersion = "14";
    clangMinMajorVersion = "7";
    gccMaxMajorVersion = "12";
    gccMinMajorVersion = "6";
  };
  "12.1" = {
    clangMaxMajorVersion = "15";
    clangMinMajorVersion = "7";
    gccMaxMajorVersion = "12";
    gccMinMajorVersion = "6";
  };
  "12.2" = {
    clangMaxMajorVersion = "16";
    clangMinMajorVersion = "7";
    gccMaxMajorVersion = "12";
    gccMinMajorVersion = "6";
  };
  "12.3" = {
    clangMaxMajorVersion = "16";
    clangMinMajorVersion = "7";
    gccMaxMajorVersion = "12";
    gccMinMajorVersion = "6";
  };
}
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/data/nvcc-compatibilities\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/data/nvcc-compatibilities)

## generic.data.nvccCompatibilities.\<name>.clangMaxMajorVersion

Maximum Clang major version to support this CUDA version

*Type:*
A version number with a major component.

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/data/nvcc-compatibilities\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/data/nvcc-compatibilities)

## generic.data.nvccCompatibilities.\<name>.clangMinMajorVersion

Minimum Clang major version to support this CUDA version

*Type:*
A version number with a major component.

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/data/nvcc-compatibilities\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/data/nvcc-compatibilities)

## generic.data.nvccCompatibilities.\<name>.gccMaxMajorVersion

Maximum GCC major version to support this CUDA version

*Type:*
A version number with a major component.

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/data/nvcc-compatibilities\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/data/nvcc-compatibilities)

## generic.data.nvccCompatibilities.\<name>.gccMinMajorVersion

Minimum GCC major version to support this CUDA version

*Type:*
A version number with a major component.

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/data/nvcc-compatibilities\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/data/nvcc-compatibilities)

## generic.types

A set of types used in building cudaPackages.

*Type:*
attribute set of optionType

*Default:*
`{ }`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/data/nvcc-compatibilities\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/data/nvcc-compatibilities)
- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/data/gpus\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/data/gpus)
- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic)

## generic.types.archName

A CUDA architecture name, like Ampere or Ada.

*Type:*
optionType

*Default:*

```
{
  _type = "option-type";
  check = <function>;
  deprecationMessage = null;
  description = "A CUDA architecture name, like Ampere or Ada.";
  descriptionClass = "noun";
  emptyValue = { };
  functor = {
    binOp = <function>;
    name = "strMatching \"^[[:alpha:]]+\\$\"";
    payload = null;
    type = null;
    wrapped = null;
  };
  getSubModules = null;
  getSubOptions = <function>;
  merge = <function>;
  name = "archName";
  nestedTypes = { };
  substSubModules = <function>;
  typeMerge = <function>;
}
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/types.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/types.nix)

## generic.types.cudaArch

A real/physical CUDA architecture name.

*Type:*
optionType

*Default:*

```
{
  _type = "option-type";
  check = <function>;
  deprecationMessage = null;
  description = "A real/physical CUDA architecture name.";
  descriptionClass = "noun";
  emptyValue = { };
  functor = {
    binOp = <function>;
    name = "strMatching \"^sm_[[:digit:]]+[a-z]?\\$\"";
    payload = null;
    type = null;
    wrapped = null;
  };
  getSubModules = null;
  getSubOptions = <function>;
  merge = <function>;
  name = "cudaArch";
  nestedTypes = { };
  substSubModules = <function>;
  typeMerge = <function>;
}
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/types.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/types.nix)

## generic.types.cudaCapability

A CUDA capability version.

*Type:*
optionType

*Default:*

```
{
  _type = "option-type";
  check = <function>;
  deprecationMessage = null;
  description = "A CUDA capability version.";
  descriptionClass = "noun";
  emptyValue = { };
  functor = {
    binOp = <function>;
    name = "strMatching \"^[[:digit:]]+\\\\.[[:digit:]]+[a-z]?\\$\"";
    payload = null;
    type = null;
    wrapped = null;
  };
  getSubModules = null;
  getSubOptions = <function>;
  merge = <function>;
  name = "cudaCapability";
  nestedTypes = { };
  substSubModules = <function>;
  typeMerge = <function>;
}
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/types.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/types.nix)

## generic.types.gencodeArg

A `gencode` argument for the `nvcc` compiler.

*Type:*
optionType

*Default:*

```
{
  _type = "option-type";
  check = <function>;
  deprecationMessage = null;
  description = "A `gencode` argument for the `nvcc` compiler.";
  descriptionClass = "noun";
  emptyValue = { };
  functor = {
    binOp = <function>;
    name = "strMatching \"^-gencode=arch=compute_[[:digit:]]+[a-z]?,code=(sm|compute)_[[:digit:]]+[a-z]?\\$\"";
    payload = null;
    type = null;
    wrapped = null;
  };
  getSubModules = null;
  getSubOptions = <function>;
  merge = <function>;
  name = "gencodeArg";
  nestedTypes = { };
  substSubModules = <function>;
  typeMerge = <function>;
}
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/types.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/types.nix)

## generic.types.gpu

A GPU

*Type:*
optionType

*Default:*

```
{
  _type = "option-type";
  check = <function>;
  deprecationMessage = null;
  description = "submodule";
  descriptionClass = null;
  emptyValue = {
    value = { };
  };
  functor = {
    binOp = <function>;
    name = "submodule";
    payload = {
      class = null;
      description = null;
      modules = [
        {
          options = {
            archName = {
              _type = "option";
              description = "Name of the microarchitecture";
              example = "Kepler";
              type = {
                _type = "option-type";
                check = <function>;
                deprecationMessage = null;
                description = "A CUDA architecture name, like Ampere or Ada.";
                descriptionClass = "noun";
                emptyValue = { };
                functor = {
                  binOp = <function>;
                  name = "strMatching \"^[[:alpha:]]+\\$\"";
                  payload = null;
                  type = null;
                  wrapped = null;
                };
                getSubModules = null;
                getSubOptions = <function>;
                merge = <function>;
                name = "archName";
                nestedTypes = { };
                substSubModules = <function>;
                typeMerge = <function>;
              };
            };
            computeCapability = {
              _type = "option";
              description = "Compute capability of the GPU";
              example = "3.0";
              type = {
                _type = "option-type";
                check = <function>;
                deprecationMessage = null;
                description = "A CUDA capability version.";
                descriptionClass = "noun";
                emptyValue = { };
                functor = {
                  binOp = <function>;
                  name = "strMatching \"^[[:digit:]]+\\\\.[[:digit:]]+[a-z]?\\$\"";
                  payload = null;
                  type = null;
                  wrapped = null;
                };
                getSubModules = null;
                getSubOptions = <function>;
                merge = <function>;
                name = "cudaCapability";
                nestedTypes = { };
                substSubModules = <function>;
                typeMerge = <function>;
              };
            };
            dontDefaultAfter = {
              _type = "option";
              description = ''
                The CUDA version after which to exclude this GPU from the list of default capabilities
                we build. null means we always include this GPU in the default capabilities if it is
                supported.
              '';
              example = "10.2";
              type = {
                _type = "option-type";
                check = <function>;
                deprecationMessage = null;
                description = "null or A version number with a major and minor component.";
                descriptionClass = "conjunction";
                emptyValue = {
                  value = null;
                };
                functor = {
                  binOp = <function>;
                  name = "nullOr";
                  payload = null;
                  type = <function>;
                  wrapped = {
                    _type = "option-type";
                    check = <function>;
                    deprecationMessage = null;
                    description = "A version number with a major and minor component.";
                    descriptionClass = "noun";
                    emptyValue = { };
                    functor = {
                      binOp = <function>;
                      name = "strMatching \"^([[:digit:]]+)\\\\.([[:digit:]]+)\\$\"";
                      payload = null;
                      type = null;
                      wrapped = null;
                    };
                    getSubModules = null;
                    getSubOptions = <function>;
                    merge = <function>;
                    name = "majorMinorVersion";
                    nestedTypes = { };
                    substSubModules = <function>;
                    typeMerge = <function>;
                  };
                };
                getSubModules = null;
                getSubOptions = <function>;
                merge = <function>;
                name = "nullOr";
                nestedTypes = {
                  elemType = {
                    _type = "option-type";
                    check = <function>;
                    deprecationMessage = null;
                    description = "A version number with a major and minor component.";
                    descriptionClass = "noun";
                    emptyValue = { };
                    functor = {
                      binOp = <function>;
                      name = "strMatching \"^([[:digit:]]+)\\\\.([[:digit:]]+)\\$\"";
                      payload = null;
                      type = null;
                      wrapped = null;
                    };
                    getSubModules = null;
                    getSubOptions = <function>;
                    merge = <function>;
                    name = "majorMinorVersion";
                    nestedTypes = { };
                    substSubModules = <function>;
                    typeMerge = <function>;
                  };
                };
                substSubModules = <function>;
                typeMerge = <function>;
              };
            };
            isJetson = {
              _type = "option";
              description = ''
                Whether a GPU is part of NVIDIA's line of Jetson embedded computers.
                
                This field is notable because it tells us what architecture to build for (as Jetson devices are
                aarch64). More on Jetson devices here:
                https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/
                
                NOTE: These architectures are only built upon request.
              '';
              type = {
                _type = "option-type";
                check = <function>;
                deprecationMessage = null;
                description = "one of true, false";
                descriptionClass = "conjunction";
                emptyValue = { };
                functor = {
                  binOp = <function>;
                  name = "enum";
                  payload = [
                    true
                    false
                  ];
                  type = <function>;
                  wrapped = null;
                };
                getSubModules = null;
                getSubOptions = <function>;
                merge = <function>;
                name = "enum";
                nestedTypes = { };
                substSubModules = <function>;
                typeMerge = <function>;
              };
            };
            maxCudaVersion = {
              _type = "option";
              description = "The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.";
              example = "10.2";
              type = {
                _type = "option-type";
                check = <function>;
                deprecationMessage = null;
                description = "null or A version number with a major and minor component.";
                descriptionClass = "conjunction";
                emptyValue = {
                  value = null;
                };
                functor = {
                  binOp = <function>;
                  name = "nullOr";
                  payload = null;
                  type = <function>;
                  wrapped = {
                    _type = "option-type";
                    check = <function>;
                    deprecationMessage = null;
                    description = "A version number with a major and minor component.";
                    descriptionClass = "noun";
                    emptyValue = { };
                    functor = {
                      binOp = <function>;
                      name = "strMatching \"^([[:digit:]]+)\\\\.([[:digit:]]+)\\$\"";
                      payload = null;
                      type = null;
                      wrapped = null;
                    };
                    getSubModules = null;
                    getSubOptions = <function>;
                    merge = <function>;
                    name = "majorMinorVersion";
                    nestedTypes = { };
                    substSubModules = <function>;
                    typeMerge = <function>;
                  };
                };
                getSubModules = null;
                getSubOptions = <function>;
                merge = <function>;
                name = "nullOr";
                nestedTypes = {
                  elemType = {
                    _type = "option-type";
                    check = <function>;
                    deprecationMessage = null;
                    description = "A version number with a major and minor component.";
                    descriptionClass = "noun";
                    emptyValue = { };
                    functor = {
                      binOp = <function>;
                      name = "strMatching \"^([[:digit:]]+)\\\\.([[:digit:]]+)\\$\"";
                      payload = null;
                      type = null;
                      wrapped = null;
                    };
                    getSubModules = null;
                    getSubOptions = <function>;
                    merge = <function>;
                    name = "majorMinorVersion";
                    nestedTypes = { };
                    substSubModules = <function>;
                    typeMerge = <function>;
                  };
                };
                substSubModules = <function>;
                typeMerge = <function>;
              };
            };
            minCudaVersion = {
              _type = "option";
              description = "The minimum (inclusive) CUDA version that supports this GPU.";
              example = "10.0";
              type = {
                _type = "option-type";
                check = <function>;
                deprecationMessage = null;
                description = "A version number with a major and minor component.";
                descriptionClass = "noun";
                emptyValue = { };
                functor = {
                  binOp = <function>;
                  name = "strMatching \"^([[:digit:]]+)\\\\.([[:digit:]]+)\\$\"";
                  payload = null;
                  type = null;
                  wrapped = null;
                };
                getSubModules = null;
                getSubOptions = <function>;
                merge = <function>;
                name = "majorMinorVersion";
                nestedTypes = { };
                substSubModules = <function>;
                typeMerge = <function>;
              };
            };
          };
        }
      ];
      shorthandOnlyDefinesConfig = false;
      specialArgs = { };
    };
    type = <function, args: {class?, description?, modules, shorthandOnlyDefinesConfig?, specialArgs?}>;
    wrapped = null;
  };
  getSubModules = [
    {
      options = {
        archName = {
          _type = "option";
          description = "Name of the microarchitecture";
          example = "Kepler";
          type = {
            _type = "option-type";
            check = <function>;
            deprecationMessage = null;
            description = "A CUDA architecture name, like Ampere or Ada.";
            descriptionClass = "noun";
            emptyValue = { };
            functor = {
              binOp = <function>;
              name = "strMatching \"^[[:alpha:]]+\\$\"";
              payload = null;
              type = null;
              wrapped = null;
            };
            getSubModules = null;
            getSubOptions = <function>;
            merge = <function>;
            name = "archName";
            nestedTypes = { };
            substSubModules = <function>;
            typeMerge = <function>;
          };
        };
        computeCapability = {
          _type = "option";
          description = "Compute capability of the GPU";
          example = "3.0";
          type = {
            _type = "option-type";
            check = <function>;
            deprecationMessage = null;
            description = "A CUDA capability version.";
            descriptionClass = "noun";
            emptyValue = { };
            functor = {
              binOp = <function>;
              name = "strMatching \"^[[:digit:]]+\\\\.[[:digit:]]+[a-z]?\\$\"";
              payload = null;
              type = null;
              wrapped = null;
            };
            getSubModules = null;
            getSubOptions = <function>;
            merge = <function>;
            name = "cudaCapability";
            nestedTypes = { };
            substSubModules = <function>;
            typeMerge = <function>;
          };
        };
        dontDefaultAfter = {
          _type = "option";
          description = ''
            The CUDA version after which to exclude this GPU from the list of default capabilities
            we build. null means we always include this GPU in the default capabilities if it is
            supported.
          '';
          example = "10.2";
          type = {
            _type = "option-type";
            check = <function>;
            deprecationMessage = null;
            description = "null or A version number with a major and minor component.";
            descriptionClass = "conjunction";
            emptyValue = {
              value = null;
            };
            functor = {
              binOp = <function>;
              name = "nullOr";
              payload = null;
              type = <function>;
              wrapped = {
                _type = "option-type";
                check = <function>;
                deprecationMessage = null;
                description = "A version number with a major and minor component.";
                descriptionClass = "noun";
                emptyValue = { };
                functor = {
                  binOp = <function>;
                  name = "strMatching \"^([[:digit:]]+)\\\\.([[:digit:]]+)\\$\"";
                  payload = null;
                  type = null;
                  wrapped = null;
                };
                getSubModules = null;
                getSubOptions = <function>;
                merge = <function>;
                name = "majorMinorVersion";
                nestedTypes = { };
                substSubModules = <function>;
                typeMerge = <function>;
              };
            };
            getSubModules = null;
            getSubOptions = <function>;
            merge = <function>;
            name = "nullOr";
            nestedTypes = {
              elemType = {
                _type = "option-type";
                check = <function>;
                deprecationMessage = null;
                description = "A version number with a major and minor component.";
                descriptionClass = "noun";
                emptyValue = { };
                functor = {
                  binOp = <function>;
                  name = "strMatching \"^([[:digit:]]+)\\\\.([[:digit:]]+)\\$\"";
                  payload = null;
                  type = null;
                  wrapped = null;
                };
                getSubModules = null;
                getSubOptions = <function>;
                merge = <function>;
                name = "majorMinorVersion";
                nestedTypes = { };
                substSubModules = <function>;
                typeMerge = <function>;
              };
            };
            substSubModules = <function>;
            typeMerge = <function>;
          };
        };
        isJetson = {
          _type = "option";
          description = ''
            Whether a GPU is part of NVIDIA's line of Jetson embedded computers.
            
            This field is notable because it tells us what architecture to build for (as Jetson devices are
            aarch64). More on Jetson devices here:
            https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/
            
            NOTE: These architectures are only built upon request.
          '';
          type = {
            _type = "option-type";
            check = <function>;
            deprecationMessage = null;
            description = "one of true, false";
            descriptionClass = "conjunction";
            emptyValue = { };
            functor = {
              binOp = <function>;
              name = "enum";
              payload = [
                true
                false
              ];
              type = <function>;
              wrapped = null;
            };
            getSubModules = null;
            getSubOptions = <function>;
            merge = <function>;
            name = "enum";
            nestedTypes = { };
            substSubModules = <function>;
            typeMerge = <function>;
          };
        };
        maxCudaVersion = {
          _type = "option";
          description = "The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.";
          example = "10.2";
          type = {
            _type = "option-type";
            check = <function>;
            deprecationMessage = null;
            description = "null or A version number with a major and minor component.";
            descriptionClass = "conjunction";
            emptyValue = {
              value = null;
            };
            functor = {
              binOp = <function>;
              name = "nullOr";
              payload = null;
              type = <function>;
              wrapped = {
                _type = "option-type";
                check = <function>;
                deprecationMessage = null;
                description = "A version number with a major and minor component.";
                descriptionClass = "noun";
                emptyValue = { };
                functor = {
                  binOp = <function>;
                  name = "strMatching \"^([[:digit:]]+)\\\\.([[:digit:]]+)\\$\"";
                  payload = null;
                  type = null;
                  wrapped = null;
                };
                getSubModules = null;
                getSubOptions = <function>;
                merge = <function>;
                name = "majorMinorVersion";
                nestedTypes = { };
                substSubModules = <function>;
                typeMerge = <function>;
              };
            };
            getSubModules = null;
            getSubOptions = <function>;
            merge = <function>;
            name = "nullOr";
            nestedTypes = {
              elemType = {
                _type = "option-type";
                check = <function>;
                deprecationMessage = null;
                description = "A version number with a major and minor component.";
                descriptionClass = "noun";
                emptyValue = { };
                functor = {
                  binOp = <function>;
                  name = "strMatching \"^([[:digit:]]+)\\\\.([[:digit:]]+)\\$\"";
                  payload = null;
                  type = null;
                  wrapped = null;
                };
                getSubModules = null;
                getSubOptions = <function>;
                merge = <function>;
                name = "majorMinorVersion";
                nestedTypes = { };
                substSubModules = <function>;
                typeMerge = <function>;
              };
            };
            substSubModules = <function>;
            typeMerge = <function>;
          };
        };
        minCudaVersion = {
          _type = "option";
          description = "The minimum (inclusive) CUDA version that supports this GPU.";
          example = "10.0";
          type = {
            _type = "option-type";
            check = <function>;
            deprecationMessage = null;
            description = "A version number with a major and minor component.";
            descriptionClass = "noun";
            emptyValue = { };
            functor = {
              binOp = <function>;
              name = "strMatching \"^([[:digit:]]+)\\\\.([[:digit:]]+)\\$\"";
              payload = null;
              type = null;
              wrapped = null;
            };
            getSubModules = null;
            getSubOptions = <function>;
            merge = <function>;
            name = "majorMinorVersion";
            nestedTypes = { };
            substSubModules = <function>;
            typeMerge = <function>;
          };
        };
      };
    }
  ];
  getSubOptions = <function>;
  merge = <function>;
  name = "submodule";
  nestedTypes = { };
  substSubModules = <function>;
  typeMerge = <function>;
}
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/data/gpus\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/data/gpus)

## generic.types.jetsonGpu

A GPU that is part of NVIDIA’s Jetson line of embedded computers

*Type:*
optionType

*Default:*

```
{
  _type = "option-type";
  check = <function>;
  deprecationMessage = null;
  description = "submodule";
  descriptionClass = null;
  emptyValue = {
    value = { };
  };
  functor = {
    binOp = <function>;
    name = "submodule";
    payload = {
      class = null;
      description = null;
      modules = [
        {
          options = {
            archName = {
              _type = "option";
              description = "Name of the microarchitecture";
              example = "Kepler";
              type = {
                _type = "option-type";
                check = <function>;
                deprecationMessage = null;
                description = "A CUDA architecture name, like Ampere or Ada.";
                descriptionClass = "noun";
                emptyValue = { };
                functor = {
                  binOp = <function>;
                  name = "strMatching \"^[[:alpha:]]+\\$\"";
                  payload = null;
                  type = null;
                  wrapped = null;
                };
                getSubModules = null;
                getSubOptions = <function>;
                merge = <function>;
                name = "archName";
                nestedTypes = { };
                substSubModules = <function>;
                typeMerge = <function>;
              };
            };
            computeCapability = {
              _type = "option";
              description = "Compute capability of the GPU";
              example = "3.0";
              type = {
                _type = "option-type";
                check = <function>;
                deprecationMessage = null;
                description = "A CUDA capability version.";
                descriptionClass = "noun";
                emptyValue = { };
                functor = {
                  binOp = <function>;
                  name = "strMatching \"^[[:digit:]]+\\\\.[[:digit:]]+[a-z]?\\$\"";
                  payload = null;
                  type = null;
                  wrapped = null;
                };
                getSubModules = null;
                getSubOptions = <function>;
                merge = <function>;
                name = "cudaCapability";
                nestedTypes = { };
                substSubModules = <function>;
                typeMerge = <function>;
              };
            };
            dontDefaultAfter = {
              _type = "option";
              description = ''
                The CUDA version after which to exclude this GPU from the list of default capabilities
                we build. null means we always include this GPU in the default capabilities if it is
                supported.
              '';
              example = "10.2";
              type = {
                _type = "option-type";
                check = <function>;
                deprecationMessage = null;
                description = "null or A version number with a major and minor component.";
                descriptionClass = "conjunction";
                emptyValue = {
                  value = null;
                };
                functor = {
                  binOp = <function>;
                  name = "nullOr";
                  payload = null;
                  type = <function>;
                  wrapped = {
                    _type = "option-type";
                    check = <function>;
                    deprecationMessage = null;
                    description = "A version number with a major and minor component.";
                    descriptionClass = "noun";
                    emptyValue = { };
                    functor = {
                      binOp = <function>;
                      name = "strMatching \"^([[:digit:]]+)\\\\.([[:digit:]]+)\\$\"";
                      payload = null;
                      type = null;
                      wrapped = null;
                    };
                    getSubModules = null;
                    getSubOptions = <function>;
                    merge = <function>;
                    name = "majorMinorVersion";
                    nestedTypes = { };
                    substSubModules = <function>;
                    typeMerge = <function>;
                  };
                };
                getSubModules = null;
                getSubOptions = <function>;
                merge = <function>;
                name = "nullOr";
                nestedTypes = {
                  elemType = {
                    _type = "option-type";
                    check = <function>;
                    deprecationMessage = null;
                    description = "A version number with a major and minor component.";
                    descriptionClass = "noun";
                    emptyValue = { };
                    functor = {
                      binOp = <function>;
                      name = "strMatching \"^([[:digit:]]+)\\\\.([[:digit:]]+)\\$\"";
                      payload = null;
                      type = null;
                      wrapped = null;
                    };
                    getSubModules = null;
                    getSubOptions = <function>;
                    merge = <function>;
                    name = "majorMinorVersion";
                    nestedTypes = { };
                    substSubModules = <function>;
                    typeMerge = <function>;
                  };
                };
                substSubModules = <function>;
                typeMerge = <function>;
              };
            };
            isJetson = {
              _type = "option";
              description = ''
                Whether a GPU is part of NVIDIA's line of Jetson embedded computers.
                
                This field is notable because it tells us what architecture to build for (as Jetson devices are
                aarch64). More on Jetson devices here:
                https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/
                
                NOTE: These architectures are only built upon request.
              '';
              type = {
                _type = "option-type";
                check = <function>;
                deprecationMessage = null;
                description = "one of true, false";
                descriptionClass = "conjunction";
                emptyValue = { };
                functor = {
                  binOp = <function>;
                  name = "enum";
                  payload = [
                    true
                    false
                  ];
                  type = <function>;
                  wrapped = null;
                };
                getSubModules = null;
                getSubOptions = <function>;
                merge = <function>;
                name = "enum";
                nestedTypes = { };
                substSubModules = <function>;
                typeMerge = <function>;
              };
            };
            maxCudaVersion = {
              _type = "option";
              description = "The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.";
              example = "10.2";
              type = {
                _type = "option-type";
                check = <function>;
                deprecationMessage = null;
                description = "null or A version number with a major and minor component.";
                descriptionClass = "conjunction";
                emptyValue = {
                  value = null;
                };
                functor = {
                  binOp = <function>;
                  name = "nullOr";
                  payload = null;
                  type = <function>;
                  wrapped = {
                    _type = "option-type";
                    check = <function>;
                    deprecationMessage = null;
                    description = "A version number with a major and minor component.";
                    descriptionClass = "noun";
                    emptyValue = { };
                    functor = {
                      binOp = <function>;
                      name = "strMatching \"^([[:digit:]]+)\\\\.([[:digit:]]+)\\$\"";
                      payload = null;
                      type = null;
                      wrapped = null;
                    };
                    getSubModules = null;
                    getSubOptions = <function>;
                    merge = <function>;
                    name = "majorMinorVersion";
                    nestedTypes = { };
                    substSubModules = <function>;
                    typeMerge = <function>;
                  };
                };
                getSubModules = null;
                getSubOptions = <function>;
                merge = <function>;
                name = "nullOr";
                nestedTypes = {
                  elemType = {
                    _type = "option-type";
                    check = <function>;
                    deprecationMessage = null;
                    description = "A version number with a major and minor component.";
                    descriptionClass = "noun";
                    emptyValue = { };
                    functor = {
                      binOp = <function>;
                      name = "strMatching \"^([[:digit:]]+)\\\\.([[:digit:]]+)\\$\"";
                      payload = null;
                      type = null;
                      wrapped = null;
                    };
                    getSubModules = null;
                    getSubOptions = <function>;
                    merge = <function>;
                    name = "majorMinorVersion";
                    nestedTypes = { };
                    substSubModules = <function>;
                    typeMerge = <function>;
                  };
                };
                substSubModules = <function>;
                typeMerge = <function>;
              };
            };
            minCudaVersion = {
              _type = "option";
              description = "The minimum (inclusive) CUDA version that supports this GPU.";
              example = "10.0";
              type = {
                _type = "option-type";
                check = <function>;
                deprecationMessage = null;
                description = "A version number with a major and minor component.";
                descriptionClass = "noun";
                emptyValue = { };
                functor = {
                  binOp = <function>;
                  name = "strMatching \"^([[:digit:]]+)\\\\.([[:digit:]]+)\\$\"";
                  payload = null;
                  type = null;
                  wrapped = null;
                };
                getSubModules = null;
                getSubOptions = <function>;
                merge = <function>;
                name = "majorMinorVersion";
                nestedTypes = { };
                substSubModules = <function>;
                typeMerge = <function>;
              };
            };
          };
        }
        {
          options = {
            isJetson = {
              _type = "option";
              type = {
                _type = "option-type";
                check = <function>;
                deprecationMessage = null;
                description = "value true (singular enum)";
                descriptionClass = "noun";
                emptyValue = { };
                functor = {
                  binOp = <function>;
                  name = "enum";
                  payload = [
                    true
                  ];
                  type = <function>;
                  wrapped = null;
                };
                getSubModules = null;
                getSubOptions = <function>;
                merge = <function>;
                name = "enum";
                nestedTypes = { };
                substSubModules = <function>;
                typeMerge = <function>;
              };
            };
          };
        }
      ];
      shorthandOnlyDefinesConfig = false;
      specialArgs = { };
    };
    type = <function, args: {class?, description?, modules, shorthandOnlyDefinesConfig?, specialArgs?}>;
    wrapped = null;
  };
  getSubModules = [
    {
      options = {
        archName = {
          _type = "option";
          description = "Name of the microarchitecture";
          example = "Kepler";
          type = {
            _type = "option-type";
            check = <function>;
            deprecationMessage = null;
            description = "A CUDA architecture name, like Ampere or Ada.";
            descriptionClass = "noun";
            emptyValue = { };
            functor = {
              binOp = <function>;
              name = "strMatching \"^[[:alpha:]]+\\$\"";
              payload = null;
              type = null;
              wrapped = null;
            };
            getSubModules = null;
            getSubOptions = <function>;
            merge = <function>;
            name = "archName";
            nestedTypes = { };
            substSubModules = <function>;
            typeMerge = <function>;
          };
        };
        computeCapability = {
          _type = "option";
          description = "Compute capability of the GPU";
          example = "3.0";
          type = {
            _type = "option-type";
            check = <function>;
            deprecationMessage = null;
            description = "A CUDA capability version.";
            descriptionClass = "noun";
            emptyValue = { };
            functor = {
              binOp = <function>;
              name = "strMatching \"^[[:digit:]]+\\\\.[[:digit:]]+[a-z]?\\$\"";
              payload = null;
              type = null;
              wrapped = null;
            };
            getSubModules = null;
            getSubOptions = <function>;
            merge = <function>;
            name = "cudaCapability";
            nestedTypes = { };
            substSubModules = <function>;
            typeMerge = <function>;
          };
        };
        dontDefaultAfter = {
          _type = "option";
          description = ''
            The CUDA version after which to exclude this GPU from the list of default capabilities
            we build. null means we always include this GPU in the default capabilities if it is
            supported.
          '';
          example = "10.2";
          type = {
            _type = "option-type";
            check = <function>;
            deprecationMessage = null;
            description = "null or A version number with a major and minor component.";
            descriptionClass = "conjunction";
            emptyValue = {
              value = null;
            };
            functor = {
              binOp = <function>;
              name = "nullOr";
              payload = null;
              type = <function>;
              wrapped = {
                _type = "option-type";
                check = <function>;
                deprecationMessage = null;
                description = "A version number with a major and minor component.";
                descriptionClass = "noun";
                emptyValue = { };
                functor = {
                  binOp = <function>;
                  name = "strMatching \"^([[:digit:]]+)\\\\.([[:digit:]]+)\\$\"";
                  payload = null;
                  type = null;
                  wrapped = null;
                };
                getSubModules = null;
                getSubOptions = <function>;
                merge = <function>;
                name = "majorMinorVersion";
                nestedTypes = { };
                substSubModules = <function>;
                typeMerge = <function>;
              };
            };
            getSubModules = null;
            getSubOptions = <function>;
            merge = <function>;
            name = "nullOr";
            nestedTypes = {
              elemType = {
                _type = "option-type";
                check = <function>;
                deprecationMessage = null;
                description = "A version number with a major and minor component.";
                descriptionClass = "noun";
                emptyValue = { };
                functor = {
                  binOp = <function>;
                  name = "strMatching \"^([[:digit:]]+)\\\\.([[:digit:]]+)\\$\"";
                  payload = null;
                  type = null;
                  wrapped = null;
                };
                getSubModules = null;
                getSubOptions = <function>;
                merge = <function>;
                name = "majorMinorVersion";
                nestedTypes = { };
                substSubModules = <function>;
                typeMerge = <function>;
              };
            };
            substSubModules = <function>;
            typeMerge = <function>;
          };
        };
        isJetson = {
          _type = "option";
          description = ''
            Whether a GPU is part of NVIDIA's line of Jetson embedded computers.
            
            This field is notable because it tells us what architecture to build for (as Jetson devices are
            aarch64). More on Jetson devices here:
            https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/
            
            NOTE: These architectures are only built upon request.
          '';
          type = {
            _type = "option-type";
            check = <function>;
            deprecationMessage = null;
            description = "one of true, false";
            descriptionClass = "conjunction";
            emptyValue = { };
            functor = {
              binOp = <function>;
              name = "enum";
              payload = [
                true
                false
              ];
              type = <function>;
              wrapped = null;
            };
            getSubModules = null;
            getSubOptions = <function>;
            merge = <function>;
            name = "enum";
            nestedTypes = { };
            substSubModules = <function>;
            typeMerge = <function>;
          };
        };
        maxCudaVersion = {
          _type = "option";
          description = "The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.";
          example = "10.2";
          type = {
            _type = "option-type";
            check = <function>;
            deprecationMessage = null;
            description = "null or A version number with a major and minor component.";
            descriptionClass = "conjunction";
            emptyValue = {
              value = null;
            };
            functor = {
              binOp = <function>;
              name = "nullOr";
              payload = null;
              type = <function>;
              wrapped = {
                _type = "option-type";
                check = <function>;
                deprecationMessage = null;
                description = "A version number with a major and minor component.";
                descriptionClass = "noun";
                emptyValue = { };
                functor = {
                  binOp = <function>;
                  name = "strMatching \"^([[:digit:]]+)\\\\.([[:digit:]]+)\\$\"";
                  payload = null;
                  type = null;
                  wrapped = null;
                };
                getSubModules = null;
                getSubOptions = <function>;
                merge = <function>;
                name = "majorMinorVersion";
                nestedTypes = { };
                substSubModules = <function>;
                typeMerge = <function>;
              };
            };
            getSubModules = null;
            getSubOptions = <function>;
            merge = <function>;
            name = "nullOr";
            nestedTypes = {
              elemType = {
                _type = "option-type";
                check = <function>;
                deprecationMessage = null;
                description = "A version number with a major and minor component.";
                descriptionClass = "noun";
                emptyValue = { };
                functor = {
                  binOp = <function>;
                  name = "strMatching \"^([[:digit:]]+)\\\\.([[:digit:]]+)\\$\"";
                  payload = null;
                  type = null;
                  wrapped = null;
                };
                getSubModules = null;
                getSubOptions = <function>;
                merge = <function>;
                name = "majorMinorVersion";
                nestedTypes = { };
                substSubModules = <function>;
                typeMerge = <function>;
              };
            };
            substSubModules = <function>;
            typeMerge = <function>;
          };
        };
        minCudaVersion = {
          _type = "option";
          description = "The minimum (inclusive) CUDA version that supports this GPU.";
          example = "10.0";
          type = {
            _type = "option-type";
            check = <function>;
            deprecationMessage = null;
            description = "A version number with a major and minor component.";
            descriptionClass = "noun";
            emptyValue = { };
            functor = {
              binOp = <function>;
              name = "strMatching \"^([[:digit:]]+)\\\\.([[:digit:]]+)\\$\"";
              payload = null;
              type = null;
              wrapped = null;
            };
            getSubModules = null;
            getSubOptions = <function>;
            merge = <function>;
            name = "majorMinorVersion";
            nestedTypes = { };
            substSubModules = <function>;
            typeMerge = <function>;
          };
        };
      };
    }
    {
      options = {
        isJetson = {
          _type = "option";
          type = {
            _type = "option-type";
            check = <function>;
            deprecationMessage = null;
            description = "value true (singular enum)";
            descriptionClass = "noun";
            emptyValue = { };
            functor = {
              binOp = <function>;
              name = "enum";
              payload = [
                true
              ];
              type = <function>;
              wrapped = null;
            };
            getSubModules = null;
            getSubOptions = <function>;
            merge = <function>;
            name = "enum";
            nestedTypes = { };
            substSubModules = <function>;
            typeMerge = <function>;
          };
        };
      };
    }
  ];
  getSubOptions = <function>;
  merge = <function>;
  name = "submodule";
  nestedTypes = { };
  substSubModules = <function>;
  typeMerge = <function>;
}
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/data/gpus\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/data/gpus)

## generic.types.libSoName

The name of a shared object file.

*Type:*
optionType

*Default:*

```
{
  _type = "option-type";
  check = <function>;
  deprecationMessage = null;
  description = "The name of a shared object file.";
  descriptionClass = "noun";
  emptyValue = { };
  functor = {
    binOp = <function>;
    name = "strMatching \".*\\\\.so(\\\\.[[:digit:]]+)*\\$\"";
    payload = null;
    type = null;
    wrapped = null;
  };
  getSubModules = null;
  getSubOptions = <function>;
  merge = <function>;
  name = "libSoName";
  nestedTypes = { };
  substSubModules = <function>;
  typeMerge = <function>;
}
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/types.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/types.nix)

## generic.types.majorMinorPatchBuildVersion

A version number with a major, minor, patch, and build component.

*Type:*
optionType

*Default:*

```
{
  _type = "option-type";
  check = <function>;
  deprecationMessage = null;
  description = "A version number with a major, minor, patch, and build component.";
  descriptionClass = "noun";
  emptyValue = { };
  functor = {
    binOp = <function>;
    name = "strMatching \"^([[:digit:]]+)\\\\.([[:digit:]]+)\\\\.([[:digit:]]+)\\\\.([[:digit:]]+)\\$\"";
    payload = null;
    type = null;
    wrapped = null;
  };
  getSubModules = null;
  getSubOptions = <function>;
  merge = <function>;
  name = "majorMinorPatchBuildVersion";
  nestedTypes = { };
  substSubModules = <function>;
  typeMerge = <function>;
}
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/types.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/types.nix)

## generic.types.majorMinorPatchVersion

A version number with a major, minor, and patch component.

*Type:*
optionType

*Default:*

```
{
  _type = "option-type";
  check = <function>;
  deprecationMessage = null;
  description = "A version number with a major, minor, and patch component.";
  descriptionClass = "noun";
  emptyValue = { };
  functor = {
    binOp = <function>;
    name = "strMatching \"^([[:digit:]]+)\\\\.([[:digit:]]+)\\\\.([[:digit:]]+)\\$\"";
    payload = null;
    type = null;
    wrapped = null;
  };
  getSubModules = null;
  getSubOptions = <function>;
  merge = <function>;
  name = "majorMinorPatchVersion";
  nestedTypes = { };
  substSubModules = <function>;
  typeMerge = <function>;
}
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/types.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/types.nix)

## generic.types.majorMinorVersion

A version number with a major and minor component.

*Type:*
optionType

*Default:*

```
{
  _type = "option-type";
  check = <function>;
  deprecationMessage = null;
  description = "A version number with a major and minor component.";
  descriptionClass = "noun";
  emptyValue = { };
  functor = {
    binOp = <function>;
    name = "strMatching \"^([[:digit:]]+)\\\\.([[:digit:]]+)\\$\"";
    payload = null;
    type = null;
    wrapped = null;
  };
  getSubModules = null;
  getSubOptions = <function>;
  merge = <function>;
  name = "majorMinorVersion";
  nestedTypes = { };
  substSubModules = <function>;
  typeMerge = <function>;
}
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/types.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/types.nix)

## generic.types.majorVersion

A version number with a major component.

*Type:*
optionType

*Default:*

```
{
  _type = "option-type";
  check = <function>;
  deprecationMessage = null;
  description = "A version number with a major component.";
  descriptionClass = "noun";
  emptyValue = { };
  functor = {
    binOp = <function>;
    name = "strMatching \"^([[:digit:]]+)\\$\"";
    payload = null;
    type = null;
    wrapped = null;
  };
  getSubModules = null;
  getSubOptions = <function>;
  merge = <function>;
  name = "majorVersion";
  nestedTypes = { };
  substSubModules = <function>;
  typeMerge = <function>;
}
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/types.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/types.nix)

## generic.types.nonJetsonGpu

A GPU that is not part of NVIDIA’s Jetson line of embedded computers

*Type:*
optionType

*Default:*

```
{
  _type = "option-type";
  check = <function>;
  deprecationMessage = null;
  description = "submodule";
  descriptionClass = null;
  emptyValue = {
    value = { };
  };
  functor = {
    binOp = <function>;
    name = "submodule";
    payload = {
      class = null;
      description = null;
      modules = [
        {
          options = {
            archName = {
              _type = "option";
              description = "Name of the microarchitecture";
              example = "Kepler";
              type = {
                _type = "option-type";
                check = <function>;
                deprecationMessage = null;
                description = "A CUDA architecture name, like Ampere or Ada.";
                descriptionClass = "noun";
                emptyValue = { };
                functor = {
                  binOp = <function>;
                  name = "strMatching \"^[[:alpha:]]+\\$\"";
                  payload = null;
                  type = null;
                  wrapped = null;
                };
                getSubModules = null;
                getSubOptions = <function>;
                merge = <function>;
                name = "archName";
                nestedTypes = { };
                substSubModules = <function>;
                typeMerge = <function>;
              };
            };
            computeCapability = {
              _type = "option";
              description = "Compute capability of the GPU";
              example = "3.0";
              type = {
                _type = "option-type";
                check = <function>;
                deprecationMessage = null;
                description = "A CUDA capability version.";
                descriptionClass = "noun";
                emptyValue = { };
                functor = {
                  binOp = <function>;
                  name = "strMatching \"^[[:digit:]]+\\\\.[[:digit:]]+[a-z]?\\$\"";
                  payload = null;
                  type = null;
                  wrapped = null;
                };
                getSubModules = null;
                getSubOptions = <function>;
                merge = <function>;
                name = "cudaCapability";
                nestedTypes = { };
                substSubModules = <function>;
                typeMerge = <function>;
              };
            };
            dontDefaultAfter = {
              _type = "option";
              description = ''
                The CUDA version after which to exclude this GPU from the list of default capabilities
                we build. null means we always include this GPU in the default capabilities if it is
                supported.
              '';
              example = "10.2";
              type = {
                _type = "option-type";
                check = <function>;
                deprecationMessage = null;
                description = "null or A version number with a major and minor component.";
                descriptionClass = "conjunction";
                emptyValue = {
                  value = null;
                };
                functor = {
                  binOp = <function>;
                  name = "nullOr";
                  payload = null;
                  type = <function>;
                  wrapped = {
                    _type = "option-type";
                    check = <function>;
                    deprecationMessage = null;
                    description = "A version number with a major and minor component.";
                    descriptionClass = "noun";
                    emptyValue = { };
                    functor = {
                      binOp = <function>;
                      name = "strMatching \"^([[:digit:]]+)\\\\.([[:digit:]]+)\\$\"";
                      payload = null;
                      type = null;
                      wrapped = null;
                    };
                    getSubModules = null;
                    getSubOptions = <function>;
                    merge = <function>;
                    name = "majorMinorVersion";
                    nestedTypes = { };
                    substSubModules = <function>;
                    typeMerge = <function>;
                  };
                };
                getSubModules = null;
                getSubOptions = <function>;
                merge = <function>;
                name = "nullOr";
                nestedTypes = {
                  elemType = {
                    _type = "option-type";
                    check = <function>;
                    deprecationMessage = null;
                    description = "A version number with a major and minor component.";
                    descriptionClass = "noun";
                    emptyValue = { };
                    functor = {
                      binOp = <function>;
                      name = "strMatching \"^([[:digit:]]+)\\\\.([[:digit:]]+)\\$\"";
                      payload = null;
                      type = null;
                      wrapped = null;
                    };
                    getSubModules = null;
                    getSubOptions = <function>;
                    merge = <function>;
                    name = "majorMinorVersion";
                    nestedTypes = { };
                    substSubModules = <function>;
                    typeMerge = <function>;
                  };
                };
                substSubModules = <function>;
                typeMerge = <function>;
              };
            };
            isJetson = {
              _type = "option";
              description = ''
                Whether a GPU is part of NVIDIA's line of Jetson embedded computers.
                
                This field is notable because it tells us what architecture to build for (as Jetson devices are
                aarch64). More on Jetson devices here:
                https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/
                
                NOTE: These architectures are only built upon request.
              '';
              type = {
                _type = "option-type";
                check = <function>;
                deprecationMessage = null;
                description = "one of true, false";
                descriptionClass = "conjunction";
                emptyValue = { };
                functor = {
                  binOp = <function>;
                  name = "enum";
                  payload = [
                    true
                    false
                  ];
                  type = <function>;
                  wrapped = null;
                };
                getSubModules = null;
                getSubOptions = <function>;
                merge = <function>;
                name = "enum";
                nestedTypes = { };
                substSubModules = <function>;
                typeMerge = <function>;
              };
            };
            maxCudaVersion = {
              _type = "option";
              description = "The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.";
              example = "10.2";
              type = {
                _type = "option-type";
                check = <function>;
                deprecationMessage = null;
                description = "null or A version number with a major and minor component.";
                descriptionClass = "conjunction";
                emptyValue = {
                  value = null;
                };
                functor = {
                  binOp = <function>;
                  name = "nullOr";
                  payload = null;
                  type = <function>;
                  wrapped = {
                    _type = "option-type";
                    check = <function>;
                    deprecationMessage = null;
                    description = "A version number with a major and minor component.";
                    descriptionClass = "noun";
                    emptyValue = { };
                    functor = {
                      binOp = <function>;
                      name = "strMatching \"^([[:digit:]]+)\\\\.([[:digit:]]+)\\$\"";
                      payload = null;
                      type = null;
                      wrapped = null;
                    };
                    getSubModules = null;
                    getSubOptions = <function>;
                    merge = <function>;
                    name = "majorMinorVersion";
                    nestedTypes = { };
                    substSubModules = <function>;
                    typeMerge = <function>;
                  };
                };
                getSubModules = null;
                getSubOptions = <function>;
                merge = <function>;
                name = "nullOr";
                nestedTypes = {
                  elemType = {
                    _type = "option-type";
                    check = <function>;
                    deprecationMessage = null;
                    description = "A version number with a major and minor component.";
                    descriptionClass = "noun";
                    emptyValue = { };
                    functor = {
                      binOp = <function>;
                      name = "strMatching \"^([[:digit:]]+)\\\\.([[:digit:]]+)\\$\"";
                      payload = null;
                      type = null;
                      wrapped = null;
                    };
                    getSubModules = null;
                    getSubOptions = <function>;
                    merge = <function>;
                    name = "majorMinorVersion";
                    nestedTypes = { };
                    substSubModules = <function>;
                    typeMerge = <function>;
                  };
                };
                substSubModules = <function>;
                typeMerge = <function>;
              };
            };
            minCudaVersion = {
              _type = "option";
              description = "The minimum (inclusive) CUDA version that supports this GPU.";
              example = "10.0";
              type = {
                _type = "option-type";
                check = <function>;
                deprecationMessage = null;
                description = "A version number with a major and minor component.";
                descriptionClass = "noun";
                emptyValue = { };
                functor = {
                  binOp = <function>;
                  name = "strMatching \"^([[:digit:]]+)\\\\.([[:digit:]]+)\\$\"";
                  payload = null;
                  type = null;
                  wrapped = null;
                };
                getSubModules = null;
                getSubOptions = <function>;
                merge = <function>;
                name = "majorMinorVersion";
                nestedTypes = { };
                substSubModules = <function>;
                typeMerge = <function>;
              };
            };
          };
        }
        {
          options = {
            isJetson = {
              _type = "option";
              type = {
                _type = "option-type";
                check = <function>;
                deprecationMessage = null;
                description = "value false (singular enum)";
                descriptionClass = "noun";
                emptyValue = { };
                functor = {
                  binOp = <function>;
                  name = "enum";
                  payload = [
                    false
                  ];
                  type = <function>;
                  wrapped = null;
                };
                getSubModules = null;
                getSubOptions = <function>;
                merge = <function>;
                name = "enum";
                nestedTypes = { };
                substSubModules = <function>;
                typeMerge = <function>;
              };
            };
          };
        }
      ];
      shorthandOnlyDefinesConfig = false;
      specialArgs = { };
    };
    type = <function, args: {class?, description?, modules, shorthandOnlyDefinesConfig?, specialArgs?}>;
    wrapped = null;
  };
  getSubModules = [
    {
      options = {
        archName = {
          _type = "option";
          description = "Name of the microarchitecture";
          example = "Kepler";
          type = {
            _type = "option-type";
            check = <function>;
            deprecationMessage = null;
            description = "A CUDA architecture name, like Ampere or Ada.";
            descriptionClass = "noun";
            emptyValue = { };
            functor = {
              binOp = <function>;
              name = "strMatching \"^[[:alpha:]]+\\$\"";
              payload = null;
              type = null;
              wrapped = null;
            };
            getSubModules = null;
            getSubOptions = <function>;
            merge = <function>;
            name = "archName";
            nestedTypes = { };
            substSubModules = <function>;
            typeMerge = <function>;
          };
        };
        computeCapability = {
          _type = "option";
          description = "Compute capability of the GPU";
          example = "3.0";
          type = {
            _type = "option-type";
            check = <function>;
            deprecationMessage = null;
            description = "A CUDA capability version.";
            descriptionClass = "noun";
            emptyValue = { };
            functor = {
              binOp = <function>;
              name = "strMatching \"^[[:digit:]]+\\\\.[[:digit:]]+[a-z]?\\$\"";
              payload = null;
              type = null;
              wrapped = null;
            };
            getSubModules = null;
            getSubOptions = <function>;
            merge = <function>;
            name = "cudaCapability";
            nestedTypes = { };
            substSubModules = <function>;
            typeMerge = <function>;
          };
        };
        dontDefaultAfter = {
          _type = "option";
          description = ''
            The CUDA version after which to exclude this GPU from the list of default capabilities
            we build. null means we always include this GPU in the default capabilities if it is
            supported.
          '';
          example = "10.2";
          type = {
            _type = "option-type";
            check = <function>;
            deprecationMessage = null;
            description = "null or A version number with a major and minor component.";
            descriptionClass = "conjunction";
            emptyValue = {
              value = null;
            };
            functor = {
              binOp = <function>;
              name = "nullOr";
              payload = null;
              type = <function>;
              wrapped = {
                _type = "option-type";
                check = <function>;
                deprecationMessage = null;
                description = "A version number with a major and minor component.";
                descriptionClass = "noun";
                emptyValue = { };
                functor = {
                  binOp = <function>;
                  name = "strMatching \"^([[:digit:]]+)\\\\.([[:digit:]]+)\\$\"";
                  payload = null;
                  type = null;
                  wrapped = null;
                };
                getSubModules = null;
                getSubOptions = <function>;
                merge = <function>;
                name = "majorMinorVersion";
                nestedTypes = { };
                substSubModules = <function>;
                typeMerge = <function>;
              };
            };
            getSubModules = null;
            getSubOptions = <function>;
            merge = <function>;
            name = "nullOr";
            nestedTypes = {
              elemType = {
                _type = "option-type";
                check = <function>;
                deprecationMessage = null;
                description = "A version number with a major and minor component.";
                descriptionClass = "noun";
                emptyValue = { };
                functor = {
                  binOp = <function>;
                  name = "strMatching \"^([[:digit:]]+)\\\\.([[:digit:]]+)\\$\"";
                  payload = null;
                  type = null;
                  wrapped = null;
                };
                getSubModules = null;
                getSubOptions = <function>;
                merge = <function>;
                name = "majorMinorVersion";
                nestedTypes = { };
                substSubModules = <function>;
                typeMerge = <function>;
              };
            };
            substSubModules = <function>;
            typeMerge = <function>;
          };
        };
        isJetson = {
          _type = "option";
          description = ''
            Whether a GPU is part of NVIDIA's line of Jetson embedded computers.
            
            This field is notable because it tells us what architecture to build for (as Jetson devices are
            aarch64). More on Jetson devices here:
            https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/
            
            NOTE: These architectures are only built upon request.
          '';
          type = {
            _type = "option-type";
            check = <function>;
            deprecationMessage = null;
            description = "one of true, false";
            descriptionClass = "conjunction";
            emptyValue = { };
            functor = {
              binOp = <function>;
              name = "enum";
              payload = [
                true
                false
              ];
              type = <function>;
              wrapped = null;
            };
            getSubModules = null;
            getSubOptions = <function>;
            merge = <function>;
            name = "enum";
            nestedTypes = { };
            substSubModules = <function>;
            typeMerge = <function>;
          };
        };
        maxCudaVersion = {
          _type = "option";
          description = "The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.";
          example = "10.2";
          type = {
            _type = "option-type";
            check = <function>;
            deprecationMessage = null;
            description = "null or A version number with a major and minor component.";
            descriptionClass = "conjunction";
            emptyValue = {
              value = null;
            };
            functor = {
              binOp = <function>;
              name = "nullOr";
              payload = null;
              type = <function>;
              wrapped = {
                _type = "option-type";
                check = <function>;
                deprecationMessage = null;
                description = "A version number with a major and minor component.";
                descriptionClass = "noun";
                emptyValue = { };
                functor = {
                  binOp = <function>;
                  name = "strMatching \"^([[:digit:]]+)\\\\.([[:digit:]]+)\\$\"";
                  payload = null;
                  type = null;
                  wrapped = null;
                };
                getSubModules = null;
                getSubOptions = <function>;
                merge = <function>;
                name = "majorMinorVersion";
                nestedTypes = { };
                substSubModules = <function>;
                typeMerge = <function>;
              };
            };
            getSubModules = null;
            getSubOptions = <function>;
            merge = <function>;
            name = "nullOr";
            nestedTypes = {
              elemType = {
                _type = "option-type";
                check = <function>;
                deprecationMessage = null;
                description = "A version number with a major and minor component.";
                descriptionClass = "noun";
                emptyValue = { };
                functor = {
                  binOp = <function>;
                  name = "strMatching \"^([[:digit:]]+)\\\\.([[:digit:]]+)\\$\"";
                  payload = null;
                  type = null;
                  wrapped = null;
                };
                getSubModules = null;
                getSubOptions = <function>;
                merge = <function>;
                name = "majorMinorVersion";
                nestedTypes = { };
                substSubModules = <function>;
                typeMerge = <function>;
              };
            };
            substSubModules = <function>;
            typeMerge = <function>;
          };
        };
        minCudaVersion = {
          _type = "option";
          description = "The minimum (inclusive) CUDA version that supports this GPU.";
          example = "10.0";
          type = {
            _type = "option-type";
            check = <function>;
            deprecationMessage = null;
            description = "A version number with a major and minor component.";
            descriptionClass = "noun";
            emptyValue = { };
            functor = {
              binOp = <function>;
              name = "strMatching \"^([[:digit:]]+)\\\\.([[:digit:]]+)\\$\"";
              payload = null;
              type = null;
              wrapped = null;
            };
            getSubModules = null;
            getSubOptions = <function>;
            merge = <function>;
            name = "majorMinorVersion";
            nestedTypes = { };
            substSubModules = <function>;
            typeMerge = <function>;
          };
        };
      };
    }
    {
      options = {
        isJetson = {
          _type = "option";
          type = {
            _type = "option-type";
            check = <function>;
            deprecationMessage = null;
            description = "value false (singular enum)";
            descriptionClass = "noun";
            emptyValue = { };
            functor = {
              binOp = <function>;
              name = "enum";
              payload = [
                false
              ];
              type = <function>;
              wrapped = null;
            };
            getSubModules = null;
            getSubOptions = <function>;
            merge = <function>;
            name = "enum";
            nestedTypes = { };
            substSubModules = <function>;
            typeMerge = <function>;
          };
        };
      };
    }
  ];
  getSubOptions = <function>;
  merge = <function>;
  name = "submodule";
  nestedTypes = { };
  substSubModules = <function>;
  typeMerge = <function>;
}
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/data/gpus\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/data/gpus)

## generic.types.nvccCompatibilities

Mapping of CUDA version to known NVCC compatibilities with GCC and Clang

Taken from
https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html#host-compiler-support-policy

NVCC performs a version check on the host compiler’s major version and so newer minor versions
of the compilers listed below will be supported, but major versions falling outside the range
will not be supported.

NOTE: These constraints don’t apply to Jetson, which uses something else.
NOTE: NVIDIA can and will add support for newer compilers even during patch releases.
E.g.: CUDA 12.2.1 maxxed out with support for Clang 15.0; 12.2.2 added support for Clang 16.0.
NOTE: Because all platforms NVIDIA supports use GCC and Clang, we omit the architectures here.

*Type:*
optionType

*Default:*

```
{
  _type = "option-type";
  check = <function>;
  deprecationMessage = null;
  description = "attribute set of (submodule)";
  descriptionClass = "composite";
  emptyValue = {
    value = { };
  };
  functor = {
    binOp = <function>;
    name = "attrsOf";
    payload = null;
    type = <function>;
    wrapped = {
      _type = "option-type";
      check = <function>;
      deprecationMessage = null;
      description = "submodule";
      descriptionClass = null;
      emptyValue = {
        value = { };
      };
      functor = {
        binOp = <function>;
        name = "submodule";
        payload = {
          class = null;
          description = null;
          modules = [
            {
              options = {
                clangMaxMajorVersion = {
                  _type = "option";
                  description = "Maximum Clang major version to support this CUDA version";
                  type = {
                    _type = "option-type";
                    check = <function>;
                    deprecationMessage = null;
                    description = "A version number with a major component.";
                    descriptionClass = "noun";
                    emptyValue = { };
                    functor = {
                      binOp = <function>;
                      name = "strMatching \"^([[:digit:]]+)\\$\"";
                      payload = null;
                      type = null;
                      wrapped = null;
                    };
                    getSubModules = null;
                    getSubOptions = <function>;
                    merge = <function>;
                    name = "majorVersion";
                    nestedTypes = { };
                    substSubModules = <function>;
                    typeMerge = <function>;
                  };
                };
                clangMinMajorVersion = {
                  _type = "option";
                  description = "Minimum Clang major version to support this CUDA version";
                  type = {
                    _type = "option-type";
                    check = <function>;
                    deprecationMessage = null;
                    description = "A version number with a major component.";
                    descriptionClass = "noun";
                    emptyValue = { };
                    functor = {
                      binOp = <function>;
                      name = "strMatching \"^([[:digit:]]+)\\$\"";
                      payload = null;
                      type = null;
                      wrapped = null;
                    };
                    getSubModules = null;
                    getSubOptions = <function>;
                    merge = <function>;
                    name = "majorVersion";
                    nestedTypes = { };
                    substSubModules = <function>;
                    typeMerge = <function>;
                  };
                };
                gccMaxMajorVersion = {
                  _type = "option";
                  description = "Maximum GCC major version to support this CUDA version";
                  type = {
                    _type = "option-type";
                    check = <function>;
                    deprecationMessage = null;
                    description = "A version number with a major component.";
                    descriptionClass = "noun";
                    emptyValue = { };
                    functor = {
                      binOp = <function>;
                      name = "strMatching \"^([[:digit:]]+)\\$\"";
                      payload = null;
                      type = null;
                      wrapped = null;
                    };
                    getSubModules = null;
                    getSubOptions = <function>;
                    merge = <function>;
                    name = "majorVersion";
                    nestedTypes = { };
                    substSubModules = <function>;
                    typeMerge = <function>;
                  };
                };
                gccMinMajorVersion = {
                  _type = "option";
                  description = "Minimum GCC major version to support this CUDA version";
                  type = {
                    _type = "option-type";
                    check = <function>;
                    deprecationMessage = null;
                    description = "A version number with a major component.";
                    descriptionClass = "noun";
                    emptyValue = { };
                    functor = {
                      binOp = <function>;
                      name = "strMatching \"^([[:digit:]]+)\\$\"";
                      payload = null;
                      type = null;
                      wrapped = null;
                    };
                    getSubModules = null;
                    getSubOptions = <function>;
                    merge = <function>;
                    name = "majorVersion";
                    nestedTypes = { };
                    substSubModules = <function>;
                    typeMerge = <function>;
                  };
                };
              };
            }
          ];
          shorthandOnlyDefinesConfig = false;
          specialArgs = { };
        };
        type = <function, args: {class?, description?, modules, shorthandOnlyDefinesConfig?, specialArgs?}>;
        wrapped = null;
      };
      getSubModules = [
        {
          options = {
            clangMaxMajorVersion = {
              _type = "option";
              description = "Maximum Clang major version to support this CUDA version";
              type = {
                _type = "option-type";
                check = <function>;
                deprecationMessage = null;
                description = "A version number with a major component.";
                descriptionClass = "noun";
                emptyValue = { };
                functor = {
                  binOp = <function>;
                  name = "strMatching \"^([[:digit:]]+)\\$\"";
                  payload = null;
                  type = null;
                  wrapped = null;
                };
                getSubModules = null;
                getSubOptions = <function>;
                merge = <function>;
                name = "majorVersion";
                nestedTypes = { };
                substSubModules = <function>;
                typeMerge = <function>;
              };
            };
            clangMinMajorVersion = {
              _type = "option";
              description = "Minimum Clang major version to support this CUDA version";
              type = {
                _type = "option-type";
                check = <function>;
                deprecationMessage = null;
                description = "A version number with a major component.";
                descriptionClass = "noun";
                emptyValue = { };
                functor = {
                  binOp = <function>;
                  name = "strMatching \"^([[:digit:]]+)\\$\"";
                  payload = null;
                  type = null;
                  wrapped = null;
                };
                getSubModules = null;
                getSubOptions = <function>;
                merge = <function>;
                name = "majorVersion";
                nestedTypes = { };
                substSubModules = <function>;
                typeMerge = <function>;
              };
            };
            gccMaxMajorVersion = {
              _type = "option";
              description = "Maximum GCC major version to support this CUDA version";
              type = {
                _type = "option-type";
                check = <function>;
                deprecationMessage = null;
                description = "A version number with a major component.";
                descriptionClass = "noun";
                emptyValue = { };
                functor = {
                  binOp = <function>;
                  name = "strMatching \"^([[:digit:]]+)\\$\"";
                  payload = null;
                  type = null;
                  wrapped = null;
                };
                getSubModules = null;
                getSubOptions = <function>;
                merge = <function>;
                name = "majorVersion";
                nestedTypes = { };
                substSubModules = <function>;
                typeMerge = <function>;
              };
            };
            gccMinMajorVersion = {
              _type = "option";
              description = "Minimum GCC major version to support this CUDA version";
              type = {
                _type = "option-type";
                check = <function>;
                deprecationMessage = null;
                description = "A version number with a major component.";
                descriptionClass = "noun";
                emptyValue = { };
                functor = {
                  binOp = <function>;
                  name = "strMatching \"^([[:digit:]]+)\\$\"";
                  payload = null;
                  type = null;
                  wrapped = null;
                };
                getSubModules = null;
                getSubOptions = <function>;
                merge = <function>;
                name = "majorVersion";
                nestedTypes = { };
                substSubModules = <function>;
                typeMerge = <function>;
              };
            };
          };
        }
      ];
      getSubOptions = <function>;
      merge = <function>;
      name = "submodule";
      nestedTypes = { };
      substSubModules = <function>;
      typeMerge = <function>;
    };
  };
  getSubModules = [
    {
      options = {
        clangMaxMajorVersion = {
          _type = "option";
          description = "Maximum Clang major version to support this CUDA version";
          type = {
            _type = "option-type";
            check = <function>;
            deprecationMessage = null;
            description = "A version number with a major component.";
            descriptionClass = "noun";
            emptyValue = { };
            functor = {
              binOp = <function>;
              name = "strMatching \"^([[:digit:]]+)\\$\"";
              payload = null;
              type = null;
              wrapped = null;
            };
            getSubModules = null;
            getSubOptions = <function>;
            merge = <function>;
            name = "majorVersion";
            nestedTypes = { };
            substSubModules = <function>;
            typeMerge = <function>;
          };
        };
        clangMinMajorVersion = {
          _type = "option";
          description = "Minimum Clang major version to support this CUDA version";
          type = {
            _type = "option-type";
            check = <function>;
            deprecationMessage = null;
            description = "A version number with a major component.";
            descriptionClass = "noun";
            emptyValue = { };
            functor = {
              binOp = <function>;
              name = "strMatching \"^([[:digit:]]+)\\$\"";
              payload = null;
              type = null;
              wrapped = null;
            };
            getSubModules = null;
            getSubOptions = <function>;
            merge = <function>;
            name = "majorVersion";
            nestedTypes = { };
            substSubModules = <function>;
            typeMerge = <function>;
          };
        };
        gccMaxMajorVersion = {
          _type = "option";
          description = "Maximum GCC major version to support this CUDA version";
          type = {
            _type = "option-type";
            check = <function>;
            deprecationMessage = null;
            description = "A version number with a major component.";
            descriptionClass = "noun";
            emptyValue = { };
            functor = {
              binOp = <function>;
              name = "strMatching \"^([[:digit:]]+)\\$\"";
              payload = null;
              type = null;
              wrapped = null;
            };
            getSubModules = null;
            getSubOptions = <function>;
            merge = <function>;
            name = "majorVersion";
            nestedTypes = { };
            substSubModules = <function>;
            typeMerge = <function>;
          };
        };
        gccMinMajorVersion = {
          _type = "option";
          description = "Minimum GCC major version to support this CUDA version";
          type = {
            _type = "option-type";
            check = <function>;
            deprecationMessage = null;
            description = "A version number with a major component.";
            descriptionClass = "noun";
            emptyValue = { };
            functor = {
              binOp = <function>;
              name = "strMatching \"^([[:digit:]]+)\\$\"";
              payload = null;
              type = null;
              wrapped = null;
            };
            getSubModules = null;
            getSubOptions = <function>;
            merge = <function>;
            name = "majorVersion";
            nestedTypes = { };
            substSubModules = <function>;
            typeMerge = <function>;
          };
        };
      };
    }
  ];
  getSubOptions = <function>;
  merge = <function>;
  name = "attrsOf";
  nestedTypes = {
    elemType = {
      _type = "option-type";
      check = <function>;
      deprecationMessage = null;
      description = "submodule";
      descriptionClass = null;
      emptyValue = {
        value = { };
      };
      functor = {
        binOp = <function>;
        name = "submodule";
        payload = {
          class = null;
          description = null;
          modules = [
            {
              options = {
                clangMaxMajorVersion = {
                  _type = "option";
                  description = "Maximum Clang major version to support this CUDA version";
                  type = {
                    _type = "option-type";
                    check = <function>;
                    deprecationMessage = null;
                    description = "A version number with a major component.";
                    descriptionClass = "noun";
                    emptyValue = { };
                    functor = {
                      binOp = <function>;
                      name = "strMatching \"^([[:digit:]]+)\\$\"";
                      payload = null;
                      type = null;
                      wrapped = null;
                    };
                    getSubModules = null;
                    getSubOptions = <function>;
                    merge = <function>;
                    name = "majorVersion";
                    nestedTypes = { };
                    substSubModules = <function>;
                    typeMerge = <function>;
                  };
                };
                clangMinMajorVersion = {
                  _type = "option";
                  description = "Minimum Clang major version to support this CUDA version";
                  type = {
                    _type = "option-type";
                    check = <function>;
                    deprecationMessage = null;
                    description = "A version number with a major component.";
                    descriptionClass = "noun";
                    emptyValue = { };
                    functor = {
                      binOp = <function>;
                      name = "strMatching \"^([[:digit:]]+)\\$\"";
                      payload = null;
                      type = null;
                      wrapped = null;
                    };
                    getSubModules = null;
                    getSubOptions = <function>;
                    merge = <function>;
                    name = "majorVersion";
                    nestedTypes = { };
                    substSubModules = <function>;
                    typeMerge = <function>;
                  };
                };
                gccMaxMajorVersion = {
                  _type = "option";
                  description = "Maximum GCC major version to support this CUDA version";
                  type = {
                    _type = "option-type";
                    check = <function>;
                    deprecationMessage = null;
                    description = "A version number with a major component.";
                    descriptionClass = "noun";
                    emptyValue = { };
                    functor = {
                      binOp = <function>;
                      name = "strMatching \"^([[:digit:]]+)\\$\"";
                      payload = null;
                      type = null;
                      wrapped = null;
                    };
                    getSubModules = null;
                    getSubOptions = <function>;
                    merge = <function>;
                    name = "majorVersion";
                    nestedTypes = { };
                    substSubModules = <function>;
                    typeMerge = <function>;
                  };
                };
                gccMinMajorVersion = {
                  _type = "option";
                  description = "Minimum GCC major version to support this CUDA version";
                  type = {
                    _type = "option-type";
                    check = <function>;
                    deprecationMessage = null;
                    description = "A version number with a major component.";
                    descriptionClass = "noun";
                    emptyValue = { };
                    functor = {
                      binOp = <function>;
                      name = "strMatching \"^([[:digit:]]+)\\$\"";
                      payload = null;
                      type = null;
                      wrapped = null;
                    };
                    getSubModules = null;
                    getSubOptions = <function>;
                    merge = <function>;
                    name = "majorVersion";
                    nestedTypes = { };
                    substSubModules = <function>;
                    typeMerge = <function>;
                  };
                };
              };
            }
          ];
          shorthandOnlyDefinesConfig = false;
          specialArgs = { };
        };
        type = <function, args: {class?, description?, modules, shorthandOnlyDefinesConfig?, specialArgs?}>;
        wrapped = null;
      };
      getSubModules = [
        {
          options = {
            clangMaxMajorVersion = {
              _type = "option";
              description = "Maximum Clang major version to support this CUDA version";
              type = {
                _type = "option-type";
                check = <function>;
                deprecationMessage = null;
                description = "A version number with a major component.";
                descriptionClass = "noun";
                emptyValue = { };
                functor = {
                  binOp = <function>;
                  name = "strMatching \"^([[:digit:]]+)\\$\"";
                  payload = null;
                  type = null;
                  wrapped = null;
                };
                getSubModules = null;
                getSubOptions = <function>;
                merge = <function>;
                name = "majorVersion";
                nestedTypes = { };
                substSubModules = <function>;
                typeMerge = <function>;
              };
            };
            clangMinMajorVersion = {
              _type = "option";
              description = "Minimum Clang major version to support this CUDA version";
              type = {
                _type = "option-type";
                check = <function>;
                deprecationMessage = null;
                description = "A version number with a major component.";
                descriptionClass = "noun";
                emptyValue = { };
                functor = {
                  binOp = <function>;
                  name = "strMatching \"^([[:digit:]]+)\\$\"";
                  payload = null;
                  type = null;
                  wrapped = null;
                };
                getSubModules = null;
                getSubOptions = <function>;
                merge = <function>;
                name = "majorVersion";
                nestedTypes = { };
                substSubModules = <function>;
                typeMerge = <function>;
              };
            };
            gccMaxMajorVersion = {
              _type = "option";
              description = "Maximum GCC major version to support this CUDA version";
              type = {
                _type = "option-type";
                check = <function>;
                deprecationMessage = null;
                description = "A version number with a major component.";
                descriptionClass = "noun";
                emptyValue = { };
                functor = {
                  binOp = <function>;
                  name = "strMatching \"^([[:digit:]]+)\\$\"";
                  payload = null;
                  type = null;
                  wrapped = null;
                };
                getSubModules = null;
                getSubOptions = <function>;
                merge = <function>;
                name = "majorVersion";
                nestedTypes = { };
                substSubModules = <function>;
                typeMerge = <function>;
              };
            };
            gccMinMajorVersion = {
              _type = "option";
              description = "Minimum GCC major version to support this CUDA version";
              type = {
                _type = "option-type";
                check = <function>;
                deprecationMessage = null;
                description = "A version number with a major component.";
                descriptionClass = "noun";
                emptyValue = { };
                functor = {
                  binOp = <function>;
                  name = "strMatching \"^([[:digit:]]+)\\$\"";
                  payload = null;
                  type = null;
                  wrapped = null;
                };
                getSubModules = null;
                getSubOptions = <function>;
                merge = <function>;
                name = "majorVersion";
                nestedTypes = { };
                substSubModules = <function>;
                typeMerge = <function>;
              };
            };
          };
        }
      ];
      getSubOptions = <function>;
      merge = <function>;
      name = "submodule";
      nestedTypes = { };
      substSubModules = <function>;
      typeMerge = <function>;
    };
  };
  substSubModules = <function>;
  typeMerge = <function>;
}
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/data/nvcc-compatibilities\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/data/nvcc-compatibilities)

## generic.types.nvccCompatibility

Compatibility of an instance of NVCC with GCC and Clang

*Type:*
optionType

*Default:*

```
{
  _type = "option-type";
  check = <function>;
  deprecationMessage = null;
  description = "submodule";
  descriptionClass = null;
  emptyValue = {
    value = { };
  };
  functor = {
    binOp = <function>;
    name = "submodule";
    payload = {
      class = null;
      description = null;
      modules = [
        {
          options = {
            clangMaxMajorVersion = {
              _type = "option";
              description = "Maximum Clang major version to support this CUDA version";
              type = {
                _type = "option-type";
                check = <function>;
                deprecationMessage = null;
                description = "A version number with a major component.";
                descriptionClass = "noun";
                emptyValue = { };
                functor = {
                  binOp = <function>;
                  name = "strMatching \"^([[:digit:]]+)\\$\"";
                  payload = null;
                  type = null;
                  wrapped = null;
                };
                getSubModules = null;
                getSubOptions = <function>;
                merge = <function>;
                name = "majorVersion";
                nestedTypes = { };
                substSubModules = <function>;
                typeMerge = <function>;
              };
            };
            clangMinMajorVersion = {
              _type = "option";
              description = "Minimum Clang major version to support this CUDA version";
              type = {
                _type = "option-type";
                check = <function>;
                deprecationMessage = null;
                description = "A version number with a major component.";
                descriptionClass = "noun";
                emptyValue = { };
                functor = {
                  binOp = <function>;
                  name = "strMatching \"^([[:digit:]]+)\\$\"";
                  payload = null;
                  type = null;
                  wrapped = null;
                };
                getSubModules = null;
                getSubOptions = <function>;
                merge = <function>;
                name = "majorVersion";
                nestedTypes = { };
                substSubModules = <function>;
                typeMerge = <function>;
              };
            };
            gccMaxMajorVersion = {
              _type = "option";
              description = "Maximum GCC major version to support this CUDA version";
              type = {
                _type = "option-type";
                check = <function>;
                deprecationMessage = null;
                description = "A version number with a major component.";
                descriptionClass = "noun";
                emptyValue = { };
                functor = {
                  binOp = <function>;
                  name = "strMatching \"^([[:digit:]]+)\\$\"";
                  payload = null;
                  type = null;
                  wrapped = null;
                };
                getSubModules = null;
                getSubOptions = <function>;
                merge = <function>;
                name = "majorVersion";
                nestedTypes = { };
                substSubModules = <function>;
                typeMerge = <function>;
              };
            };
            gccMinMajorVersion = {
              _type = "option";
              description = "Minimum GCC major version to support this CUDA version";
              type = {
                _type = "option-type";
                check = <function>;
                deprecationMessage = null;
                description = "A version number with a major component.";
                descriptionClass = "noun";
                emptyValue = { };
                functor = {
                  binOp = <function>;
                  name = "strMatching \"^([[:digit:]]+)\\$\"";
                  payload = null;
                  type = null;
                  wrapped = null;
                };
                getSubModules = null;
                getSubOptions = <function>;
                merge = <function>;
                name = "majorVersion";
                nestedTypes = { };
                substSubModules = <function>;
                typeMerge = <function>;
              };
            };
          };
        }
      ];
      shorthandOnlyDefinesConfig = false;
      specialArgs = { };
    };
    type = <function, args: {class?, description?, modules, shorthandOnlyDefinesConfig?, specialArgs?}>;
    wrapped = null;
  };
  getSubModules = [
    {
      options = {
        clangMaxMajorVersion = {
          _type = "option";
          description = "Maximum Clang major version to support this CUDA version";
          type = {
            _type = "option-type";
            check = <function>;
            deprecationMessage = null;
            description = "A version number with a major component.";
            descriptionClass = "noun";
            emptyValue = { };
            functor = {
              binOp = <function>;
              name = "strMatching \"^([[:digit:]]+)\\$\"";
              payload = null;
              type = null;
              wrapped = null;
            };
            getSubModules = null;
            getSubOptions = <function>;
            merge = <function>;
            name = "majorVersion";
            nestedTypes = { };
            substSubModules = <function>;
            typeMerge = <function>;
          };
        };
        clangMinMajorVersion = {
          _type = "option";
          description = "Minimum Clang major version to support this CUDA version";
          type = {
            _type = "option-type";
            check = <function>;
            deprecationMessage = null;
            description = "A version number with a major component.";
            descriptionClass = "noun";
            emptyValue = { };
            functor = {
              binOp = <function>;
              name = "strMatching \"^([[:digit:]]+)\\$\"";
              payload = null;
              type = null;
              wrapped = null;
            };
            getSubModules = null;
            getSubOptions = <function>;
            merge = <function>;
            name = "majorVersion";
            nestedTypes = { };
            substSubModules = <function>;
            typeMerge = <function>;
          };
        };
        gccMaxMajorVersion = {
          _type = "option";
          description = "Maximum GCC major version to support this CUDA version";
          type = {
            _type = "option-type";
            check = <function>;
            deprecationMessage = null;
            description = "A version number with a major component.";
            descriptionClass = "noun";
            emptyValue = { };
            functor = {
              binOp = <function>;
              name = "strMatching \"^([[:digit:]]+)\\$\"";
              payload = null;
              type = null;
              wrapped = null;
            };
            getSubModules = null;
            getSubOptions = <function>;
            merge = <function>;
            name = "majorVersion";
            nestedTypes = { };
            substSubModules = <function>;
            typeMerge = <function>;
          };
        };
        gccMinMajorVersion = {
          _type = "option";
          description = "Minimum GCC major version to support this CUDA version";
          type = {
            _type = "option-type";
            check = <function>;
            deprecationMessage = null;
            description = "A version number with a major component.";
            descriptionClass = "noun";
            emptyValue = { };
            functor = {
              binOp = <function>;
              name = "strMatching \"^([[:digit:]]+)\\$\"";
              payload = null;
              type = null;
              wrapped = null;
            };
            getSubModules = null;
            getSubOptions = <function>;
            merge = <function>;
            name = "majorVersion";
            nestedTypes = { };
            substSubModules = <function>;
            typeMerge = <function>;
          };
        };
      };
    }
  ];
  getSubOptions = <function>;
  merge = <function>;
  name = "submodule";
  nestedTypes = { };
  substSubModules = <function>;
  typeMerge = <function>;
}
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/data/nvcc-compatibilities\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/data/nvcc-compatibilities)

## generic.types.virtualCudaArch

A virtual CUDA architecture name.

*Type:*
optionType

*Default:*

```
{
  _type = "option-type";
  check = <function>;
  deprecationMessage = null;
  description = "A virtual CUDA architecture name.";
  descriptionClass = "noun";
  emptyValue = { };
  functor = {
    binOp = <function>;
    name = "strMatching \"^compute_[[:digit:]]+[a-z]?\\$\"";
    payload = null;
    type = null;
    wrapped = null;
  };
  getSubModules = null;
  getSubOptions = <function>;
  merge = <function>;
  name = "virtualCudaArch";
  nestedTypes = { };
  substSubModules = <function>;
  typeMerge = <function>;
}
```

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/types.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/types.nix)

## generic.utils

A set of utility functions used in building cudaPackages.

*Type:*
anything

*Default:*
`{ }`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic)

## generic.utils.mkVersionedPackageName

A function to generate a versioned package name

*Type:*
function that evaluates to a(n) function that evaluates to a(n) string

*Default:*
`<function>`

*Declared by:*

- \[/nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/utils.nix\](file:///nix/store/qbcb5y4gv6lw4mr9dap8f1whh7y0dw6h-source/cuda-modules/generic/utils.nix)
