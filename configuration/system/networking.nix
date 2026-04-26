{username, ...}: {
  networking = {
    hostName = "nixos";

    wireless.iwd.enable = true;

    firewall.enable = true;

    networkmanager = {
      enable = true;
      wifi.backend = "iwd";
    };
  };

  services.openssh.enable = true;
  services.resolved.enable = true;

  users.users."${username}".extraGroups = ["networkmanager"];
}
