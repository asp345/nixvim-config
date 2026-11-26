{ ... }:
{
  plugins.toggleterm = {
    enable = true;
    settings = {
      open_mapping = "[[<c-t>]]";
      autochdir = true;
      shell = "zsh";
    };
  };
  keymaps = [
    {
      key = "<C-t>";
      mode = [
        "n"
        "t"
      ];
      action = "<cmd>ToggleTerm<CR>";
      options = {
        silent = true;
        noremap = true;
      };
    }
  ];
}
