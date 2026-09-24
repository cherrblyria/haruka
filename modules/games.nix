{ pkgs, inputs, ... }:
{
  # Steam
  programs = {
    gamemode.enable = true;
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      gamescopeSession.enable = true;
    };
  };

  services = {
    # For Sober (Roblox)
    flatpak.enable = true;

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
      (gamePkgs.osu-stable.override {
        tricks = [
          "gdiplus"
          "dotnet48"
          "meiryo"
        ];
        useGameMode = false;
        inherit (gamePkgs) wine-discord-ipc-bridge;
      })

      # FreesmLauncher (Minecraft)
      inputs.freesmlauncher.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
}
