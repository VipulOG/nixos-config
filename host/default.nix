{ hostName, ... }: {
  imports = [ ./${hostName} ];
}