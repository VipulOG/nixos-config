{ username, ... }: {
  services.tailscale = {
    enable = true;
    extraUpFlags = [ "--ssh" "--operator=${username}" ];
  };
}
