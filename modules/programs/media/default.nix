{ pkgs, home-manager, username, ... }: {
  home-manager.users.${username} = {
    home.packages = with pkgs; [
      viu # Terminal image viewer with native support for Kitty
      gimp
      graphviz
    ];
  };
}
