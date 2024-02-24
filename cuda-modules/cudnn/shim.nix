# Shims to mimic the shape of ../modules/generic/manifests/{feature,redistrib}/release.nix
{
  lib,
  package,
  # redistArch :: String
  # String is "unsupported" if the given architecture is unsupported.
  redistArch,
}:
{
  feature.cudnn = lib.optionalAttrs (redistArch != "unsupported") {
    ${redistArch}.outputs = {
      lib = true;
      static = true;
      dev = true;
    };
  };
  redistrib.cudnn = {
    name = "NVIDIA CUDA Deep Neural Network library (cuDNN)";
    inherit (package) version;
  };
}
