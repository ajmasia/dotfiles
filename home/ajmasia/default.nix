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

  imports = [ ] ++ builtins.concatMap import [ ./programs ];
}
