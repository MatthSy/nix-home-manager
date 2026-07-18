{ config, pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    enableGitIntegration = true;
    font.name = "programs.kitty.font.name";
    font.size = 16;
    shellIntegration.enableZshIntegration = true;
    settings = {
      shell = "fish";
      confirm_os_window_close = 2;
    };
  };
}
