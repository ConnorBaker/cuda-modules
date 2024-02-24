{
  config,
  lib,
  pkgs,
  generic,
  ...
}:
let
  inherit (pkgs) stdenv;

  inherit (lib)
    attrsets
    lists
    strings
    trivial
    options
    types
    ;

  inherit (config) cudaAtLeast cudaAtMost;
in
{
  # Flags are determined based on your CUDA toolkit by default.  You may benefit
  # from improved performance, reduced file size, or greater hardware support by
  # passing a configuration based on your specific GPU environment.
  #
  # cudaCapabilities :: List Capability
  # List of hardware generations to build.
  # E.g. [ "8.0" ]
  # Currently, the last item is considered the optional forward-compatibility arch,
  # but this may change in the future.
  #
  # cudaForwardCompat :: Bool
  # Whether to include the forward compatibility gencode (+PTX)
  # to support future GPU generations.
  # E.g. true
  #
  # Please see the accompanying documentation or https://github.com/NixOS/nixpkgs/pull/205351
  options.cudaFlags = {
    utils = {
      isSupported = options.mkOption {
        description = "Whether a CUDA version supports a given GPU";
        type = types.functionTo types.bool;
        default =
          { minCudaVersion, maxCudaVersion, ... }:
          cudaAtLeast minCudaVersion && (maxCudaVersion == null || cudaAtMost maxCudaVersion);
      };

      isDefault = options.mkOption {
        description = "Whether a GPU is included in the default capabilities";
        type = types.functionTo types.bool;
        default =
          { dontDefaultAfter, isJetson, ... }:
          let
            newGpu = dontDefaultAfter == null;
            recentGpu = newGpu || cudaAtMost dontDefaultAfter;
          in
          recentGpu && !isJetson;
      };

      dropDot = options.mkOption {
        description = "Drops dots from a string.";
        type = types.functionTo types.str;
        default = strings.replaceStrings [ "." ] [ "" ];
      };

      archMapper = options.mkOption {
        description = ''
          Maps a feature across a list of compute capabilities to produce a list of architectures.

          For example, "sm" and [ "8.0" "8.6" "8.7" ] yield [ "sm_80" "sm_86" "sm_87" ].
        '';
        type = types.functionTo (types.functionTo (types.listOf types.str));
        default =
          feat: lists.map (computeCapability: "${feat}_${config.cudaFlags.utils.dropDot computeCapability}");
      };

      gencodeMapper = options.mkOption {
        description = ''
          Maps a feature across a list of compute capabilities to produce a list of gencode arguments.

          For example, "sm" and [ "8.0" "8.6" "8.7" ] yield [ "-gencode=arch=compute_80,code=sm_80"
          "-gencode=arch=compute_86,code=sm_86" "-gencode=arch=compute_87,code=sm_87" ].
        '';
        type = types.functionTo (types.functionTo (types.listOf types.str));
        default =
          feat:
          lists.map (
            computeCapability:
            let
              dottedComputeCapability = config.cudaFlags.utils.dropDot computeCapability;
            in
            "-gencode=arch=compute_${dottedComputeCapability},code=${feat}_${dottedComputeCapability}"
          );
      };

      getRedistArch = options.mkOption {
        description = ''
          Maps Nix system to NVIDIA redist arch.

          NOTE: We swap out the default `linux-sbsa` redist (for server-grade ARM chips) with the
          `linux-aarch64` redist (which is for Jetson devices) if we're building any Jetson devices.
          Since both are based on aarch64, we can only have one or the other, otherwise there's an
          ambiguity as to which should be used.

          NOTE: This function *will* be called by unsupported systems because `cudaPackages` is part of
          `all-packages.nix`, which is evaluated on all systems. As such, we need to handle unsupported
          systems gracefully.
        '';
        type = types.functionTo (
          types.enum [
            "unsupported"
            "linux-aarch64"
            "linux-sbsa"
            "linux-x86_64"
            "linux-ppc64le"
            "windows-x86_64"
          ]
        );
        default =
          nixSystem:
          attrsets.attrByPath [ nixSystem ] "unsupported" {
            aarch64-linux =
              if config.cudaFlags.data.cudaJetsonGpus != [ ] then "linux-aarch64" else "linux-sbsa";
            x86_64-linux = "linux-x86_64";
            ppc64le-linux = "linux-ppc64le";
            x86_64-windows = "windows-x86_64";
          };
      };

      getNixSystem = options.mkOption {
        description = ''
          Maps NVIDIA redist arch to Nix system.

          NOTE: This function *will* be called by unsupported systems because `cudaPackages` is part of
          `all-packages.nix`, which is evaluated on all systems. As such, we need to handle unsupported
          systems gracefully.
        '';
        type = types.functionTo (
          types.enum [
            "unsupported"
            "aaarch64-linux"
            "x86_64-linux"
            "ppc64le-linux"
            "x86_64-windows"
          ]
        );
        default =
          redistArch:
          attrsets.attrByPath [ redistArch ] "unsupported" {
            linux-sbsa = "aarch64-linux";
            linux-aarch64 = "aarch64-linux";
            linux-x86_64 = "x86_64-linux";
            linux-ppc64le = "ppc64le-linux";
            windows-x86_64 = "x86_64-windows";
          };
      };
    };

    data = {
      cudaSupport = options.mkOption {
        description = "Build packages with CUDA support";
        type = types.bool;
        default = pkgs.config.cudaSupport;
      };
      cudaGpus = options.mkOption {
        description = "CUDA GPUs to build for";
        type = types.listOf generic.types.gpu;
        default =
          let
            inherit (config.cudaFlags.data) cudaCapabilities supportedGpus;
          in
          lists.filter (gpu: lists.elem gpu.computeCapability cudaCapabilities) supportedGpus;
      };
      cudaNonJetsonGpus = options.mkOption {
        description = "CUDA GPUs to build for, excluding Jetson devices";
        type = types.listOf generic.types.gpu;
        default = lists.intersectLists generic.data.gpus.nonJetsons config.cudaFlags.data.cudaGpus;
      };
      cudaJetsonGpus = options.mkOption {
        description = "CUDA GPUs to build for, including only Jetson devices";
        type = types.listOf generic.types.gpu;
        default = lists.intersectLists generic.data.gpus.jetsons config.cudaFlags.data.cudaGpus;
      };
      cudaCapabilities = options.mkOption {
        description = "CUDA capabilities (hardware generations) to build for";
        type = types.listOf generic.types.cudaCapability;
        default = pkgs.config.cudaCapabilities or config.cudaFlags.data.defaultCapabilities;
      };
      cudaForwardCompat = options.mkOption {
        description = "Build with forward compatibility gencode (+PTX) to support future GPU generations";
        type = types.bool;
        default = pkgs.config.cudaForwardCompat or false;
      };

      supportedGpus = options.mkOption {
        description = "The GPUs supported by a given CUDA version";
        type = types.listOf generic.types.gpu;
        default = lists.filter config.cudaFlags.utils.isSupported generic.data.gpus.all;
      };
      supportedCapabilities = options.mkOption {
        description = "The compute capabilities supported by a given CUDA version";
        type = types.listOf generic.types.cudaCapability;
        default = lists.map (gpu: gpu.computeCapability) config.cudaFlags.data.supportedGpus;
      };

      defaultGpus = options.mkOption {
        description = "The default GPUs for a given CUDA version";
        type = types.listOf generic.types.gpu;
        default = lists.filter config.cudaFlags.utils.isDefault config.cudaFlags.data.supportedGpus;
      };
      defaultCapabilities = options.mkOption {
        description = "The default compute capabilities for a given CUDA version";
        type = types.listOf generic.types.cudaCapability;
        default = lists.map (gpu: gpu.computeCapability) config.cudaFlags.data.defaultGpus;
      };

      archNames = options.mkOption {
        description = "The names of the architectures to build for";
        example = [
          "Turing"
          "Ampere"
        ];
        type = types.listOf types.str;
        default = trivial.pipe config.cudaFlags.data.cudaGpus [
          (lists.map (gpu: gpu.archName))
          lists.unique
        ];
      };
      realArches = options.mkOption {
        description = "The physical architectures to build for";
        example = [
          "sm_75"
          "sm_86"
        ];
        type = types.listOf generic.types.cudaArch;
        default = config.cudaFlags.utils.archMapper "sm" config.cudaFlags.data.cudaCapabilities;
      };
      virtualArches = options.mkOption {
        description = ''
          The virtual architectures to build for. These are typically used for forward compatibility,
          when trying to support an architecture newer than the CUDA version allows.
        '';
        example = [
          "compute_75"
          "compute_86"
        ];
        type = types.listOf generic.types.virtualCudaArch;
        default = config.cudaFlags.utils.archMapper "compute" config.cudaFlags.data.cudaCapabilities;
      };
      arches = options.mkOption {
        description = ''
          The architectures to build for. Includes a virtual architecture if forward compatibility is enabled.
        '';
        example = [
          "sm_75"
          "sm_86"
          "compute_86"
        ];
        type = types.listOf (
          types.oneOf [
            generic.types.cudaArch
            generic.types.virtualCudaArch
          ]
        );
        default =
          config.cudaFlags.data.realArches
          ++ lists.optional config.cudaFlags.data.cudaForwardCompat (
            lists.last config.cudaFlags.data.virtualArches
          );
      };
      gencodeArgs = options.mkOption {
        description = "The gencode arguments to pass to NVCC";
        example = [
          "-gencode=arch=compute_75,code=sm_75"
          "-gencode=arch=compute_86,code=sm_86"
          "-gencode=arch=compute_86,code=compute_86"
        ];
        type = types.listOf generic.types.gencodeArg;
        default =
          config.cudaFlags.utils.gencodeMapper "sm" config.cudaFlags.data.cudaCapabilities
          ++ lists.optionals config.cudaFlags.data.cudaForwardCompat (
            config.cudaFlags.utils.gencodeMapper "compute" [
              (lists.last config.cudaFlags.data.cudaCapabilities)
            ]
          );
      };
      gencodeString = options.mkOption {
        description = "A space-separated string of CUDA gencode arguments to pass to NVCC";
        example = "-gencode=arch=compute_75,code=sm_75 ... -gencode=arch=compute_86,code=compute_86";
        type = types.str;
        default = strings.concatStringsSep " " config.cudaFlags.data.gencodeArgs;
      };

      isJetsonBuild = options.mkOption {
        description = ''
          Whether the build is for a Jetson device.

          Jetson devices cannot be targeted by the same binaries which target non-Jetson devices. While
          NVIDIA provides both `linux-aarch64` and `linux-sbsa` packages, which both target `aarch64`,
          they are built with different settings and cannot be mixed.
        '';
        type = types.bool;
        default =
          let
            requestedJetsonDevices = config.cudaFlags.data.cudaJetsonGpus;
            requestedNonJetsonDevices = config.cudaFlags.data.cudaNonJetsonGpus;
            jetsonBuildSufficientCondition = requestedJetsonDevices != [ ];
            jetsonBuildNecessaryCondition = requestedNonJetsonDevices == [ ] && stdenv.hostPlatform.isAarch64;
          in
          trivial.throwIf (jetsonBuildSufficientCondition && !jetsonBuildNecessaryCondition)
            ''
              Jetson devices cannot be targeted with non-Jetson devices. Additionally, they require hostPlatform to be aarch64.
              You requested ${builtins.toJSON config.cudaFlags.data.cudaCapabilities} for host platform ${stdenv.hostPlatform.system}.
              Requested Jetson devices: ${builtins.toJSON requestedJetsonDevices}.
              Requested non-Jetson devices: ${builtins.toJSON requestedNonJetsonDevices}.
              Exactly one of the following must be true:
              - All CUDA capabilities belong to Jetson devices and hostPlatform is aarch64.
              - No CUDA capabilities belong to Jetson devices.
              See cudaPackages.cudaModules.config.gpus for a list of architectures supported by this version of Nixpkgs.
            ''
            jetsonBuildSufficientCondition
          && jetsonBuildNecessaryCondition;
      };
    };
  };
}
