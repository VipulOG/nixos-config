{ myvars, ... }: {
  virtualisation.docker.enable = true;
  users.users.${myvars.username}.extraGroups = [ "docker" ];
}
