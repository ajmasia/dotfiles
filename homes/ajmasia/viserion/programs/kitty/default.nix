{ ... }:

{
  programs.kitty = {
    enable = true;

    font.name = "Hack Nerd Font";
    font.size = 13;

    theme = "Cobalt2";

    settings = {
      window_padding_width = 6;
      confirm_os_window_close = 0;
      cursor_shape = "underline";
      shell_integration = "enabled no-cursor";
      detect_urls = "yes";
      copy_on_selects = "yes";
    };
  };
}

