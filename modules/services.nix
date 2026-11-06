{ config, ... }:
{
  services = {
    dbus.enable = true;
    openssh.enable = true;

    # Audio
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      pulse.enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
    };

    # Games
    flatpak.enable = true;
    sunshine = {
      enable = true;
      autoStart = false;
      openFirewall = true;
    };

    # Xorg
    libinput.enable = true;
    xserver = {
      enable = false;
      xkb.layout = "us,th";
    };

    # Disks
    gvfs.enable = true;
    udisks2.enable = true;

    # Power
    upower.enable = true;
    power-profiles-daemon.enable = true;

    # Keyd
    keyd = {
      enable = true;
      keyboards =
        let
          commonMain = {
            capslock = "leftcontrol"; # Capslock to Ctrl
            "leftshift+rightshift" = "capslock"; # Both shift to Capslock
            leftcontrol = "grave"; # Ctrl to Grave (`)

            # Swap Super and Alt
            leftmeta = "leftalt";
            leftalt = "leftmeta";

            # I don't why but this make it actually RIGHT keys
            rightalt = "rightalt";
            rightshift = "rightshift";
            rightcontrol = "rightcontrol";
          };
        in
        {
          default = {
            ids = [
              "*"
              "-0000:0000"
              "-1234:5678"
              "-dec0:5eba"
            ];
            settings.main = commonMain;
          };

          nubwoX68Krueger = {
            ids = [ "258a:002a" ];
            settings.main = commonMain // {
              # Custom right side keys
              home = "delete";
              delete = "sysrq";
              pageup = "volumeup";
              pagedown = "volumedown";
            };
          };
        };
    };

    # Syncthings
    syncthing = {
      enable = true;
      openDefaultPorts = true;

      user = "cherr";
      group = "users";
      dataDir = "${config.users.users.cherr.home}";

      settings = {
        gui.user = "cherr";

        devices = {
          "Phone".id = "Z37NBNQ-LV6FUGQ-QRG3X3F-XE3OXTD-4FPPGFO-YE6PMGQ-DJ6NGCB-ZFPXZQY";
          "Tablet".id = "7ZYRPOK-AJENNVR-JJFQG2A-NKX4HPY-MJNQQMU-3ADI5DV-DBIMFAY-ARZ3GAT";
        };

        folders = {
          "shared-dcim" = {
            id = "shared-dcim";
            label = "DCIM";
            path = "${config.services.syncthing.dataDir}/DCIM";
            devices = [
              "Phone"
              "Tablet"
            ];
          };

          "shared-pics" = {
            id = "shared-pics";
            label = "Pictures";
            path = "${config.services.syncthing.dataDir}/Pictures";
            devices = [
              "Phone"
              "Tablet"
            ];
          };

          "shared-docs" = {
            id = "shared-docs";
            label = "Documents";
            path = "${config.services.syncthing.dataDir}/Documents";
            ignorePatterns = [ "**/.obsidian/community-plugins.json" ];
            devices = [
              "Phone"
              "Tablet"
            ];
          };
        };
      };
    };
  };
}
