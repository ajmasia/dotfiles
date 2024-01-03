import ./git.nix //

{
  c = "clear";
  cat = "bat";
  ls = "eza";

  # Nvim Manager
  nvm = "nvim-manager $@";
  nvs = "nvim-manager sel $@";
  nvd = "nvim-manager def $@";
  nvn = "nvim-manager sys $@";
  ed = "nvim-manager def $@";
}
