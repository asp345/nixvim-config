{
  pkgs,
  ...
}:
{
  plugins = {
    lsp-lines = {
      enable = true;
    };
    helm = {
      enable = true;
    };
    lsp = {
      enable = true;
      inlayHints = true;
      servers = {
        clangd = {
          enable = true;
          packageFallback = true;
        };
        rust_analyzer = {
          enable = true;
          packageFallback = true;
          installCargo = true;
          installRustc = true;
          installRustfmt = false;
        };
        # superhtml = {
        #   enable = true;
        # };
        sqls = {
          enable = true;
          packageFallback = true;
        };
        lua_ls = {
          enable = true;
          packageFallback = true;
        };
        nil_ls = {
          enable = true;
          packageFallback = true;
          settings = {
            nix.flake.autoArchive = true;
          };
        };
        ts_ls = {
          enable = true;
          packageFallback = true;
        };
        marksman = {
          enable = true;
          packageFallback = true;
        };
        pyright = {
          enable = true;
          packageFallback = true;
        };
        ruff = {
          enable = true;
          packageFallback = true;
        };
        gopls = {
          enable = true;
          packageFallback = true;
        };
        terraformls = {
          enable = true;
          packageFallback = true;
        };
        jsonls = {
          enable = true;
          packageFallback = true;
        };
        helm_ls = {
          enable = true;
          packageFallback = true;
          extraOptions = {
            settings = {
              "helm_ls" = {
                yamlls = {
                  path = "yaml-language-server";
                };
              };
            };
          };
        };
        yamlls = {
          enable = true;
          packageFallback = true;
          extraOptions = {
            settings = {
              yaml = {
                schemas = {
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
            };
          };
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
    local _border = "rounded"

    vim.diagnostic.config{
      float = { border = _border }
    }

    require('lspconfig.ui.windows').default_options = {
      border = _border
    }
  '';
}
