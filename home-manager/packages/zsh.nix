_: {
  programs = {
    zsh = {
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

    fzf.enableZshIntegration = true;

    starship = {
      enable = true;
      settings = {
        gcloud.disabled = true;
      };
    };
  };
}
