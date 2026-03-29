{
  lib,
  ...
}: {
  hardware.nvidia.prime = {
    amdgpuBusId = lib.mkForce "PCI:6:0:0";
    nvidiaBusId = "PCI:1:0:0";
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };
}
