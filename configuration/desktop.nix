{
  pkgs,
  username,
  ...
}: {
  environment.sessionVariables = {
    _PR_SHELL = "/bin/zsh";
    NIXOS_OZONE_WL = "1";
  };

  programs = {
    bash.enable = false;
    zsh.enable = true;

    gpu-screen-recorder.enable = true;
    hyprland.enable = true;
    ambxst = {
      enable = true;
      fonts.enable = true;
    };
  };

  users.users."${username}".shell = pkgs.zsh;
}
