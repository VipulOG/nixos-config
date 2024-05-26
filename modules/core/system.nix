{ pkgs, myvars, ... }:

{
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
      allowed-users = [ myvars.username ];
      trusted-users = [ myvars.username ];
      # substituers that will be considered before the official ones(https://cache.nixos.org)
      substituters = [ "https://nix-community.cachix.org" ];
      trusted-public-keys = [ "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs=" ];
      builders-use-substitutes = true;
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };

    package = pkgs.nixVersions.latest;
    channel.enable = false;
  };

  environment.shells = with pkgs; [
    bashInteractive
    nushellFull
  ];

  # set user's default shell system-wide
  users.defaultUserShell = pkgs.bashInteractive;

  time.timeZone = "Asia/Kolkata";
  i18n.defaultLocale = "en_US.UTF-8";
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "23.11";
}
