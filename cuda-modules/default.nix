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
    types
    ;
in
{
  imports = [
    ./generic
    # Always after generic
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

    cudaPackagesPackageSets =
      let
        # An option type for a CUDA package set.
        cudaPackagesPackageSet =
          cudaVersion:
          options.mkOption {
            description = "A CUDA package set for a particular version of CUDA";
            type = types.submoduleWith {
              modules = [
                {
                  inherit cudaVersion;
                  _module.args = {
                    inherit pkgs;
                    inherit (config) generic;
                  };
                }
                ./cuda-packages-package-set.nix
              ];
            };
          };
        # Creates a package set for each CUDA version, using the provided builder
        # function applied to the CUDA version to create the package set.
        mkCudaPackagesPackageSet =
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
          modules = [ { options = mkCudaPackagesPackageSet cudaPackagesPackageSet; } ];
        };
        default = mkCudaPackagesPackageSet (cudaVersion: { inherit cudaVersion; });
      };
  };
}
