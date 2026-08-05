{ lib, ... }:
{
  imports = [
    ../modules/fonts.nix
  ];

  my.features = {
    steam = lib.mkDefault false;
    discord = lib.mkDefault false;
    devTools = lib.mkDefault false;
    spotify = lib.mkDefault false;
  };
}
