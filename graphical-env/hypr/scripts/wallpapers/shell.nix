let
  pkgs = import <nixpkgs> {};
in pkgs.mkShell {
  packages = [
    (pkgs.python314Packages.python.withPackages (python314Packages: [
      python314Packages.pywal16
      python314Packages.haishoku
    ]))
    pkgs.procps
    pkgs.hyprpaper
    pkgs.killall
    pkgs.dunst
    pkgs.hyprland
  ];
}
