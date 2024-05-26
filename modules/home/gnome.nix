{ pkgs, lib, ... }:

{
  home.packages = (with pkgs; [
    resources
    pop-launcher
    gnome.dconf-editor
    gnome3.gnome-tweaks
  ]) ++ (with pkgs.gnomeExtensions; [
    pop-shell
    blur-my-shell
    vitals
    unite
    just-perfection
  ]);

  dconf.settings = with lib.gvariant; {
    "org/gnome/GWeather4".temperature-unit = "centigrade";
    "org/gnome/desktop/a11y/interface".show-status-shapes = true;
    "org/gnome/desktop/session".idle-delay = mkUint32 120;

    "org/gnome/desktop/interface" = {
      clock-format = "12h";
      clock-show-weekday = true;
    };

    "org/gnome/mutter" = {
      dynamic-workspaces = true;
      edge-tiling = false;
      workspaces-only-on-primary = false;
    };

    "org/gnome/settings-daemon/plugins/power" = {
      power-button-action = "suspend";
      sleep-inactive-ac-type = "suspend";
    };

    "org/gnome/shell".enabled-extensions = [
      "pop-shell@system76.com"
      "Vitals@CoreCoding.com"
      "user-theme@gnome-shell-extensions.gcampax.github.com"
      "unite@hardpixel.eu"
      "blur-my-shell@aunetx"
      "just-perfection-desktop@just-perfection"
    ];
  };
}
