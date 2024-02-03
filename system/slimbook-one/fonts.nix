{ pkgs, ... }: {
  fonts = {
    enableDefaultPackages = false;

    fontDir.enable = true;

    packages = with pkgs; [
      (nerdfonts.override {
        fonts = [
          "FiraCode"
          "Hack"
          "NerdFontsSymbolsOnly"
          "CascadiaCode"
          "JetBrainsMono"
          "Noto"
          "SourceCodePro"
          "Ubuntu"
        ];
      })

      source-serif
      work-sans
    ];

    fontconfig = {
      antialias = true;
      defaultFonts = {
        serif = [ "Source Serif" ];
        sansSerif = [ "Work Sans" "Fira Sans" "FiraGO" ];
        monospace = [ "Hack Nerd Font" "FiraCode Nerd Font Mono" "SauceCodePro Nerd Font Mono" ];
        emoji = [ "Noto Color Emoji" ];
      };
      enable = true;
      hinting = {
        autohint = false;
        enable = true;
        style = "slight";
      };
      subpixel = {
        rgba = "rgb";
        lcdfilter = "light";
      };
    };
  };
}
