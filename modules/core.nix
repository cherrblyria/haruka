{ pkgs, ... }:
{
  # NixOS
  networking.hostName = "yozora";
  system.stateVersion = "26.11";
  nixpkgs.config.allowUnfree = true;

  nix.settings = {
    experimental-features = [
      "flakes"
      "nix-command"
    ];
    accept-flake-config = true;
  };

  # Kernel & Boot Loader
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  # Hardware
  hardware = {
    # Bluetooth
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };

    # Open Tablet Driver
    opentabletdriver = {
      enable = true;
      daemon.enable = true;
    };
    uinput.enable = true;

    # Graphics Card
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
