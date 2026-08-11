{ inputs, config, lib, ... }:
let
  cfg = config.my.desktop;
  type = cfg.type;
in
{
  options.my.desktop = {
    type = lib.mkOption { type = lib.types.str; };
  };

  imports = [inputs.silentSDDM.nixosModules.default];
  config.programs.silentSDDM = {
    enable = true;
    theme = "default";
  };

  services.displayManager.defaultSession = type;
}
