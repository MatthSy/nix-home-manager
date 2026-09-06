{
  config,
  pkgs,
  theme,
  ...
}: {
  imports = [];

  stylix = {
    enable = true;
    # image = ../wallpapers/nixos.png;
    base16Scheme = theme;
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
