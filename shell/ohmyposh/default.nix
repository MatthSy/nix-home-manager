{ config, pkgs, ... }:

{
  programs.oh-my-posh = {
    enable = true;
    enableFishIntegration = true;
    enableZshIntegration = true;
    configFile = ./config/config.toml;
  };
}
