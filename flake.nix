{
  inputs = {
    flake-parts = {
      inputs.nixpkgs-lib.follows = "nixpkgs";
      url = "github:hercules-ci/flake-parts";
    };

    flake-utils.url = "github:numtide/flake-utils";

    nixpkgs.url = "github:NixOS/nixpkgs/master";

    pre-commit-hooks-nix = {
      inputs = {
        flake-utils.follows = "flake-utils";
        nixpkgs-stable.follows = "nixpkgs";
        nixpkgs.follows = "nixpkgs";
      };
      url = "github:cachix/pre-commit-hooks.nix";
    };

    treefmt-nix = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:numtide/treefmt-nix";
    };
  };

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } (
      {
        moduleWithSystem,
        withSystem,
        self,
        ...
      }:
      {
        systems = [
          "aarch64-darwin"
          "x86_64-linux"
        ];

        imports = [
          {
            perSystem =
              { system, ... }:
              {
                _module.args.pkgs = import inputs.nixpkgs {
                  inherit system;
                  config = {
                    allowUnfree = true;
                    allowBroken = true;
                    cudaSupport = true;
                    cudaCapabilities = [ "8.9" ];
                    cudaForwardCompat = false;
                  };
                };
              };
          }
          inputs.treefmt-nix.flakeModule
          inputs.pre-commit-hooks-nix.flakeModule
        ];

        perSystem =
          {
            config,
            lib,
            pkgs,
            ...
          }:
          let
            # evaluate our options
            eval = lib.evalModules {
              modules = [
                {
                  _module.args = {
                    inherit pkgs;
                  };
                }
                ./cuda-modules
              ];
            };
            # generate our docs
            optionsDoc = pkgs.nixosOptionsDoc { inherit (eval) options; };

            pyEnv = pkgs.python3.withPackages (
              ps: with ps; [
                mkdocs
                mkdocs-material
                pygments
              ]
            );
          in
          {
            # Generating docs from modules:
            # https://bmcgee.ie/posts/2023/03/til-how-to-generate-nixos-module-docs/
            packages = {
              docs = pkgs.stdenv.mkDerivation {
                src = null;
                pname = "docs";
                version = "0";
                strictDeps = true;
                nativeBuildInputs = [ pyEnv ];
                passthru = {
                  inherit optionsDoc pyEnv;
                };
                unpackPhase = ''
                  mkdir -p ./md
                  cat "${optionsDoc.optionsCommonMark}" > ./md/README.md
                '';
                configurePhase = ''
                  ln -s ${./mkdocs.yml} mkdocs.yml
                '';
                buildPhase = ''
                  mkdocs build
                '';
                installPhase = ''
                  mv ./docs "$out"
                '';
              };

              docs-serve = pkgs.writeShellApplication {
                name = "docs-serve";
                runtimeInputs = [ pyEnv ];
                text =
                  config.packages.docs.unpackPhase
                  # NOTE: No need for the configurePhase
                  + config.packages.docs.buildPhase
                  + ''
                    mkdocs serve --no-livereload
                  '';
              };
            };

            pre-commit.settings = {
              hooks = {
                # Formatter checks
                treefmt.enable = true;

                # Nix checks
                deadnix.enable = true;
                nil.enable = true;
                statix.enable = true;
              };
              # Formatter
              settings.treefmt.package = config.treefmt.build.wrapper;
            };

            treefmt = {
              projectRootFile = "flake.nix";
              programs = {
                # Markdown
                mdformat.enable = true;

                # Nix
                nixfmt = {
                  enable = true;
                  package = pkgs.nixfmt-rfc-style;
                };

                # Shell
                shellcheck.enable = true;
                shfmt.enable = true;

                # YAML
                yamlfmt.enable = true;
              };
            };
          };

        flake.nixosModules.cuda-modules = ./cuda-modules;
        flake.nixosConfigurations.cuda-modules = withSystem "x86_64-linux" (
          { config, pkgs, ... }:
          pkgs.lib.modules.evalModules {
            modules = [
              {
                _module.args = {
                  inherit pkgs;
                };
              }
              self.nixosModules.cuda-modules
            ];
          }
        );
      }
    );
}
