# Many thanks to Arnon Shimoni for maintaining a list of these architectures and capabilities.
# Without your work, this would have been much more difficult.
# https://arnon.dk/matching-sm-architectures-arch-and-gencode-for-various-nvidia-cards/

{ config, lib, ... }:
let
  inherit (lib) options types;

  gpuOptions.options = {
    archName = options.mkOption {
      description = "Name of the microarchitecture";
      example = "Kepler";
      type = types.nonEmptyStr;
    };
    computeCapability = options.mkOption {
      description = "Compute capability of the GPU";
      example = "3.0";
      type = config.generic.types.cudaCapability;
    };
    isJetson = options.mkOption {
      description = ''
        Whether a GPU is part of NVIDIA's line of Jetson embedded computers.

        This field is notable because it tells us what architecture to build for (as Jetson devices are
        aarch64). More on Jetson devices here:
        https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/

        NOTE: These architectures are only built upon request.
      '';
      # Extensible options: https://nixos.org/manual/nixos/unstable/#sec-option-declarations-eot
      # Unfortunately we can't use types.bool and must use types.enum.
      type = types.enum [
        true
        false
      ];
    };
    minCudaVersion = options.mkOption {
      description = "The minimum (inclusive) CUDA version that supports this GPU.";
      example = "10.0";
      type = config.generic.types.majorMinorVersion;
    };
    maxCudaVersion = options.mkOption {
      description = "The maximum (exclusive) CUDA version that supports this GPU. null means there is no maximum.";
      example = "10.2";
      type = types.nullOr config.generic.types.majorMinorVersion;
    };
    dontDefaultAfter = options.mkOption {
      description = ''
        The CUDA version after which to exclude this GPU from the list of default capabilities
        we build. null means we always include this GPU in the default capabilities if it is
        supported.
      '';
      example = "10.2";
      type = types.nullOr config.generic.types.majorMinorVersion;
    };
  };
in
{
  options.generic = {
    types = {
      gpu = options.mkOption {
        description = "A GPU";
        type = types.optionType;
        default = types.submoduleWith { modules = [ gpuOptions ]; };
      };
      jetsonGpu = options.mkOption {
        description = "A GPU that is part of NVIDIA's Jetson line of embedded computers";
        type = types.optionType;
        default = types.submoduleWith {
          modules = config.generic.types.gpu.getSubModules ++ [
            { options.isJetson = options.mkOption { type = types.enum [ true ]; }; }
          ];
        };
      };
      nonJetsonGpu = options.mkOption {
        description = "A GPU that is not part of NVIDIA's Jetson line of embedded computers";
        type = types.optionType;
        default = types.submoduleWith {
          modules = config.generic.types.gpu.getSubModules ++ [
            { options.isJetson = options.mkOption { type = types.enum [ false ]; }; }
          ];
        };
      };
    };
    data.gpus = {
      all = options.mkOption {
        description = "Known GPUs";
        type = types.listOf config.generic.types.gpu;
        default = import ./data.nix;
      };
      nonJetsons = options.mkOption {
        description = "Known GPUs that are not part of NVIDIA's Jetson line of embedded computers";
        type = types.listOf config.generic.types.nonJetsonGpu;
        default = lib.filter (gpu: !gpu.isJetson) config.generic.data.gpus.all;
      };
      jetsons = options.mkOption {
        description = "Known GPUs that are part of NVIDIA's Jetson line of embedded computers";
        type = types.listOf config.generic.types.jetsonGpu;
        default = lib.filter (gpu: gpu.isJetson) config.generic.data.gpus.all;
      };
    };
  };
}
