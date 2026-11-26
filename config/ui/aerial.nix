{
  plugins.aerial = {
    enable = true;
    settings = {
      attach_mode = "global";
      backends = {
        _ = [
          "treesitter"
          "lsp"
          "markdown"
          "man"
        ];
        nix = [
          "lsp"
        ];
      };
      disable_max_lines = 5000;
      filter_kind.nix = false;
      highlight_on_hover = true;
      ignore = {
        filetypes = [
          "gomod"
        ];
      };
    };
  };
  keymaps = [
    {
      key = "<leader>o";
      mode = [ "n" ];
      action = "<cmd>AerialToggle<CR>";
    }
  ];
}
