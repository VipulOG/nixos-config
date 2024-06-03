{ pkgs, lib, config, ... }:

{
  stylix = {
    targets = {
      vscode.enable = false;
    };
  };

  gtk = {
    cursorTheme = {
      package = pkgs.apple-cursor;
      name = "macOS-BigSur";
    };

    iconTheme = {
      package = pkgs.colloid-icon-theme;
      name = "Colloid";
    };
  };
}
