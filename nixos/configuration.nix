{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./bootloader.nix
    ./networking.nix
    ./graphics.nix
    ./users.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
 
  time.timeZone = "Asia/Kolkata";

  security.polkit.enable = true;

  services.upower.enable = true;

  services.openssh.enable = true;

  programs.ambxst.enable = true;
  programs.hyprland.enable = true;

  system.stateVersion = "25.11";
}

