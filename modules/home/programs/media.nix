{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    viu # Terminal image viewer with native support for Kitty
    gimp
    graphviz
  ];
}
