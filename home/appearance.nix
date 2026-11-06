{ pkgs, mkSymlink, ... }:
{
  # Cursor
  home = {
    pointerCursor = {
      enable = true;
      gtk.enable = true;
      x11.enable = true;

      name = "mizuki-psekai-cursor";
      package = pkgs.mizuki-psekai-cursor;
      size = 24;
    };
  };

  # GTK
  gtk = {
    enable = true;
    theme = {
      name = "adw-gtk3";
      package = pkgs.adw-gtk3;
    };

    iconTheme = {
      name = "WhiteSur-grey";
      package = pkgs.whitesur-icon-theme.override { themeVariants = [ "grey" ]; };
    };
  };

  # QT
  qt = {
    enable = true;
    platformTheme.name = "qtct";
  };

  xdg.configFile = {
    "qt6ct/qt6ct.conf".source = mkSymlink "config/qt6ct/qt6ct.conf";
    "qt5ct/qt5ct.conf".source = mkSymlink "config/qt5ct/qt5ct.conf";
  };
}
