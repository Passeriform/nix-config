{
  lib,
  pkgs,
  ...
}: {
  security.pam.services.sddm.enableGnomeKeyring = true;

  programs.bash.enable = false;
  programs.zsh.enable = true;

  environment.systemPackages = [
    pkgs.sddm-astronaut
  ];

  services.gnome.gnome-keyring.enable = true;
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "sddm-astronaut-theme";
    extraPackages = [
      pkgs.kdePackages.qtsvg
      pkgs.kdePackages.qtvirtualkeyboard
      pkgs.kdePackages.qtmultimedia
    ];
    enableHidpi = true;
  };

  users.users.utkarsh = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "networkmanager" "docker" ];
  };
}
