{ config, pkgs, ...}: {
  # security with polkit
  security.polkit.enable = true;
  # security with gnome-kering
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.greetd.enableGnomeKeyring = true;

  # gpg agent
  programs.gnupg.agent = {
    enable = true;
  };
}
