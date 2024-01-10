{ ... }: {
  programs.nixvim = {
    plugins.lualine = {
      enable = true;

      theme = "auto";
      iconsEnabled = true;
      globalstatus = true;
      componentSeparators = {
        left = "";
        right = "";
      };
      sectionSeparators = {
        left = "";
        right = "";
      };
      disabledFiletypes = {
        statusline = [ "dashboard" "alpha" "starter" "neo-tree" ];
      };
      extensions = [ "neo-tree" ];

      sections = {
        lualine_a = [
          {
            name = "mode";
            extraConfig = { upper = true; };
          }
        ];

        lualine_b = [
          {
            name = "branch";
            icon = "";
          }
        ];

        lualine_c = [
          {
            name = "filename";
            extraConfig = {
              path = 0;
              fileStatus = true;
              symbols = {
                modified = " ";
                readonly = " ";
                unamed = " ";
                new = " ";
              };
            };
          }

          {
            name = "diff";
            extraConfig = {
              symbols = {
                added = " ";
                modified = " ";
                removed = " ";
              };
            };
          }
        ];

        lualine_x = [
          # {
          #   name.__raw =
          #     # lua
          #     ''
          #
          #       function(msg)
          #         msg = msg or "LSP Inactive"
          #
          #         local trim = function(s)
          #           return s:gsub("^%s*", ""):gsub("%s*$", "")
          #         end
          #
          #         local buf_clients = vim.lsp.buf_get_clients()
          #         local buf_client_names = {}
          #
          #         if next(buf_clients) == nil then
          #           if type(msg) == "boolean" or #msg == 0 then
          #             return "LS Inactive"
          #           end
          #
          #           return msg
          #         end
          #
          #         for _, client in pairs(buf_clients) do
          #           if client.name ~= "copilot" then
          #             local client_name = client.name
          #
          #             table.insert(buf_client_names, client_name)
          #           end
          #         end
          #
          #         local unique_client_names = vim.fn.uniq(buf_client_names)
          #         local language_servers = table.concat(unique_client_names, " ") .. " "
          #
          #         -- return "[" .. trim(language_servers) .. "]"
          #         return trim(language_servers)
          #       end
          #     '';
          #   color = {
          #     fg = "#7aa2f7";
          #     bg = "#3b4261";
          #     # gui = "bold";
          #   };
          #   separator = {
          #     left = "";
          #   };
          # }

          {
            name = "diagnostics";
            extraConfig = {
              symbols = {
                error = " ";
                warn = " ";
                info = " ";
                hint = " ";
              };
            };
          }

          {
            name = "filetype";
          }
        ];

        lualine_y = [
          {
            name = "progress";
            extraConfig = { upper = true; };
          }
        ];

        lualine_z = [
          {
            name = "location";
            extraConfig = { upper = true; };
          }
        ];
      };
    };
  };
}
