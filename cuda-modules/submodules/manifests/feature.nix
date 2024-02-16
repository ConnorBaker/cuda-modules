{ lib, ... }:
let
  inherit (lib) options types;

  # Nixpkgs outputs for a specific package
  # https://github.com/ConnorBaker/cuda-redist-find-features/blob/603407bea2fab47f2dfcd88431122a505af95b42/cuda_redist_find_features/manifest/feature/package/package.py
  outputs = options.mkOption {
    description = "A set of outputs that a package can provide.";
    example = {
      bin = true;
      dev = true;
      doc = false;
      lib = false;
      sample = false;
      static = false;
    };
    type = types.submodule {
      options = {
        bin = options.mkOption {
          description = "A `bin` output requires that we have a non-empty `bin` directory containing at least one file with the executable bit set.";
          type = types.bool;
        };
        dev = options.mkOption {
          description = ''
            A `dev` output requires that we have at least one of the following non-empty directories:

            - `include`
            - `lib/pkgconfig`
            - `share/pkgconfig`
            - `lib/cmake`
            - `share/aclocal`
          '';
          type = types.bool;
        };
        doc = options.mkOption {
          description = ''
            A `doc` output requires that we have at least one of the following non-empty directories:

            - `share/info`
            - `share/doc`
            - `share/gtk-doc`
            - `share/devhelp`
            - `share/man`
          '';
          type = types.bool;
        };
        lib = options.mkOption {
          description = "A `lib` output requires that we have a non-empty lib directory containing at least one shared library.";
          type = types.bool;
        };
        sample = options.mkOption {
          description = "A `sample` output requires that we have a non-empty `samples` directory.";
          type = types.bool;
        };
        static = options.mkOption {
          description = "A `static` output requires that we have a non-empty lib directory containing at least one static library.";
          type = types.bool;
        };
      };
    };
  };

  # A package is a release for a specific architecture/platform
  package = options.mkOption {
    description = "A package in the manifest";
    type = types.submodule {
      options = {
        inherit outputs;
      };
    };
  };

  # A release is an attribute set which includes a mapping from platform to package
  release = options.mkOption {
    description = "A release is an attribute set which includes a mapping from platform to package";
    type = types.attrsOf package.type;
  };

  # A feature manifest is an attribute set which includes a mapping from package name to release
  manifest = options.mkOption {
    description = "A feature manifest is an attribute set which includes a mapping from package name to release";
    type = types.attrsOf release.type;
  };
in

{
  options.feature = manifest;
}
