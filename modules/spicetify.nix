{ pkgs, inputs, ... }:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in
{
  programs.spicetify = {
    enable = true;
    wayland = true;
    windowManagerPatch = true;
    enabledExtensions = with spicePkgs.extensions; [
      adblockify
      aiBandBlocker
      autoSkipExplicit
      copyToClipboard
      hidePodcasts
      shuffle
    ];
    enabledCustomApps = with spicePkgs.apps; [
      lyricsPlus
      ncsVisualizer
    ];
    enabledSnippets = [
      "removeGradient"
      "modernScrollbar"
      "prettyLyrics"
      "pointer"
    ];
    theme = spicePkgs.themes.defaultDynamic;
    # colorScheme = "";
  };
}
