{ pkgs, inputs, ... }:
{
  # Steam
  programs = {
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      gamescopeSession.enable = true;
    };

    gamemode.enable = true;
  };

  services = {
    flatpak.enable = true; # For Sober (Roblox)

    sunshine = {
      enable = true;
      autoStart = true;
      capSysAdmin = true;
      openFirewall = true;
    };
  };

  environment.systemPackages = [
    # osu!stable
    (inputs.nix-gaming.packages.${pkgs.stdenv.hostPlatform.system}.osu-stable.override {
      tricks = [
        "gdiplus"
        "dotnet48"
        "meiryo"
      ];
      useGameMode = true;
    })

    # FreesmLauncher (Minecraft)
    inputs.freesmlauncher.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
