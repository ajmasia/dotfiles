{ system, inputs, customModules, ... }:

let
  inherit (inputs.nixpkgs.lib) nixosSystem; 
in
{
  viserion = nixosSystem {
    inherit system;

    specialArgs = {
      inherit inputs;
    };
    
    modules = [
      ../machines/slimbook-one/hardware-configuration.nix
      ../machines/slimbook-one/configuration.nix
      customModules
    ];
  };
}
