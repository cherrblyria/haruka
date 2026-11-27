{ pkgs, ... }:
{

  environment.systemPackages = with pkgs; [
    mizuki-psekai-cursor # Cursor
    wl-clipboard # Clipboard
  ];

  programs = {
    gpu-screen-recorder.enable = true; # Sreenrecorder
    umbriel.enable = true; # Window Manager

    # Noctalia
    noctalia = {
      enable = true;
      recommendedServices.enable = true;
    };
  };

  services.gnome.gnome-keyring.enable = true;
  security.pam.services.greetd.enableGnomeKeyring = true;

  # Noctalia Greeter
  services.displayManager.noctalia-greeter = {
    enable = true;
    greeter-args = "";
    passwordless-sync-users = [ "cherr" ];
    settings = {
      cursor = {
        theme = "mizuki-psekai-cursor";
        size = 32;
      };
      keyboard.layout = "us";
    };
  };
}
