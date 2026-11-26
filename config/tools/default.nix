{
  imports = [
    ./gitsigns.nix
    ./lazygit.nix
    ./kulala.nix
    ./toggleterm.nix
    ./yazi.nix
    ./wtf.nix
  ];

  plugins = {
    direnv.enable = true;
    nix-develop.enable = true;
    tmux-navigator.enable = true;
  };
  dependencies = {
    direnv.packageFallback = true;
    git.packageFallback = true;
    go.packageFallback = true;
    lazygit.packageFallback = true;
    yazi.packageFallback = true;
  };
  keymaps = [
    {
      key = "<leader>nd";
      mode = [ "n" ];
      action = "<cmd>NixDevelop<CR>";
    }
  ];
}
