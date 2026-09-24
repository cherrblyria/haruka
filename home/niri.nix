{ config, dots, ... }:
let
  mkSymlink = path: config.lib.file.mkOutOfStoreSymlink "${dots}/${path}";
in
{
  wayland.windowManager.niri.enable = true;
  xsession.enable = true;

  xdg.configFile = {
    "niri/config.kdl".source = mkSymlink "config/niri/config.kdl";
    "niri/animations.kdl".source = mkSymlink "config/niri/animations.kdl";
    "niri/general.kdl".source = mkSymlink "config/niri/general.kdl";
    "niri/input.kdl".source = mkSymlink "config/niri/input.kdl";
    "niri/keymap.kdl".source = mkSymlink "config/niri/keymap.kdl";
    "niri/rules.kdl".source = mkSymlink "config/niri/rules.kdl";
  };
}
