{...}: {
  imports = [
    # ./config.nix
    # ./keybinds.nix
  ];
  wayland.windowManager.hyprland.enable = true;

  wayland.windowManager.hyprland = {
    extraLuaFiles = {
      "keybinds" = {
        content = ./keybinds.lua;
        autoLoad = true;
      };
      "config" = {
        content = ./config.lua;
        autoLoad = true;
      };
    };
  };
}
