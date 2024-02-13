{ ... }:

{
  # allows applications to run with real-time priorities safely, without requiring superuser privileges, recommended for audio applications
  security.rtkit.enable = true;

  # tool collection for managing keyrings and storing sensitive data from the GNOME desktop environment
  services.gnome.gnome-keyring.enable = true;
}
