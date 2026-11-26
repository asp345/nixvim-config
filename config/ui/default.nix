{
  imports = [
    ./aerial.nix
    ./bufferline.nix
    ./lualine.nix
    ./noice.nix
    ./snacks.nix
    ./zen-mode.nix
  ];

  colorschemes.moonfly = {
    enable = true;
    settings.Transparent = true;
  };
  plugins = {
    neoscroll.enable = true;
    smear-cursor = {
      enable = true;
      settings = {
        distance_stop_animating = 0.5;
        hide_target_hack = false;
        stiffness = 0.8;
        trailing_stiffness = 0.5;
      };
    };
    timerly = {
      enable = true;
      settings.minutes = [
        5
        10
        15
        20
        25
        30
      ];
    };
    web-devicons = {
      enable = true;
      settings.strict = true;
    };
    which-key.enable = true;
  };
}
