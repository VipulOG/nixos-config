{ home-manager, username, pkgs, ... }: {
  home-manager.users.${username} = {
    home.packages = with pkgs; [
      viu # Terminal image viewer with native support for Kitty
    ];
    programs.kitty = {
      enable = true;
      settings = {
        enable_audio_bell = false;
      };
    };
  };
}
