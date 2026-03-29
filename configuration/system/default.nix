{
  ...
}: {
  imports = [
    ./bootloader.nix
    ./graphics.nix
    ./networking.nix
  ];

  time.timeZone = "Asia/Kolkata";

  hardware.bluetooth.enable = true;

  services.upower.enable = true;
}
