{ pkgs, ... }: 

let
  selectedNerdFonts = pkgs.nerdfonts.override {
    fonts = [
      "FiraCode"
      "Hack"
      "NerdFontsSymbolsOnly"
      "CascadiaCode"
      "JetBrainsMono"
      "Noto"
      "SourceCodePro"
      "Ubuntu"
    ];
  };

in
  with pkgs; [
    # From overlays

    # Core tools
    ripgrep # A utility that combines the usability of The Silver Searcher with the raw speed of grep
    tldr # Simplified and community-driven man pages
    eza # A modern replacement for ls written in Rust
    lfs # Get infomation on yoour mounted disks
    tree # A recursive directory listing program that produces a depth indented listing of files
    unzip # A utility for unpacking zip files

    # bullshit apps

    # System fonts
    selectedNerdFonts # My custom Nerd Fonts
    font-awesome # The internet famous font and CSS toolkit

    # Code builders, compilers and interpreters

    # Productivity tools

    # Multimedia
    helvum # A GTK patchbay for pipewire


    # Messaging

    # Dev tools

    # Security tools
    _1password-gui # Password manager and secure wallet
    _1password # CLI Password manager and secure wallet

    # Browsers
    firefox # Web brouser

    # UI
    wl-clipboard # Command-line copy/paste utilities for Wayland
    wl-clip-persist # Keep Wayland clipboard even after programs close
    cliphist # Wayland clipboard manager
    swww # Efficient animated wallpaper daemon for wayland, controlled at runtime
    libnotify # A library that sends desktop notifications to a notification daemon

    # Code builders, compilers and interpreters
    gcc # GNU compiler collection tools
    cmake # Cross-platform, open-source build system generatorpa
    gnumake # Tool to control the generation of non-source files from sources
    cargo # Rust builder & module manager
    nodejs_20 # Node.js interpreter

    # Dev tools
    lazygit # Simple terminal UI for git commands

    # Security and privacy

    # Editors

    # LSP and Lua tools
    stylua # An opinionated Lua code formatter
    sumneko-lua-language-server # A full-featured Lua language server
    luajitPackages.luarocks # A package manager for Lua modules
  ]
