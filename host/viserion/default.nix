# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, inputs, pkgs, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ./modules/hardware-base.nix
      ./modules/bluetooth.nix
      ./modules/logitech.nix
      ./modules/bootloader.nix
      ./modules/networking.nix
      ./modules/vpn.nix
      ./modules/virtualization.nix
      ./modules/services.nix
      ./modules/multimedia.nix
      ./modules/system-packages.nix
      ./modules/users.nix
      ./modules/display-manager.nix
      ./modules/window-manager.nix
      ./modules/xdg.nix
      ./modules/locale.nix
      ./modules/gnome.nix
      ./modules/security.nix
      ./modules/fonts.nix
      ./modules/nix.nix
      ./modules/nixpkgs.nix
    ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}

