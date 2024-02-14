{ pkgs, ... }:

{
  services.xserver = {
    enable = true;

    xkb.layout = "us";
    xkb.variant = "altgr-intl";
    libinput.enable = true;

    displayManager.sddm = {
      enable = true;

      wayland.enable = true;
      autoNumlock = true;
      theme = "tokyo-night-sddm";
    };
  };

  environment.systemPackages =
    let
      tokyo-night = pkgs.libsForQt5.callPackage ../pkgs/sddm-tokyo-night.nix { };
    in
    with pkgs; [
      tokyo-night # tokyo-night-sddm
      libsForQt5.qt5.qtgraphicaleffects
    ];
}
