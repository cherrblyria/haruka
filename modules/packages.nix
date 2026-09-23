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
    papers
    showtime
    sushi

    # NIX
    nixfmt
    nixd

    # GSteamer
    gst_all_1.gstreamer
    gst_all_1.gst-plugins-base
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-bad
    gst_all_1.gst-plugins-ugly
    gst_all_1.gst-libav

    # Deps
    ffmpeg
    ffmpegthumbnailer
    poppler
    resvg
    webp-pixbuf-loader
  ];
  programs.fish.enable = true;
}
