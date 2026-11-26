{
  imports = [
    ./aerial.nix
    ./bufferline.nix
    ./snacks.nix
    ./zen-mode.nix
  ];

  colorschemes.moonfly.enable = true;
  plugins = {
    lualine.enable = true;
    noice = {
      enable = true;
      settings.messages.enabled = false;
    };
    web-devicons = {
      enable = true;
      settings.strict = true;
    };
    which-key.enable = true;
  };
}
