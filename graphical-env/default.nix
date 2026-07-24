{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./stylix
    ./wayle.nix
    ./noctalia.nix
  ];

  home.packages = with pkgs; [
    wofi # App launcher
    hyprlock # Lockscreen
    hypridle # Idle detector, auto suspend
    hyprpaper # Wallpaper manager
    nsxiv # Image viewer
    hyprshot # Screenshot tool
    brightnessctl # Screen brightness tool
    # wlogout # Logout screen
    gdk-pixbuf # Used by wlogout
    bibata-cursors # Mouse cursor
    hyprpolkitagent # Password asker for privilege required apps
  ];

  services.hyprpaper.enable = true;
}
