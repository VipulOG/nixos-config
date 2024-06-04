{ pkgs, lib, ... }:

{
  home.packages = (with pkgs; [
    resources
    gnome.dconf-editor
    gnome3.gnome-tweaks
  ]) ++ (with pkgs.gnomeExtensions; [
    blur-my-shell
    vitals
    unite
    just-perfection
  ]);

  dconf.settings = with lib.gvariant; {
    "org/gnome/GWeather4" = {
      temperature-unit = "centigrade";
    };

    "org/gnome/TextEditor" = {
      highlight-current-line = true;
      show-grid = true;
      show-line-numbers = true;
      show-map = false;
      show-right-margin = false;
      style-scheme = "classic-dark";
      style-variant = "follow";
      use-system-font = false;
      wrap-text = false;
    };

    "org/gnome/desktop/a11y" = {
      always-show-universal-access-status = true;
    };

    "org/gnome/desktop/a11y/interface" = {
      show-status-shapes = true;
    };

    "org/gnome/desktop/background" = {
      picture-options = "zoom";
    };

    "org/gnome/desktop/interface" = {
      clock-format = "12h";
      clock-show-weekday = true;
      enable-animations = true;
      locate-pointer = false;
      overlay-scrolling = true;
      toolbar-style = "text";
      toolkit-accessibility = false;
    };

    "org/gnome/desktop/notifications" = {
      show-banners = true;
      show-in-lock-screen = false;
    };

    "org/gnome/desktop/peripherals/mouse" = {
      natural-scroll = true;
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      two-finger-scrolling-enabled = true;
    };

    "org/gnome/desktop/screensaver" = {
      lock-delay = mkUint32 30;
      picture-options = "zoom";
    };

    "org/gnome/desktop/session" = {
      idle-delay = mkUint32 120;
    };

    "org/gnome/desktop/wm/keybindings" = {
      begin-move = ["<Super>t"];
      begin-resize = ["<Super>r"];
      close = ["<Super>c"];
      cycle-group = ["<Super>grave"];
      cycle-group-backward = ["<Shift><Super>grave"];
      cycle-panels = [];
      cycle-panels-backward = [];
      cycle-windows = ["<Alt>Escape"];
      cycle-windows-backward = ["<Shift><Alt>Escape"];
      maximize = [];
      minimize = ["<Super>Down"];
      move-to-monitor-down = ["<Shift><Super>Down"];
      move-to-monitor-left = ["<Shift><Super>Left"];
      move-to-monitor-right = ["<Shift><Super>Right"];
      move-to-monitor-up = ["<Shift><Super>Up"];
      move-to-workspace-1 = ["<Shift><Super>n"];
      move-to-workspace-2 = ["<Shift><Super>m"];
      move-to-workspace-3 = ["<Shift><Super>comma"];
      move-to-workspace-4 = ["<Shift><Super>period"];
      move-to-workspace-last = ["<Shift><Super>slash"];
      move-to-workspace-left = ["<Shift><Super>h"];
      move-to-workspace-right = ["<Shift><Super>l"];
      switch-applications = ["<Super>Tab"];
      switch-applications-backward = ["<Shift><Super>Tab"];
      switch-group = [];
      switch-group-backward = [];
      switch-input-source = [];
      switch-input-source-backward = [];
      switch-panels = ["<Control><Alt>Tab"];
      switch-panels-backward = ["<Shift><Control><Alt>Tab"];
      switch-to-workspace-1 = ["<Super>n"];
      switch-to-workspace-2 = ["<Super>m"];
      switch-to-workspace-3 = ["<Super>comma"];
      switch-to-workspace-4 = ["<Super>period"];
      switch-to-workspace-last = ["<Super>slash"];
      switch-to-workspace-left = ["<Super>h"];
      switch-to-workspace-right = ["<Super>l"];
      toggle-fullscreen = ["<Super>f"];
      toggle-maximized = ["<Super>Up"];
      unmaximize = [];
    };

    "org/gnome/desktop/wm/preferences" = {
      action-middle-click-titlebar = "lower";
      action-right-click-titlebar = "menu";
      auto-raise = false;
      button-layout = "icon:minimize,maximize,close";
      focus-mode = "click";
      num-workspaces = 6;
      resize-with-right-button = false;
    };

    "org/gnome/mutter" = {
      attach-modal-dialogs = false;
      center-new-windows = true;
      dynamic-workspaces = false;
      edge-tiling = true;
      workspaces-only-on-primary = false;
    };

    "org/gnome/nautilus/preferences" = {
      default-folder-viewer = "list-view";
    };

    "org/gnome/settings-daemon/plugins/power" = {
      power-button-action = "suspend";
      sleep-inactive-ac-type = "suspend";
    };

    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [
        "auto-move-windows@gnome-shell-extensions.gcampax.github.com"
        "blur-my-shell@aunetx"
        "unite@hardpixel.eu"
        "just-perfection-desktop@just-perfection"
        "user-theme@gnome-shell-extensions.gcampax.github.com"
        "Vitals@CoreCoding.com"
      ];
      favorite-apps = [
        "org.gnome.Console.desktop"
        "org.gnome.Nautilus.desktop"
        "org.gnome.Geary.desktop"
        "brave-browser.desktop"
        "android-studio-beta.desktop"
      ];
    };

    "org/gnome/shell/extensions/auto-move-windows" = {
      application-list = [
        "brave-browser.desktop:2"
        "android-studio-beta.desktop:3"
        "code.desktop:3"
        "kitty.desktop:3"
      ];
    };

    "org/gnome/shell/extensions/blur-my-shell" = {
      hacks-level = 1;
      settings-version = 2;
    };

    "org/gnome/shell/extensions/blur-my-shell/appfolder" = {
      brightness = 0.40;
      sigma = 40;
      style-dialogs = 0;
    };

    "org/gnome/shell/extensions/blur-my-shell/applications" = {
      blur = true;
      blur-on-overview = false;
      brightness = 0.90;
      dynamic-opacity = false;
      enable-all = false;
      opacity = 244;
      sigma = 58;
      whitelist = [
        "org.gnome.Nautilus"
        "org.gnome.Shell.Extensions"
        "org.gnome.Extensions"
        "org.gnome.Settings"
        "org.gnome.Console"
        "net.nokyan.Resources"
        "org.gnome.tweaks"
        "dconf-editor"
        "kitty"
        "org.gnome.Weather"
        "org.gnome.clocks"
        "org.gnome.Calendar"
        "org.gnome.Calculator"
        "org.gnome.baobab"
        "gnome-disks"
        "org.gnome.FileRoller"
        "seahorse"
        "org.gnome.Characters"
        "org.gnome.Logs"
        "org.gnome.font-viewer"
        "xdg-desktop-portal-gnome"
      ];
    };

    "org/gnome/shell/extensions/blur-my-shell/lockscreen" = {
      pipeline = "pipeline_default";
    };

    "org/gnome/shell/extensions/blur-my-shell/overview" = {
      pipeline = "pipeline_default";
      style-components = 2;
    };

    "org/gnome/shell/extensions/blur-my-shell/panel" = {
      blur = true;
      force-light-text = false;
      override-background = true;
      override-background-dynamically = true;
      pipeline = "pipeline_default";
      static-blur = false;
      style-panel = 3;
      unblur-in-overview = true;
    };

    "org/gnome/shell/extensions/blur-my-shell/screenshot" = {
      pipeline = "pipeline_default";
    };

    "org/gnome/shell/extensions/just-perfection" = {
      accessibility-menu = true;
      activities-button = true;
      alt-tab-small-icon-size = 0;
      alt-tab-window-preview-size = 0;
      animation = 1;
      background-menu = false;
      calendar = true;
      clock-menu = true;
      clock-menu-position = 0;
      clock-menu-position-offset = 0;
      controls-manager-spacing-size = 0;
      dash = true;
      dash-icon-size = 0;
      double-super-to-appgrid = true;
      keyboard-layout = true;
      osd = true;
      overlay-key = true;
      panel = true;
      panel-button-padding-size = 0;
      panel-icon-size = 14;
      panel-in-overview = true;
      panel-indicator-padding-size = 0;
      panel-notification-icon = true;
      panel-size = 32;
      power-icon = true;
      quick-settings = true;
      ripple-box = false;
      search = true;
      show-apps-button = false;
      startup-status = 0;
      switcher-popup-delay = true;
      theme = true;
      top-panel-position = 0;
      weather = false;
      window-demands-attention-focus = false;
      window-maximized-on-create = false;
      window-picker-icon = true;
      window-preview-caption = true;
      window-preview-close-button = true;
      workspace = true;
      workspace-background-corner-size = 0;
      workspace-peek = true;
      workspace-popup = true;
      workspace-switcher-should-show = false;
      workspace-switcher-size = 0;
      workspace-wrap-around = false;
      workspaces-in-app-grid = false;
      world-clock = false;
    };

    "org/gnome/shell/extensions/unite" = {
      app-menu-ellipsize-mode = "end";
      autofocus-windows = false;
      desktop-name-text = "Desktop";
      enable-titlebar-actions = true;
      extend-left-box = false;
      greyscale-tray-icons = false;
      hide-activities-button = "auto";
      hide-app-menu-icon = false;
      hide-window-titlebars = "both";
      notifications-position = "center";
      reduce-panel-spacing = true;
      restrict-to-primary-screen = false;
      show-appmenu-button = true;
      show-desktop-name = true;
      show-legacy-tray = true;
      show-window-buttons = "both";
      show-window-title = "both";
      use-activities-text = false;
      window-buttons-placement = "left";
      window-buttons-theme = "whitesur";
    };

    "org/gnome/shell/extensions/vitals" = {
      alphabetize = false;
      fixed-widths = false;
      hide-icons = false;
      hide-zeros = true;
      hot-sensors = [
        "_memory_usage_"
        "_temperature_processor_0_"
        "_storage_used_"
      ];
      icon-style = 0;
      menu-centered = true;
      position-in-panel = 2;
      show-battery = false;
      show-fan = false;
      show-gpu = false;
      show-storage = true;
      show-voltage = true;
    };
  };
}
