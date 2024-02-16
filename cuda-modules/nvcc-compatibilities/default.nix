{ config, lib, ... }:
let
  inherit (lib) options types;

  nvccCompatibility = options.mkOption {
    description = "Compatibility of an instance of NVCC with GCC and Clang";
    type = types.submodule {
      options = {
        clangMinMajorVersion = options.mkOption {
          description = "Minimum Clang major version to support this CUDA version";
          type = config.generic.types.majorVersion;
        };
        clangMaxMajorVersion = options.mkOption {
          description = "Maximum Clang major version to support this CUDA version";
          type = config.generic.types.majorVersion;
        };
        gccMinMajorVersion = options.mkOption {
          description = "Minimum GCC major version to support this CUDA version";
          type = config.generic.types.majorVersion;
        };
        gccMaxMajorVersion = options.mkOption {
          description = "Maximum GCC major version to support this CUDA version";
          type = config.generic.types.majorVersion;
        };
      };
    };
  };

  nvccCompatibilities = options.mkOption {
    description = ''
      Mapping of CUDA version to known NVCC compatibilities with GCC and Clang

      Taken from
      https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html#host-compiler-support-policy

        NVCC performs a version check on the host compiler’s major version and so newer minor versions
        of the compilers listed below will be supported, but major versions falling outside the range
        will not be supported.

      NOTE: These constraints don't apply to Jetson, which uses something else.
      NOTE: NVIDIA can and will add support for newer compilers even during patch releases.
      E.g.: CUDA 12.2.1 maxxed out with support for Clang 15.0; 12.2.2 added support for Clang 16.0.
      NOTE: Because all platforms NVIDIA supports use GCC and Clang, we omit the architectures here.
    '';
    type = types.attrsOf nvccCompatibility.type;
    default = import ./data.nix;
  };
in
{
  imports = [ ../generic/types.nix ];
  options = {
    inherit nvccCompatibilities;
  };
}
