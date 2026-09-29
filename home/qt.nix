{ config, dots, ... }:
let
  mkSymlink = path: config.lib.file.mkOutOfStoreSymlink "${dots}/${path}";
in
{
  qt.enable = true;
  qt.platformTheme.name = "qtct";

  xdg.configFile = {
    "qt6ct/qt6ct.conf".source = mkSymlink "config/qt6ct/qt6ct.conf";
    "qt5ct/qt5ct.conf".source = mkSymlink "config/qt5ct/qt5ct.conf";
  };
}
