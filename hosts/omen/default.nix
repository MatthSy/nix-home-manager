{pkgs, ...}: {
  home.packages = with pkgs; [
    btop-cuda
    htop

    dbeaver-bin
  ];
}
