{ inputs, pkgs, gtkThemeFromeScheme, ... }:

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

  colorScheme = inputs.nix-colors.colorSchemes.tokyo-night-dark;

  fonts.fontconfig.enable = true;

  nixpkgs = {
    config = {
      allowUnfreePredicate = pkg:
        builtins.elem (pkgs.lib.getName pkg) [
          "1password"
          "google-chrome"
          "obsidian"
          "vscode"
        ];

      permittedInsecurePackages = [
        "electron-25.9.0"
      ];
    };
  };

  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    inputs.nix-colors.homeManagerModules.default
    ./notifications
  ] ++ builtins.concatMap import [
    ./ui
    ./programs
    ./services
    ./terminal
    ./editors
  ];
}
