{ config, lib, pkgs, ... }:

{
  home = {
    stateVersion = "24.05";

    username = "ajmasia";
    homeDirectory = "/Users/ajmasia";

    packages = (import ./packages.nix) pkgs;
  };

  programs = {
    htop = {
      enable = true;
    };

    eza = {
      enable = true;
    };
  };

  imports = builtins.concatMap import [
    ./shell
  ];
}


