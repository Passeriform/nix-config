{pkgs, ...}: {
  home.packages = with pkgs; [
    foot
    yazi
  ];

  programs.foot = {
    enable = true;
    settings.main.font = "Iosevka Nerd Font:size=11";
    settings.colors.background = "0a0a0a";
  };
}
