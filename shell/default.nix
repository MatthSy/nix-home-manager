{ config, pkgs, ... }:

{
  imports = [
    ./ohmyposh
    ./kitty.nix
    ./fish.nix
  ];

  home.packages = with pkgs; [
    ########## Archives ##########
    zip
    unzip
    xz


    ########## Miscellaneous ##########
    fzf
    bat
  ];
}
