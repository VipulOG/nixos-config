{ pkgs, home-manager, username, ... }: {
  home-manager.users.${username} = {
    programs.starship = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
    };
  };
}
