{
  pkgs,
  ...
}: {
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  # TODO: Prune unrequired services
  services.dbus.enable = true;
  services.pipewire.enable = true;
  services.libinput.enable = true;
  services.resolved.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };

  programs.hyprland.enable = true;
}
