{ ... }:
{
  plugins.lualine = {
    enable = true;
    settings = {
      options = {
        globalstatus = true;
        extensions = [
          "fzf"
        ];
        disabledFiletypes = {
          statusline = [
            "startup"
            "alpha"
          ];
        };
        theme = "auto";
      };
      sections = {
        lualine_a = [
          {
            __unkeyed-1 = "mode";
          }
        ];
        lualine_b = [
          {
            __unkeyed-1 = "branch";
            icon = "";
          }
          {
            __unkeyed-1 = "diff";
            symbols = {
              added = " ";
              modified = " ";
              removed = " ";
            };
          }
        ];
        lualine_c = [
          {
            __unkeyed-1 = "diagnostics";
            sources = [ "nvim_lsp" ];
            symbols = {
              error = " ";
              warn = " ";
              info = " ";
              hint = "󰝶 ";
            };
          }
          {
            __unkeyed-1.__raw = ''
              function()
                local ok, navic = pcall(require, "nvim-navic")
                if not ok or not navic.is_available() then
                  return ""
                end

                return navic.get_location()
              end
            '';
            cond.__raw = ''
              function()
                local ok, navic = pcall(require, "nvim-navic")
                return ok and navic.is_available()
              end
            '';
          }
        ];
        lualine_x = [
          {
            __unkeyed-1 = "filetype";
            icon_only = true;
            separator = "";
            padding = {
              left = 1;
              right = 0;
            };
          }
          {
            __unkeyed-1 = "filename";
            path = 1;
          }
        ];
        lualine_y = [
          {
            __unkeyed-1 = "progress";
          }
        ];
        lualine_z = [
          {
            __unkeyed-1 = "location";
          }
        ];
      };
    };
  };
}
