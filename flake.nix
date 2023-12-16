{
  description = "My awesom machines configs";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    homeManager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = inputs @ {nixpkgs, ...}: let
    system = "x86_64-linux";

    customModules = {
      imports = [ ];
    };
  in {
    nixosConfigurations = (
      import ./outputs/nixos-config.nix {
        inherit system inputs customModules;
      }
    );

    homeConfigurations = (
      import ./outputs/home-config.nix {
        inherit system inputs;
      }
    );
  };
}
