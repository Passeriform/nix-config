{
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./gc.nix
    ../overlays/whitelist.nix
    ../overlays/bootloader.nix
    ../overlays/networking.nix
    ../overlays/virtualisation.nix
    ../overlays/graphics.nix
    ../overlays/users.nix
    ../overlays/packages.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
 
  time.timeZone = "Asia/Kolkata";

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    _PR_SHELL = "/bin/zsh";
  };

  security.polkit.enable = true;

  services.upower.enable = true;

  hardware.bluetooth.enable = true;

  system.stateVersion = "25.11";
}
