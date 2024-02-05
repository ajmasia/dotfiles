{ pkgs, ... }:

with pkgs; [
  # Core tools
  ripgrep # A utility that combines the usability of The Silver Searcher with the raw speed of grep
  tldr # Simplified and community-driven man pages
  eza # A modern replacement for ls written in Rust
  lfs # Get infomation on yoour mounted disks
  tree # A recursive directory listing program that produces a depth indented listing of files
  unzip # A utility for unpacking zip files
  fd # A simple, fast and user-friendly alternative to find

  # GUI tools
  wl-clipboard # Command-line copy/paste utilities for Wayland
  wl-clip-persist # Keep Wayland clipboard even after programs close
  cliphist # Wayland clipboard manager

  # Messaging
  telegram-desktop # Telegram desktop client

  # Security tools
  _1password-gui # 1Password password manager GUI

  # Browser
  firefox-wayland # Firefox browser with Wayland support
  google-chrome # Google Chrome browser
]