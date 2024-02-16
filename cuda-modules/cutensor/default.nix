{
  config,
  lib,
  options,
  ...
}:
let
  inherit (lib)
    attrsets
    filesystem
    modules
    trivial
    ;
  inherit (config.generic.manifests) utils;
in
{
  options.cutensor = options.generic.manifests.options;

  # Use modules.mkDefault to allow for overriding the default values
  config.cutensor = attrsets.mapAttrs (trivial.const modules.mkDefault) {
    generalFixupFn = ./fixup.nix;
    manifestMetas = builtins.map utils.manifestPathToManifestMeta config.cutensor.manifestPaths;
    manifestPaths = filesystem.listFilesRecursive ./manifests;
    versionedManifests = utils.manifestMetasToManifests config.cutensor.manifestMetas;
  };
}
