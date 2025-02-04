{lib, ...}: {
  home-manager.users.vipul = {
    imports = lib.flatten [
      (map lib.custom.relativeToRoot [
        "modules/home/vipul/core"
        "modules/home/vipul/optional/desktop/niri"
        "modules/home/vipul/optional/browsers"
        "modules/home/vipul/optional/btop.nix"
      ])
    ];

    # The state version is required and should stay at the version you
    # originally installed.
    home.stateVersion = "23.11";
  };
}
