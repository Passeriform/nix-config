{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.shell.hypr-ambxst;
in {
  imports = [
    ./bindings.nix
  ];

  options.shell.hypr-ambxst = {
    enable = lib.options.mkEnableOption "hypr-ambxst";

    mod = lib.options.mkOption {
        default = "SUPER";
    };

    terminal = lib.options.mkOption {
        default = "kitty";
    };

    file-manager = lib.options.mkOption {
        default = "thunar";
    };

    web-browser = lib.options.mkOption {
        default = "firefox";
    };
  };

  config = lib.modules.mkIf cfg.enable {
    wayland.windowManager.hyprland.enable = true;

    wayland.windowManager.hyprland.settings.general = {
      gaps_in = 4;
      gaps_out = 10;
      border_size = 2;
      "col.active_border" = "rgba(c4a7e7ff) rgba(ea9a97ff) 45deg";
      "col.inactive_border" = "rgba(2a273fcc)";
      layout = "dwindle";
    };

    wayland.windowManager.hyprland.settings.monitor = [ "eDP-2,2560x1440@240,0x0,1.25" ];

    wayland.windowManager.hyprland.settings.input = {
      numlock_by_default = true;
      touchpad.natural_scroll = true;
    };

    wayland.windowManager.hyprland.settings.decoration = {
      rounding = 8;
      blur = {
        enabled = true;
        size = 4;
        passes = 2;
      };
    };

    wayland.windowManager.hyprland.settings.animations = {
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

    wayland.windowManager.hyprland.settings.exec-once = [
      "ambxst > ~/.logs/ambxst.log"
    ];

    xdg.portal = {
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
    };
  };
}
