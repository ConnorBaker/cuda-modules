# Shims to mimic the shape of ../modules/generic/manifests/{feature,redistrib}/release.nix
{
  lib,
  package,
  # redistArch :: String
  # String is `"unsupported"` if the given architecture is unsupported.
  redistArch,
}:
{
  feature.tensorrt = lib.optionalAttrs (redistArch != "unsupported") {
    ${redistArch}.outputs = {
      bin = true;
      lib = true;
      static = true;
      dev = true;
      sample = true;
      python = true;
    };
  };
  redistrib.tensorrt = {
    name = "TensorRT: a high-performance deep learning interface";
    inherit (package) version;
  };
}
