{ pkgs, ... }: {

  system.stateVersion = 4;

  nixpkgs.hostPlatform = "aarch64-darwin";

  users.users.ajmasia = {
    name = "ajmasia";
    home = "/Users/ajmasia";
  };

  environment.systemPackages =
    with pkgs; [ ];

  environment.variables = {
    LANG = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";
  };

  imports = [
    ./nix
    ./programs
    ./brew
  ];
}


