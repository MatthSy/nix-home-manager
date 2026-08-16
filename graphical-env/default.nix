{pkgs, ...}: {
  imports = [
    ./stylix
    ./noctalia.nix
    ./hypr
  ];

  home.packages = with pkgs; [
    # wofi # App launcher
    hyprlock # Lockscreen
    hypridle # Idle detector, auto suspend
    hyprpaper # Wallpaper manager
    nsxiv # Image viewer
    hyprshot # Screenshot tool
    brightnessctl # Screen brightness tool
    nemo # Main file manager
    # wlogout # Logout screen
    # gdk-pixbuf # Used by wlogout
    hyprpolkitagent # Password asker for privilege required apps
    # hyprpwcenter # Pipewire settings gui app
    wl-clipboard # clipboard additions (used for neovim)

    localsend # Alternative to airdrop
  ];

  services.hyprpaper.enable = true;

  home.pointerCursor = {
    enable = true;
    name = "Bibata-Modern-Ice";
    size = 24;
    package = pkgs.bibata-cursors;

    hyprcursor = {
      enable = true;
      size = 24;
    };
  };
}
