{
  pkgs,
  ...
}:
{
  config = {
    extraPackagesAfter = with pkgs; [
      black
      isort
      nixfmt
      mdformat
      yamlfmt
      stylua
      rustfmt
      clang-tools
      shellcheck
      shfmt
      shellharden
    ];

    extraConfigLuaPre =
      # lua
      ''
          local slow_format_filetypes = {}
          vim.g.disable_autoformat = true

          vim.api.nvim_create_user_command("FormatDisable", function(args)
             if args.bang then
            -- FormatDisable! will disable formatting just for this buffer
            vim.b.disable_autoformat = true
          else
            vim.g.disable_autoformat = true
          end
        end, {
          desc = "Disable autoformat-on-save",
          bang = true,
        })
        vim.api.nvim_create_user_command("FormatEnable", function()
          vim.b.disable_autoformat = false
          vim.g.disable_autoformat = false
        end, {
          desc = "Re-enable autoformat-on-save",
        })
        vim.api.nvim_create_user_command("FormatToggle", function(args)
          if args.bang then
            -- Toggle formatting for current buffer
            vim.b.disable_autoformat = not vim.b.disable_autoformat
          else
            -- Toggle formatting globally
            vim.g.disable_autoformat = not vim.g.disable_autoformat
          end
        end, {
          desc = "Toggle autoformat-on-save",
          bang = true,
        })
      '';
    plugins.conform-nvim = {
      enable = true;
      settings = {
        format_on_save = ''
          function(bufnr)
            if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
              return
            end

            if slow_format_filetypes[vim.bo[bufnr].filetype] then
              return
            end

            local function on_format(err)
              if err and err:match("timeout$") then
                slow_format_filetypes[vim.bo[bufnr].filetype] = true
              end
            end

            return { timeout_ms = 200, lsp_format = "fallback" }, on_format
           end
        '';

        format_after_save = ''
          function(bufnr)
            if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
              return
            end

            if not slow_format_filetypes[vim.bo[bufnr].filetype] then
              return
            end

            return { lsp_format = "fallback" }
          end
        '';
        notify_on_error = true;
        formatters_by_ft = {
          html = [ "biome" ];
          css = [ "biome" ];
          javascript = [ "biome" ];
          javascriptreact = [ "biome" ];
          typescript = [ "biome" ];
          typescriptreact = [ "biome" ];
          python = [
            "black"
            "isort"
          ];
          rust = [ "rustfmt" ];
          cpp = [ "clang_format" ];
          c = [ "clang_format" ];
          lua = [ "stylua" ];
          nix = [ "nixfmt" ];
          markdown = [ "mdformat" ];
          yaml = [ "yamlfmt" ];
          terraform = [ "terraform_fmt" ];
          bash = [
            "shellcheck"
            "shellharden"
            "shfmt"
          ];
          json = [ "biome" ];
          jsonc = [ "biome" ];
          "_" = [ "trim_whitespace" ];
        };
      };
    };
  };
}
