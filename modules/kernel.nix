{ config, pkgs, inputs, lib, ... }:
let
  cfg = config.my.kernel;
  helpers = pkgs.callPackage
    "${inputs.nix-cachyos-kernel.outPath}/helpers.nix" {};

  kernel = pkgs.cachyosKernels."linux-cachyos-${cfg.variant}".override {
    processorOpt = cfg.processorOpt;
    cpusched     = cfg.cpusched;
    lto          = cfg.lto;
    hzTicks      = cfg.hzTicks;
    bbr3         = cfg.bbr3;
    hardened     = cfg.hardened;
  };
in
{
  options.my.kernel = {
    variant = lib.mkOption {
      type = lib.types.str;
      default = "bore";
      description = "Cachyos kernel variant (bore, rt-bore, eevdf, etc.)";
    };

    processorOpt = lib.mkOption {
      type = lib.types.str;
      default = "x86_64-v3";
      description = "Processor optimization target.";
    };

    cpusched = lib.mkOption {
      type = lib.types.str;
      default = "bore";
    };

    lto = lib.mkOption {
      type = lib.types.enum [ "none" "thin" "full" ];
      default = "thin";
    };

    hzTicks = lib.mkOption {
      type = lib.types.enum [ "100" "250" "500" "1000" ];
      default = "1000";
    };

    bbr3 = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };

    hardened = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };

    fixGpp0Wakeup = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Disable GPP0 ACPI wakeup (Gigabyte board workaround).";
    };
  };

  config = {
    nixpkgs.overlays = [
      inputs.nix-cachyos-kernel.overlays.default
    ];

    boot.kernelPackages =
        helpers.kernelModuleLLVMOverride
          (pkgs.linuxKernel.packagesFor kernel);
    boot.supportedFilesystems = [ "bcachefs" ];
    hardware.enableRedistributableFirmware = true;

    # Use udev rules to disable GPP0 wakeup on Gigabyte boards.
    services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="pci", KERNEL=="0000:00:01.1", ATTR{power/wakeup}="disabled"
    '';
  };
}
