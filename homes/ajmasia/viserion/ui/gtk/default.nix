{ pkgs, ... }:

{
  gtk = with pkgs; {
    enable = true;

    theme = {
      name = "Adwaita-dark";
      package = gnome.gnome-themes-extra;
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = papirus-icon-theme;
    };
  };
}
