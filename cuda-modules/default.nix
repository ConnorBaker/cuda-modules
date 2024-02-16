{
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (lib) options types;
in
{
  imports = [
    ./generic
    ./gpus
    ./nvcc-compatibilities
    # ./utils.nix
    # # Always after generic
    ./cuda
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

    # packages = options.mkOption {
    #   description = "Nixpkgs";
    #   type = types.lazyAttrsOf types.raw;
    #   default = pkgs;
    # };
  };
}
