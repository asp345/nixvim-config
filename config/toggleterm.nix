{ pkgs, ... }:
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
      auto_scroll = true;
      close_on_exit = true;
      insert_mappings = true;
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
    # New keymap for horizontal split terminal
    {
      key = "<leader>th";
      mode = [
        "n"
        "t"
      ];
      action = "<cmd>ToggleTerm direction=horizontal size=15<CR>";
      options = {
        silent = true;
        noremap = true;
      };
    }
  ];
}

