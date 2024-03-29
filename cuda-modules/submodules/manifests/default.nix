{ lib, config, ... }:
let
  inherit (lib)
    attrsets
    lists
    options
    trivial
    types
    versions
    ;

  manifestMeta = options.mkOption {
    description = "Meta information about CUDA redistributable manifests";
    type = types.submodule {
      options = {
        path = options.mkOption {
          description = "Path to the manifest file";
          type = types.path;
        };
        kind = options.mkOption {
          description = "The kind of manifest file";
          type = types.enum [
            "feature"
            "redistrib"
          ];
        };
        version = options.mkOption {
          description = "The manifest version (major.minor)";
          type = config.generic.types.majorMinorVersion;
        };
      };
    };
  };

  manifest = options.mkOption {
    description = "A redistributable and feature manifest";
    type = types.submodule [
      ./feature.nix
      ./redistrib.nix
    ];
  };

  # mkManifestMeta :: Path -> { path, kind, version }
  # Construct a manifest meta from a path
  mkManifestMeta =
    filename:
    let
      regex = "^.*(feature|redistrib)_([[:digit:]]+\\.[[:digit:]]+\\.[[:digit:]]+)\\.json$";
      components = builtins.match regex (builtins.baseNameOf filename);
    in
    trivial.throwIf (components == null || builtins.length components != 2)
      "Unexpected error while processing manifest files: regex failed to match filename ${builtins.toString filename}"
      {
        path = filename;
        kind = builtins.head components;
        version = versions.majorMinor (lists.last components);
      };

  # manifestMetasToManifests :: [ManifestMeta] -> { ${version} = Manifest }
  # Convert a list of manifest metas to a mapping of version to manifest
  mkVersionedManifests =
    let
      op =
        manifests: manifestMeta:
        let
          inherit (manifestMeta) version kind path;
          nullableExistingEntry =
            attrsets.attrByPath
              [
                version
                kind
              ]
              null
              manifests;

          newEntry =
            attrsets.setAttrByPath
              [
                version
                kind
              ]
              (
                trivial.throwIf (nullableExistingEntry != null)
                  "Unexpected error while processing manifest files: duplicate version ${version}"
                  (trivial.importJSON path)
              );
        in
        attrsets.recursiveUpdate manifests newEntry;
    in
    builtins.foldl' op { };
in
{
  imports = [ ../../generic/types.nix ];
  options = {
    manifestPaths = options.mkOption {
      description = "List of paths to CUDA redistributable manifests";
      type = types.listOf types.path;
    };
    manifestMetas = options.mkOption {
      description = "List of meta information about CUDA redistributable manifests";
      type = types.listOf manifestMeta.type;
      default = builtins.map mkManifestMeta config.manifestPaths;
      defaultText = options.literalMD "the value of the `manifestPaths` option under `builtins.map mkManifestMeta`";
    };
    versionedManifests = options.mkOption {
      description = "Mapping of manifest version (major and minor) to feature and redistributable manifests";
      type = types.attrsOf manifest.type;
      default = mkVersionedManifests config.manifestMetas;
      defaultText = options.literalMD "the value of the `manifestMetas` option under `mkVersionedManifests`";
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
    indexedFixupFn = options.mkOption {
      description = ''
        Attribute set of functions where each key is the `pname` of a redistributable and each value is a
        function to fixup the derivation's attributes after being callPackage'd
        NOTE: The value must be inspectable by `callPackage`. It seems that when functions are exposed via module
        configurations, they do not preserve functionArgs, and so callPackage will fail because it cannot supply
        arguments by default.
      '';
      default = { };
      type = types.oneOf [
        types.path
        types.attrs
      ];
    };
  };
}
