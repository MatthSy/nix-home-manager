{pkgs, ...}: {
  imports = [
    ./stylix
    ./noctalia.nix
    ./hypr
    ./jellyfin.nix
  ];

  home.packages = with pkgs; [
    # wofi # App launcher
    hyprlock # Lockscreen
    hypridle # Idle detector, auto suspend
    hyprpaper # Wallpaper manager
    nsxiv # Image viewer
    hyprshot # Screenshot tool
    brightnessctl # Screen brightness tool
    kdePackages.dolphin # Main file manager
    nemo # Secondary
    # wlogout # Logout screen
    # gdk-pixbuf # Used by wlogout
    hyprpolkitagent # Password asker for privilege required apps
    # hyprpwcenter # Pipewire settings gui app
    wl-clipboard # clipboard additions (used for neovim)

    localsend # Alternative to airdrop
    mpv
  ];

  # services.hyprpaper.enable = true;

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
