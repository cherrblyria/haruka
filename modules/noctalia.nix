{
  programs = {
    niri.enable = true;

    noctalia = {
      enable = true;
      recommendedServices = {
        enable = true;
      };
    };

    gpu-screen-recorder.enable = true;
  };

  services.displayManager.noctalia-greeter = {
    enable = true;
    greeter-args = "";
    passwordless-sync-users = [ "cherr" ];
    settings = {
      cursor = {
        size = 24;
        theme = "mizuki-psekai-cursor";
      };
      keyboard = {
        layout = "us";
      };
    };
  };
}
