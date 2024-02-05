{
  nix.settings.experimental-features = "nix-command flakes";

  services.nix-daemon.enable = true;
}
