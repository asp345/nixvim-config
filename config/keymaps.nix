{ ... }:
{
  keymaps = [
    {
      key = "<leader>p";
      mode = [ "n" ];
      action = "<cmd>YankyRingHistory<CR>";
      options.desc = "Yank History";
    }
    {
      key = "<leader>qq";
      mode = [ "n" ];
      action = "<cmd>qa<CR>";
      options.desc = "Quit All";
    }
    {
      key = "<leader>cf";
      mode = [
        "n"
        "v"
      ];
      action = "<cmd>lua require('conform').format({ async = true, lsp_fallback = true })<CR>";
      options.desc = "Format buffer";
    }
  ];
}
