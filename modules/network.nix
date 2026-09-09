{ config, ... }:
{
  # Networking
  networking = {
    networkmanager.enable = true;
    firewall.enable = false;
  };

  # Bluetooth
  hardware.bluetooth = {
    enable = true;
    settings.General.Experimental = true;
  };

  # Tailscale
  services.tailscale = {
    enable = true;
    authKeyFile = config.sops.secrets."tailscale_key".path;
  };
}
