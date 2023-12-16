{ pkgs, ... }: 

{
  programs.readline = {
    enable = true;

    bindings = {
      "\\e[A" = "history-search-backward"; # arrow up
      "\\e[B" = "history-search-forward"; # arrow down
    };

    variables = {
      editing-mode = "vi";
      show-mode-in-prompt = true;
      vi-cmd-mode-string = "\\1\\e[38;5;214m\\2󰮔 \\1\\e[0m\\2";
      vi-ins-mode-string = "\\1\\e[38;5;27m\\2󰛿 \\1\\e[0m\\2";
    };
  };
}
