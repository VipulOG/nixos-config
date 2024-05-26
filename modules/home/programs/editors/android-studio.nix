{ pkgs, ... }: {
  home.packages = with pkgs; [
    androidStudioPackages.beta
  ];
}
