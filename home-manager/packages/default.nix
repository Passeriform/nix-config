{
  pkgs,
  inputs,
  username,
  ...
}: {
  imports = [
    ./git.nix
    ./zsh.nix
    ./hyprland
    ./foot.nix
    ./zen.nix
    ./vscode.nix
    ./spotify.nix
    ./discord.nix
    ./stremio.nix
  ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
