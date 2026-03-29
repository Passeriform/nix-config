{
  lib,
  pkgs,
  ...
}: {
  environment.systemPackages = [
    pkgs.hyprpolkitagent
    pkgs.where-is-my-sddm-theme
  ];

  security.polkit.enable = true;
  security.pam.services.sddm.enableGnomeKeyring = true;

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "where-is-my-sddm-theme";
    enableHidpi = true;
  };
}
