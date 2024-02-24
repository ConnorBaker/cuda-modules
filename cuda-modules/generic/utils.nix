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
  freeformType = types.anything;
  options = {
    mkVersionedPackageName = options.mkOption {
      description = "A function to generate a versioned package name";
      type = types.functionTo (types.functionTo types.str);
      default =
        name: version:
        strings.concatStringsSep "_" [
          name
          (strings.replaceStrings [ "." ] [ "_" ] (versions.majorMinor version))
        ];
    };
  };
}
