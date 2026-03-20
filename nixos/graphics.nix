{
  lib,
  pkgs,
  config,
  ...
}: {
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [ "nvidia-x11" "nvidia-settings" ];

  hardware.nvidia.prime = {
    amdgpuBusId = lib.mkForce "PCI:6:0:0";
    nvidiaBusId = "PCI:1:0:0";
  };
}
