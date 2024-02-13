{ pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      vim # base text editor
      home-manager # declarative configuration for user environments
    ];

    sessionVariables = {
      NIXOS_OZONE_WL = "1"; # hint electron apps to use wayland
      MOZ_ENABLE_WAYLAND = "1"; # ensure enable wayland for Firefox
    };

  };
}
