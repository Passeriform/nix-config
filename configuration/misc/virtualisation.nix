{
  username,
  ...
}: {
  hardware.nvidia-container-toolkit.enable = true;

  virtualisation.docker = {
    enable = true;

    rootless = {
      enable = true;
      setSocketVariable = true;
    };

    daemon.settings.features.cdi = true;
  };

  users.users."${username}".extraGroups = [ "docker" ];
}
