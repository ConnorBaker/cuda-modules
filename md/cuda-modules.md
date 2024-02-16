## _module\.args

Additional arguments passed to each module in addition to ones
like ` lib `, ` config `,
and ` pkgs `, ` modulesPath `\.

This option is also available to all submodules\. Submodules do not
inherit args from their parent module, nor do they provide args to
their parent module or sibling submodules\. The sole exception to
this is the argument ` name ` which is provided by
parent modules to a submodule and contains the attribute name
the submodule is bound to, or a unique generated name if it is
not bound to an attribute\.

Some arguments are already passed by default, of which the
following *cannot* be changed with this option:

 - ` lib `: The nixpkgs library\.

 - ` config `: The results of all options after merging the values from all modules together\.

 - ` options `: The options declared in all modules\.

 - ` specialArgs `: The ` specialArgs ` argument passed to ` evalModules `\.

 - All attributes of ` specialArgs `
   
   Whereas option values can generally depend on other option values
   thanks to laziness, this does not apply to ` imports `, which
   must be computed statically before anything else\.
   
   For this reason, callers of the module system can provide ` specialArgs `
   which are available during import resolution\.
   
   For NixOS, ` specialArgs ` includes
   ` modulesPath `, which allows you to import
   extra modules from the nixpkgs package tree without having to
   somehow make the module aware of the location of the
   ` nixpkgs ` or NixOS directories\.
   
   ```
   { modulesPath, ... }: {
     imports = [
       (modulesPath + "/profiles/minimal.nix")
     ];
   }
   ```

For NixOS, the default value for this option includes at least this argument:

 - ` pkgs `: The nixpkgs package set according to
   the ` nixpkgs.pkgs ` option\.



*Type:*
lazy attribute set of raw value

