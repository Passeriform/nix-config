{
  pkgs,
  username,
  ...
}: { 
  environment.systemPackages = with pkgs; [ i2c-tools ];

  hardware.i2c.enable = true;

  boot.kernelModules = [ "i2c-dev" "i2c-piix4" ];

  services.hardware.openrgb = {
    enable = true;
    motherboard = "amd";
    package = pkgs.openrgb-with-all-plugins;
  };

  users.groups.i2c.members = [ username ];
}