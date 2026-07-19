{
  config,
  pkgs,
  ...
}: {
  programs.fish = {
    enable = true;
    shellAliases = {
      c = "clear";
    };
    shellInit = "
      set fish_greeting \$(date)
      ";
  };
}
