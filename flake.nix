{
  description = "Vipul's nix configuration for NixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.11";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";
  };

  outputs = { self, nixpkgs, ... }@inputs:
  let
    lib = nixpkgs.lib;
    mylib = import ./lib { inherit lib; };

    pkgs-unstable = system: import inputs.nixpkgs-unstable {
      inherit system;
      config.allowUnfree = true;
    };

    pkgs-stable = system: import inputs.nixpkgs-stable {
      inherit system;
      config.allowUnfree = true;
    };

    commonArgs = system: {
      inherit lib mylib system;
      pkgs-stable = pkgs-stable system;
      pkgs-unstable = pkgs-unstable system;
    } // inputs;

  in {
    nixosConfigurations = {
      desktop =
        let
          system = "x86_64-linux";
        in
        lib.nixosSystem {
          specialArgs = {
            username = "vipul";
            hostName = "desktop";
          } // commonArgs system;
          modules = [
            inputs.disko.nixosModules.disko
            ./disko.nix { _module.args.device = "/dev/sdb"; }
            inputs.home-manager.nixosModules.home-manager
            inputs.stylix.nixosModules.stylix
            ./hosts
            ./users
            ./modules
          ];
        };
    };
  };
}
