{
  plugins.zen-mode = {
    enable = true;
    settings = {
      window = {
        backdrop = 0.95;
        width = 0.8;
        height = 1;
        options.signcolumn = "no";
      };
      plugins = {
        options = {
          enabled = true;
          ruler = false;
          showcmd = false;
        };
        twilight.enabled = false;
        gitsigns.enabled = true;
      };
    };
  };
  keymaps = [
    {
      key = "<leader>zm";
      mode = [ "n" ];
      action = "<cmd>ZenMode<CR>";
    }
  ];
}
