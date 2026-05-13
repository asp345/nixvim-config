{
  ...
}:
{
  plugins.snacks = {
    enable = true;
    autoLoad = true;
    settings = {
      notifier = {
        enabled = false;
        style = "compact";
        top_down = false;
      };
      dashboard = {
        enabled = false;
      };
    };
  };
  keymaps = [
    {
      key = "<leader><space>";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.smart()<CR>";
      options.desc = "Smart Find Files";
    }
    {
      key = "<leader>,";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.buffers()<CR>";
      options.desc = "Buffers";
    }
    {
      key = "<leader>/";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.grep()<CR>";
      options.desc = "Grep";
    }
    {
      key = "<leader>:";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.command_history()<CR>";
      options.desc = "Command History";
    }
    {
      key = "<leader>n";
      mode = [ "n" ];
      action = "<cmd>messages<CR>";
      options.desc = "Message History";
    }
    {
      key = "<leader>e";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.explorer()<CR>";
      options.desc = "Explorer";
    }
    {
      key = "<leader>fb";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.buffers()<CR>";
      options.desc = "Buffers";
    }
    {
      key = "<leader>ff";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.files()<CR>";
      options.desc = "Find Files";
    }
    {
      key = "<leader>fg";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.git_files()<CR>";
      options.desc = "Find Git Files";
    }
    {
      key = "<leader>fr";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.recent()<CR>";
      options.desc = "Recent Files";
    }
    {
      key = "<leader>gb";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.git_branches()<CR>";
      options.desc = "Git Branches";
    }
    {
      key = "<leader>gB";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.gitbrowse()<CR>";
      options.desc = "Git Browse";
    }
    {
      key = "<leader>gl";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.git_log()<CR>";
      options.desc = "Git Log";
    }
    {
      key = "<leader>gs";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.git_status()<CR>";
      options.desc = "Git Status";
    }
    {
      key = "<leader>uC";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.colorschemes()<CR>";
      options.desc = "Colorschemes";
    }
    {
      key = "<leader>sb";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.lines()<CR>";
      options.desc = "Buffer Lines";
    }
    {
      key = "<leader>sg";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.grep()<CR>";
      options.desc = "Grep";
    }
    {
      key = "<leader>sh";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.help()<CR>";
      options.desc = "Help";
    }
    {
      key = "<leader>sk";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.keymaps()<CR>";
      options.desc = "Keymaps";
    }
    {
      key = "<leader>sl";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.loclist()<CR>";
      options.desc = "Location List";
    }
    {
      key = "<leader>sq";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.qflist()<CR>";
      options.desc = "Quickfix List";
    }
    {
      key = "K";
      mode = [ "n" ];
      action = "<cmd>lua vim.lsp.buf.hover()<CR>";
      options.desc = "Hover";
    }
    {
      key = "<leader>ca";
      mode = [
        "n"
        "v"
      ];
      action = "<cmd>lua vim.lsp.buf.code_action()<CR>";
      options.desc = "Code Action";
    }
    {
      key = "<leader>cr";
      mode = [ "n" ];
      action = "<cmd>lua vim.lsp.buf.rename()<CR>";
      options.desc = "Rename";
    }
    {
      # Goto Definition
      key = "gd";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.lsp_definitions()<CR>";
      options.desc = "Goto Definition";
    }
    {
      # Goto Declaration
      key = "gD";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.lsp_declarations()<CR>";
      options.desc = "Goto Declaration";
    }
    {
      # References
      key = "gr";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.lsp_references()<CR>";
      options.desc = "References";
    }
    {
      # Goto Implementation
      key = "gI";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.lsp_implementations()<CR>";
      options.desc = "Goto Implementation";
    }
    {
      # Goto Type Definition (gy)
      key = "gy";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.lsp_type_definitions()<CR>";
      options.desc = "Goto Type Definition";
    }
    {
      # Incoming Calls
      key = "gai";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.lsp_incoming_calls()<CR>";
      options.desc = "Incoming Calls";
    }
    {
      # Outgoing Calls
      key = "gao";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.lsp_outgoing_calls()<CR>";
      options.desc = "Outgoing Calls";
    }

    # LSP Symbols
    {
      key = "<leader>ss";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.lsp_symbols()<CR>";
      options.desc = "Document Symbols";
    }
    {
      key = "<leader>sd";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.diagnostics()<CR>";
      options.desc = "Diagnostics";
    }
    {
      key = "<leader>sD";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.diagnostics_buffer()<CR>";
      options.desc = "Buffer Diagnostics";
    }

    # LSP Workspace Symbols
    {
      key = "<leader>sS";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.picker.lsp_workspace_symbols()<CR>";
      options.desc = "Workspace Symbols";
    }
    {
      key = "<leader>ud";
      mode = [ "n" ];
      action = "<cmd>lua Snacks.toggle.diagnostics():toggle()<CR>";
      options.desc = "Toggle Diagnostics";
    }
  ];
}
