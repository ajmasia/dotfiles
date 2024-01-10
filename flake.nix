{
  description = "My awesom machines configs";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    homeManager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
    ags.url = "github:Aylur/ags";

    nixvim = {
      url = "github:nix-community/nixvim";
      # url = "/home/gaetan/perso/nix/nixvim/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { nixpkgs, ... }:
    let
      system = "x86_64-linux";

      customModules = {
        imports = [ ];
      };

      homeManagerModules = {
        imports = [
          inputs.nixvim.homeManagerModules.nixvim
        ];
      };
    in
    {
      nixosConfigurations = (
        import ./outputs/nixos-config.nix {
          inherit system inputs customModules;
        }
      );

      homeConfigurations = (
        import ./outputs/home-config.nix {
          inherit system inputs homeManagerModules;
        }
      );
    };
}
