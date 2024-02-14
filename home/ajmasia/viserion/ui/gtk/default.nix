{ config, pkgs, gtkThemeFromScheme, ... }:

{
  gtk = with pkgs; {
    enable = true;

    font = {
      name = "Ubuntu";
      size = 12;
      package = ubuntu_font_family;
    };

    theme = {
      name = "${config.colorScheme.slug}";
      package = gtkThemeFromScheme { scheme = config.colorScheme; };
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = papirus-icon-theme;
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };

  qt = with pkgs; {
    enable = true;
    platformTheme = "gtk";

    style = {
      name = "adwaita-dark";
      package = adwaita-qt;
    };
  };
}
