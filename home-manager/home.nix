{
  inputs,
  config,
  pkgs,
  ...
}: {
  home = {
    username = "utkarsh";
    homeDirectory = "/home/utkarsh";
  };

  home.packages = with pkgs; [
    # Archive
    zip
    unzip

    # Apps
    kitty
    inputs.zen-browser.packages."${system}".default

    # Networking
    dnsutils

    # Shell
    oh-my-zsh

    # Utils
    neofetch
    ripgrep
    jq
    yq-go
    fzf
    file
    tree
    lsof
  ];

  systemd.user.startServices = [ "sd-switch" ];

  programs.git = {
    enable = true;
    userName = "Passeriform";
    userEmail = "bhardwajutkarsh.ub@gmail.com";
    settings.push.autoSetupRemote = true;
    settings.init.defaultBranch = "master";
  };

  programs.kitty.enable = true;
  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;
  };

  wayland.windowManager.hyprland.enable = true;

  programs.home-manager.enable = true;

  home.stateVersion = "25.11";
}
