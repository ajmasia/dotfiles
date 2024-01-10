{ config, pkgs, ... }:

{
  programs.nixvim = {
    plugins = {
      lsp.servers = {
        tsserver.enable = true;
        eslint.enable = true;
      };

      conform-nvim = {
        formattersByFt = {
          javascript = [ "prettierd" ];
          javascriptreact = [ "prettierd" ];
          typescript = [ "prettierd" ];
          typescriptreact = [ "prettierd" ];
        };

        formatters = {
          prettierd = {
            command = "${pkgs.prettierd}/bin/prettierd";
          };
        };
      };

      treesitter = {
        grammarPackages = with config.programs.nixvim.plugins.treesitter.package.builtGrammars; [
          javascript
        ];
      };
    };
  };
}
