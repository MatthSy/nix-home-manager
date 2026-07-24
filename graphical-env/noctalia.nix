{
  config,
  lib,
  ...
}: {
  programs.noctalia = {
    enable = true;
    systemd.enable = true;

    settings = {
      wallpaper = {
        enabled = false;
        # default.path = lib.mkForce "./wallpapers/nixos.png";
        directory = "./wallpapers";
      };

      bar.order = "main";
      bar.main = {
        position = "top";
        enabled = true;
        auto_hide = false;
        smart_auto_hide = false;
        reserve_space = true;
        layer = "top";

        thickness = 25;
        background_opacity = 0.0;
        concave_edge_corners = false;
        margin_edge = 0;
        margin_ends = 10;
        scale = 1.3;
        padding = 0;
        widget_spacing = 5.0;

        capsule = true;
        capsule_fill = "surface_variant";
        capsule_thickness = 1.0;

        start = ["workspaces" "active_window"];
        center = ["clock"];
        end = ["out_vol" "in_vol" "privacy" "media" "clipboard" "tray" "battery" "clock-date"];
      };

      widget = {
        # Start (left) :
        workspaces = {
          display = "name";
          active_pill_size = 1.8;
        };
        active_window = {
          max_length = 300;
        };

        # End (right) :
        clock-date = {
          type = "clock";
          format = "{:%d/%m/%Y}";
        };

        out_vol = {
          type = "volume";
          device = "output";
        };
        in_vol = {
          type = "volume";
          device = "input";
        };
        privacy = {
          hide_inactive = true;
        };
        media = {
          max_length = 170;
          hide_when_no_media = true;
          title_scroll = "on_hover";
        };

        tray = {
          drawer = true;
          drawer_item_size = 20;
        };
      };

      shell = {
        panel = {
          list_item_background = true;
        };
      };
    };
  };
}
