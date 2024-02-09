{ pkgs, ... }:

let
  userConfig = (import ./config.nix);

in
{
  home = {
    username = userConfig.userName;
    homeDirectory = userConfig.homeDirectory;

    keyboard = {
      layout = "us";
      variant = "altgr-intl";
    };

    packages = import ./packages { pkgs = pkgs; };

    file = (import ./file) { };

    stateVersion = "23.11";
  };

  nixpkgs = {
    config = {
      allowUnfreePredicate = pkg:
        builtins.elem (pkgs.lib.getName pkg) [
          "1password"
          "google-chrome"
          "obsidian"
        ];

      permittedInsecurePackages = [ ];
    };

  };

  imports = [ ] ++ builtins.concatMap import [ ./programs ./services ];
}
