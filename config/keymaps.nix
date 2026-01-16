{ pkgs, ... }:
{
  keymaps = [
    {
      key = "<leader>p";
      mode = [ "n" ];
      action = "<cmd>YankyRingHistory<CR>";
    }
    {
      key = "<leader>qq";
      mode = [ "n" ];
      action = "<cmd>qa<CR>";
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
