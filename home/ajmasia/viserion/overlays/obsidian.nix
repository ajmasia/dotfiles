# needed for las obsidian version using electron 25
# https://github.com/NixOS/nixpkgs/issues/263764#issuecomment-1782979513
self: super: {
  obsidian-wayland = super.obsidian.override { electron = self.electron_24; };
}

