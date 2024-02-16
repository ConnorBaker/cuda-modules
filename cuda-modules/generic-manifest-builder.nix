{
  callPackage,
  cudaModules,
  cudaVersion,
  cudaMajorVersion,
  callPackageOnAttrs,
  lib,
  redistName,
  useLibPath,
  # If version is specified, only build the redistributable package for that version.
  version ? null,
}:
let
  inherit (lib)
    attrsets
    lists
    strings
    trivial
    ;

  redistConfig = cudaModules.config.${redistName};

  inherit (cudaModules.config.utils) mkVersionedPackageName;

  # Retrieve all versions of the manifests available for our redistName.
  # versionedManifests :: { ${version} = { redistrib, feature }; }
  versionedManifests = trivial.pipe redistConfig.versionedManifests [
    (attrsets.filterAttrs (name: _: version != null -> version == name))
    (
      attrs:
      trivial.throwIf (attrs == { })
        ''
          No manifest found for ${redistName} version ${version}.
          Please check that the manifest file is present and that it is not filtered out by a version check.
        ''
        attrs
    )
  ];

  # Our cudaVersion tells us which version of CUDA we're building against.
  # The subdirectories in lib/ tell us which versions of CUDA are supported.
  # Typically the names will look like this:
  #
  # - 10.2
  # - 11
  # - 11.0
  # - 12
  #
  # Not every package uses this layout, but we can precompute it here.
  # libPath :: Optional String
  libPath =
    if useLibPath then if cudaVersion == "10.2" then cudaVersion else cudaMajorVersion else null;

  # Build a redistributable package given the version and corresponding manifest.
  buildPackageSetFromVersionedManifest =
    let
      # Retrieve our fixup functions which do not rely on the version of the manifest being processed.
      indexedFixupFn = trivial.pipe redistConfig.indexedFixupFn [
        # If it's a path, we need to import it before passing it along.
        # The default value is an empty attrset so we don't need to import it.
        (maybePath: if builtins.isPath maybePath then builtins.import maybePath else maybePath)
        # Use callPackage on the values in the attrset.
        callPackageOnAttrs
      ];
    in
    # version :: String
    version:
    let
      # Retrieve our generalFixupFn, which needs the version of the manifest being processed.
      generalFixupFn = callPackage redistConfig.generalFixupFn { inherit redistName version; };
    in
    # manifests :: { redistrib, feature }
    manifests:

    # Map over the attribute names of the feature manifest, which contain only package names.
    attrsets.genAttrs (builtins.attrNames manifests.feature) (
      # pname :: String
      pname:
      trivial.pipe pname [
        # Build the package
        (
          pname:
          callPackage ./generic-builder.nix {
            inherit
              pname
              redistName
              manifests
              libPath
              ;
          }
        )
        # General package fixup
        (drv: drv.overrideAttrs generalFixupFn)
        # Package-specific fixup if it exists
        (drv: drv.overrideAttrs (attrsets.attrByPath [ pname ] { } indexedFixupFn))
      ]
    );

  # For each version in our manifests, build a package set.
  # Do not rename packages yet; that's handled later.
  versionedPackageSets = attrsets.mapAttrs buildPackageSetFromVersionedManifest versionedManifests;

  # Fold over any remaining package sets and append a suffix to the package names.
  flattenedVersionedSuffixedPackageSets =
    attrsets.concatMapAttrs
      (
        # version :: String
        version:
        # packages :: { ${pname} = drv; }
        packages:
        attrsets.mapAttrs'
          (pname: drv: {
            name = mkVersionedPackageName pname version;
            value = drv;
          })
          packages
      )
      versionedPackageSets;
in
trivial.throwIf (versionedPackageSets == { })
  ''
    No manifests found for ${redistName}.
    Please check that there are in fact manifest files present and that there are not filtered out by a version
    check or (within the module evaluation) by an incorrect manifest filename (which would case the regex to
    fail to match).
  ''
  (
    let
      # Since versionedPackageSets is non-empty, we can safely assume that newestToOldestVersion is non-empty.
      newestToOldestVersion = lists.sort (trivial.flip strings.versionOlder) (
        builtins.attrNames versionedManifests
      );
      newestVersion = builtins.head newestToOldestVersion;
      newestPackageSet = versionedPackageSets.${newestVersion};
    in
    if version != null then
      # If version is non-null, just return the newest package set.
      newestPackageSet
    else
      # Otherwise, return the flattened package set unioned with the default package set (the newest).
      newestPackageSet // flattenedVersionedSuffixedPackageSets
  )
