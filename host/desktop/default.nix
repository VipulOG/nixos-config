{ mylib, pkgs, home-manager, username, ... }: {
  imports = [
    ./hardware-configuration.nix
  ] ++ mylib.importConfiguredPrograms [
    "kitty" "vscode" "obs"
  ];

  #----Host specific config ----
  # Hide mei logs from tty
  boot.blacklistedKernelModules = [ "mei" "mei_me" ];

  home-manager.users.${username} = {
    home.packages = with pkgs; [
      androidStudioPackages.dev
      brave
      firefox-devedition
      librewolf
      gimp
    ];
  };
}
