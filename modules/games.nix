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

    sunshine.enable = true; # I want to play minecraft on my phone 'cause why not?
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
