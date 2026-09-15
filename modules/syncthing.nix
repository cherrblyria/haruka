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
        "Phone".id = "O76SLWB-LZJFWNX-XY3CRJV-SG7PIMM-P3HNDPU-XZYU7HR-736KX5Q-QGZ45QV";
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
