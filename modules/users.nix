{ pkgs, ... }:
{
  users.users."cherr" = {
    shell = pkgs.fish;
    isNormalUser = true;
    description = "cherr";
    extraGroups = [
      "dialout"
      "input"
      "networkmanager"
      "uinput"
      "video"
      "wheel"
    ];
    initialPassword = "password";
  };
  nix.settings.trusted-users = [ "cherr" ];
  security.sudo.extraConfig = "Defaults passwd_timeout=0";
}
