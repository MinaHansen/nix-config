{ ... }:
{
  imports = [
    ./default.nix
    ./vm-hardware.nix
  ];

  my.kernel = {
    variant       = "bore";
    procesorOpt   = "x86_64-v3";
    lto           = "thin";
    fixGpp0Wakeup = false;
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

  networking.hostName = "vmminanixos";
  time.timeZone       = "Europe/Oslo";
  system.stateVersion = "25.11";
}
