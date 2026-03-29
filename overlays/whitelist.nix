{
  lib,
  config,
  ...
}: {
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) (map lib.getName [
    "nvidia-x11"
    "nvidia-settings"
    "discord"
    "spotify"
  ]);
}
