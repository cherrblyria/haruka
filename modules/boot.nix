{ pkgs, ... }:
{
  networking.hostName = "yozora";
  system.stateVersion = "26.11";
  nixpkgs.config.allowUnfree = true;

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
  };

  nix.settings = {
    experimental-features = [
      "flakes"
      "nix-command"
    ];
    accept-flake-config = true;
  };

  hardware = {
    uinput.enable = true;

    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        intel-media-driver
        vpl-gpu-rt
      ];
      extraPackages32 = with pkgs; [
        intel-media-driver
      ];
    };
  };
}
