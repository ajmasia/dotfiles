{ inputs, pkgs, ... }:

let
  username = (import ./constants.nix).userName;
  homeDirectory = (import ./constants.nix).homeDirectory;
in
with pkgs; {

  home = {
    inherit username homeDirectory;

    keyboard = {
      layout = "us";
      variant = "altgr-intl";
    };

    packages = import ./packages { pkgs = pkgs; };

    #  User assets and personal config
    file = (import ./file) { };

    stateVersion = "24.05";
  };

  fonts.fontconfig.enable = true;

  programs.home-manager.enable = true;
  # programs.neovim.enable = true;

  dconf = {
    enable = true;
    settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
  };

  nixpkgs = {
    config = {
      allowUnfreePredicate = pkg:
        builtins.elem (pkgs.lib.getName pkg) [
          "1password"
          "1password-cli"
          "google-chrome"
          "slack"
        ];

      permittedInsecurePackages = [ ];
    };

    overlays = [
      (import ./overlays/bin.nix)
      (import ./overlays/nvim.nix { inherit inputs; })
    ];
  };

  imports = [
    inputs.ags.homeManagerModules.default
  ] ++ builtins.concatMap import [
    ./programs
    ./services
  ];
}
