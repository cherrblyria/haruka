{
  programs = {
    # TUI
    btop.enable = true;

    cava = {
      enable = true;
      settings.color.theme = "noctalia";
    };

    yazi = {
      enable = true;
      enableFishIntegration = true;
    };

    bottom = {
      enable = true;
      settings = {
        flags.temperature_type = "c";
        processes.default_grouped = true;
      };
    };

    # CLI
    fastfetch.enable = true;

    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };

    # Desktop Apps
    obsidian = {
      enable = true;
      cli.enable = true;
    };

    vscode = {
      enable = true;
      mutableExtensionsDir = true;
    };
  };
}
