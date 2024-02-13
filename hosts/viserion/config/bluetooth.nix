{ ... }:

{
  hardware.bluetooth.enable = true;
  hardware.bluetooth.settings.General.ControllerMode = "dual";

  services.blueman.enable = true;
}
