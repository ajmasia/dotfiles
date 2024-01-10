{
  config,
  pkgs,
  ...
}: {
  programs.nixvim = {
    plugins = {
      nix.enable = true;
      hmts.enable = true;
      nix-develop.enable = true;

      # conform-nvim = {
      #   formattersByFt = {
      #     nix = [ "alejandra" ];
      #   };
      #   formatters = {
      #     alejandra = {
      #       command = "${pkgs.alejandra}/bin/alejandra";
      #     };
      #   };
      # };

      lint = {
        lintersByFt = {
          nix = ["statix"];
        };
        linters = {
          statix = {
            cmd = "${pkgs.statix}/bin/statix";
          };
        };
      };

      lsp.servers.rnix-lsp = {
        enable = true;
      };

      treesitter = {
        grammarPackages = with config.programs.nixvim.plugins.treesitter.package.builtGrammars; [
          nix
        ];
      };
    };

    extraConfigVim = ''
      au BufRead,BufNewFile flake.lock setf json
    '';
  };
}
