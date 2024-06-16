{ lib, ... }: {
  relativeToRoot = lib.path.append ../.;

  scanPaths = path:
    let
      isValidType = path: _type:
        (_type == "directory") ||
        (path != "default.nix" && lib.strings.hasSuffix ".nix" path);
    in
      builtins.map
        (f: "${path}/${f}")
        (builtins.attrNames (lib.attrsets.filterAttrs isValidType (builtins.readDir path)));
}
