{ lib, ... }:
let
  inherit (lib) types options;
in
{
  options.cudnn = options.mkOption {
    description = "Options for the creation of CUDNN redistributable packages.";
    type = types.submodule ../submodules/releases;
    default = {
      extraPackageFields.url = options.mkOption {
        description = "The URL to download the tarball from";
        type = types.str;
      };
      releases = builtins.import ./releases.nix;
      generalFixupFn = ./fixup.nix;
      shimFn = ./shim.nix;
    };
  };
}
