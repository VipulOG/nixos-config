{ username, home-manager, pkgs, ... }: {
  home-manager.users.${username} = {
    home.packages = with pkgs; [ firefox-devedition ];
  };
}
