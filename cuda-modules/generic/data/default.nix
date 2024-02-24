{
  # As these modules add values to the top-level config, they cannot be brought in as submodules.
  imports = [
    ./gpus
    ./nvcc-compatibilities
  ];
}
