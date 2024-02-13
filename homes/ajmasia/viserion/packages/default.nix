{ pkgs, ... }:

with pkgs; [
  # Core tools
  ripgrep # A utility that combines the usability of The Silver Searcher with the raw speed of grep
  tldr # Simplified and community-driven man pages
  lsd # The next gen ls command
  lfs # Get infomation on yoour mounted disks
  tree # A recursive directory listing program that produces a depth indented listing of files
  unzip # A utility for unpacking zip files
  fd # A simple, fast and user-friendly alternative to find
  jq # A lightweight and flexible command-line JSON processor

  # GUI tools
  wl-clipboard # Command-line copy/paste utilities for Wayland
  wl-clip-persist # Keep Wayland clipboard even after programs close
  cliphist # Wayland clipboard manager

  # Fonts
  font-awesome # Iconic font and CSS toolkit
  noto-fonts-color-emoji # Google Noto emoji font
  material-icons # Material Design icons

  # Productivity tools
  obsidian # A powerful knowledge base that works on top of a local folder of plain text Markdown files

  # Messaging
  telegram-desktop # Telegram desktop client

  # Security tools
  _1password-gui # 1Password password manager GUI

  # Browser
  firefox-wayland # Firefox browser with Wayland support
  google-chrome # Google Chrome browser

  grim # Screenshot utility
  swappy # Screenshot utility
  slurp # Screenshot utility

  # bin
  (import ../bin/capture-screen-selection.nix { inherit pkgs; })
]
