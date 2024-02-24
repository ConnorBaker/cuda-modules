{ lib, ... }:
let
  inherit (lib) attrsets options types;

  # Override the base type of an option with a more specific type.
  mkOptionForTypeOverride =
    name:
    { description, baseType }:
    options.mkOption {
      inherit description;
      type = types.optionType;
      default = baseType // {
        inherit description name;
      };
    };

  # Create an option with a base type of `strMatching`.
  mkOptionForStrMatching =
    name:
    { description, pattern }:
    mkOptionForTypeOverride name {
      inherit description;
      baseType = types.strMatching pattern;
    };

  numOptionalTrailingAlpha = "[[:digit:]]+[a-z]?";
in
# "-gencode=arch=compute_75,code=sm_75"
{
  # As this module is meant to be consumed as a submodule, allow the user to add additional options to the module (so
  # long as they are also option types -- otherwise they would not belong in this module.
  freeformType = types.attrsOf types.optionType;
  options =
    # Types which are based on the `strMatching` type.
    attrsets.mapAttrs mkOptionForStrMatching {
      archName = {
        description = "A CUDA architecture name, like Ampere or Ada.";
        pattern = "^[[:alpha:]]+$";
      };

      cudaArch = {
        description = "A real/physical CUDA architecture name.";
        pattern = "^sm_${numOptionalTrailingAlpha}$";
      };

      virtualCudaArch = {
        description = "A virtual CUDA architecture name.";
        pattern = "^compute_${numOptionalTrailingAlpha}$";
      };

      gencodeArg = {
        description = "A `gencode` argument for the `nvcc` compiler.";
        # The `arch` component is always a virtual architecture, and the `code` component is either a virtual
        # architecture or a real architecture.
        pattern = "^-gencode=arch=compute_${numOptionalTrailingAlpha},code=(sm|compute)_${numOptionalTrailingAlpha}$";
      };

      cudaCapability = {
        description = "A CUDA capability version.";
        pattern = "^[[:digit:]]+\\.[[:digit:]]+[a-z]?$";
      };

      # https://github.com/ConnorBaker/cuda-redist-find-features/blob/c841980e146f8664bbcd0ba1399e486b7910617b/cuda_redist_find_features/types/_lib_so_name.py
      libSoName = {
        description = "The name of a shared object file.";
        pattern = ".*\\.so(\\.[[:digit:]]+)*$";
      };

      majorVersion = {
        description = "A version number with a major component.";
        pattern = "^([[:digit:]]+)$";
      };

      majorMinorVersion = {
        description = "A version number with a major and minor component.";
        pattern = "^([[:digit:]]+)\\.([[:digit:]]+)$";
      };

      majorMinorPatchVersion = {
        description = "A version number with a major, minor, and patch component.";
        pattern = "^([[:digit:]]+)\\.([[:digit:]]+)\\.([[:digit:]]+)$";
      };

      majorMinorPatchBuildVersion = {
        description = "A version number with a major, minor, patch, and build component.";
        pattern = "^([[:digit:]]+)\\.([[:digit:]]+)\\.([[:digit:]]+)\\.([[:digit:]]+)$";
      };
    };
}
