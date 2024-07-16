{ lib, inputs, ... }: {
  relativeToRoot = lib.path.append ../.;

  scanPaths = path:
    let isValidType = path: _type:
      (_type == "directory") ||
      (path != "default.nix" && lib.strings.hasSuffix ".nix" path);
    in builtins.map
      (f: "${path}/${f}")
      (builtins.attrNames (lib.attrsets.filterAttrs isValidType (builtins.readDir path)));

  nixosSystem = args: lib.nixosSystem {
    specialArgs = args.specialArgs;
    modules = [
      inputs.disko.nixosModules.disko
      inputs.home-manager.nixosModules.home-manager
      ../host
      ../user
      ../modules/core
      ../modules/environment
      ../modules/theme
    ] ++ args.modules;
  };

  importConfiguredPrograms = programs: builtins.map (program:
    ../modules/programs/${program}.nix
  ) programs;
}
