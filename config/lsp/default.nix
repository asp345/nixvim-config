{ lib, pkgs, ... }:
{
  imports = [
    ./formatting.nix
    ./debugging.nix
  ];

  plugins = {
    lsp-lines.enable = true;
    helm.enable = true;
    lsp = {
      enable = true;
      inlayHints = true;
      servers =
        lib.mapAttrs
          (
            _: server:
            {
              enable = true;
              packageFallback = true;
            }
            // server
          )
          {
            bashls = { };
            biome = { };
            clangd = { };
            gopls = { };
            jsonls = { };
            lua_ls = { };
            marksman = { };
            nixd = { };
            pyright = { };
            ruff = { };
            rust_analyzer = {
              installCargo = true;
              installRustc = true;
              installRustfmt = false;
            };
            sqls = { };
            taplo = { };
            terraformls = { };
            texlab = { };
            tsc = { };
            helm_ls.extraOptions.settings.helm_ls.yamlls.path = "yaml-language-server";
            yamlls.extraOptions.settings.yaml.schemas = {
              kubernetes = "'*.yaml";
              "http://json.schemastore.org/github-workflow" = ".github/workflows/*";
              "http://json.schemastore.org/github-action" = ".github/action.{yml,yaml}";
              "http://json.schemastore.org/ansible-stable-2.9" = "roles/tasks/*.{yml,yaml}";
              "http://json.schemastore.org/kustomization" = "kustomization.{yml,yaml}";
              "http://json.schemastore.org/ansible-playbook" = "*play*.{yml,yaml}";
              "http://json.schemastore.org/chart" = "Chart.{yml,yaml}";
              "https://json.schemastore.org/dependabot-v2" = ".github/dependabot.{yml,yaml}";
              "https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json" =
                "*docker-compose*.{yml,yaml}";
              "https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json" =
                "*flow*.{yml,yaml}";
            };
          };

      keymaps = {
        silent = true;
        diagnostic = {
          "<leader>cd" = {
            action = "open_float";
            desc = "Line Diagnostics";
          };
          "[d" = {
            action = "goto_next";
            desc = "Next Diagnostic";
          };
          "]d" = {
            action = "goto_prev";
            desc = "Previous Diagnostic";
          };
        };
      };
    };
  };
  extraPlugins = with pkgs.vimPlugins; [
    ansible-vim
  ];

  extraConfigLua = ''
    vim.diagnostic.config{
      float = { border = "rounded" }
    }

    require('lspconfig.ui.windows').default_options = {
      border = "rounded"
    }
  '';
}
