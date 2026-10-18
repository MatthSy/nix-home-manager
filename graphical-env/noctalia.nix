{
  config,
  lib,
  pkgs,
  ...
}: let
  systemctl = "${pkgs.systemd}/bin/systemctl";
  tailscale = "/run/current-system/sw/bin/tailscale";
  tsUpFlags = "--login-server=https://vpn.sympho.fr --accept-routes";
in {
  # Noctalia plugin for connecting to wireguard VPN with a button on the bar
  #### WARNING: Musty be activated once with : noctalia msg plugins enable matt/wg-toggle
  #
  xdg.dataFile."noctalia/plugins/wg-toggle/plugin.toml".text = ''
    id         = "matt/wg-toggle"
    name       = "WireGuard toggle"
    version    = "1.0.0"
    plugin_api = 3
    author     = "matt"

    [[widget]]
    id    = "toggle"
    entry = "widget.luau"
  '';

  xdg.dataFile."noctalia/plugins/wg-toggle/widget.luau".text = ''
    local SYSTEMCTL = "${systemctl}"
    local up = false

    local function render()
      if up then
        barWidget.setGlyph("shield-check")
        barWidget.setText("VPN")
      else
        barWidget.setGlyph("shield-off")
        barWidget.setText("")
      end
    end

    local function poll()
      noctalia.runAsync(SYSTEMCTL .. " is-active --quiet wg-quick-wg0", function(r)
        up = (r.exitCode == 0)
        render()
      end)
    end

    noctalia.setUpdateInterval(2000)

    function update()
      poll()
    end

    function onClick()
      local action = up and "stop" or "start"
      noctalia.runAsync(SYSTEMCTL .. " " .. action .. " wg-quick-wg0", function(r)
        if r.exitCode ~= 0 then
          noctalia.notifyError("WireGuard", r.stderr)
        end
        poll()
      end)
    end

    render()
  '';

  # Noctalia plugin : bouton Tailscale/Headscale
  #### WARNING: activer une fois avec : noctalia msg plugins enable matt/ts-toggle
  xdg.dataFile."noctalia/plugins/ts-toggle/plugin.toml".text = ''
    id         = "matt/ts-toggle"
    name       = "Tailscale toggle"
    version    = "1.0.0"
    plugin_api = 3
    author     = "matt"

    [[widget]]
    id    = "toggle"
    entry = "widget.luau"
  '';

  xdg.dataFile."noctalia/plugins/ts-toggle/widget.luau".text = ''
    local TS = "${tailscale}"
    local UP_FLAGS = "${tsUpFlags}"
    local up = false

    local function render()
      if up then
        barWidget.setGlyph("shield-check")
        barWidget.setText("TS")
      else
        barWidget.setGlyph("shield-off")
        barWidget.setText("")
      end
    end

    local function poll()
      -- code de sortie 0 uniquement quand le tunnel est actif
      noctalia.runAsync(TS .. " status --peers=false", function(r)
        up = (r.exitCode == 0)
        render()
      end)
    end

    noctalia.setUpdateInterval(2000)

    function update()
      poll()
    end

    function onClick()
      local cmd = up and (TS .. " down") or (TS .. " up " .. UP_FLAGS)
      noctalia.runAsync(cmd, function(r)
        if r.exitCode ~= 0 then
          noctalia.notifyError("Tailscale", r.stderr)
        end
        poll()
      end)
    end

    render()
  '';

  programs.noctalia = {
    enable = true;
    systemd.enable = true;

    settings = {
      wallpaper = {
        enabled = true;
        # default.path = lib.mkForce "./wallpapers/nixos.png";
        directory = "/home/matt/.config/home-manager/graphical-env/wallpapers";
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
        end = ["out_vol" "in_vol" "privacy" "media" "matt/ts-toggle:toggle" "matt/wg-toggle:toggle" "clipboard" "tray" "battery" "clock-date"];
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

        launcher = {
          compact = true;
        };
      };
    };
  };
}
