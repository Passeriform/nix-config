{
  lib,
  pkgs,
  ...
}: {
  security.pam.services.sddm.enableGnomeKeyring = true;

  programs.bash.enable = false;
  programs.zsh.enable = true;

  services.gnome.gnome-keyring.enable = true;
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  users.users.utkarsh = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "networkmanager" "docker" ];
  };
}
