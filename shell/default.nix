{
  config,
  pkgs,
  ...
}: {
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
    fastfetch # System infos
    livegrep
    ripgrep
  ];

  programs.fzf = {
    enable = true;
    defaultOptions = [
      "--preview 'fzf-preview.sh {}'"
    ];
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };
}
