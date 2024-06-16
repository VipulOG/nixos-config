{
  boot = {
    loader.grub.enable = true;
    loader.grub.efiSupport = true;
    loader.grub.efiInstallAsRemovable = true;

    # Hide mei logs from tty
    blacklistedKernelModules = [ "mei" "mei_me" ];

    # Boot animation
    # plymouth.enable = true;
  };
}
