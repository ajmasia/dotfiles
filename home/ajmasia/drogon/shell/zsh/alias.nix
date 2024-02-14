{
  # shell commands
  ls = "exa";
  lvim = "~/.local/bin/lvim";

  # system-manager
  scs = "darwin-rebuild switch --flake ~/.dotfiles#viserion";
  ed = "nix run github:ajmasia/nvim-nix";
  npv = "nix-instantiate --eval -E '(import <nixpkgs> {}).lib.version'";
}
