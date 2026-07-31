{ ... }:
{
  imports = [
    ./default.nix
  ];

  my.kernel = {
    variant       = "bore";
    cpusched      = "bore";
    processorOpt  = "x86_64-v3";
    lto           = "slim";
    hzTicks       = "1000";
    bbr3          = true;
    hardened      = false;
    fixGpp0Wakeup = true;
  };

  my.features = {
    steam    = false;
    discord  = false;
    devTools = true;
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
