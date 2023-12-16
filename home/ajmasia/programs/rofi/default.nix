{ pkgs, ... }:

{
  programs.rofi = {
    enable = true;

    package = pkgs.rofi-wayland;

    terminal = "${pkgs.alacritty}/bin/alacritty";
    # theme = ./themes/spotlight-dark.rasi;
  };
}
