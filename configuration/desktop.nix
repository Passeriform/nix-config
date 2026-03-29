{
  pkgs,
  inputs,
  username,
  ...
}: {
  environment.sessionVariables = {
    _PR_SHELL = "/bin/zsh";
  };

  programs.bash.enable = false;
  programs.zsh.enable = true;

  programs.hyprland.enable = true;
  programs.ambxst.enable = true;

  programs.gpu-screen-recorder.enable = true;

  users.users."${username}".shell = pkgs.zsh;
}
