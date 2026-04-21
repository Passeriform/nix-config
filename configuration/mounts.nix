{
  ...
}: let
  mounts = [ "Dev" "Dump" "BigStore" ];
in {
  fileSystems = builtins.listToAttrs (map (name: {
    name = "/run/media/${name}";
    value = {
      label = name;
      fsType = "ntfs3";
      options = [
        "auto"
        "nouser"
        "nofail"
        "nodev"
        "exec"
        "uid=1000"
        "gid=100"
        "x-gvfs-show"
      ];
    };
  }) mounts);
}