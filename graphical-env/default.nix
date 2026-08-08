{pkgs, ...}: {
  imports = [
    ./stylix
    ./wayle.nix
    ./noctalia.nix
    ./hypr
    # ./wofi.nix
  ];

  home.packages = with pkgs; [
    # wofi # App launcher
    hyprlock # Lockscreen
    hypridle # Idle detector, auto suspend
    hyprpaper # Wallpaper manager
    nsxiv # Image viewer
    hyprshot # Screenshot tool
    brightnessctl # Screen brightness tool
    # wlogout # Logout screen
    gdk-pixbuf # Used by wlogout
    hyprpolkitagent # Password asker for privilege required apps
    hyprpwcenter
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
