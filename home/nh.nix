{ config, ... }:
{
  programs.nh = {
    enable = true;
    flake = "${config.home.homeDirectory}/haruka";
    clean = {
      enable = true;
      dates = "saturday";
      extraArgs = "--keep 3 --keep-since 3d";
    };
  };
}
