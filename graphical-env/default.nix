{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./stylix
    ./wayle.nix
    ./noctalia.nix
  ];
}
