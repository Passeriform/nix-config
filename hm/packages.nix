{
  pkgs,
  inputs,
  username,
  ...
}: {
  imports = [
    ../modules/hypr-ambxst.nix
    inputs.nix-index-database.homeModules.default
    inputs.zen-browser.homeModules.default
    inputs.spicetify-nix.homeManagerModules.default
    inputs.nixcord.homeModules.default
  ];

  home.packages = with pkgs; [
    # Archive
    zip
    unzip

    # Apps
    foot
    yazi
    vscodium

    # Networking
    dnsutils

    # Ambxst Compatibility
    gsettings-desktop-schemas
    dconf

    # Utils
    neofetch
    yq-go
    wget
    file
    tree
    lsof
  ];

  programs.nix-index-database.comma.enable = true;
  programs.pay-respects.enable = true;
  programs.ripgrep.enable = true;
  programs.asciinema.enable = true;
  programs.jq.enable = true;
  programs.zoxide.enable = true;

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Passeriform";
        email = "bhardwajutkarsh.ub@gmail.com";
      };
      init.defaultBranch = "master";
      push.autoSetupRemote = true;
    };
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.starship = {
    enable = true;
    settings = {
      gcloud.disabled = true;
    };
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "python"
      ];
      theme = "agnoster";
    };
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.quickshell = {
    enable = true;
    systemd.enable = true;
  };

  programs.foot = {
    enable = true;
    settings.main.font = "Iosevka Nerd Font:size=11";
  };

  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;

    policies = {
      DisableAppUpdate = true;
      DisableTelemetry = true;
    };

    profiles = {
      "${username}" = {
        isDefault = true;
        settings = {
          "extensions.autoDisableScopes" = 0;
        };

        bookmarks = {
          force = true;
          settings = [
            {
              name = "Nix";
              toolbar = true;
              bookmarks = [
                { name = "homepage"; url = "https://nixos.org/"; }
                { name = "wiki"; url = "https://wiki.nixos.org/"; }
              ];
            }
          ];
        };

        # extensions = {
        #   force = true;
        #   packages = with inputs.zen-addons.packages.${pkgs.stdenv.hostPlatform.system}; [
        #     darkreader
        #     ublock-origin
        #   ];
        # };
      };
    };
  };

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles = {
      default = {
        extensions = with pkgs.vscode-extensions; [
        ];
      };
    };
  };

  programs.nixcord = {
    enable = true;
    discord.vencord.enable = true;
    vesktop.enable = true;
  };

  programs.spicetify = let
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
  in {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
      adblockify
      hidePodcasts
      powerBar
      seekSong
      playlistIcons
      songStats
      history
      betterGenres
      oneko
      catJamSynced
      shuffle
    ];
    enabledCustomApps = with spicePkgs.apps; [
      newReleases
      nameThatTune
    ];
    theme = spicePkgs.themes.hazy;
  };

  shell.hypr-ambxst.enable = true;
  shell.hypr-ambxst.terminal = "foot";
  shell.hypr-ambxst.file-manager = "foot -e yazi";
  shell.hypr-ambxst.web-browser = "zen-beta";
}
