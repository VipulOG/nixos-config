{ config, ... }:

let
  d = config.xdg.dataHome;
  c = config.xdg.configHome;
  cache = config.xdg.cacheHome;

in {
  # environment variables that always set at login
  home.sessionVariables = {
    # clean up ~
    LESSHISTFILE = cache + "/less/history";
    LESSKEY = c + "/less/lesskey";
    WINEPREFIX = d + "/wine";

    # set default applications
    BROWSER = "brave";

    # enable scrolling in git diff
    DELTA_PAGER = "less -R";
  };
}
