{ pkgs, lib, ... }: {
  services.xserver = {
    enable = true;
    xkb.layout = "us";
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;

    excludePackages = [ pkgs.xterm ];
    desktopManager.xterm.enable = false;
  };

  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
  ]) ++ (with pkgs.gnome; [
    cheese
    epiphany
    gnome-contacts
    gnome-maps
    gnome-music
    gnome-terminal
    simple-scan
    yelp
  ]);
}
