{ ... }:
{
  imports = [
    ./default.nix
  ];

  my.kernel = {
    variant       = "bore";
    cpusched      = "bore";
    processorOpt  = "x86_64-v3";
    lto           = "none";
    hzTicks       = "1000";
    bbr3          = true;
    hardened      = false;
    fixGpp0Wakeup = false;
  };

  my.features = {
    steam    = false;
    discord  = false;
    devTools = false;
    spotify  = false;
  };

  my.input = {
    keyboardLayoutShort = "jp";
    keyboardLayout      = "jp106";
  };

  networking.hostName = "vmminanixos";
  time.timeZone       = "Europe/Oslo";
  system.stateVersion = "25.11";
}
