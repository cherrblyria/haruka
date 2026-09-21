{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # WM/Shell
    mizuki-psekai-cursor
    wl-clipboard

    # CLI/TUI
    eza
    fd
    fzf
    imagemagick
    lazygit
    ripgrep
    wget

    # Desktop Apps
    brave-origin
    czkawka
    krita
    vesktop
    blockbench

    # Gnome-ish
    engrampa
    gnome-text-editor
    loupe
    nautilus
    showtime
    sushi

    # NIX
    nixfmt
    nixd

    # Deps
    ffmpeg
    ffmpegthumbnailer
    poppler
    resvg
    webp-pixbuf-loader
  ];
  programs.fish.enable = true;
}
