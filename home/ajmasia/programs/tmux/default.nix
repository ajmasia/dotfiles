{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;

    baseIndex = 1;
    historyLimit = 10000;
    keyMode = "vi";
    shortcut = "x";
    terminal = "screen-256color";
    extraConfig = builtins.readFile ./tmux.conf;
  };
}
