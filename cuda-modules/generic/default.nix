{ lib, ... }:
let
  inherit (lib) options types;
in
{
  imports = [ ./data ];
  options.generic = {
    types = options.mkOption {
      description = "A set of types used in building cudaPackages.";
      type = types.submoduleWith { modules = [ ./types.nix ]; };
      default = { };
    };
    utils = options.mkOption {
      description = "A set of utility functions used in building cudaPackages.";
      type = types.submoduleWith { modules = [ ./utils.nix ]; };
      default = { };
    };
  };
}
