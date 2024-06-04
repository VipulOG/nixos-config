{ pkgs, mylib, config, ... }: {

  stylix = {
    # autoEnable = false;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tomorrow-night.yaml";
    polarity = "dark";
    image = mylib.relativeToRoot "./wallpaper.jpg";

    targets = {
      plymouth.enable = false;
      console.enable = false;
    };
  };
}
