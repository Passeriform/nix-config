{
  pkgs,
  ...
}: {
  imports = [
    ./bindings.nix
  ];

  home.packages = with pkgs; [
    gsettings-desktop-schemas
    dconf
  ];

  programs.quickshell = {
    enable = true;
    systemd.enable = true;
  };

  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      general = {
        gaps_in = 4;
        gaps_out = 10;
        border_size = 2;
        "col.active_border" = "rgba(c4a7e7ff) rgba(ea9a97ff) 45deg";
        "col.inactive_border" = "rgba(2a273fcc)";
        layout = "dwindle";
      };

      monitor = [ "eDP-2,2560x1440@240,0x0,1.25" ];

      input = {
        numlock_by_default = true;
        touchpad.natural_scroll = true;
      };

      decoration = {
        rounding = 8;
        blur = {
          enabled = true;
          size = 4;
          passes = 2;
        };
      };

      animations = {
        enabled = "yes";
        bezier = [
          "myBezier, 0.05, 0.9, 0.1, 1.05"
        ];
        animation = [
          "windows, 1, 3, myBezier"
          "windowsOut, 1, 3, default, popin 80%"
          "border, 1, 5, default"
          "workspaces, 1, 3, default"
        ];
      };

      exec-once = [
        "ambxst > ~/.logs/ambxst.log"
      ];
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };
}
