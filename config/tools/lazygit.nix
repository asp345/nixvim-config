{ ... }:
{
  plugins.lazygit = {
    enable = true;
    settings.use_neovim_remote = 1;
  };
  keymaps = [
    {
      key = "<leader>gg";
      mode = [ "n" ];
      action = "<cmd>LazyGit<CR>";
      options = {
        silent = true;
        noremap = true;
      };
    }
  ];
}
