{
  description = "My awesomie systems config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = inputs @ { self, nixpkgs, home-manager, nix-darwin, ... }:
    let
      inherit (nixpkgs.lib) nixosSystem;
      inherit (nix-darwin.lib) darwinSystem;
      inherit (home-manager.lib) homeManagerConfiguration;

      customModules = {
        imports = [ ];
      };
    in
    {
      nixosConfigurations = {
        # Slimbook One
        viserion = nixosSystem {
          system = "x86_64-linux";
          modules = [ ./hosts/viserion ];
          specialArgs = { inherit inputs; };
        };
      };

      darwinConfigurations = {
        # Macbook Pro M2 Pro 
        drogon = darwinSystem {
          system = "aarch64-darwin";
          modules = [
            ./hosts/drogon
            # home-manager as system module
            home-manager.darwinModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.ajmasia = import ./home/ajmasia/drogon;
            }
          ];
        };
      };

      homeConfigurations = {
        "ajmasia@viserion" = homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${system};
          extraSpecialArgs = { inherit inputs; };
          modules = [ ./homes/ajmasia/viserion ];
        };
      };
    };
}
