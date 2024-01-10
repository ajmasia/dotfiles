{
  programs.nixvim = {
    plugins.telescope = {
      enable = true;

      keymaps = {
        # Find files using Telescope command-line sugar.
        "<leader>/" = {
          action = "live_grep";
          desc = "Grep (root)";
        };

        "<leader><space>" = {
          action = "find_files";
          desc = "Files (root)";
        };

        "<leader>ff" = {
          action = "find_files";
          desc = "Files (root)";
        };

        "<leader>sg" = {
          action = "live_grep";
          desc = "Grep (root)";
        };

        "<leader>fb" = {
          action = "buffers";
          desc = "Buffers";
        };

        "<leader>sd" = {
          action = "diagnostics";
          desc = "Diagnostic";
        };

        "<leader>fr" = {
          action = "oldfiles";
          desc = "Recent Files (root)";
        };
      };

      keymapsSilent = true;

      defaults = {
        file_ignore_patterns = [
          "^.git/"
          "^.mypy_cache/"
          "^__pycache__/"
          "^output/"
          "^data/"
          "%.ipynb"
        ];
        set_env.COLORTERM = "truecolor";
      };

      extensions.fzf-native.enable = true;
    };
  };
}