*Declared by:*
 - [\<nixpkgs/lib/modules\.nix>](https://github.com/NixOS/nixpkgs/blob//lib/modules.nix)



## cuda



Options for the creation of the primary CUDA redistributable packages\.



*Type:*
submodule



*Default:*

```
{
  generalFixupFn = /nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/cuda/fixup.nix;
  indexedFixupFn = /nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/cuda/fixups.nix;
  manifestPaths = [
    /nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/cuda/manifests/feature_11.4.4.json
    /nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/cuda/manifests/feature_11.5.2.json
    /nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/cuda/manifests/feature_11.6.2.json
    /nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/cuda/manifests/feature_11.7.1.json
    /nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/cuda/manifests/feature_11.8.0.json
    /nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/cuda/manifests/feature_12.0.1.json
    /nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/cuda/manifests/feature_12.1.1.json
    /nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/cuda/manifests/feature_12.2.2.json
    /nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/cuda/manifests/feature_12.3.0.json
    /nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/cuda/manifests/redistrib_11.4.4.json
    /nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/cuda/manifests/redistrib_11.5.2.json
    /nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/cuda/manifests/redistrib_11.6.2.json
    /nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/cuda/manifests/redistrib_11.7.1.json
    /nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/cuda/manifests/redistrib_11.8.0.json
    /nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/cuda/manifests/redistrib_12.0.1.json
    /nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/cuda/manifests/redistrib_12.1.1.json
    /nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/cuda/manifests/redistrib_12.2.2.json
    /nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/cuda/manifests/redistrib_12.3.0.json
  ];
}
```

*Declared by:*
 - [/nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/cuda](file:///nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/cuda)



## cuda\.generalFixupFn



A general fixup applied to all redistributables’s\. Note that it requires ` callPackage ` to provide a
` manifests ` argument\.
NOTE: The value must be inspectable by ` callPackage `\. It seems that when functions are exposed via module
configurations, they do not preserve functionArgs, and so callPackage will fail because it cannot supply
arguments by default\.



*Type:*
path or function that evaluates to a(n) (attribute set)



*Default:*
` <function> `

*Declared by:*
 - [/nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/submodules/manifests](file:///nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/submodules/manifests)



## cuda\.generic\.types



A set of types used in building cudaPackages\.



*Type:*
attribute set of optionType

*Declared by:*
 - [/nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/generic/types\.nix](file:///nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/generic/types.nix)



## cuda\.indexedFixupFn



Attribute set of functions where each key is the ` pname ` of a redistributable and each value is a
function to fixup the derivation’s attributes after being callPackage’d
NOTE: The value must be inspectable by ` callPackage `\. It seems that when functions are exposed via module
configurations, they do not preserve functionArgs, and so callPackage will fail because it cannot supply
arguments by default\.



*Type:*
path or (attribute set)



*Default:*
` { } `

*Declared by:*
 - [/nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/submodules/manifests](file:///nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/submodules/manifests)



## cuda\.manifestMetas



List of meta information about CUDA redistributable manifests



*Type:*
list of (submodule)



*Default:*
the value of the ` manifestPaths ` option under ` builtins.map mkManifestMeta `

*Declared by:*
 - [/nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/submodules/manifests](file:///nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/submodules/manifests)



## cuda\.manifestMetas\.\*\.kind



The kind of manifest file



*Type:*
one of “feature”, “redistrib”

*Declared by:*
 - [/nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/submodules/manifests](file:///nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/submodules/manifests)



## cuda\.manifestMetas\.\*\.path



Path to the manifest file



*Type:*
path

*Declared by:*
 - [/nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/submodules/manifests](file:///nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/submodules/manifests)



## cuda\.manifestMetas\.\*\.version



The manifest version (major\.minor)



*Type:*
A version number with a major and minor component\.

*Declared by:*
 - [/nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/submodules/manifests](file:///nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/submodules/manifests)



## cuda\.manifestPaths



List of paths to CUDA redistributable manifests



*Type:*
list of path

*Declared by:*
 - [/nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/submodules/manifests](file:///nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/submodules/manifests)



## cuda\.versionedManifests



Mapping of manifest version (major and minor) to feature and redistributable manifests



*Type:*
attribute set of (submodule)



*Default:*
the value of the ` manifestMetas ` option under ` mkVersionedManifests `

*Declared by:*
 - [/nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/submodules/manifests](file:///nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/submodules/manifests)



## cuda\.versionedManifests\.\<name>\.feature



A feature manifest is an attribute set which includes a mapping from package name to release



*Type:*
attribute set of attribute set of (submodule)

*Declared by:*
 - [/nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/submodules/manifests/feature\.nix](file:///nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/submodules/manifests/feature.nix)



## cuda\.versionedManifests\.\<name>\.feature\.\<name>\.\<name>\.outputs



A set of outputs that a package can provide\.



*Type:*
submodule



*Example:*

```
{
  bin = true;
  dev = true;
  doc = false;
  lib = false;
  sample = false;
  static = false;
}
```

*Declared by:*
 - [/nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/submodules/manifests/feature\.nix](file:///nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/submodules/manifests/feature.nix)



## cuda\.versionedManifests\.\<name>\.feature\.\<name>\.\<name>\.outputs\.bin



A ` bin ` output requires that we have a non-empty ` bin ` directory containing at least one file with the executable bit set\.



*Type:*
boolean

*Declared by:*
 - [/nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/submodules/manifests/feature\.nix](file:///nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/submodules/manifests/feature.nix)



## cuda\.versionedManifests\.\<name>\.feature\.\<name>\.\<name>\.outputs\.dev



A ` dev ` output requires that we have at least one of the following non-empty directories:

 - ` include `
 - ` lib/pkgconfig `
 - ` share/pkgconfig `
 - ` lib/cmake `
 - ` share/aclocal `



*Type:*
boolean

*Declared by:*
 - [/nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/submodules/manifests/feature\.nix](file:///nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/submodules/manifests/feature.nix)



## cuda\.versionedManifests\.\<name>\.feature\.\<name>\.\<name>\.outputs\.doc



A ` doc ` output requires that we have at least one of the following non-empty directories:

 - ` share/info `
 - ` share/doc `
 - ` share/gtk-doc `
 - ` share/devhelp `
 - ` share/man `



*Type:*
boolean

*Declared by:*
 - [/nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/submodules/manifests/feature\.nix](file:///nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/submodules/manifests/feature.nix)



## cuda\.versionedManifests\.\<name>\.feature\.\<name>\.\<name>\.outputs\.lib



A ` lib ` output requires that we have a non-empty lib directory containing at least one shared library\.



*Type:*
boolean

*Declared by:*
 - [/nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/submodules/manifests/feature\.nix](file:///nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/submodules/manifests/feature.nix)



## cuda\.versionedManifests\.\<name>\.feature\.\<name>\.\<name>\.outputs\.sample



A ` sample ` output requires that we have a non-empty ` samples ` directory\.



*Type:*
boolean

*Declared by:*
 - [/nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/submodules/manifests/feature\.nix](file:///nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/submodules/manifests/feature.nix)



## cuda\.versionedManifests\.\<name>\.feature\.\<name>\.\<name>\.outputs\.static



A ` static ` output requires that we have a non-empty lib directory containing at least one static library\.



*Type:*
boolean

*Declared by:*
 - [/nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/submodules/manifests/feature\.nix](file:///nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/submodules/manifests/feature.nix)



## cuda\.versionedManifests\.\<name>\.redistrib



A redistributable manifest is an attribute set which includes a mapping from package name to release



*Type:*
attribute set of (attribute set of (submodule))

*Declared by:*
 - [/nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/submodules/manifests/redistrib\.nix](file:///nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/submodules/manifests/redistrib.nix)



## cuda\.versionedManifests\.\<name>\.redistrib\.\<name>\.\<name>\.md5



The md5 hash of the package



*Type:*
string



*Example:*
` "e5deef4f6cb71f14aac5be5d5745dafe" `



## cuda\.versionedManifests\.\<name>\.redistrib\.\<name>\.\<name>\.relative_path



The relative path to the package



*Type:*
string



*Example:*
` "cuda_cccl/linux-x86_64/cuda_cccl-linux-x86_64-11.5.62-archive.tar.xz" `



## cuda\.versionedManifests\.\<name>\.redistrib\.\<name>\.\<name>\.sha256



The sha256 hash of the package



*Type:*
string



*Example:*
` "bbe633d6603d5a96a214dcb9f3f6f6fd2fa04d62e53694af97ae0c7afe0121b0" `



## cuda\.versionedManifests\.\<name>\.redistrib\.\<name>\.\<name>\.size



The size of the package as a string



*Type:*
string



*Example:*
` "960968" `



## cuda\.versionedManifests\.\<name>\.redistrib\.\<name>\.license



The license of the package



*Type:*
string



*Example:*
` "CUDA Toolkit" `



## cuda\.versionedManifests\.\<name>\.redistrib\.\<name>\.license_path



The path to the license of the package



*Type:*
null or string



*Default:*
` null `



*Example:*
` "cuda_cccl/LICENSE.txt" `



## cuda\.versionedManifests\.\<name>\.redistrib\.\<name>\.name



The full name of the package



*Type:*
string



*Example:*
` "CXX Core Compute Libraries" `



## cuda\.versionedManifests\.\<name>\.redistrib\.\<name>\.version



The version of the package



*Type:*
string



*Example:*
` "11.5.62" `



## cuda\.versionedManifests\.\<name>\.redistrib\.release_date



The release date of the manifest



*Type:*
null or string



*Default:*
` null `



*Example:*
` "2023-08-29" `

*Declared by:*
 - [/nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/submodules/manifests/redistrib\.nix](file:///nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/submodules/manifests/redistrib.nix)



## cuda\.versionedManifests\.\<name>\.redistrib\.release_label



The release label of the manifest



*Type:*
null or string



*Default:*
` null `



*Example:*
` "12.2.2" `

*Declared by:*
 - [/nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/submodules/manifests/redistrib\.nix](file:///nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/submodules/manifests/redistrib.nix)



## cuda\.versionedManifests\.\<name>\.redistrib\.release_product



The release product of the manifest



*Type:*
null or string



*Default:*
` null `



*Example:*
` "cuda" `

*Declared by:*
 - [/nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/submodules/manifests/redistrib\.nix](file:///nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/submodules/manifests/redistrib.nix)



## cudaCapabilities



CUDA capabilities (hardware generations) to build for



*Type:*
list of A CUDA capability version\.



*Default:*

```
[
  "8.9"
]
```

*Declared by:*
 - [/nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules](file:///nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules)



## cudaForwardCompat



Build with forward compatibility gencode (+PTX) to support future GPU generations



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [/nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules](file:///nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules)



## cudaSupport



Build packages with CUDA support



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [/nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules](file:///nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules)



## cudaVersions



A list of CUDA versions to create package sets for



*Type:*
list of A version number with a major and minor component\.



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
 - [/nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules](file:///nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules)



## generic\.types



A set of types used in building cudaPackages\.



*Type:*
attribute set of optionType

*Declared by:*
 - [/nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/generic/types\.nix](file:///nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/generic/types.nix)



## gpus



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
 - [/nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/gpus](file:///nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/gpus)



## gpus\.\*\.archName



Name of the microarchitecture



*Type:*
non-empty string



*Example:*
` "Kepler" `

*Declared by:*
 - [/nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/gpus](file:///nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/gpus)



## gpus\.\*\.computeCapability



Compute capability of the GPU



*Type:*
A CUDA capability version\.



*Example:*
` "3.0" `

*Declared by:*
 - [/nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/gpus](file:///nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/gpus)



## gpus\.\*\.dontDefaultAfter



The CUDA version after which to exclude this GPU from the list of default capabilities
we build\. null means we always include this GPU in the default capabilities if it is
supported\.



*Type:*
null or A version number with a major and minor component\.



*Example:*
` "10.2" `

*Declared by:*
 - [/nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/gpus](file:///nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/gpus)



## gpus\.\*\.isJetson



Whether a GPU is part of NVIDIA’s line of Jetson embedded computers\.

This field is notable because it tells us what architecture to build for (as Jetson devices are
aarch64)\. More on Jetson devices here:
https://www\.nvidia\.com/en-us/autonomous-machines/embedded-systems/

NOTE: These architectures are only built upon request\.



*Type:*
boolean

*Declared by:*
 - [/nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/gpus](file:///nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/gpus)



## gpus\.\*\.maxCudaVersion



The maximum (exclusive) CUDA version that supports this GPU\. null means there is no maximum\.



*Type:*
null or A version number with a major and minor component\.



*Example:*
` "10.2" `

*Declared by:*
 - [/nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/gpus](file:///nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/gpus)



## gpus\.\*\.minCudaVersion



The minimum (inclusive) CUDA version that supports this GPU\.



*Type:*
A version number with a major and minor component\.



*Example:*
` "10.0" `

*Declared by:*
 - [/nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/gpus](file:///nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/gpus)



## nvccCompatibilities



Mapping of CUDA version to known NVCC compatibilities with GCC and Clang

Taken from
https://docs\.nvidia\.com/cuda/cuda-installation-guide-linux/index\.html\#host-compiler-support-policy

NVCC performs a version check on the host compiler’s major version and so newer minor versions
of the compilers listed below will be supported, but major versions falling outside the range
will not be supported\.

NOTE: These constraints don’t apply to Jetson, which uses something else\.
NOTE: NVIDIA can and will add support for newer compilers even during patch releases\.
E\.g\.: CUDA 12\.2\.1 maxxed out with support for Clang 15\.0; 12\.2\.2 added support for Clang 16\.0\.
NOTE: Because all platforms NVIDIA supports use GCC and Clang, we omit the architectures here\.



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
 - [/nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/nvcc-compatibilities](file:///nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/nvcc-compatibilities)



## nvccCompatibilities\.\<name>\.clangMaxMajorVersion



Maximum Clang major version to support this CUDA version



*Type:*
A version number with a major component\.

*Declared by:*
 - [/nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/nvcc-compatibilities](file:///nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/nvcc-compatibilities)



## nvccCompatibilities\.\<name>\.clangMinMajorVersion



Minimum Clang major version to support this CUDA version



*Type:*
A version number with a major component\.

*Declared by:*
 - [/nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/nvcc-compatibilities](file:///nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/nvcc-compatibilities)



## nvccCompatibilities\.\<name>\.gccMaxMajorVersion



Maximum GCC major version to support this CUDA version



*Type:*
A version number with a major component\.

*Declared by:*
 - [/nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/nvcc-compatibilities](file:///nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/nvcc-compatibilities)



## nvccCompatibilities\.\<name>\.gccMinMajorVersion



Minimum GCC major version to support this CUDA version



*Type:*
A version number with a major component\.

*Declared by:*
 - [/nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/nvcc-compatibilities](file:///nix/store/ha7q569pqqzpx482f08vzscy217pbp30-source/cuda-modules/nvcc-compatibilities)


