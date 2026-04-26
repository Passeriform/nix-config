_: {
  services.gnome-keyring = {
    enable = true;
    components = ["pkcs11" "secrets" "ssh"];
  };

  services.hyprpolkitagent.enable = true;
}
