{ ... }:
{
  imports = [
    ./hardware.nix
    ../modules/boot.nix
    ../modules/kernel.nix
    ../modules/nix.nix
    ../modules/input.nix
    ../modules/desktop.nix
    ../modules/features.nix
    ../modules/fonts.nix
    ../modules/user.nix
  ];

  my.kernel = {
    variant       = "bore";
    cpusched      = "bore";
    processorOpt  = "x86_64-v3";
    lto           = "full";
    hzTicks       = "1000";
    bbr3          = true;
    hardened      = false;
    fixGpp0Wakeup = true;
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

  #networking.hostName = "minanixos";
  #time.timeZone       = "Europe/Oslo";
  #system.stateVersion = "25.11";
}
