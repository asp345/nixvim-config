{ ... }:
{
  keymaps = [
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
      action = "<cmd>lua require('conform').format({ async = true, lsp_format = 'fallback' })<CR>";
      options.desc = "Format buffer";
    }
  ];
}
