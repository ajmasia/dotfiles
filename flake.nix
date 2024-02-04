{
  description = "My awesomie systems config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    homeManager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = inputs @ { nixpkgs, ... }:
    let
      customModules = {
        imports = [ ];
      };
    in
    {
      nixosConfigurations = {
        # Slimbook One
        viserion = lib.nixosSystem {
          system = "x86_64-linux";
          modules = [ ./host/viserion ];
          specialArgs = { inherit system inputs; };
        };
      };

      homeConfigurationes = { };
    };
}
