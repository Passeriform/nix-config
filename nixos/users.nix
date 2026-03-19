{
  pkgs,
  ...
}: {
  users.users.utkarsh = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    packages = with pkgs; [
      git
      gh
      wget
      curl
    ];
  };
}
