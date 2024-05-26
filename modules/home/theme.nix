{ pkgs, lib, config, ... }:

{
  stylix = {
    targets = {
      vscode.enable = false;
    };

    fonts = {
      monospace = {
        package = pkgs.jetbrains-mono;
        name = "JetBrainsMono";
      };

      serif = config.stylix.fonts.monospace;
      sansSerif = config.stylix.fonts.monospace;
      emoji = config.stylix.fonts.monospace;
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
