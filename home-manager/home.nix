{
  inputs,
  config,
  pkgs,
  ...
}: {
  imports = [
    inputs.zen-browser.homeModules.default
  ];

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
    foot

    # Networking
    dnsutils

    # Shell
    oh-my-zsh

    # Utils
    neofetch
    ripgrep
    jq
    git
    gh
    yq-go
    wget
    fzf
    file
    tree
    lsof
  ];

  systemd.user.startServices = "sd-switch";

  programs.git = {
    enable = true;
    settings = {
      user = {
        email = "bhardwajutkarsh.ub@gmail.com";
        name = "Passeriform";
      };
      init.defaultBranch = "master";
      push.autoSetupRemote = true;
    };
  };

  programs.kitty.enable = true;

  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;
  };

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "SUPER";
      "$mod_L" = "Super_L";
      "$terminal" = "foot";
      "$web-browser" = "zen-beta";
      "$file-manager" = "thunar";
      
      general = {
        gaps_in = 4;
        gaps_out = 10;
        border_size = 2;
        "col.active_border" = "rgba(c4a7e7ff) rgba(ea9a97ff) 45deg";
        "col.inactive_border" = "rgba(2a273fcc)";
        layout = "dwindle";
      };

      input = {
        numlock_by_default = true;
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

      bind = [
        "$mod, Return, exec, $terminal"
        "$mod, W, exec, $web-browser"
        "$mod, E, exec, $file-manager"
        "$mod, Q, killactive"
        "$mod, SPACE, togglefloating"

        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"

        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"

        "$mod, $mod_L, exec, ambxst run launcher"
        "$mod, D, exec, ambxst run dashboard"
        "$mod, A, exec, ambxst run assistant"
        "$mod, V, exec, ambxst run clipboard"
        "$mod, PERIOD, exec, ambxst run emoji"
        "$mod, N, exec, ambxst run notes"
        "$mod, T, exec, ambxst run tmux"
        "$mod, COMMA, exec, ambxst run wallpapers"
        "$mod, TAB, exec, ambxst run overview"
        "$mod, ESCAPE, exec, ambxst run powermenu"
        "$mod SHIFT, C, exec, ambxst run config"
        "$mod, L, exec, loginctl lock-session"
        "$mod, S, exec, ambxst run tools"
        "$mod SHIFT, S, exec, ambxst run screenshot"
        "$mod SHIFT, R, exec, ambxst run screenrecord"
        "$mod SHIFT, A, exec, ambxst run lens"
        "$mod SHIFT, B, exec, ambxst reload"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      exec-once = [
        "ambxst"
      ];
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };

  programs.home-manager.enable = true;

  home.stateVersion = "25.11";
}
