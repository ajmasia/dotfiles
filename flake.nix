{
  description = "My awesomie systems config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";

    homeManager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = inputs @ { nixpkgs, ... }:
    let
      system = "x86_64-linux";

      customModules = {
        imports = [ ];
      };
    in
    {
      nixosConfigurations = (
        import ./outputs/nixos.nix {
          inherit system inputs customModules;
        }
      );

      homeConfigurations = (
        import ./outputs/home.nix {
          inherit system inputs;
        }
      );
    };
}
