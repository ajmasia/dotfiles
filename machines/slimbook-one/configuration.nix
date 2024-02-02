# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, config, pkgs, ... }:
let
  dbus-hyprland-environment = pkgs.writeTextFile {
    name = "dbus-hyprland-environment";
    destination = "/bin/dbus-hyprland-environment";
    executable = true;

    text = ''
      dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=hyprland
      systemctl --user stop pipewire pipewire-media-session xdg-desktop-portal xdg-desktop-portal-wlr
      systemctl --user start pipewire pipewire-media-session xdg-desktop-portal xdg-desktop-portal-wlr
    '';
  };
in

{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.timeout = 3;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.plymouth.enable = false;

  hardware.logitech.wireless.enable = true;
  hardware.pulseaudio.enable = false;

  hardware.bluetooth.enable = true;
  hardware.bluetooth.settings.General.ControllerMode = "dual";

  hardware.opengl = {
    enable = true;
  };

  sound.enable = true;

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  networking.hostName = "viserion"; # Define your hostname.
  networking.networkmanager.enable = true;
  networking.firewall.allowedTCPPorts = [ ];
  networking.firewall.allowedUDPPorts = [ ];

  security.rtkit.enable = true;
  security.polkit.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Madrid";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_ES.UTF-8";
    LC_IDENTIFICATION = "es_ES.UTF-8";
    LC_MEASUREMENT = "es_ES.UTF-8";
    LC_MONETARY = "es_ES.UTF-8";
    LC_NAME = "es_ES.UTF-8";
    LC_NUMERIC = "es_ES.UTF-8";
    LC_PAPER = "es_ES.UTF-8";
    LC_TELEPHONE = "es_ES.UTF-8";
    LC_TIME = "es_ES.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = false;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "altgr-intl";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  services.accounts-daemon.enable = true; # DBus service for accessing the list of user accounts and information attached to those accounts

  services.dbus.enable = true;
  services.dbus.packages = [ pkgs.dconf ]; # https://search.nixos.org/options?channel=23.11&show=services.dbus.packages&from=0&size=50&sort=relevance&type=packages&query=services.dbus.package

  # GNOME Keyring daemon, a service designed to take care of the user’s security credentials, such as user names and passwords
  services.gnome.gnome-keyring.enable = true; # https://search.nixos.org/options?channel=23.11&show=services.gnome.gnome-keyring&from=0&size=50&sort=relevance&type=packages&query=services.gnome.gnome-keyring

  # Enable sound with pipewire.
  services.blueman.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  services.avahi.enable = true;
  services.avahi.nssmdns4 = true;

  services.pcscd.enable = true; # Smart Card Daemon

  services.udev. packages = [ pkgs.yubikey-personalization ];

  services.udisks2.enable = true;

  services.mullvad-vpn.enable = true;
  services.mullvad-vpn.package = pkgs.mullvad-vpn;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  virtualisation.docker.enable = true;

  programs.dconf.enable = true;
  programs.hyprland = {
    enable = true;

    package = inputs.hyprland.packages.${pkgs.system}.hyprland; # use the flake pachage

    xwayland = {
      # An X server for interfacing X11 apps with the Wayland protocol
      enable = true;
    };
  };

  xdg.portal = {
    enable = true;

    wlr = {
      enable = true;
    };

    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ajmasia = {
    isNormalUser = true;
    description = "Antonio José Masiá";
    extraGroups = [ "networkmanager" "wheel" "input" "audio" ];
    packages = with pkgs; [ ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    bluetuith
    dbus-hyprland-environment
  ];

  # Hint Electon apps to use wayland
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    GDK_BACKEND = "wayland,x11";
    WLR_DRM_NO_ATOMIC = "1";
    MOZ_ENABLE_WAYLAND = "1";
    XDG_SESSION_TYPE = "wayland";
  };

  environment.loginShellInit = ''
    dbus-update-activation-environment --systemd DISPLAY
  '';

  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
    };
  };

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
