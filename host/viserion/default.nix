# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, inputs, pkgs, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ./config/hardware-base.nix
      ./config/bluetooth.nix
      ./config/logitech.nix
      ./config/bootloader.nix
      ./config/networking.nix
      ./config/vpn.nix
      ./config/virtualization.nix
      ./config/services.nix
      ./config/multimedia.nix
      ./config/system-packages.nix
      ./config/users.nix
      ./config/display-manager.nix
      ./config/window-manager.nix
      ./config/xdg.nix
      ./config/localization.nix
      ./config/gnome.nix
      ./config/security.nix
      ./config/fonts.nix
      ./config/nix.nix
      ./config/nixpkgs.nix
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

