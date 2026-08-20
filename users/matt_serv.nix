{
  config,
  pkgs,
  ...
}: {
  home = {
    username = "matt_serv";
    homeDirectory = "/home/matt_serv";
    stateVersion = "26.05";
  };

  imports = [
    ../shell
    ../neovim
  ];

  # Packages list
  nixpkgs.config.allowUnfree = true;
  home.packages = [];

  home.sessionVariables = {
    EDITOR = "nvim";
    SHELL = "fish";
  };

  programs.home-manager.enable = true;
}
