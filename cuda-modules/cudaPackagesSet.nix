{
  config,
  lib,
  generic,
  ...
}:
let
  inherit (lib)
    options
    strings
    trivial
    types
    versions
    ;
in
{
  imports = [ ./cuda-flags.nix ];
  options = {
    cudaVersion = options.mkOption {
      description = "The CUDA version of the package set";
      type = generic.types.majorMinorVersion;
    };

    cudaMajorVersion = options.mkOption {
      description = "The major version of the CUDA package set";
      type = types.str;
      default = versions.major config.cudaVersion;
    };

    cudaMajorMinorVersion = options.mkOption {
      description = "The major and minor version of the CUDA package set";
      type = types.str;
      default = versions.majorMinor config.cudaVersion;
    };

    cudaOlder = options.mkOption {
      description = "A utility to check if the CUDA version is older than a given version";
      type = types.functionTo types.bool;
      default = strings.versionOlder config.cudaVersion;
    };

    cudaAtLeast = options.mkOption {
      description = "A utility to check if the CUDA version is at least a given version";
      type = types.functionTo types.bool;
      default = strings.versionAtLeast config.cudaVersion;
    };

    cudaAtMost = options.mkOption {
      description = "A utility to check if the CUDA version is at most a given version";
      type = types.functionTo types.bool;
      default = trivial.flip strings.versionAtLeast config.cudaVersion;
    };

    cudaNewer = options.mkOption {
      description = "A utility to check if the CUDA version is newer than a given version";
      type = types.functionTo types.bool;
      default = trivial.flip strings.versionOlder config.cudaVersion;
    };
  };
}
