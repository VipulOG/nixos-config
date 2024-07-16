{ username, ... }: {
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 6d --keep 10";
    flake = "/home/${username}/nixos-config";
  };
}
