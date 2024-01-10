{ system, inputs, homeManagerModules, ... }:

let
  pkgs = inputs.nixpkgs.legacyPackages.${system};
in
with inputs; {
  ajmasia = homeManager.lib.homeManagerConfiguration {
    pkgs = nixpkgs.legacyPackages.${system};

    extraSpecialArgs = {
      inherit inputs;
    };

    modules = [
      ../home/ajmasia/home.nix
      homeManagerModules
    ];
  };
}
