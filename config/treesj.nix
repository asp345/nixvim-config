{
  plugins.treesj = {
    enable = true;
    autoLoad = true;
  };
  keymaps = [
    {
      key = "<leader>cm";
      mode = [
        "n"
      ];
      action = "<cmd>TSJToggle<CR>";
      options.desc = "Toggle Split/Join";
    }
    {
      key = "<leader>cs";
      mode = [
        "n"
      ];
      action = "<cmd>TSJSplit<CR>";
      options.desc = "Split Node";
    }
    {
      key = "<leader>cj";
      mode = [
        "n"
      ];
      action = "<cmd>TSJJoin<CR>";
      options.desc = "Join Node";
    }
  ];
}
