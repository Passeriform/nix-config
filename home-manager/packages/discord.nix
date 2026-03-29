{
  inputs,
  ...
}: {
  imports = [ inputs.nixcord.homeModules.default ];

  programs.nixcord = {
    enable = true;
    discord.vencord.enable = true;
    vesktop.enable = true;
  };
}
