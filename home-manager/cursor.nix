{pkgs, ...}: let
  ghostline-cursor-theme = pkgs.callPackage ../packages/ghostline-cursor-theme.nix {};
in {
  home.pointerCursor = {
    gtk.enable = true;
    package = ghostline-cursor-theme;
    name = "Ghostline Dark";
    size = 32;
  };
}
