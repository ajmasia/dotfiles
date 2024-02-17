{ pkgs, ... }:

{
  # allows applications to run with real-time priorities safely, without requiring superuser privileges, recommended for audio applications
  security.rtkit.enable = true;

  # tool collection for managing keyrings and storing sensitive data from the GNOME desktop environment
  services.gnome.gnome-keyring.enable = true;

  # enables policyKit, a framework for privilege management
  security.polkit.enable = true;

  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };

  environment.variables = {
    POLKIT_BIN = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
  };

  services = {
    # enables the pcscd daemon, which provides access to smart cards
    # needed for YubiKey tools
    pcscd.enable = true;
    udev.packages = with pkgs; [ yubikey-personalization ];
  };
}
