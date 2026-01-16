{
  pkgs,
  lib,
  ...
}:
{
  plugins.dap = {
    enable = true;

    adapters = {
      executables = {
        lldb = {
          command = "${pkgs.lldb}/bin/lldb-dap";
        };
        debugpy = {
          command = "${pkgs.python3Packages.debugpy}/bin/python";
          args = [
            "-m"
            "debugpy.adapter"
          ];
        };
      };
      servers = {
        codelldb = {
          port = 13000;
          executable = {
            command = "${pkgs.vscode-extensions.vadimcn.vscode-lldb}/share/vscode/extensions/vadimcn.vscode-lldb/adapter/codelldb";
            args = [
              "--port"
              "13000"
            ];
          };
        };
      };
    };

    configurations = {
      cpp = [
        {
          name = "Launch (LLDB)";
          type = "lldb";
          request = "launch";
          program.__raw = ''
            function()
              return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end
          '';
          cwd = "\${workspaceFolder}";
          stopOnEntry = false;
        }
        {
          name = "Launch (CodeLLDB)";
          type = "codelldb";
          request = "launch";
          program.__raw = ''
            function()
              return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end
          '';
          cwd = "\${workspaceFolder}";
          stopOnEntry = false;
        }
      ];
      c = [
        {
          name = "Launch (LLDB)";
          type = "lldb";
          request = "launch";
          program.__raw = ''
            function()
              return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end
          '';
          cwd = "\${workspaceFolder}";
          stopOnEntry = false;
        }
      ];
      rust = [
        {
          name = "Launch (CodeLLDB)";
          type = "codelldb";
          request = "launch";
          program.__raw = ''
            function()
              return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
            end
          '';
          cwd = "\${workspaceFolder}";
          stopOnEntry = false;
        }
      ];
      python = [
        {
          name = "Launch file";
          type = "debugpy";
          request = "launch";
          program = "\${file}";
          pythonPath.__raw = ''
            function()
              local venv = os.getenv("VIRTUAL_ENV")
              if venv then
                return venv .. "/bin/python"
              else
                return "${pkgs.python3}/bin/python"
              end
            end
          '';
        }
        {
          name = "Launch file with arguments";
          type = "debugpy";
          request = "launch";
          program = "\${file}";
          args.__raw = ''
            function()
              local args_string = vim.fn.input('Arguments: ')
              return vim.split(args_string, " +")
            end
          '';
          pythonPath.__raw = ''
            function()
              local venv = os.getenv("VIRTUAL_ENV")
              if venv then
                return venv .. "/bin/python"
              else
                return "${pkgs.python3}/bin/python"
              end
            end
          '';
        }
      ];
    };
  };

  plugins.dap-ui = {
    enable = true;
  };

  plugins.dap-virtual-text = {
    enable = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>db";
      action = "<cmd>DapToggleBreakpoint<cr>";
      options.desc = "Toggle breakpoint";
    }
    {
      mode = "n";
      key = "<leader>dc";
      action = "<cmd>DapContinue<cr>";
      options.desc = "Continue";
    }
    {
      mode = "n";
      key = "<leader>di";
      action = "<cmd>DapStepInto<cr>";
      options.desc = "Step into";
    }
    {
      mode = "n";
      key = "<leader>do";
      action = "<cmd>DapStepOver<cr>";
      options.desc = "Step over";
    }
    {
      mode = "n";
      key = "<leader>dO";
      action = "<cmd>DapStepOut<cr>";
      options.desc = "Step out";
    }
    {
      mode = "n";
      key = "<leader>dr";
      action = "<cmd>DapToggleRepl<cr>";
      options.desc = "Toggle REPL";
    }
    {
      mode = "n";
      key = "<leader>dt";
      action = "<cmd>DapTerminate<cr>";
      options.desc = "Terminate";
    }
    {
      mode = "n";
      key = "<leader>du";
      action.__raw = "function() require('dapui').toggle() end";
      options.desc = "Toggle DAP UI";
    }
  ];
}
