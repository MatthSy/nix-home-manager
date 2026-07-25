{
  pkgs,
  config,
  ...
}: {
  wayland.windowManager.hyprland = {
    configType = "lua";
  };
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    "$scdMod" = "ALT";

    bind = [
      "$mod, F, exec, firefox"
      ", Print, exec, grimblast copy area"
      # Binds to run some apps
      "$mainMod, Return, exec, $terminal"
      "$mainMod, F, exec, $webBrowser"
      "$mainMod, E, exec, $fileManager"
      "$mainMod L_SHIFT, E, exec, $fileManagerBis"
      "$mainMod, space, exec, $menu"
      "$scdMod, space, exec, $menu"
      "$mainMod, O, exec, obsidian"

      # Some binds
      "$mainMod, C, killactive,"
      "$mainMod, M, exit,"
      "$mainMod, V, togglefloating,"
      "$mainMod, P, pseudo," # dwindle
      "$mainMod, J, togglesplit," # dwindle
      "$mainMod, J, $d toggle split, layoutmsg, togglesplit" # Patch for togglesplit. From : https://github.com/HyDE-Project/HyDE/issues/1613
      "$mainMod & CTRL, F, fullscreen"

      # An exit menu
      # bind = CTRL & ALT, Delete, exec, $HOME/.config/home-manager/graphical-env/hypr/scripts/exit_menu.sh
      # bind = CTRL & ALT, Delete, exec, wlogout
      "CTRL & ALT, Delete, exec, noctalia msg panel-toggle session"

      # Waybar keybinds
      "$mainMod, B, exec, $HOME/.config/home-manager/graphical-env/hypr/scripts/toggleWaybar.sh"
      "$mainMod & L_Shift, B, exec, pkill -9 waybar; waybar;"

      # Change wallpaper and theme
      "$mainMod & CTRL & L_Shift, W, exec, $HOME/.config/home-manager/graphical-env/hypr/scripts/wallpapers/load_rand_wall.sh  "
      "$mainMod & CTRL, W, exec, $HOME/.config/home-manager/graphical-env/hypr/scripts/wallpapers/select_wall.sh  "

      # Screenshot
      "$mainMod & L_Shift, S, exec, hyprshot -zm region # rectangular region"
      ", PRINT, exec, hyprshot -m output -m active # entire screen"

      # to switch between windows in a floating workspace
      "$scdMod, Tab, cyclenext,           # change focus to another window"
      "$scdMod, Tab, bringactivetotop,    # bring it to the top"

      # Waybar keybinds
      "$mainMod, B, exec, $HOME/.config/home-manager/graphical-env/hypr/scripts/toggleWaybar.sh"
      "$mainMod & L_Shift, B, exec, pkill -9 waybar; waybar;"

      # Change wallpaper and theme
      "$mainMod & CTRL & L_Shift, W, exec, $HOME/.config/home-manager/graphical-env/hypr/scripts/wallpapers/load_rand_wall.sh  "
      "$mainMod & CTRL, W, exec, $HOME/.config/home-manager/graphical-env/hypr/scripts/wallpapers/select_wall.sh  "

      # Screenshot
      "$mainMod & L_Shift, S, exec, hyprshot -zm region # rectangular region"
      ", PRINT, exec, hyprshot -m output -m active # entire screen"

      # to switch between windows in a floating workspace
      "$scdMod, Tab, cyclenext,           # change focus to another window"
      "$scdMod, Tab, bringactivetotop,    # bring it to the top"

      # Switch workspaces with mainMod + [0-9]
      "$mainMod, code:10, workspace, 1"
      "$mainMod, code:11, workspace, 2"
      "$mainMod, code:12, workspace, 3"
      "$mainMod, code:13, workspace, 4"
      "$mainMod, code:14, workspace, 5"
      "$mainMod, code:15, workspace, 6"
      "$mainMod, code:16, workspace, 7"
      "$mainMod, code:17, workspace, 8"
      "$mainMod, code:18, workspace, 9"
      "$mainMod, code:19, workspace, 10"

      ", XF86Calculator, exec, kalk"

      # Zoom :
      "$mainMod SHIFT, mouse_down, exec, hyprctl -q keyword cursor:zoom_factor $(hyprctl getoption cursor:zoom_factor -j | jq '.float * 1.1')"
      "$mainMod SHIFT, mouse_up, exec, hyprctl -q keyword cursor:zoom_factor $(hyprctl getoption cursor:zoom_factor -j | jq '(.float * 0.9) | if . < 1 then 1 else . end')"

      # Reset zoom :
      "$mainMod SHIFT, minus, exec, hyprctl -q keyword cursor:zoom_factor 1"
      "$mainMod SHIFT, equal, exec, hyprctl -q keyword cursor:zoom_factor 1"
      "$mainMod SHIFT, 0, exec, hyprctl -q keyword cursor:zoom_factor 1"
    ];

    bindl = [
      # Lock the screen and suspend after 30 sec
      "$mainMod, L, exec, $HOME/.config/home-manager/graphical-env/hypr/scripts/manualLock.sh"

      #activate/deactivate autosuspend :
      "$mainMod & L_Shift, L, exec, $HOME/.config/home-manager/graphical-env/hypr/scripts/toggle_autosuspend.sh"
    ];

    binde = [
      # Move focus with mainMod + arrow keys
      "$mainMod, left, movefocus, l"
      "$mainMod, right, movefocus, r"
      "$mainMod, up, movefocus, u"
      "$mainMod, down, movefocus, d"

      # Move window with mainMod + shift(or CTRL) + arrow keys
      "$mainMod&SHIFT, left, movewindow, l"
      "$mainMod&SHIFT, right, movewindow, r"
      "$mainMod&SHIFT, up, movewindow, u"
      "$mainMod&SHIFT, down, movewindow, d"
      "$mainMod&Ctrl, left, movewindow, l"
      "$mainMod&Ctrl, right, movewindow, r"
      "$mainMod&Ctrl, up, movewindow, u"
      "$mainMod&Ctrl, down, movewindow, d"

      # Move active window to a workspace with mainMod + SHIFT + [0-9]
      "$mainMod SHIFT, code:10, movetoworkspace, 1"
      "$mainMod SHIFT, code:11, movetoworkspace, 2"
      "$mainMod SHIFT, code:12, movetoworkspace, 3"
      "$mainMod SHIFT, code:13, movetoworkspace, 4"
      "$mainMod SHIFT, code:14, movetoworkspace, 5"
      "$mainMod SHIFT, code:15, movetoworkspace, 6"
      "$mainMod SHIFT, code:16, movetoworkspace, 7"
      "$mainMod SHIFT, code:17, movetoworkspace, 8"
      "$mainMod SHIFT, code:18, movetoworkspace, 9"
      "$mainMod SHIFT, code:19, movetoworkspace, 10"

      # Special workspace
      "$mainMod, W, togglespecialworkspace, magic"
      "$mainMod SHIFT, W, movetoworkspace, special:magic"
      "$mainMod, D, workspace, name:D"
      "$mainMod SHIFT, D, movetoworkspace, name:D"

      # Scroll through existing workspaces with mainMod + scroll
      "$mainMod, mouse_down, workspace, e+1"
      "$mainMod, mouse_up, workspace, e-1"

      # Zoom :
      "$mainMod, equal, exec, hyprctl -q keyword cursor:zoom_factor $(hyprctl getoption cursor:zoom_factor -j | jq '.float * 1.1')"
    ];

    bindt = [
      # Resize windows :
      "$mainMod, R, exec, dunstify -t 1500 'Resizing mode' 'Resize mode...'"
      "$mainMod, R, submap, resize"
    ];

    bindm = [
      # Move/resize windows with mainMod + LMB/RMB and dragging
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow;"
    ];

    bindn = [
      ", insert, global, :Discord"
    ];

    bindel = [
      # Laptop multimedia keys for volume and LCD brightness
      # Volume
      ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
      ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"

      # Brightness
      ",XF86MonBrightnessUp, exec, brightnessctl s 5%+ "
      #bindel = ,XF86MonBrightnessUp, exec, $HOME/.config/home-manager/graphical-env/hypr/scripts/displayBrightness.sh
      ",XF86MonBrightnessDown, exec, brightnessctl s 5%-"
      #bindel = ,XF86MonBrightnessDown, exec, $HOME/.config/home-manager/graphical-env/hypr/scripts/displayBrightness.sh
      #Brightness for 2nd keyboard :
      "$mainMod, F1, exec, brightnessctl s 5%- "
      "$mainMod, F1, exec, $HOME/.config/home-manager/graphical-env/hypr/scripts/displayBrightness.sh"
      "$mainMod, F2, exec, brightnessctl s 5%+ "
      "$mainMod, F2, exec, $HOME/.config/home-manager/graphical-env/hypr/scripts/displayBrightness.sh"
    ];

    submap = {
      "resize" = {
        binde = [
          ", right, resizeactive, 20 0"
          ", left, resizeactive, -20 0"
          ", up, resizeactive, 0 -20"
          ", down, resizeactive, 0 20"
          "Shift_L, right, resizeactive, 100 0"
          "Shift_L, left, resizeactive, -100 0"
          "Shift_L, up, resizeactive, 0 -100"
          "Shift_L, down, resizeactive, 0 100"
        ];
        bind = [
          # use reset to go back to the global submap
          "$mainMod, R, submap, reset"
          ", Escape, submap, reset"
        ];
      };
    };
  };
}
