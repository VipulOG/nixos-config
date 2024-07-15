{ pkgs, home-manager, username, ... }: {
  home-manager.users.${username} = {
    home.packages = with pkgs; [
      viu # Terminal image viewer with native support for Kitty
      gimp
      graphviz
    ];

    programs.obs-studio = {
      enable = true;
      plugins = with pkgs.obs-studio-plugins; [
        wlrobs
        droidcam-obs
        obs-pipewire-audio-capture
      ];
    };
  };
}
