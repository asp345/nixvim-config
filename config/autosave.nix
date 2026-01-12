{
  plugins.auto-save = {
    enable = false;
    autoLoad = true;
    #testsave
  };
  keymaps = [
    {
      key = "<C-s>";
      mode = [ "n" ];
      action = "<cmd>ASToggle<CR>";
    }
  ];
}
