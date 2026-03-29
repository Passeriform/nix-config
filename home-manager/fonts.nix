{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.fira-mono
    nerd-fonts.hack
    nerd-fonts.iosevka
    nerd-fonts.iosevka-term
    nerd-fonts.iosevka-term-slab
  ];

  fonts.fontconfig = {
    enable = true;
    antialiasing = true;
    subpixelRendering = "rgb";

    # defaultFonts = {
    #   monospace = [ "Iosevka" "Fira Code" ];
    #   serif = [ "Iosevka" "Fira Code" ];
    #   emoji = [ "Iosevka" "Fira Code" ];
    # };
  };    
}
