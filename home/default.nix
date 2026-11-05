{ config, dots, ... }:
let
  homeDirectory = config.users.users.cherr.home;
in
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";

    users.cherr =
      { config, ... }:
      let
        mkSymlink = path: config.lib.file.mkOutOfStoreSymlink "${dots}/${path}";
      in
      {
        _module.args = { inherit mkSymlink; };
        home = {
          username = "cherr";
          inherit homeDirectory;
          stateVersion = "26.11";
        };
        imports = [
          ./dotfiles.nix
          ./fish.nix
          ./git.nix
          ./gtk.nix
          ./kitty.nix
          ./niri.nix
          ./programs.nix
          ./qt.nix
          ./starship.nix
          ./xdg.nix
        ];
      };
  };
}
