{ config, ... }: {
  imports = [ ./grub ];

  boot = {
  extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback ];
  kernelModules = [ "v4l2loopback" ];
  extraModprobeConfig = ''
    options v4l2loopback devices=1 video_nr=1 card_label="VWebCam" exclusive_caps=1
  '';
  };
}
