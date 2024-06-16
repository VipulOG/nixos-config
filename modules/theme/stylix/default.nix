{ pkgs, username, mylib, ... }: {
  # ---- Home Configuration ----
  home-manager.users.${username} = {
    stylix = {
      targets = {
        vscode.enable = false;
        gtk.extraCss = ''
          decoration, window, window.background, window.titlebar, .titlebar {
            border-radius: 0px;
          }
        '';
      };
    };
  };

  # ---- System Configuration ----
  stylix = {
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tomorrow-night.yaml";
    polarity = "dark";
    image = mylib.relativeToRoot "assets/backgrounds/wallpaper.jpg";

    targets = {
      plymouth.enable = false;
      console.enable = false;
      grub.enable = false;
    };
  };
}
