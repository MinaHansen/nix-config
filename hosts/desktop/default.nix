{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../profiles/base.nix
    ../../profiles/bluetooth.nix
    ../../profiles/desktop.nix
    ../../profiles/niri.nix
    ../../profiles/development.nix
    ../../profiles/gaming.nix
    ../../profiles/media.nix
    ../../profiles/social.nix
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
