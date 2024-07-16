{ pkgs, home-manager, username, config, ... }:

{
  boot = {
    extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback ];
    kernelModules = [ "v4l2loopback" ];
    extraModprobeConfig = ''
      options v4l2loopback devices=1 video_nr=1 card_label="VWebCam" exclusive_caps=1
    '';
  };

  home-manager.users.${username} = {
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
