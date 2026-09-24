{
  programs = {
    # Sreenrecorder
    gpu-screen-recorder.enable = true;

    # Window Manager
    niri.enable = true;

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
