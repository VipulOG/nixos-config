{ pkgs, ... }:

{
  services.xserver.desktopManager.xterm.enable = false;

  environment.systemPackages = with pkgs; [
    git
    neofetch
    neovim
    librewolf

    # networking tools
    wget
    curl

    # archives
    zip
    xz

    # Text Processing
    # Docs: https://github.com/learnbyexample/Command-line-text-processing
    gnugrep # GNU grep, provides `grep`/`egrep`/`fgrep`
    gnused # GNU sed, very powerful(mainly for replacing text in files)
    gawk # GNU awk, a pattern scanning and processing language
    jq # A lightweight and flexible command-line JSON processor

    # misc
    file
    which
    tree
    gnutar
    rsync

    # other system tools
    parted
  ];
}
