{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ambxst = {
      url = "github:Axenide/Ambxst";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };

    nixcord.url = "github:FlameFlag/nixcord";

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
  };

  outputs = {
    nixpkgs,
    nixos-hardware,
    home-manager,
    nix-index-database,
    ambxst,
    zen-browser,
    spicetify-nix,
    ...
  } @ inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        nixos-hardware.nixosModules.asus-rog-strix-g713ie
        ./configuration
        ambxst.nixosModules.default
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.extraSpecialArgs = {
            inherit inputs;
            username = "utkarsh";
          };
          home-manager.users.utkarsh = import ./hm;
        }
      ];
    };
  };
}
