{ config, ... }:
let
  homeDirectory = config.users.users.cherr.home;
  dots = "${homeDirectory}/haruka/dots";
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
          ./appearance.nix
          ./dotfiles.nix
          ./programs.nix
          ./session.nix
        ];
      };
  };
}
