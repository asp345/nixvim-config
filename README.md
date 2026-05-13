# Nixvim Flake Config

Personal Neovim configuration built with [nixvim](https://github.com/nix-community/nixvim) and packaged as a flake.

## Installation

Clone the repository and enter the dev shell:

```bash
git clone https://github.com/asp345/nixvim-config
cd nixvim-config
nix develop
```

Then start Neovim:

```bash
nvim
```

You can also install it directly with:

```bash
nix profile install github:asp345/nixvim-config
```

## What is included

The active configuration is split into small modules under `config/` and currently centers on:

- `snacks.nvim` for the picker, explorer, and LSP navigation pickers
- `blink.cmp` for completion
- `nvim-treesitter` for syntax highlighting and indentation
- `nvim-lspconfig` through nixvim's `plugins.lsp`
- `conform.nvim` for formatting
- `nvim-dap`, `dap-ui`, and `dap-virtual-text` for debugging
- `lualine`, `bufferline`, `gitsigns`, `which-key`, `noice`, and `notify` for UI

Check `config/default.nix` for enabled modules and `config/keymaps.nix` for shared keymaps.

## Notes

- `config/default.nix` is the entry point for enabled modules.
- Some files in `config/` are optional or experimental and are not imported by default.
- `nix flake check --no-build` should pass for the active configuration.
