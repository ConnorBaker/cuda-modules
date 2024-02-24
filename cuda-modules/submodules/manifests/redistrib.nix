{ lib, ... }:
let
  inherit (lib) options types;

  # Foundational option for a package -- a release for a specific architecture
  package = options.mkOption {
    description = "A package in the manifest";
    type = types.submodule {
      options = {
        relative_path = options.mkOption {
          description = "The relative path to the package";
          example = "cuda_cccl/linux-x86_64/cuda_cccl-linux-x86_64-11.5.62-archive.tar.xz";
          type = types.str;
        };
        sha256 = options.mkOption {
          description = "The sha256 hash of the package";
          example = "bbe633d6603d5a96a214dcb9f3f6f6fd2fa04d62e53694af97ae0c7afe0121b0";
          type = types.str;
        };
        md5 = options.mkOption {
          description = "The md5 hash of the package";
          example = "e5deef4f6cb71f14aac5be5d5745dafe";
          type = types.str;
        };
        size = options.mkOption {
          description = "The size of the package as a string";
          type = types.str;
          example = "960968";
        };
      };
    };
  };

  # A release is a mapping from platform to package
  release = options.mkOption {
    description = "A release is an attribute set which includes a mapping from platform to package";
    type = types.submodule {
      # Allow any attribute name as these will be the platform names
      freeformType = types.attrsOf package.type;
      options = {
        name = options.mkOption {
          description = "The full name of the package";
          example = "CXX Core Compute Libraries";
          type = types.str;
        };
        license = options.mkOption {
          description = "The license of the package";
          example = "CUDA Toolkit";
          type = types.str;
        };
        license_path = options.mkOption {
          description = "The path to the license of the package";
          example = "cuda_cccl/LICENSE.txt";
          default = null;
          type = types.nullOr types.str;
        };
        version = options.mkOption {
          description = "The version of the package";
          example = "11.5.62";
          type = types.str;
        };
      };
    };
  };

  # A manifest is a mapping from package name to release
  manifest = options.mkOption {
    description = "A redistributable manifest is an attribute set which includes a mapping from package name to release";
    type = types.submodule {
      # Allow any attribute name as these will be the package names
      freeformType = types.attrsOf release.type;
      options = {
        release_date = options.mkOption {
          description = "The release date of the manifest";
          type = types.nullOr types.str;
          default = null;
          example = "2023-08-29";
        };
        release_label = options.mkOption {
          description = "The release label of the manifest";
          type = types.nullOr types.str;
          default = null;
          example = "12.2.2";
        };
        release_product = options.mkOption {
          example = "cuda";
          description = "The release product of the manifest";
          type = types.nullOr types.str;
          default = null;
        };
      };
    };
  };
in
{
  options.redistrib = manifest;
}
