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

  # Locale
  time.timeZone = "Asia/Bangkok";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings.LC_TIME = "C.UTF-8";
  };

  # Networking
  networking = {
    networkmanager.enable = true;
    firewall.enable = false;
  };

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

    # Graphics
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

  # Environment
  environment = {
    sessionVariables = {
      LIBVA_DRIVER_NAME = "iHD";
    };

    variables = {
      # Wayland
      ELECTRON_OZONE_PLATFORM_HINT = "wayland";
      MOZ_ENABLE_WAYLAND = "1";
      NIXOS_OZONE_WL = "1";
      QT_AUTO_SCREEN_SCALE_FACTOR = "1";
      QT_QPA_PLATFORM = "wayland";
      QT_QPA_PLATFORMTHEME = "qt6ct";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    };
  };
}
