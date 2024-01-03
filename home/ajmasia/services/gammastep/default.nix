{ ... }:

{
  services.gammastep = {
    enable = true;

    provider = "manual"; # needed to set location maually (latitude and longitude)
    latitude = "36";
    longitude = "-6";
  };
}
