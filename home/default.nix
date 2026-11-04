{
  lib,
  dots,
  config,
  ...
}:
let
  entries = builtins.readDir ./.;
  homeDirectory = "/home/cherr";
  mkSymlink = path: config.lib.file.mkOutOfStoreSymlink "${dots}/${path}";
in
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    users.cherr = {
      _module.args = {
        dots = dots;
        mkSymlink = mkSymlink;
      };
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
