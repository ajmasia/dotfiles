{ pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ajmasia = {
    isNormalUser = true;
    description = "ajmasia";
    extraGroups = [ "networkmanager" "wheel" "audio" "input" "docker" ];
    packages = with pkgs; [ ];
  };
}
