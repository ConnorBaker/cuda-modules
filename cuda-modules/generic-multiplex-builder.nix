{
  # callPackage-provided arguments
  lib,
  callPackage,
  cudaVersion,
  flags,
  cudaModules,
  stdenv,
  # pname :: String
  pname,
}:
let
  inherit (lib) attrsets lists strings;

  inherit (cudaModules.config.utils) mkVersionedPackageName;

  # NOTE: Important types:
  # - Releases: ../modules/${pname}/releases/releases.nix
  # - Package: ../modules/${pname}/releases/package.nix

  # FIXME: do this at the module system level
  propagatePlatforms = lib.mapAttrs (
    redistArch: packages: map (p: { inherit redistArch; } // p) packages
  );

  # All releases across all platforms
  # See ../modules/${pname}/releases/releases.nix
  releaseSets = propagatePlatforms cudaModules.config.${pname}.releases;

  # Compute versioned attribute name to be used in this package set
  # Patch version changes should not break the build, so we only use major and minor
  # computeName :: Package -> String
  computeName = { version, ... }: mkVersionedPackageName pname version;

  # Check whether a package supports our CUDA version and platform.
  # isSupported :: Package -> Bool
  isSupported =
    package:
    redistArch == package.redistArch
    && strings.versionAtLeast cudaVersion package.minCudaVersion
    && strings.versionAtLeast package.maxCudaVersion cudaVersion;

  # Get all of the packages for our given platform.
  # redistArch :: String
  # Value is `"unsupported"` if the platform is not supported.
  redistArch = flags.getRedistArch stdenv.hostPlatform.system;

  preferable =
    p1: p2: (isSupported p2 -> isSupported p1) && (strings.versionAtLeast p1.version p2.version);

  # All the supported packages we can build for our platform.
  # perSystemReleases :: List Package
  allReleases = lib.pipe releaseSets [
    (lib.attrValues)
    (lists.flatten)
    (lib.groupBy (p: lib.versions.majorMinor p.version))
    (lib.mapAttrs (_: builtins.sort preferable))
    (lib.mapAttrs (_: lib.take 1))
    (lib.attrValues)
    (lib.concatMap lib.trivial.id)
  ];

  # newestToOldestSupportedPackage :: List (AttrSet Packages)
  newestToOldestSupportedPackage = builtins.sort preferable allReleases;

  nameOfNewest = computeName (builtins.head newestToOldestSupportedPackage);

  # A function which takes the `final` overlay and the `package` being built and returns
  # a function to be consumed via `overrideAttrs`.
  overrideAttrsFixupFn =
    package:
    callPackage cudaModules.config.${pname}.fixupFnPath {
      inherit cudaVersion mkVersionedPackageName package;
    };

  # Builds our package into derivation and wraps it in a nameValuePair, where the name is the versioned name
  # of the package.
  buildPackage =
    package:
    let
      manifests = callPackage cudaModules.config.${pname}.shimsFnPath { inherit package redistArch; };
      name = computeName package;
      drv = callPackage ./generic-builder.nix {
        inherit pname manifests;
        redistName = pname;
      };
      fixedDrv = drv.overrideAttrs (overrideAttrsFixupFn package);
    in
    attrsets.nameValuePair name fixedDrv;

  # versionedDerivations :: AttrSet Derivation
  versionedDerivations = builtins.listToAttrs (lists.map buildPackage newestToOldestSupportedPackage);

  defaultDerivation = attrsets.optionalAttrs (versionedDerivations != { }) {
    ${pname} = versionedDerivations.${nameOfNewest};
  };
in
versionedDerivations // defaultDerivation
