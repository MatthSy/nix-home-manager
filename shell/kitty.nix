{ config, pkgs, lib, ... }:
{
  programs.kitty = {
    enable = true;
    enableGitIntegration = true;
    font.name = lib.mkForce "jetbrains-mono";
    font.size = lib.mkForce 16;
    shellIntegration.enableZshIntegration = true;
    settings = {
      shell = "fish";
      confirm_os_window_close = 2;
    };
  };
}
