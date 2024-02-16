# Many thanks to Arnon Shimoni for maintaining a list of these architectures and capabilities.
# Without your work, this would have been much more difficult.
# https://arnon.dk/matching-sm-architectures-arch-and-gencode-for-various-nvidia-cards/

{ config, lib, ... }:
let
  inherit (lib) options types;

  gpu = options.mkOption {
    description = "A GPU";
    type = types.submodule {
      options = {
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
          type = types.bool;
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
    };
  };

  gpus = options.mkOption {
    description = "Known GPUs";
    type = types.listOf gpu.type;
    default = import ./data.nix;
  };
in
{
  imports = [ ../generic/types.nix ];
  options = {
    inherit gpus;
  };
}
