{ home-manager, username, ... }: {
  home-manager.users.${username} = {
    programs.kitty = {
      enable = true;
      settings = {
        enable_audio_bell = false;
      };
    };
  };
}
