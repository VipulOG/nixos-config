# misc cli utilities
{ pkgs, username, home-manager, ... }:

{
  environment.systemPackages = with pkgs; [
    nitch
    wget
    curl
    gnugrep
    gnused
    gawk
    file
    which
    tree
    rsync
    gnutar
    zip
    xz
    parted
  ];

  home-manager.users.${username} = {
    programs = {
      eza = {
        enable = true;
        git = true;
        icons = true;
      };

      bat = {
        enable = true;
        config = {
          pager = "less -FR";
        };
      };

      fzf = {
        enable = true;
      };

      zoxide = {
        enable = true;
        enableBashIntegration = true;
        enableZshIntegration = true;
      };

      atuin = {
        enable = true;
        enableBashIntegration = true;
        enableZshIntegration = true;
      };
    };
  };
}
