{ pkgs, mylib, config, ... }: {

  stylix = {
    # autoEnable = false;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";
    image = mylib.relativeToRoot "./background.png";
    polarity = "dark";

    targets = {
      plymouth.enable = false;
      console.enable = false;
    };
  };
}
