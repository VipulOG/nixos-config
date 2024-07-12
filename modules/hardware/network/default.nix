{ username, hostName, ... }: {
  networking = {
    networkmanager.enable = true;
    inherit hostName;

    firewall = {
      enable = true;
      allowedTCPPorts = [ 22 80 443 ];
      allowedUDPPorts = [ ];
    };
  };

  users.users.${username}.extraGroups = [ "networkmanager" ];
}
