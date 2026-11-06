{
  pkgs,
  config,
  inputs,
  ...
}:
let
  gamePkgs = inputs.nix-gaming.packages.${pkgs.stdenv.hostPlatform.system};
in
{
  environment.systemPackages = with pkgs; [
    # CLI/TUI
    eza
    fd
    fzf
    imagemagick
    ripgrep
    wget

    # Desktop Apps
    brave-origin
    czkawka
    krita
    vesktop
    blockbench
    blender
    pavucontrol

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
    engrampa
    gnome-text-editor
    loupe
    nautilus
    papers
    showtime
    sushi

    # Dev
    direnv
    gh
    nixd
    nixfmt
    uv

    # Archive
    unzip
    zip
    p7zip

    # GSteamer
    gst_all_1.gstreamer
    gst_all_1.gst-plugins-base
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-bad
    gst_all_1.gst-plugins-ugly
    gst_all_1.gst-libav

    # Drive
    udiskie
    udisks2
    smartmontools
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
