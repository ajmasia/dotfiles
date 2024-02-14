{...}:

{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      add_newline = false;

      line_break = {
        disabled = true;
      };

      nix_shell = {
        style = "bold blue";
        symbol = "❄️ ";
        impure_msg = "[impure](bold red)";
        pure_msg = "[pure](bold green)";
        format = "via [$symbol$state( \($name)\)]($style) ";
      };
    };
  };
}
