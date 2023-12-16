let
  userName = "ajmasia";
  homeDirectory = "/home/${userName}";
  configHome = "${homeDirectory}/.config";
in
{
  # System 
  userName = userName;
  homeDirectory = homeDirectory;
  configHome = configHome;

  # Monitors
  mainMonitor = "DP-3";
  portableMonitor = "DP-2";

  # UI
  wallpaper = "~/.local/share/wallpapers/001_sonoma-macos.jpeg";

  # Default apps
  terminal = "alacritty";
  browser = "firefox";
}
