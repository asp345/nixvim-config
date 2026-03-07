{ pkgs, ... }:
{
  clipboard = {
    register = "unnamed";

    providers.wl-copy.enable = pkgs.stdenv.hostPlatform.isLinux;
  };

}
