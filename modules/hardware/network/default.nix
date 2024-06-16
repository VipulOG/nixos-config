{ username, hostName, ... }: {
  networking = {
    networkmanager.enable = true;
    nameservers = [ "100.100.100.100" "8.8.8.8" "1.1.1.1" ];
    search = [ "tailed69d9.ts.net" ];
    inherit hostName;

    firewall = {
      enable = true;
      allowedTCPPorts = [ 22 80 443 ];
      allowedUDPPorts = [ ];
    };
  };

  users.users.${username}.extraGroups = [ "networkmanager" ];
}
