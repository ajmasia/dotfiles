{ pkgs, ... }:

{
  services.flameshot = {
    enable = false;

    settings = {
      General = {
        disabledTrayIcon = true;
      };
    };
  };
}
