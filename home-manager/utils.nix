{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.nix-index-database.homeModules.default
  ];

  home.packages = with pkgs; [
    # Archive
    zip
    unzip

    # Networking
    dnsutils
    iputils
    unixtools.net-tools
    wget

    # Utils
    fastfetch
    file
    lsof
    tree
    unixtools.util-linux
    unixtools.procps
    yq-go
  ];

  programs.fastfetch.enable = true;
  programs.nix-index-database.comma.enable = true;
  programs.pay-respects.enable = true;
  programs.ripgrep.enable = true;
  programs.asciinema.enable = true;
  programs.jq.enable = true;
  programs.fzf.enable = true;
  programs.zoxide.enable = true;
}
