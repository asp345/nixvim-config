{ lib, pkgs, ... }:
{
  clipboard = {
    register = "unnamed";
  };

  extraPackagesAfter = lib.optional pkgs.stdenv.hostPlatform.isLinux pkgs.wl-clipboard;
}
