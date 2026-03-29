{
  ...
}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "python"
      ];
      theme = "agnoster";
    };
  };

  programs.fzf.enableZshIntegration = true;

  programs.starship = {
    enable = true;
    settings = {
      gcloud.disabled = true;
    };
  };
}
