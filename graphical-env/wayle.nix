{config, pkgs, ...}:

{
  services.wayle = {
    enable = false;
    package = pkgs.wayle;
    settings = {
      bar = {
        layout = {
          center = [ "clock" ];
          left = [ "dashboard" "hyprland-workspaces" "window-title" ];
          right = [ "media" "volume" "microphone" "brightness" "bluetooth" "network" "systray" "battery" "clock" ];
        };
        location = "top";
        rounding = "sm";
        scale = 1;
      };
    };
  };
}
