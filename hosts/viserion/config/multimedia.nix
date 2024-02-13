{ ... }:

{
  sound.enable = true;

  services.pipewire = {
    enable = true;

    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

  # allows applications to run with real-time priorities safely, without requiring superuser privileges, recommended for audio applications
  security.rtkit.enable = true;
}
