{
  config,
  ...
}: let
  mounts = [ "Dev" "Dump" "BigStore" ];
in {
  home.file = builtins.listToAttrs (map (name: {
    name = name;
    value = {
      source = config.lib.file.mkOutOfStoreSymlink "/run/media/${name}";
    };
  }) mounts);
}
