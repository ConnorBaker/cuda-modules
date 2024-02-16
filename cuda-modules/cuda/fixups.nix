# Attribute set where each package name maps to a function which, when `callPackage` is called on it,
# returns a function to be provided to `overrideAttrs` to override the attributes of that package.
# NOTE: Unless a package is always available, do not take it by name in the callPackage arguments;
# instead, take cudaPackages and use the package you need within a guard (e.g., cudaAtLeast).
{
  libcufile =
    {
      cudaOlder,
      lib,
      libcublas,
      numactl,
      rdma-core,
    }:
    prevAttrs: {
      buildInputs = prevAttrs.buildInputs ++ [
        libcublas.lib
        numactl
        rdma-core
      ];
      # Before 11.7 libcufile depends on itself for some reason.
      autoPatchelfIgnoreMissingDeps =
        prevAttrs.autoPatchelfIgnoreMissingDeps
        ++ lib.optionals (cudaOlder "11.7") [ "libcufile.so.0" ];
    };

  libcusolver =
    {
      cudaPackages,
      cudaAtLeast,
      lib,
      libcublas,
    }:
    prevAttrs: {
      buildInputs =
        prevAttrs.buildInputs
        # Always depends on this
        ++ [ libcublas.lib ]
        # Dependency from 12.0 and on
        ++ lib.optionals (cudaAtLeast "12.0") [ cudaPackages.libnvjitlink.lib ]
        # Dependency from 12.1 and on
        ++ lib.optionals (cudaAtLeast "12.1") [ cudaPackages.libcusparse.lib ];
    };

  libcusparse =
    {
      cudaPackages,
      cudaAtLeast,
      lib,
    }:
    prevAttrs: {
      buildInputs =
        prevAttrs.buildInputs
        ++ lib.optionals (cudaAtLeast "12.0") [ cudaPackages.libnvjitlink.lib ];
    };

  cuda_cudart =
    {
      addDriverRunpath,
      flags,
      lib,
    }:
    prevAttrs: {
      # Remove once cuda-find-redist-features has a special case for libcuda
      outputs =
        prevAttrs.outputs
        ++ lib.optionals (!(builtins.elem "stubs" prevAttrs.outputs)) [ "stubs" ];

      allowFHSReferences = false;

      # The libcuda stub's pkg-config doesn't follow the general pattern:
      postPatch =
        prevAttrs.postPatch or ""
        + ''
          while IFS= read -r -d $'\0' path ; do
            sed -i \
              -e "s|^libdir\s*=.*/lib\$|libdir=''${!outputLib}/lib/stubs|" \
              -e "s|^Libs\s*:\(.*\)\$|Libs: \1 -Wl,-rpath,${addDriverRunpath.driverLink}/lib|" \
              "$path"
          done < <(find -iname 'cuda-*.pc' -print0)
        ''
        + ''
          # Namelink may not be enough, add a soname.
          # Cf. https://gitlab.kitware.com/cmake/cmake/-/issues/25536
          if [[ -f lib/stubs/libcuda.so && ! -f lib/stubs/libcuda.so.1 ]] ; then
            ln -s libcuda.so lib/stubs/libcuda.so.1
          fi
        '';

      postFixup =
        prevAttrs.postFixup or ""
        + ''
          moveToOutput lib/stubs "$stubs"
          ln -s "$stubs"/lib/stubs/* "$stubs"/lib/
          ln -s "$stubs"/lib/stubs "''${!outputLib}/lib/stubs"
        '';
    };

  cuda_compat =
    { flags }:
    prevAttrs: {
      autoPatchelfIgnoreMissingDeps = prevAttrs.autoPatchelfIgnoreMissingDeps ++ [
        "libnvrm_gpu.so"
        "libnvrm_mem.so"
        "libnvdla_runtime.so"
      ];
      # `cuda_compat` only works on aarch64-linux, and only when building for Jetson devices.
      badPlatformsConditions = prevAttrs.badPlatformsConditions // {
        "Trying to use cuda_compat on aarch64-linux targeting non-Jetson devices" = !flags.isJetsonBuild;
      };
    };

  cuda_gdb =
    {
      cudaAtLeast,
      gmp,
      lib,
    }:
    prevAttrs: {
      buildInputs =
        prevAttrs.buildInputs
        # x86_64 only needs gmp from 12.0 and on
        ++ lib.optionals (cudaAtLeast "12.0") [ gmp ];
    };

  cuda_nvcc =
    {
      cudaModules,
      cudaVersion,
      pkgs,
      stdenv,
      wrapCCWith,
      lib,
      cuda_cudart,
      setupCudaHook,
    }:
    prevAttrs:
    let
      # This replicates the logic in stdenvAdapters.useLibsFrom, except we use
      # gcc from pkgsHostTarget and not from buildPackages.
      ccForLibs-wrapper = stdenv.cc;
      gccMajorVersion = cudaModules.config.nvccCompatibilities.${cudaVersion}.gccMaxMajorVersion;
      cc = wrapCCWith {
        cc = pkgs."gcc${gccMajorVersion}".cc;
        useCcForLibs = true;
        gccForLibs = ccForLibs-wrapper.cc;
      };
    in
    {

      outputs = prevAttrs.outputs ++ lib.optionals (!(builtins.elem "lib" prevAttrs.outputs)) [ "lib" ];

      # Patch the nvcc.profile.
      # Syntax:
      # - `=` for assignment,
      # - `?=` for conditional assignment,
      # - `+=` to "prepend",
      # - `=+` to "append".

      # Cf. https://web.archive.org/web/20230308044351/https://arcb.csc.ncsu.edu/~mueller/cluster/nvidia/2.0/nvcc_2.0.pdf

      # We set all variables with the lowest priority (=+), but we do force
      # nvcc to use the fixed backend toolchain. Cf. comments in
      # backend-stdenv.nix

      postPatch =
        (prevAttrs.postPatch or "")
        + ''
          substituteInPlace bin/nvcc.profile \
            --replace \
              '$(TOP)/lib' \
              "''${!outputLib}/lib" \
            --replace \
              '$(TOP)/$(_NVVM_BRANCH_)' \
              "''${!outputBin}/nvvm" \
            --replace \
              '$(TOP)/$(_TARGET_DIR_)/include' \
              "''${!outputDev}/include"

          cat << EOF >> bin/nvcc.profile

          # Fix a compatible backend compiler
          PATH += ${lib.getBin cc}/bin:

          # Expose the split-out nvvm
          LIBRARIES =+ -L''${!outputBin}/nvvm/lib
          INCLUDES =+ -I''${!outputBin}/nvvm/include

          # Expose cudart and the libcuda stubs
          LIBRARIES =+ -L$static/lib" "-L${cuda_cudart.lib}/lib -L${cuda_cudart.lib}/lib/stubs
          INCLUDES =+ -I${cuda_cudart.dev}/include
          EOF
        '';

      propagatedBuildInputs = [ setupCudaHook ];

      postInstall =
        (prevAttrs.postInstall or "")
        + ''
          moveToOutput "nvvm" "''${!outputBin}"
        '';

      # The nvcc and cicc binaries contain hard-coded references to /usr
      allowFHSReferences = true;

      meta = (prevAttrs.meta or { }) // {
        mainProgram = "nvcc";
      };
    };

  cuda_nvprof =
    { cuda_cupti }: prevAttrs: { buildInputs = prevAttrs.buildInputs ++ [ cuda_cupti.lib ]; };

  cuda_demo_suite =
    {
      freeglut,
      libcufft,
      libcurand,
      libGLU,
      libglvnd,
      mesa,
    }:
    prevAttrs: {
      buildInputs = prevAttrs.buildInputs ++ [
        freeglut
        libcufft.lib
        libcurand.lib
        libGLU
        libglvnd
        mesa
      ];
    };

  nsight_compute =
    {
      lib,
      qt5,
      qt6,
    }:
    prevAttrs:
    let
      qt = if lib.versionOlder prevAttrs.version "2022.2.0" then qt5 else qt6;
    in
    {
      nativeBuildInputs = prevAttrs.nativeBuildInputs ++ [ qt.wrapQtAppsHook ];
      buildInputs = prevAttrs.buildInputs ++ [ qt.qtwebview ];
    };

  nsight_systems =
    {
      alsa-lib,
      e2fsprogs,
      lib,
      nss,
      numactl,
      pulseaudio,
      qt5,
      qt6,
      wayland,
      xorg,
      cudaOlder,
    }:
    prevAttrs:
    let
      qt = if lib.versionOlder prevAttrs.version "2022.2.0" then qt5 else qt6;
    in
    {
      # An ad hoc replacement for
      # https://github.com/ConnorBaker/cuda-redist-find-features/issues/11
      env.rmPatterns = toString [
        "nsight-systems/*/*/libQt*"
        "nsight-systems/*/*/libstdc*"
        "nsight-systems/*/*/libboost*"
        "nsight-systems/*/*/lib{ssl,ssh,crypto}*"
        "nsight-systems/*/*/lib{arrow,jpeg}*"
        "nsight-systems/*/*/Mesa"
        "nsight-systems/*/*/python/bin/python"
        "nsight-systems/*/*/libexec"
        "nsight-systems/*/*/Plugins"
      ];
      postPatch =
        prevAttrs.postPatch or ""
        + ''
          for path in $rmPatterns ; do
            rm -r "$path"
          done
        '';
      nativeBuildInputs = prevAttrs.nativeBuildInputs ++ [ qt.wrapQtAppsHook ];
      buildInputs = prevAttrs.buildInputs ++ [
        alsa-lib
        e2fsprogs
        nss
        numactl
        pulseaudio
        wayland
        xorg.libXcursor
        xorg.libXdamage
        xorg.libXrandr
        xorg.libXtst
        qt.qtwebview
      ];

      # Older releases require boost 1.70 deprecated in Nixpkgs
      meta.broken = prevAttrs.meta.broken or false || cudaOlder "11.8";
    };

  nvidia_driver =
    { }:
    {
      # No need to support this package as we have drivers already
      # in linuxPackages.
      meta.broken = true;
    };
}
