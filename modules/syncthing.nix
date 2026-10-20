{ config, ... }:
{
  services.syncthing = {
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
}
