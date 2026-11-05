{ mkSymlink, ... }:
{
  qt = {
    enable = true;
    platformTheme.name = "qtct";
  };

  xdg.configFile = {
    "qt6ct/qt6ct.conf".source = mkSymlink "config/qt6ct/qt6ct.conf";
    "qt5ct/qt5ct.conf".source = mkSymlink "config/qt5ct/qt5ct.conf";
  };
}
