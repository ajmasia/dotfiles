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

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = inputs @ { self, nixpkgs, home-manager, nix-darwin, ... }:
    let
      inherit (nixpkgs.lib) nixosSystem;
      inherit (nix-darwin.lib) darwinSystem;
      inherit (home-manager.lib) homeManagerConfiguration;

      pkgs = nixpkgs.legacyPackages."x86_64-linux";

      customModules = {
        imports = [ ];
      };
    in
    {
      nixosConfigurations = {
        # Slimbook One
        viserion = nixosSystem {
          system = "x86_64-linux";
          modules = [ ./host/viserion ];
          specialArgs = { inherit inputs; };
        };
      };

      darwinConfigurations = {
        # Macbook Pro M2 Pro 
        drogon = darwinSystem {
          system = "aarch64-darwin";
          modules = [
            ./host/drogon
            # home-manager as system module
            home-manager.darwinModules.home-manager
            {
              # TODO: move as home-manager standalone module
              # https://github.com/ajmasia/darwin-config/blob/main/flake.nix
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users = {
                "ajmasia" = import ./homes/ajmasia/drogon;
              };
            }
          ];
        };
      };

      homeConfigurations = {
        "ajmasia@viserion" = homeManagerConfiguration {
          inherit pkgs;

          extraSpecialArgs = {
            inherit inputs;
            inherit (inputs.nix-colors.lib-contrib { inherit pkgs; }) gtkThemeFromScheme;
          };
          modules = [ ./home/ajmasia/viserion ];
        };
      };
    };
}
