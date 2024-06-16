{ pkgs, username, lib, ... }: {
  # ---- Home Configuration ----
  home-manager.users.${username} = {config, ...} : {
    home.packages = [ pkgs.pop-launcher ];
    imports = [ ./keybindings.nix ./extensions.nix ];
  };

  # ---- System Configuration ----
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  services.gnome = {
    evolution-data-server.enable = true;
    gnome-keyring.enable = true;
  };

  programs.dconf.enable = true;

  environment.systemPackages = with pkgs; [
    mission-center
    gnome.gnome-tweaks
    gnome.dconf-editor
  ];

  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
    gedit
  ]) ++ (with pkgs.gnome; [
    cheese
    epiphany
    gnome-contacts
    gnome-maps
    gnome-music
    gnome-terminal
    gnome-system-monitor
    simple-scan
    yelp
  ]);
}
