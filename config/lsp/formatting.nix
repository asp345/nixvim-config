{ pkgs, ... }:
{
  extraPackagesAfter = with pkgs; [
    black
    isort
    nixfmt
    mdformat
    yamlfmt
    stylua
    rustfmt
    shellcheck
    shfmt
    shellharden
  ];

  plugins.conform-nvim = {
    enable = true;
    settings.formatters_by_ft = {
      html = [ "biome" ];
      css = [ "biome" ];
      javascript = [ "biome" ];
      javascriptreact = [ "biome" ];
      typescript = [ "biome" ];
      typescriptreact = [ "biome" ];
      python = [
        "black"
        "isort"
      ];
      rust = [ "rustfmt" ];
      cpp = [ "clang_format" ];
      c = [ "clang_format" ];
      lua = [ "stylua" ];
      nix = [ "nixfmt" ];
      markdown = [ "mdformat" ];
      yaml = [ "yamlfmt" ];
      terraform = [ "terraform_fmt" ];
      bash = [
        "shellcheck"
        "shellharden"
        "shfmt"
      ];
      json = [ "biome" ];
      jsonc = [ "biome" ];
      "_" = [ "trim_whitespace" ];
    };
  };
}
