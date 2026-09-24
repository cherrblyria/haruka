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

    # Chromium Flags
    "obsidian/user-flags.conf".source = mkSymlink "config/obsidian/user-flags.conf";
    "brave-origin-nightly-flags.conf".source = mkSymlink "config/brave-origin-nightly-flags.conf";
    "chrome-flags.conf".source = mkSymlink "config/chrome-flags.conf";
    "chromium-flags.conf".source = mkSymlink "config/chromium-flags.conf";
    "code-flags.conf".source = mkSymlink "config/code-flags.conf";
    "electron-flags.conf".source = mkSymlink "config/electron-flags.conf";
  };

  xdg.stateFile = {
    # Noctalia
    "noctalia/settings.toml".source = mkSymlink "local/state/noctalia/settings.toml";
  };
}
