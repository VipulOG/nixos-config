{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.internal.roles.workstation;
in {
  options.internal.roles.workstation = {
    enable = mkEnableOption "workstation role";
  };

  config = mkIf cfg.enable {
    internal = {
      system = {
        boot.enable = true;
        nix.enable = true;
        security.sudo.enable = true;
        time.enable = true;
        locale.enable = true;
        autoUpdate.enable = true;
      };

      services = {
        dm.enable = true;
        audio.enable = true;
        networking.enable = true;
        openssh.enable = true;

        tailscale = {
          enable = true;
          enableSSH = true;
        };
      };

      de = {
        senkai.enable = true;
      };

      programs = {
        zsh.enable = true;
        flatpak.enable = true;
        comma.enable = true;
      };
    };
  };
}
