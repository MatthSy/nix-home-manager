{
  config,
  pkgs,
  ...
}: {
  home = {
    username = "matt";
    homeDirectory = "/home/matt";
    stateVersion = "26.05";
  };

  imports = [
    ../shell
    ../gaming
    ../graphical-env
    ../neovim
  ];

  # Packages list
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    ########## Miscellaneous ##########
    firefox
    ungoogled-chromium
    thunderbird # Mail client
    libreoffice-qt-fresh
    hunspell
    hunspellDicts.fr-any

    ########## Programming ##########
    # cargo # Rust package manager
    # gcc # Toolchain for C

    ########## WM environment ##########
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    SHELL = "fish";
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "default-web-browser" = ["firefox.desktop"];
      "text/html" = ["firefox.desktop"];
      "x-scheme-handler/http" = ["firefox.desktop"];
      "x-scheme-handler/https" = ["firefox.desktop"];
      "x-scheme-handler/about" = ["firefox.desktop"];
      "x-scheme-handler/unknown" = ["firefox.desktop"];
      text = ["kitty -e nvim"];
      "application/pdf" = ["firefox.desktop"];
      pdf = ["firefox.desktop"];
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
