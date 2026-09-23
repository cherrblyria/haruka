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
      openFirewall = true;
    };
  };

  environment.systemPackages =
    let
      gamePkgs = inputs.nix-gaming.packages.${pkgs.stdenv.hostPlatform.system};
    in
    [
      # osu!stable
      (gamePkgs.osu-stable.override rec {
        tricks = [
          "gdiplus"
          "dotnet48"
          "meiryo"
        ];
        useGameMode = false;
        wine-discord-ipc-bridge = gamePkgs.wine-discord-ipc-bridge;
      })

      # FreesmLauncher (Minecraft)
      inputs.freesmlauncher.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
}
