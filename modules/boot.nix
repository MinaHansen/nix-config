{ ... }:
{
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.editor = false;

  hardware.enableRedistributableFirmware = true;
}
