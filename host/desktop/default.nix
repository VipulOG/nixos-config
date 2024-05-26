{ mylib, pkgs, home-manager, username, ... }: {
  imports = [
    ./hardware-configuration.nix

    ../../programs/kitty.nix
    ../../programs/vscode.nix
  ];

  #----Host specific config ----
  # Hide mei logs from tty
  boot.blacklistedKernelModules = [ "mei" "mei_me" ];

  home-manager.users.${username} = {
    home.packages = with pkgs; [
      androidStudioPackages.beta
      brave
      librewolf
      gimp
    ];
  };
}
