{ hostname, ... }: {
  imports = [ ./${hostname} ];
}
