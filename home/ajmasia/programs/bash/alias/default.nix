import ./git.nix //

{
  c = "clear";
  cat = "bat";
  ls = "eza";

  nvm = "nvim-manager $@";
  nvr = "NVIM_APPNAME=nvim-rolling nvim $@";
}
