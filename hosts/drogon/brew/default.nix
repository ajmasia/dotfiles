{
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      upgrade = true;

      # Uninstall not listed packages and casks
      cleanup = "uninstall";
    };
    brews = [
    ];
    casks = [
      "iterm2"
      "obsidian"
    ];
  };
}
