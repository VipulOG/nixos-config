{ hostName, ... }:
{
  imports = [
    ./${hostName}
  ];
}