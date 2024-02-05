{
  description = "My awesomie systems config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = inputs @ { self, nixpkgs, home-manager, ... }:
    let
      inherit (nixpkgs.lib) nixosSystem;
      inherit (home-manager.lib) homeManagerConfiguration;

      system = "x86_64-linux";

      customModules = {
        imports = [ ];
      };
    in
    {
      nixosConfigurations = {
        # Slimbook One
        viserion = nixosSystem {
          inherit system;
          modules = [ ./hosts/viserion ];
          specialArgs = { inherit inputs; };
        };
      };

      homeConfigurations = {
        "ajmasia@viserion" = homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${system};
          extraSpecialArgs = { inherit inputs; };
          modules = [ ./homes/viserion/ajmasia ];
        };
      };
    };
}
