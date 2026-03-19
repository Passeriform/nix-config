{
  pkgs,
  ...
}: {
  networking.hostName = "nixos";

  networking.wireless.iwd.enable = true;

  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.backend = "iwd";
}
