{
  pkgs,
  config,
  inputs,
  ...
}:
let
  gamePkgs = inputs.nix-gaming.packages.${pkgs.stdenv.hostPlatform.system};
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in
{
  environment.systemPackages = with pkgs; [
    # CLI/TUI
    eza
    fd
    fzf
    ncdu
    imagemagick
    ripgrep
    wget

    # Desktop Apps
    blender
    blockbench
    brave-origin
    czkawka
    engrampa
    krita
    pavucontrol
    vesktop

    # Games
    (gamePkgs.osu-stable.override {
      tricks = [
        "gdiplus"
        "dotnet48"
        "meiryo"
      ];
      useGameMode = true;
      inherit (gamePkgs) wine-discord-ipc-bridge;
    })
    inputs.freesmlauncher.packages.${pkgs.stdenv.hostPlatform.system}.default

    # Gnome-ish
    decibels
    gnome-calculator
    gnome-clocks
    gnome-text-editor
    loupe
    nautilus
    papers
    showtime
    snapshot
    sushi

    # Dev
    direnv
    gh
    nixd
    nixfmt
    uv

    # Archive
    p7zip
    unzip
    zip

    # GSteamer
    gst_all_1.gst-libav
    gst_all_1.gst-plugins-bad
    gst_all_1.gst-plugins-base
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-ugly
    gst_all_1.gstreamer

    # Drive
    smartmontools
    udiskie
    udisks2
    util-linux

    # Media
    ffmpeg
    ffmpegthumbnailer
    poppler
    resvg
    webp-pixbuf-loader
  ];

  programs = {
    # Shell
    fish.enable = true;

    # Games
    gamemode.enable = true;
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      gamescopeSession.enable = true;
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };

    # Spicetify
    spicetify = {
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
    };

    # Nix/NixOS
    nix-ld.enable = true;
    nh = {
      enable = true;
      flake = "${config.users.users.cherr.home}/haruka";
      clean = {
        dates = "saturday";
        enable = true;
        extraArgs = "--keep 2 --keep-since 7d";
      };
    };
  };
}
