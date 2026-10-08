{ config, dots, ... }:
let
  mkSymlink = path: config.lib.file.mkOutOfStoreSymlink "${dots}/${path}";
in
{
  xdg.configFile = {
    # Krita/OTD
    "kritarc".source = mkSymlink "config/kritarc";
    "OpenTabletDriver/settings.json".source = mkSymlink "config/OpenTabletDriver/settings.json";

    # Fastfetch
    "fastfetch/config.jsonc".source = mkSymlink "config/fastfetch/config.jsonc";

    # Btop
    "btop/btop.conf".source = mkSymlink "config/btop/btop.conf";

    # Yazi
    "yazi/yazi.toml".source = mkSymlink "config/yazi/yazi.toml";
    "yazi/keymap.toml".source = mkSymlink "config/yazi/keymap.toml";
    "yazi/theme.toml".source = mkSymlink "config/yazi/theme.toml";
  };

  xdg.stateFile = {
    # Noctalia
    "noctalia/settings.toml".source = mkSymlink "local/state/noctalia/settings.toml";
  };
}
