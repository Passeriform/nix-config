{inputs, ...}: {
  imports = [inputs.nixcord.homeModules.default];

  programs.nixcord = {
    enable = true;
    vesktop.enable = true;

    config = {
      frameless = true;
      useQuickCss = true;

      plugins = {
        alwaysAnimate.enable = true;
        alwaysTrust.enable = true;
        copyFileContents.enable = true;
        disableCallIdle.enable = true;
        experiments.enable = true;
        fakeNitro.enable = true;
        favoriteEmojiFirst.enable = true;
        fixCodeblockGap.enable = true;
        fixYoutubeEmbeds.enable = true;
        gifPaste.enable = true;
        oneko.enable = true;
        openInApp.enable = true;
        petpet.enable = true;
        shikiCodeblocks.enable = true;
        silentTyping.enable = true;
        spotifyCrack = {
          enable = false;
          noSpotifyAutoPause = false;
        };
        validReply.enable = true;
        validUser.enable = true;
        youtubeAdblock.enable = true;
        webScreenShareFixes.enable = true;
      };
    };
  };
}
