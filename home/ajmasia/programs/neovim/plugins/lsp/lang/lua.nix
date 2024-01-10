{ config, pkgs, ... }:

{
  programs.nixvim = {
    # extraPlugins = with pkgs.vimPlugins; [ neodev-nvim neoconf-nvim ];
    #
    # extraConfigLuaPre = ''
    #   require('neoconf').setup()
    #   require('neodev').setup()
    # '';

    plugins = {
      lsp.servers.lua-ls.enable = true;
      lsp.servers.lua-ls.settings = {
        diagnostics.globals = [ ];
      };

      conform-nvim = {
        formattersByFt = {
          lua = [ "stylua" ];
        };

        formatters = {
          stylua = {
            command = "${pkgs.stylua}/bin/stylua";
          };
        };
      };

      treesitter = {
        grammarPackages = with config.programs.nixvim.plugins.treesitter.package.builtGrammars; [
          lua
          luadoc
          luap
        ];
      };
    };
  };
}
