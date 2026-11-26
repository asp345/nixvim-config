{ ... }:
{
  plugins.toggleterm = {
    enable = true;
    settings = {
      direction = "float";
      float_opts = {
        border = "curved";
        height = 30;
        width = 130;
      };
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
