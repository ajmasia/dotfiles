{ pkgs, ... }:

let
  userConfig = (import ../../config.nix);

  gitConfig = {
    core = {
      excludesfile = "${userConfig.homeDirectory}/.gitignore";
      editor = "vim";
    };

    init = {
      defaultBranch = "main";
    };

    ui = {
      color = true;
    };
  };
in
{
  home.packages = with pkgs.gitAndTools; [
    diff-so-fancy # git diff with colors
    hub # github command-line client
    tig # diff and commit view
  ];

  programs.git = {
    enable = true;

    extraConfig = gitConfig;
    userEmail = userConfig.gitEmail;
    userName = userConfig.userDescription;

    ignores = [
      ".dir-locals.el"
      ".projectile"
      "TAGS"
      ".tern-project"
      "tsserver.log"
      "ti-.*.log"
      ".log"
    ];
  };
}
