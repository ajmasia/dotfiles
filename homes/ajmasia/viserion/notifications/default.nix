{ config, pkgs, ... }:

let
  configModule = import ./dotfiles/config.nix { inherit pkgs; };
  stylesModule = import ./dotfiles/styles.nix { inherit pkgs config; };
in
{
  home.packages = with pkgs; [
    swaynotificationcenter # A notification center for sway
  ];

  home.file.".config/swaync/config.json".text = configModule.config;
  home.file.".config/swaync/style.css".text = stylesModule.styles;
}
