{ lib, ... }:
let
  inherit (lib) filesystem options types;
in
{
  options.cuda = options.mkOption {
    description = "Options for the creation of the primary CUDA redistributable packages.";
    type = types.submodule ../submodules/manifests;
    default = {
      generalFixupFn = ./fixup.nix;
      indexedFixupFn = ./fixups.nix;
      manifestPaths = filesystem.listFilesRecursive ./manifests;
    };
  };
}
