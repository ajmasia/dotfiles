{ inputs, pkgs, ... }:

{
  programs = {
    hyprland.enable = true;
    hyprland.package = inputs.hyprland.packages.${pkgs.system}.hyprland; # use the flake pachage
  };

  services.dbus.enable = true;
}
