{ pkgs, username, lib, ... }: {
  # ---- Home Configuration ----
  home-manager.users.${username} = { config, ... }: {
    home.packages = [ pkgs.pop-launcher ];
    imports = [ ./keybindings.nix ./extensions.nix ];
  };

  # ---- System Configuration ----
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  programs.dconf.enable = true;

  environment.systemPackages = with pkgs; [
    gnome-tweaks
    dconf-editor
  ];

  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
    gedit
    cheese
    epiphany
    simple-scan
    yelp
  ]) ++ (with pkgs.gnome; [
    gnome-contacts
    gnome-maps
    gnome-music
  ]);
}
