{
  lib,
  pkgs,
  ...
}: {
  programs.bash.enable = false;
  programs.zsh.enable = true;

  users.users.utkarsh = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "networkmanager" "docker" ];
  };
}
