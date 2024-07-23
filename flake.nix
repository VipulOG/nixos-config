{
  description = "Vipul's nix configuration for NixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    pre-commit-hooks.url = "github:cachix/pre-commit-hooks.nix";
    stylix.url = "github:danth/stylix";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, ... }:
    let
      supportedSystems = [ "x86_64-linux" ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
    in
    {
      checks = forAllSystems (system: {
        pre-commit-check = inputs.pre-commit-hooks.lib.${system}.run {
          src = ./.;
          hooks = {
            nixpkgs-fmt.enable = true;
          };
        };
      });

      devShells = forAllSystems (system: {
        default = nixpkgs.legacyPackages.${system}.mkShell {
          inherit (self.checks.${system}.pre-commit-check) shellHook;
          buildInputs = self.checks.${system}.pre-commit-check.enabledPackages;
        };
      });

      nixosConfigurations =
        let
          lib = nixpkgs.lib;
          mylib = import ./lib { inherit lib inputs; };
          commonArgs = system: { inherit lib mylib system; } // inputs;
        in
        {
          desktop = let system = "x86_64-linux"; in mylib.nixosSystem {
            modules = [
              ./disko.nix
              { _module.args.device = "/dev/sdb"; }
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
