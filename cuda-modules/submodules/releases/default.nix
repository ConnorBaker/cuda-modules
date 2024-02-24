{ lib, config, ... }:
let
  inherit (config.generic.types) majorMinorVersion majorMinorPatchBuildVersion;
  inherit (lib) options types;

  package = options.mkOption {
    description = "A package for a specific platform";
    example = {
      version = "8.0.3.4";
      minCudaVersion = "10.2";
      maxCudaVersion = "10.2";
      hash = "sha256-LxcXgwe1OCRfwDsEsNLIkeNsOcx3KuF5Sj+g2dY6WD0=";
    };
    type = types.submodule {
      # TODO(@connorbaker): Figure out how to extend option sets.
      # freeformType = types.attrsOf types.anything;
      options = {
        version = options.mkOption {
          description = "The version of the package";
          type = majorMinorPatchBuildVersion;
        };
        minCudaVersion = options.mkOption {
          description = "The minimum CUDA version supported";
          type = majorMinorVersion;
        };
        maxCudaVersion = options.mkOption {
          description = "The maximum CUDA version supported";
          type = majorMinorVersion;
        };
        hash = options.mkOption {
          description = "The hash of the tarball";
          type = types.str;
        };
      } // config.extraPackageFields;
    };
  };
in
{
  imports = [ ../../generic/types.nix ];
  options = {
    extraPackageFields = options.mkOption {
      description = "Extra fields present in each `package`";
      type = types.attrsOf types.raw;
      default = { };
    };
    releases = options.mkOption {
      description = "A mapping from platform to packages";
      type = types.oneOf [
        types.path
        (types.attrsOf (types.listOf package.type))
      ];
    };
    generalFixupFn = options.mkOption {
      description = ''
        A general fixup applied to all redistributables's. Note that it requires `callPackage` to provide a
        `manifests` argument.
        NOTE: The value must be inspectable by `callPackage`. It seems that when functions are exposed via module
        configurations, they do not preserve functionArgs, and so callPackage will fail because it cannot supply
        arguments by default.
      '';
      default = { }: { };
      type = types.oneOf [
        types.path
        (types.functionTo types.attrs)
      ];
    };
    shimFn = options.mkOption {
      description = ''
        A function which transforms a release expression into a manifest expression. This allows us to re-use
        the same expression manipulation logic for both manually maintained releases and automatically generated
        manifests.
      '';
      default = { }: { };
      type = types.oneOf [
        types.path
        (types.functionTo types.attrs)
      ];
    };
  };
}
