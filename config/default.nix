{ pkgs, ... }:
{
  imports = [
    ./keymaps.nix
    ./treesitter.nix
    ./toggleterm.nix
    ./themes.nix
    ./direnv.nix
    ./lazygit.nix
    ./bufferline.nix
    ./lualine.nix
    ./snacks.nix
    ./gitsigns.nix
    ./whichkey.nix
    ./autopairs.nix
    ./blink-cmp.nix
    ./tmux-navigator.nix
    ./smear-cursor.nix
    ./lsp/conform.nix
    ./lsp/lsp.nix
    ./lsp/dap.nix
    ./nix-develop.nix
    ./aerial.nix
    ./notify.nix
    ./navic.nix
    ./noice.nix
    ./neoscroll.nix
    ./zen-mode.nix
    ./yazi.nix
    ./kulala.nix
    ./wtf.nix
    # ./windsurf-vim.nix if you want to use this plugin uncomment it and run nix develop --impure
    ./ts-comments.nix
    ./timerly.nix
    ./treesj.nix
    ./web-devicons.nix
    ./clipboard.nix
  ];

  config = {
    extraConfigLua = ''
      vim.opt.shortmess:append("I")
    '';

    globals = {
      mapleader = " ";
    };

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
      swapfile = false; # Undotree
      backup = false; # Undotree
      undofile = true;
      hlsearch = false;
      incsearch = true;
      termguicolors = true;
      scrolloff = 4;
      signcolumn = "yes";
      updatetime = 50;
      foldlevelstart = 99;
    };
    extraPackages = with pkgs; [
      # base
      fzf
      ripgrep
      fd
      # Formatters
      stylua # Lua formatter
      nixfmt # Nix formatter
      # Linters
      golangci-lint # Go linter
      shellcheck # Shell script linter
      eslint_d # JavaScript/TypeScript linter
      # Debuggers
      asm-lsp # Assembly LSP
      delve # Go debugger
      gcc
    ];
  };
}
