{pkgs, ...}: {
  home.packages = [
    # (pkgs.symlinkJoin {
    #   name = "jellyfin-desktop-wrapped";
    #   paths = [pkgs.jellyfin-desktop];
    #   buildInputs = [pkgs.makeWrapper];
    #   postBuild = ''
    #     wrapProgram $out/bin/jellyfin-desktop \
    #       --set QT_QUICK_BACKEND opengl \
    #       --set QT_XCB_GL_INTEGRATION xcb_egl \
    #   '';
    # })
    pkgs.jellyfin-mpv-shim
  ];

  # xdg.desktopEntries.jellyfin-desktop = {
  #   name = "Jellyfin Desktop";
  #   exec = "jellyfin-desktop";
  #   icon = "jellyfin";
  #   comment = "Jellyfin Desktop Client";
  #   categories = ["AudioVideo" "Video" "Player"];
  # };
}
