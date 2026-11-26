{
  plugins.zen-mode = {
    enable = true;
    settings.plugins = {
      twilight.enabled = false;
      gitsigns.enabled = true;
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
