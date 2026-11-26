{ lib, pkgs, ... }:
{
  imports = [
    ./blink-cmp.nix
    ./ts-comments.nix
    ./treesj.nix
  ];

  globals.mapleader = " ";
  opts = {
    number = true;
    background = "dark";
    relativenumber = true;
    cmdheight = 0;
    expandtab = true;
    softtabstop = 2;
    shiftwidth = 2;
    tabstop = 2;
    wrap = false;
    swapfile = false;
    backup = false;
    undofile = true;
    hlsearch = false;
    incsearch = true;
    termguicolors = true;
    scrolloff = 4;
    signcolumn = "yes";
    updatetime = 50;
    foldlevelstart = 99;
  };
  extraConfigLua = ''
    vim.opt.shortmess:append("I")
  '';

  clipboard.register = "unnamed";
  extraPackagesAfter = lib.optional pkgs.stdenv.hostPlatform.isLinux pkgs.wl-clipboard;

  plugins = {
    nvim-autopairs = {
      enable = true;
      settings.disable_filetype = [
        "TelescopePrompt"
        "vim"
      ];
    };
    treesitter = {
      enable = true;
      highlight.enable = true;
      settings.indent.enable = true;
    };
  };

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
