{
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (lib)
    attrsets
    lists
    options
    strings
    trivial
    types
    versions
    ;

  cudaPackagesSet = options.mkOption {
    description = "A CUDA package set for a particular version of CUDA";
    type = types.submoduleWith {
      # Generic is propagated manually to avoid exposing it in the package sets.
      specialArgs = {
        inherit (config) generic;
      };
      modules = [ ./cudaPackagesSet.nix ];
    };
    default = { };
  };

  cudaPackagesSets =
    let
      # Creates a package set for each CUDA version, using the provided builder
      # function applied to the CUDA version to create the package set.
      mkCudaPackageSet =
        builder:
        attrsets.listToAttrs (
          lists.map
            (cudaVersion: {
              name = config.generic.utils.mkVersionedPackageName "cudaPackages" cudaVersion;
              value = builder cudaVersion;
            })
            config.cudaVersions
        );
    in
    options.mkOption {
      description = "CUDA Package Sets";
      type = types.submoduleWith {
        # Map each CUDA version to an option type for the package set.
        modules = [ { options = mkCudaPackageSet (trivial.const cudaPackagesSet); } ];
      };
      default = mkCudaPackageSet (cudaVersion: { inherit cudaVersion; });
    };
in
{
  imports = [
    ./generic
    # ./utils.nix
    # # Always after generic
    # ./cuda
    # ./cudnn
    # ./tensorrt
    # ./cutensor
  ];

  # Flags are determined based on your CUDA toolkit by default.  You may benefit
  # from improved performance, reduced file size, or greater hardware support by
  # passing a configuration based on your specific GPU environment.
  # Please see the accompanying documentation or https://github.com/NixOS/nixpkgs/pull/205351

  options = {
    cudaSupport = options.mkOption {
      description = "Build packages with CUDA support";
      type = types.bool;
      default = pkgs.config.cudaSupport;
    };
    cudaCapabilities = options.mkOption {
      description = "CUDA capabilities (hardware generations) to build for";
      type = types.listOf config.generic.types.cudaCapability;
      default = pkgs.config.cudaCapabilities or [ ];
    };
    cudaForwardCompat = options.mkOption {
      description = "Build with forward compatibility gencode (+PTX) to support future GPU generations";
      type = types.bool;
      default = pkgs.config.cudaForwardCompat or false;
    };
    cudaVersions = options.mkOption {
      description = "A list of CUDA versions to create package sets for";
      type = types.listOf config.generic.types.majorMinorVersion;
      default = [
        # CUDA 10
        "10.0"
        "10.1"
        "10.2"
        # CUDA 11
        "11.0"
        "11.1"
        "11.2"
        "11.3"
        "11.4"
        "11.5"
        "11.6"
        "11.7"
        "11.8"
        # CUDA 12
        "12.0"
        "12.1"
        "12.2"
        "12.3"
      ];
    };

    inherit cudaPackagesSets;

    # packages = options.mkOption {
    #   description = "Nixpkgs";
    #   type = types.lazyAttrsOf types.raw;
    #   default = pkgs;
    # };
  };
}
