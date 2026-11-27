{ pkgs, ... }:
{
  # Windows Manager
  xsession.enable = true;
  programs.umbriel.enable = true;

  # Xdg
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-umbriel
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
    ];
    config.common = {
      default = [
        "umbriel"
        "gnome"
        "gtk"
      ];
      "org.freedesktop.impl.portal.FileChooser" = [ "luciole" ];
      "org.freedesktop.impl.portal.Access" = [ "gtk" ];
      "org.freedesktop.impl.portal.Notification" = [ "gtk" ];
      "org.freedesktop.impl.portal.Secret" = [
        "gnome-keyring"
        "gnome"
      ];
    };
  };

  # Keyring
  services.gnome-keyring.enable = true;
}
