{ inputs, myvars, mylib, pkgs-stable, pkgs-unstable, ... } @args :

let
  inherit (myvars) username userfullname;

in {
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs myvars mylib pkgs-stable pkgs-unstable; };
    backupFileExtension = "backup35";

    users.${username} = {
      imports = map mylib.relativeToRoot [ "modules/home" ];
      home.username = "${username}";
      home.homeDirectory = "/home/${username}";
      home.stateVersion = "23.11";
      programs.home-manager.enable = true;
    };
  };

  users.users.${username} = {
    isNormalUser = true;
    description = "${userfullname}";
    extraGroups = [ "wheel" ];
  };
}
