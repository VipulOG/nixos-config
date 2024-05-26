{ pkgs, ... }: {
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    # Hide mei logs from tty
    blacklistedKernelModules = [ "mei" "mei_me" ];

    plymouth.enable = true;
    
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot = {
        enable = true;
        configurationLimit = 10;
      };
    };
  };
}
