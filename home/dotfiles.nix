{ mkSymlink, ... }:
{
  xdg.configFile = {
    # Krita/OTD
    "kritarc".source = mkSymlink "config/kritarc";
    "OpenTabletDriver/settings.json".source = mkSymlink "config/OpenTabletDriver/settings.json";

    # Fastfetch
    "fastfetch/config.jsonc".source = mkSymlink "config/fastfetch/config.jsonc";

    # Btop
    "btop/btop.conf".source = mkSymlink "config/btop/btop.conf";

    # Starship
    "starship.toml".source = mkSymlink "config/starship.toml";

    # Yazi
    "yazi/yazi.toml".source = mkSymlink "config/yazi/yazi.toml";
    "yazi/keymap.toml".source = mkSymlink "config/yazi/keymap.toml";
    "yazi/theme.toml".source = mkSymlink "config/yazi/theme.toml";

    # Niri
    "niri/config.kdl".source = mkSymlink "config/niri/config.kdl";
    "niri/animations.kdl".source = mkSymlink "config/niri/animations.kdl";
    "niri/general.kdl".source = mkSymlink "config/niri/general.kdl";
    "niri/input.kdl".source = mkSymlink "config/niri/input.kdl";
    "niri/keymap.kdl".source = mkSymlink "config/niri/keymap.kdl";
    "niri/rules.kdl".source = mkSymlink "config/niri/rules.kdl";

    # Xdg
    "mimeapps.list".source = mkSymlink "config/mimeapps.list";
  };

  xdg.stateFile = {
    # Noctalia
    "noctalia/settings.toml".source = mkSymlink "local/state/noctalia/settings.toml";
  };
}
