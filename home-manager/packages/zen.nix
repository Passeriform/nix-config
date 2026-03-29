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
