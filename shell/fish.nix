{ config, pkgs, ... }:
{
  programs.fish = {
      enable = true;
      shellAliases = {
        c = "clear";
      };
  };
}
