{ ... }: {
  programs.nixvim = {
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    keymaps = [
      # telescope
      {
        action = "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>";
        key = "<leader>,";
        options = {
          desc = "Switch buffer";
        };
      }

      # windows
      {
        action = "<C-W>s";
        key = "<leader>-";
        options = {
          desc = "Split window below";
          remap = true;
        };
      }

      {
        action = "<C-W>s";
        key = "<leader>w-";
        options = {
          desc = "Split window below";
          remap = true;
        };
      }

      {
        action = "<C-W>v";
        key = "<leader>|";
        options = {
          desc = "Split window right";
          remap = true;
        };
      }

      {
        action = "<C-W>v";
        key = "<leader>w|";
        options = {
          desc = "Split window right";
          remap = true;
        };
      }

      {
        action = "<C-W>c";
        key = "<leader>wd";
        options = {
          desc = "Delete window";
          remap = true;
        };
      }

      # buffers
      {
        action = "<cmd>e #<cr>";
        key = "<leader>bb";
        options = {
          desc = "Switch to Other Buffer";
        };
        mode = "n";
      }

      {
        action = "<cmd>lua require('neo-tree.command').execute({ source = 'buffers', toggle = true })<cr>";
        key = "<leader>be";
        options = {
          desc = "Buffer explorer";
        };
      }
    ];
  };
}
