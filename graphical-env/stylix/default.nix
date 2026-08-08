{
  config,
  pkgs,
  ...
}: {
  imports = [];

  stylix = {
    enable = true;
    image = ../wallpapers/nixos.png;
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/deep-oceanic-next.yaml";
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/dracula.yaml";
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-latte.yaml";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
    polarity = "dark";

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "Jetbrains mono";
      };

      serif = config.stylix.fonts.monospace;
      sansSerif = config.stylix.fonts.monospace;
      emoji = config.stylix.fonts.monospace;
    };

    # targets.firefox.enable = false;
    # targets.thunderbird.enable = false;
  };
}
