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
      ../system/slimbook-one/hardware-configuration.nix
      ../system/slimbook-one/configuration.nix
      customModules
    ];
  };
}
