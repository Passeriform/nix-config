{
  ...
}: {
  networking.hostName = "nixos";

  networking.wireless.iwd.enable = true;

  networking.firewall.enable = true;

  networking.networkmanager = {
    enable = true;
    wifi.backend = "iwd";
  };

  services.openssh.enable = true;
  services.resolved.enable = true;
}
