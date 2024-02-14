{ config, pkgs, ... }:

let
  zaney = import ./themes/zaney.nix { inherit config; };
in

{
  programs.rofi = {
    enable = true;

    package = pkgs.rofi-wayland;
    terminal = "${pkgs.alacritty}/bin/alacritty";
    theme = "zaney";
  };

  home.file.".config/rofi/themes/zaney.rasi".text = zaney.theme;
  home.file.".config/rofi/themes/assets/" = {
    recursive = true;
    source = ./themes/assets;
  };
}
