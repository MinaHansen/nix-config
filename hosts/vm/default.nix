{ ... }:
{
  imports = [
    /etc/nixos/hardware-configuration.nix
    ../../profiles/base.nix
    ../../profiles/desktop.nix
    ../../profiles/niri.nix
    ../../profiles/development.nix
  ];

  networking.hostName = "vmminanixos";
  time.timeZone = "Europe/Oslo";

  my.input = {
    keyboardLayoutShort = "jp";
    keyboardLayout = "jp106";
  };

  my.kernel = {
    variant = "bore";
    cpusched = "bore";
    processorOpt = "x86_64-v3";
    lto = "none";
    hzTicks = "1000";
    bbr3 = true;
    hardened = false;
    fixGpp0Wakeup = true;
  };

  fileSystems = { };
}
