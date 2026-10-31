{
  services = {
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

    openssh.enable = true;
    dbus.enable = true;

    # Disks
    gvfs.enable = true;
    udisks2.enable = true;

    # Power
    upower.enable = true;
    power-profiles-daemon.enable = true;

    # Xorg
    libinput.enable = true;
    xserver = {
      enable = false;
      xkb.layout = "us,th";
    };
  };
}
