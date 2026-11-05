{ lib, dots, osConfig, ... }:
let
  entries = builtins.readDir ./.;
  homeDirectory = osConfig.users.users.cherr.home;
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
        _module.args = { inherit dots mkSymlink; };
        home = {
          username = "cherr";
          inherit homeDirectory;
          stateVersion = "26.11";
        };
        imports =
          with lib;
          map (f: ./. + "/${f}") (
            filter (f: f != "default.nix" && hasSuffix ".nix" f) (builtins.attrNames entries)
          );
      };
  };
}
