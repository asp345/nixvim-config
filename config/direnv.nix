{ pkgs, ... }:
{
  extraPackages = with pkgs; [
    direnv
  ];

  plugins.direnv = {
    enable = true;
  };
}
