{...}: {
  wayland.windowManager.hyprland.settings = {
    "$webBrowser" = "firefox"; # goated
    "$terminal" = "kitty";
    "$fileManager" = "nemo";
    "$menu" = "bash --login -c 'wofi --show drun -l top -i'"; # wofi --show drun -l top -i

    monitor = [
      ",preferred,auto, 1, mirror, eDP-1"
      "eDP-1,1920x1080@144,auto, 1, vrr, 3"
    ];

    exec-once = [
      "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      "hyprctl setcursor Bibata-Modern-Ice 24"
      "[workspace special:magic silent] $terminal"
      "[workspace 1 silent] $webBrowser"
      "noctalia" # Bar (and a lot more)
      "hyprpaper"
      # "nm-applet --indicator & disown"
      # "protonvpn-app"
      # "dunst"
      "~/.config/hypr/scripts/run_XDPH.sh"
      "systemctl --user start hyprpolkitagent"
      "hypridle"
    ];

    env = [
      "WLR_DRM_VRR_ENABLED,1" # Variable refresh rate
      "XCURSOR_SIZE,24"
      "HYPRCURSOR_SIZE,24"
    ];

    general = {
      gaps_in = 2;
      gaps_out = 3;
      border_size = 3;

      # col.active_border = $color1;
      # col.inactive_border = $background;

      # Set to true enable resizing windows by clicking and dragging on borders and gaps
      resize_on_border = false;

      # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
      allow_tearing = false;

      layout = "dwindle";
    };

    misc = {
      disable_splash_rendering = true;
    };
    binds = {
      scroll_event_delay = 5;
    };

    decoration = {
      rounding = 3;

      # Change transparency of focused and unfocused windows
      active_opacity = 1;
      inactive_opacity = 0.83;

      shadow = {
        enabled = false;
        range = 4;
        render_power = 3;
      };

      # https://wiki.hyprland.org/Configuring/Variables/#blur
      blur = {
        enabled = true;
        size = 3;
        passes = 2;

        vibrancy = 0.0696;
      };
    };

    # https://wiki.hyprland.org/Configuring/Variables/#animations
    animations = {
      enabled = true;

      # Default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

      bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

      animation = [
        "windows, 1, 0.7, myBezier, slide"
        "windowsOut, 1, 0.7, myBezier, popin 80%"
        "fade, 1, 5, default"
        "workspaces, 1, 1, default"
      ];
    };

    dwindle = {
      preserve_split = true;
    };

    master = {
      new_status = "master";
    };

    misc = {
      force_default_wallpaper = 1; # Set to 0 or 1 to disable the anime mascot wallpapers
      disable_hyprland_logo = true;
    };

    input = {
      # kb_layout = "fr";

      follow_mouse = 1;

      sensitivity = 0; # -1.0 - 1.0, 0 means no modification.

      touchpad = {
        natural_scroll = true;
        scroll_factor = 0.25;
      };
    };

    gesture = "3, horizontal, workspace";

    device = [
      {
        name = "steelseries-steelseries-rival-3";
        sensitivity = -0.60;
      }
      {
        name = "elan0752:00-04f3:31c2-touchpad";
        sensitivity = 0.1;
        natural_scroll = true;
      }
      {
        name = "logitech-logig-tkl-mkeyboard";
      }
    ];

    windowrule = [
      # NSXIV auto float :
      "float on, match:class .*Nsxiv.*"
      "size 50% 60%, match:class .*Nsxiv.*"

      # Discord positioning :
      "match:class=discord, workspace name:D"
      "noinitialfocus, class:discord"

      # Jetbrains IDEs :
      "opaque on, match:class jetbrains(.*)"

      # Kalk auto float (if you're new on the stream, calc is slang for calculator btw)
      "float on, match:class .*kalk.*"
      "move 100%-w-2% 5%, class:.*kalk.*"

      # Nemo auto float
      "float on, match:class .*nemo.*"
      "move 100%-w-2% 5%, class:.*nemo.*"
      "size 30% 40%, class:.*nemo.*"
    ];
  };
}
