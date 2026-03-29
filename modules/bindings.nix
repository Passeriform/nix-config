{
  config,
  pkgs,
  ...
}: let
  cfg = config.shell.hypr-ambxst;

  navigation = [
    "${cfg.mod}, UP, movefocus, u"
    "${cfg.mod}, RIGHT, movefocus, r"
    "${cfg.mod}, DOWN, movefocus, d"
    "${cfg.mod}, LEFT, movefocus, l"

    "${cfg.mod}, 1, workspace, 1"
    "${cfg.mod}, 2, workspace, 2"
    "${cfg.mod}, 3, workspace, 3"
    "${cfg.mod}, 4, workspace, 4"
    "${cfg.mod}, 5, workspace, 5"
    "${cfg.mod}, 6, workspace, 6"
    "${cfg.mod}, 7, workspace, 7"
    "${cfg.mod}, 8, workspace, 8"
    "${cfg.mod}, 9, workspace, 9"
    "${cfg.mod}, 0, workspace, 10"

    "${cfg.mod} SHIFT, 1, movetoworkspace, 1"
    "${cfg.mod} SHIFT, 2, movetoworkspace, 2"
    "${cfg.mod} SHIFT, 3, movetoworkspace, 3"
    "${cfg.mod} SHIFT, 4, movetoworkspace, 4"
    "${cfg.mod} SHIFT, 5, movetoworkspace, 5"
    "${cfg.mod} SHIFT, 6, movetoworkspace, 6"
    "${cfg.mod} SHIFT, 7, movetoworkspace, 7"
    "${cfg.mod} SHIFT, 8, movetoworkspace, 8"
    "${cfg.mod} SHIFT, 9, movetoworkspace, 9"
    "${cfg.mod} SHIFT, 0, movetoworkspace, 10"
  ];

  window_E = [
    "${cfg.mod} CONTROL, UP, resizeactive, 0 -10"
    "${cfg.mod} CONTROL, RIGHT, resizeactive, 10 0"
    "${cfg.mod} CONTROL, DOWN, resizeactive, 0 10"
    "${cfg.mod} CONTROL, LEFT, resizeactive, -10 0"
  ];

  window = [
    "${cfg.mod}, SPACE, togglefloating"
    "${cfg.mod}, F, fullscreen"
    "${cfg.mod}, Q, killactive"
  ];

  window_M = [
    "${cfg.mod}, mouse:272, movewindow"
  ];

  specialKeys_LE = [
    ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
    ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
    ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
    ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
    ", XF86MonBrightnessUp, exec, brightnessctl -e2 set 5%+"
    ", XF86MonBrightnessDown, exec, brightnessctl -e2 set 5%-"
    ", XF86KbdBrightnessUp, exec, brightnessctl -d *::kbd_backlight set 5%+"
    ", XF86KbdBrightnessDown, exec, brightnessctl -d *::kbd_backlight set 5%-"
  ];    

  application = [
    "${cfg.mod}, Return, exec, ${cfg.terminal}"
    "${cfg.mod}, W, exec, ${cfg.web-browser}"
    "${cfg.mod}, E, exec, ${cfg.file-manager}"
  ];

  shell = [
    "${cfg.mod}, ${cfg.mod}_L, exec, ambxst run dashboard"
    "${cfg.mod}, R, exec, ambxst run launcher"
    "${cfg.mod}, T, exec, ambxst run tmux"
    "${cfg.mod}, V, exec, ambxst run clipboard"
    "${cfg.mod}, TAB, exec, ambxst run overview"
    "${cfg.mod}, SLASH, exec, ambxst run assistant"
    "${cfg.mod}, APOSTROPHE, exec, ambxst run notes"

    "${cfg.mod}, PERIOD, exec, ambxst run emoji"
    "${cfg.mod}, SEMICOLON, exec, ambxst run tools"

    "${cfg.mod}, PRINT, exec, ambxst run screenshot"
    "${cfg.mod} SHIFT, PRINT, exec, ambxst run screenrecord"
    "${cfg.mod} ALT, PRINT, exec, ambxst run lens"

    "${cfg.mod}, COMMA, exec, ambxst run config"
    "${cfg.mod} ALT, COMMA, exec, ambxst run wallpapers"

    "${cfg.mod}, L, exec, ambxst lock"
    "${cfg.mod}, ESCAPE, exec, ambxst run powermenu"
  ];

  nix = [
    "${cfg.mod} ALT, R, exec, pkexec nixos-rebuild switch --flake ~/.config/nix"
    "${cfg.mod} ALT, DELETE, exec, pkexec nix-collect-garbage -d"
  ];
in {
  wayland.windowManager.hyprland.settings.bind = navigation ++ window ++ application ++ shell ++ nix;
  wayland.windowManager.hyprland.settings.binde = window_E;
  wayland.windowManager.hyprland.settings.bindle = specialKeys_LE;
  wayland.windowManager.hyprland.settings.bindm = window_M;
}