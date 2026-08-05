{ ... }:
{
  imports = [
    /etc/nixos/hardware-configuration.nix
    ../../profiles/base.nix
    ../../profiles/desktop.nix
    ../../profiles/development.nix
    ../../gaming.nix
    ../../media.nix
    ../../social.nix
  ];

  networking.hostName = "desktop-nixos";
  time.timeZone = "Europe/Oslo";

  my.input = {
    keyboardLayoutShort = "jp";
    keyboardLayout = "jp106";
  };

  my.kernel = {
    variant = "bore";
    cpusched = "bore";
    processorOpt = "x86_64-v3";
    lto = "full";
    hzTicks = "1000";
    bbr3 = true;
    hardened = false;
    fixGpp0Wakeup = true;
  };

  # Game controller support
  hardware.xone.enable = true;
  hardware.xpadneo.enable = true;

  fileSystems = { };
}
