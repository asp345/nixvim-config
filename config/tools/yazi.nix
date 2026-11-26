{
  plugins.yazi = {
    enable = true;
    settings = {
      open_for_directories = true;
      enable_mouse_support = true;
    };
  };
  keymaps = [
    {
      key = "<leader>fm";
      mode = [ "n" ];
      action = "<cmd>Yazi<CR>";
    }
  ];
}
