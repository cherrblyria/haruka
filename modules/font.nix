{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      adwaita-fonts
      inter
      nerd-fonts.caskaydia-cove
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji

      # Install fonts from assets dir
      (pkgs.runCommand "haruka-font-pack" { } ''
        mkdir -p $out/share/fonts/truetype
        cp -r ${../assets/fonts}/* $out/share/fonts/truetype/
      '')
    ];

    # Default fonts fallback
    fontconfig.defaultFonts = {
      serif = [
        "Noto Serif"
        "Noto Serif Thai"
        "Caskaydia Cove Nerd Font"
      ];
      sansSerif = [
        "Inter"
        "Noto Sans"
        "Noto Sans Thai"
        "Caskaydia Cove Nerd Font"
      ];
      monospace = [
        "Caskaydia Cove Nerd Font"
        "Noto Sans Thai Looped"
      ];
      emoji = [ "Noto Color Emoji" ];
    };
  };
}
