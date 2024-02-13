{ inputs, pkgs, ... }:

{
  programs = {
    hyprland.enable = true;

    # use the flake pachage
    hyprland.package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };

  services = {
    # applications messaging system
    dbus = {
      enable = true;

      packages = with pkgs; [
        gcr # for gnome crypto services
        dconf # for gnome settings daemon
      ];
    };
  };
}
