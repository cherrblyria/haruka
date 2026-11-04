{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    mizuki-psekai-cursor # Cursor
    wl-clipboard # Clipboard
  ];

  programs = {
    gpu-screen-recorder.enable = true; # Sreenrecorder
    niri.enable = true; # Window Manager

    # Noctalia
    noctalia = {
      enable = true;
      recommendedServices.enable = true;
    };
  };

  # Noctalia Greeter
  services.displayManager.noctalia-greeter = {
    enable = true;
    greeter-args = "";
    passwordless-sync-users = [ "cherr" ];
    settings = {
      cursor = {
        size = 24;
        theme = "mizuki-psekai-cursor";
      };
      keyboard.layout = "us";
    };
  };
}
