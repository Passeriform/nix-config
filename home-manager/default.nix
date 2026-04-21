{
  username,
  ...
}: {
  imports = [
    ./packages
    ./mounts.nix
    ./session.nix
    ./fonts.nix
    ./cursor.nix
    ./utils.nix
  ];

  home = {
    username = username;
    homeDirectory = "/home/${username}";
  };

  systemd.user.startServices = "sd-switch";
  programs.home-manager.enable = true;

  home.stateVersion = "25.11";
}
