{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    gsettings-desktop-schemas
    dconf
  ];

  gtk = {
    enable = true;
    theme = {
      name = "Orchis-Dark";
      package = pkgs.orchis-theme;
    };
    iconTheme = {
      name = "Dracula";
      package = pkgs.dracula-icon-theme;
    };
  };

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        gtk-theme = "Orchis-Dark";
        font-name = "Iosevka Nerd Font 10";
        monospace-font-name = "Iosevka Nerd Font 10";
        show-battery-percentage = true;
        enable-animations = true;
      };
    };
  };
}