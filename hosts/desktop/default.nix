{ mylib, ... }:

{
  imports = [ ./hardware-configuration.nix ];
  #----Host specific config ----

  # Hide mei logs from tty
  boot.blacklistedKernelModules = [ "mei" "mei_me" ];
}
