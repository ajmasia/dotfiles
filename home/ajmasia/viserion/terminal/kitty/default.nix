{ ... }:

{
  programs.kitty = {
    enable = true;

    font.name = "Hack Nerd Font";
    font.size = 13;

    theme = "Catppuccin-Macchiato";
    shellIntegration.enableBashIntegration = true;
    shellIntegration.mode = "no-cursor";

    settings = {
      window_padding_width = 6;
      confirm_os_window_close = 0;
      cursor_shape = "underline";
      detect_urls = "yes";
      copy_on_selects = "yes";
    };
  };
}

