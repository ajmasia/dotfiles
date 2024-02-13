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

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1"; # hint electron apps to use wayland
    MOZ_ENABLE_WAYLAND = "1"; # ensure enable wayland for Firefox
  };

}
