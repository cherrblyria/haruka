{
  services.keyd = {
    enable = true;
    keyboards =
      let
        commonMain = {
          capslock = "leftcontrol";            # Capslock to Ctrl
          "leftshift+rightshift" = "capslock"; # Both shift to Capslock
          leftcontrol = "grave";               # Ctrl to Grave (`)

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
}
