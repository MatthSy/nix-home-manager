{
  description = "Root nixos config flake";

  inputs = {
    nixpkgs.url = "nixpkgs";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia/cachix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    stylix,
    nvf,
    noctalia,
    ...
  } @ inputs: let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};
    mkHomeConfig = username: hostname: extraModules:
      home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules =
          [
            ./hosts/${hostname}
            ./users/${username}.nix
            ./user-host/${username}-${hostname}.nix
          ]
          ++ extraModules;

        extraSpecialArgs = {
          inherit username;
        };
      };
  in {
    homeConfigurations = {
      "matt@omen" = mkHomeConfig "matt" "omen" [
        stylix.homeModules.stylix
        nvf.homeManagerModules.default
        noctalia.homeModules.default
      ];

      "matt@fixe" = mkHomeConfig "matt" "fixe" [
        stylix.homeModules.stylix
        nvf.homeManagerModules.default
        noctalia.homeModules.default
      ];

      "matt_serv@serv" = mkHomeConfig "matt_serv" "serv" [
        nvf.homeManagerModules.default
      ];
    };
  };
}
