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

    # Umbriel
    "umbriel/config.toml".source = mkSymlink "config/umbriel/config.toml";

    # Xdg
    "mimeapps.list".source = mkSymlink "config/mimeapps.list";
  };

  xdg.stateFile = {
    # Noctalia
    "noctalia/settings.toml".source = mkSymlink "local/state/noctalia/settings.toml";
  };

  xdg.dataFile = {
    # Luciole scripts
    "luciole/scripts/Set As Wallpaper".source =
      mkSymlink "local/share/luciole/scripts/Set As Wallpaper";
  };
}
