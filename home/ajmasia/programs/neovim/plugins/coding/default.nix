{ ... }:
let
  cmp-icons = builtins.readFile ./cmp_icons.lua;
in

{
  programs.nixvim = {
    plugins = {
      nvim-autopairs.enable = true;

      nvim-colorizer = {
        enable = true;

        userDefaultOptions.names = false;
      };

      surround.enable = true;

      comment-nvim.enable = true;

      copilot-lua = {
        enable = false;

        suggestion = {
          enabled = false;
        };

        panel = {
          enabled = false;
        };
      };

      # completion
      cmp-buffer = {
        enable = true;
      };

      cmp-emoji = {
        enable = true;
      };

      cmp-nvim-lsp = {
        enable = true;
      };

      cmp-path = {
        enable = true;
      };

      cmp_luasnip = {
        enable = true;
      };

      nvim-cmp = {
        enable = true;

        sources = [
          { name = "nvim_lsp"; }
          { name = "luasnip"; }
          { name = "buffer"; }
          { name = "nvim_lua"; }
          { name = "path"; }
          # { name = "copilot"; }
        ];

        formatting = {
          fields = [ "abbr" "kind" "menu" ];
          format = '' ${cmp-icons} '';
        };

        snippet = { };

        window = {
          completion = {
            scrollbar = false;
            border = "rounded";
          };

          documentation = {
            border = "rounded";
          };
        };
        mappingPresets = [ "insert" ];
        mapping = {
          "<CR>" = "cmp.mapping.confirm({ select = true })";
        };

        experimental = {
          ghost_text = {
            hl_group = "CmpGhostText";
          };
        };
      };


    };
  };

  imports = [
    ./treesitter.nix
  ];
}
