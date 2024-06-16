{ username, home-manager, config, ... }: {
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    backupFileExtension = "hm-backup";

    users.${username} = {config, ...} :
    let
      d = config.xdg.dataHome;
      c = config.xdg.configHome;
      cache = config.xdg.cacheHome;
    in {
      nixpkgs.config.allowUnfree = true;

      home = {
        username = "${username}";
        homeDirectory = "/home/${username}";
        stateVersion = "23.11";

        # environment variables that always set at login
        sessionVariables = {
          # clean up ~
          LESSHISTFILE = cache + "/less/history";
          LESSKEY = c + "/less/lesskey";
          WINEPREFIX = d + "/wine";

          # enable scrolling in git diff
          DELTA_PAGER = "less -R";
        };
      };
    };
  };
}
