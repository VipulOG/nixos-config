{ mylib, ... }: {
  imports = mylib.scanPaths ./.;
}