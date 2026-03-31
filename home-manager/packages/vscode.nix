{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [ vscodium ];

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles = {
      default = {
        extensions = with pkgs.vscode-extensions; [
          mikestead.dotenv
          editorconfig.editorconfig
          streetsidesoftware.code-spell-checker
          yoavbls.pretty-ts-errors
          wix.vscode-import-cost
          gruntfuggly.todo-tree
          redhat.vscode-yaml

          # Remove and adopt devshell
          jnoortheen.nix-ide
          mkhl.direnv
        ] ++ (with inputs.nix-vscode-extensions.extensions.${pkgs.stdenv.hostPlatform.system}.vscode-marketplace; [
          vitest.explorer
          pixl-garden.bongocat
        ]) ++ (with inputs.nix-vscode-extensions.extensions.${pkgs.stdenv.hostPlatform.system}.open-vsx; [
          azir-11.azir-vscode-theme
        ]);

        userSettings = {
          "chat.fontFamily" = "'Iosevka Nerd Font', 'FiraCode Nerd Font'";
          "chat.editor.fontFamily" = "'Iosevka Nerd Font', 'FiraCode Nerd Font'";
          "debug.console.fontFamily" = "'Iosevka Nerd Font', 'FiraCode Nerd Font'";
          "editor.codeLensFontFamily" = "'Iosevka Nerd Font', 'FiraCode Nerd Font'";
          "editor.cursorBlinking" = "phase";
          "editor.cursorSmoothCaretAnimation" = "on";
          "editor.cursorStyle" = "block";
          "editor.fontFamily" = "'Iosevka Nerd Font', 'FiraCode Nerd Font'";
          "editor.fontLigatures" = true;
          "editor.inlayHints.fontFamily" = "'Iosevka Nerd Font', 'FiraCode Nerd Font'";
          "editor.inlineSuggest.fontFamily" = "'Iosevka Nerd Font', 'FiraCode Nerd Font'";
          "git.autoFetch" = true;
          "git.confirmSync" = false;
          "markdown.preview.fontFamily" = "'Iosevka Nerd Font', 'FiraCode Nerd Font'";
          "notebook.markup.fontFamily" = "'Iosevka Nerd Font', 'FiraCode Nerd Font'";
          "notebook.output.fontFamily" = "'Iosevka Nerd Font', 'FiraCode Nerd Font'";
          "scm.inputFontFamily" = "'Iosevka Nerd Font', 'FiraCode Nerd Font'";
          "terminal.integrated.cursorBlinking" = true;
          "terminal.integrated.fontFamily" = "'Iosevka Nerd Font', 'FiraCode Nerd Font'";
          "terminal.integrated.fontLigatures.enabled" = true;
          "window.titleBarStyle" = "native";
          "window.customTitleBarVisibility" = "never";
          "window.menuBarVisibility" = "hidden";
          "workbench.colorTheme" = "Azir Buddha Vira Carbon";
          "workbench.layoutControl.enabled" = false;
          "workbench.productIconTheme" = "bongocat";
        };
      };
    };
  };
}
