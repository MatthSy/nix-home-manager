{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    ########## Voicechats ##########
    discord

    ########## Tools ##########
    protontricks
    vulkan-tools
    mangohud
    nvtopPackages.full
    gpustat
  ];

  # Patch for the desktop entry, prevent black screen.
  xdg.desktopEntries = {
    steam = {
      name = "Steam";
      exec = "steam -no-cef-sandbox %U";
      icon = "steam";
      comment = "Application for managing and playing games on Steam";
      categories = ["Network" "FileTransfer" "Game"];
      mimeType = ["x-scheme-handler/steam" "x-scheme-handler/steamlink"];
    };
  };

  # programs.gamemode = {
  #   enable = true;
  #   settings = {
  #     general = {
  #       softrealtime = "auto";
  #       renice = 15;
  #     };
  #   };
  # };
}
