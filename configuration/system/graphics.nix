{
  lib,
  ...
}: {
  hardware.nvidia.prime = {
    amdgpuBusId = lib.mkForce "PCI:6:0:0";
    nvidiaBusId = "PCI:1:0:0";
  };
}
