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
      # inputs.nixpkgs.follows = "nixpkgs";
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

    ############
    # Themes :
    # custom_theme = "gruvbox";
    # custom_theme = "dracula";
    custom_theme = "deep-oceanic";
    # custom_theme = "mocha";
    # custom_theme = "latte";
    themes = {
      "gruvbox" = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
      "mocha" = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
      "latte" = "${pkgs.base16-schemes}/share/themes/catppuccin-latte.yaml";
      "deep-oceanic" = "${pkgs.base16-schemes}/share/themes/deep-oceanic-next.yaml";
      "dracula" = "${pkgs.base16-schemes}/share/themes/dracula.yaml";
    };
    getTheme = theme: default:
      if themes ? ${theme}
      then themes.${theme}
      else default;

    #################################
    # Home manager config builder :
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
          theme = getTheme custom_theme "${pkgs.base16-schemes}/share/themes/dracula.yaml";
        };
      };
  in
    ##############
    # Profiles :
    {
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
