{ nixpkgs, ... } @inputs :

let
  myvars = import ../vars;
  mylib = import ../lib { inherit lib; };
  lib = nixpkgs.lib;

  system = "x86_64-linux";

  pkgs-unstable = import inputs.nixpkgs-unstable {
    inherit system;
    config.allowUnfree = true;
  };

  pkgs-stable = import inputs.nixpkgs-stable {
    inherit system;
    config.allowUnfree = true;
  };

  args = { inherit inputs lib myvars mylib pkgs-stable pkgs-unstable; };

in {
  nixosConfigurations = {
    desktop = lib.nixosSystem {
      modules = [
        inputs.stylix.nixosModules.stylix
        (import ../hosts/desktop)
      ];
      specialArgs = args;
    };
  };
}
