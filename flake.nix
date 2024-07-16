{
  description = "Vipul's nix configuration for NixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

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
    mylib = import ./lib { inherit lib inputs; };
    commonArgs = system: { inherit lib mylib system; } // inputs;

  in {
    nixosConfigurations = {
      desktop = let system = "x86_64-linux"; in
        mylib.nixosSystem {
          modules = [
            ./disko.nix { _module.args.device = "/dev/sdb"; }
            inputs.stylix.nixosModules.stylix
            ./modules/virtualization/docker.nix
            ./modules/virtualization/podman.nix
          ];

          specialArgs = {
            username = "vipul";
            hostName = "desktop";
            de = "gnome";
            theme = "tomorrow-night";
          } // commonArgs system;
        };
    };
  };
}
