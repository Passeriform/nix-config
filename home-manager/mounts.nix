{config, ...}: let
  mounts = ["Dev" "Dump" "BigStore"];
in {
  home.file = builtins.listToAttrs (map (name: {
      inherit name;
      value = {
        source = config.lib.file.mkOutOfStoreSymlink "/run/media/${name}";
      };
    })
    mounts);
}
