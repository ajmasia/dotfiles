{
  description = "My awesom machines configs";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-23.11";

    homeManager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
    ags.url = "github:Aylur/ags";

    nixVim.url = "github:ajmasia/nvim-nix";
  };

  outputs = inputs @ { nixpkgs, nixpkgs-stable, ... }:
    let
      system = "x86_64-linux";

      customModules = {
        imports = [ ];
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
          inherit system inputs;
        }
      );
    };
}
