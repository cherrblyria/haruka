{ pkgs, ... }:
{
  # Niri
  wayland.windowManager.niri.enable = true;
  xsession.enable = true;

  # Xdg
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
    ];
    config.common = {
      default = [
        "gnome"
        "gtk"
      ];
      "org.freedesktop.impl.portal.Secret" = [ "gnome-keyring" ];
    };
  };

  # Keyring
  services.gnome-keyring.enable = true;
}
