{ ... }:

{
  # low-level configuration system used by the GNOME desktop environment
  programs.dconf.enable = true;

  # Collection tools to manage passwords and other secrets
  services.gnome.gnome-keyring.enable = true;
}
