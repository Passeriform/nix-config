{
  inputs,
  username,
  ...
}: {
  imports = [ inputs.zen-browser.homeModules.default ];

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
          "zen.view.compact.enable-at-startup" = true;
          "zen.view.experimental-no-window-controls" = true;
          "zen.welcome-screen.seen" = true;
          "zen.workspaces.continue-where-left-off" = true;
          "zen.view.show-newtab-button-top" = false;
          "zen.tabs.show-newtab-vertical" = false;
          "zen.theme.color-prefs.amoled" = true;
          "zen.theme.color-prefs.use-workspace-colors" = true;
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
}
