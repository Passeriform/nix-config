{
  inputs,
  pkgs,
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
          "browser.bookmarks.addedImportButton" = false;
          "browser.laterrun.enabled" = false;
          "browser.rights.3.shown" = true;
          "browser.termsofuse.prefMigrationCheck" = true;
          "browser.theme.toolbar-theme" = 1;
          "extensions.autoDisableScopes" = 0;
          "security.webauth.webauthn_enable_softtoken" = true;
          "sidebar.visibility" = "hide-sidebar";
          "zen.tabs.show-newtab-vertical" = false;
          "zen.theme.color-prefs.amoled" = true;
          "zen.theme.color-prefs.use-workspace-colors" = true;
          "zen.view.compact.enable-at-startup" = true;
          "zen.view.experimental-no-window-controls" = true;
          "zen.view.show-newtab-button-top" = false;
          "zen.welcome-screen.seen" = true;
          "zen.workspaces.continue-where-left-off" = true;
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

        extensions = {
          force = true;
          packages = with inputs.zen-addons.packages.${pkgs.stdenv.hostPlatform.system}; [
            darkreader
            ublock-origin
            ublacklist
          ];
        };

        search = {
          force = true;
          engines = {
            bing.metaData.hidden = true;
            ddg.metaData.hidden = true;
            perplexity.metaData.hidden = true;
            wikipedia.metaData.hidden = true;

            "GitHub" = {
              urls = [{ template = "https://github.com/search?q={searchTerms}"; }];
              icon = "https://github.githubassets.com/favicons/favicon-dark.svg";
              definedAliases = ["@gh"];
            };
            "NixOS Packages" = {
              urls = [{ template = "https://search.nixos.org/packages?from=0&size=200&sort=relevance&type=packages&query={searchTerms}"; }];
              icon = "https://nixos.org/favicon.svg";
              definedAliases = [ "@np" "@nix" ];
            };
            "NixOS Options" = {
              urls = [{ template = "https://search.nixos.org/options?from=0&size=200&sort=relevance&type=packages&query={searchTerms}"; }];
              icon = "https://nixos.org/favicon.svg";
              definedAliases = [ "@no" ];
            };
          };
        };
      };
    };
  };
}
