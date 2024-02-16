{ lib, ... }:
let
  inherit (lib)
    options
    strings
    types
    versions
    ;
in
{
  options.utils = options.mkOption {
    description = "A set of types used in building cudaPackages.";
    type = types.submodule {
      freeformType = types.attrsOf types.anything;
      options = {
        mkVersionedPackageName = options.mkOption {
          description = "A function to generate a versioned package name";
          type = types.functionTo (types.functionTo types.str);
        };
      };
    };
  };

  # Define in config to prevent overriding by user
  config.utils = {
    mkVersionedPackageName =
      name: version:
      strings.concatStringsSep "_" [
        name
        (strings.replaceStrings [ "." ] [ "_" ] (versions.majorMinor version))
      ];
  };
}
