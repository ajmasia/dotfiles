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

  # Messaging
  telegram-desktop # Telegram desktop client

  # Security tools
  _1password-gui # 1Password password manager GUI
]
