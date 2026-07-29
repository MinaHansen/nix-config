{ ... }:
{
  imports = [
    ./hardware.nix
    ../../modules/boot.nix
    ../../modules/kernel.nix
    ../../modules/nix.nix
    ../../modules/input.nix
    ../../modules/desktop.nix
    ../../modules/features.nix
    ../../modules/fonts.nix
    ../../modules/home/default.nix
  ];

  my.kernel = {
    variant       = "bore";
    procesorOpt   = "x86_64-v3";
    lto           = "full";
    fixGpp0Wakeup = true;
    hardened      = false;
  };

  my.features = {
    steam    = true;
    discord  = true;
    devTools = true;
  };

  my.input = {
    keyboardLayoutShort = "jp";
    keyboardLayout      = "jp106";
  };

  networking.hostName = "minanixos";
  time.timeZone       = "Europe/Oslo";
  system.stateVersion = "25.11";
}
