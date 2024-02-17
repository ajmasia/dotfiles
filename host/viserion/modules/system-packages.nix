{ pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      vim # base text editor
      home-manager # declarative configuration for user environments
    ];
  };
}
