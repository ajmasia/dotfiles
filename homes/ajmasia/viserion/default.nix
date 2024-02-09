{ pkgs, ... }:

{
  home = {
    inherit (import ./config.nix) username;
    inherit (import ./config.nix) homeDirectory;

    keyboard = {
      layout = "us";
      variant = "altgr-intl";
    };

    packages = import ./packages { inherit pkgs; };

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

      permittedInsecurePackages = [
        "electron-25.9.0"
      ];
    };

  };

  imports = [ ] ++ builtins.concatMap import [
    ./ui
    ./programs
    ./services
    ./terminal
  ];
}
