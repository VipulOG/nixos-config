# misc cli utilities
{ pkgs, username, home-manager, ... }: {
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
      # A modern replacement for ‘ls’
      eza = {
        enable = true;
        git = true;
        icons = true;
      };

      # a cat(1) clone with syntax highlighting and Git integration.
      bat = {
        enable = true;
        config = {
          pager = "less -FR";
        };
      };

      # A command-line fuzzy finder
      fzf = {
        enable = true;
      };

      # zoxide is a smarter cd command, inspired by z and autojump.
      # It remembers which directories you use most frequently,
      # so you can "jump" to them in just a few keystrokes.
      # zoxide works on all major shells.
      zoxide = {
        enable = true;
        enableBashIntegration = true;
        enableZshIntegration = true;
      };

      # Atuin replaces your existing shell history with a SQLite database,
      # and records additional context for your commands.
      # Additionally, it provides optional and fully encrypted
      # synchronisation of your history between machines, via an Atuin server.
      atuin = {
        enable = true;
        enableBashIntegration = true;
        enableZshIntegration = true;
      };
    };
  };
}
