{ lib, pkgs, ... }:

{
  programs.kitty = {
    enable = true;

    keybindings = {
      "ctrl+shift+m" = "toggle_maximized";
      "ctrl+shift+f" = "show_scrollback"; # search in the current window
    };

    settings = {
      enable_audio_bell = false;
      tab_bar_edge = "top"; # tab bar on top
    };
  };
}
